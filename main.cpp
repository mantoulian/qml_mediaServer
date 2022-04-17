#include <QtCore>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QTranslator>
#include <QDebug>

#ifndef Q_OS_LINUX
    #define _GUI_ONLY_
#endif

#ifndef _GUI_ONLY_
    #include "StdAfx.h"
    extern APP_DEFINE g_appMediaServer;
#endif

#include "signallist.h"
#include "stringhelper.h"
#include "servernotify.h"
#include "myqmlfile.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QLocale locale;

    StringHelper::initChineseSupport();

    // 安装 QT Quick 语言包
    QTranslator qtTranslator;
    if (locale.language() == QLocale::Chinese && qtTranslator.load(":/qt_zh_CN.qm")) {
        qDebug() << "Load qt translator ok!";
        QCoreApplication::installTranslator(&qtTranslator);
    } else {
        qDebug() << "Load qt translator failed!";
    }

    // 安装软件语言包
    QTranslator translator;
    bool translatorOK = false;
    if (locale.language() == QLocale::English) {
        translatorOK = translator.load(":/qml_en.qm");
    } else {
        translatorOK = translator.load(":/qml_zh.qm");
    }

    if (translatorOK) {
         QCoreApplication::installTranslator(&translator);
    }

    qmlRegisterType<SignalSource>("Com.ItSync.MediaServer", 1, 0, "SignalSource");
    qmlRegisterType<SignalList>("Com.ItSync.MediaServer", 1, 0, "SignalList");
    qmlRegisterType<ClientInfo>("Com.ItSync.MediaServer", 1, 0, "ClientInfo");
    qmlRegisterType<ClientInfoList>("Com.ItSync.MediaServer", 1, 0, "ClientInfoList");
    qmlRegisterType<MyQmlFile>("Com.ItSync.MediaServer", 1, 0, "MyQmlFile");

    QQmlApplicationEngine engine;
//    QQuickStyle::setStyle(QStringLiteral("Default"));
//    QQuickStyle::setStyle(QStringLiteral("Material"));
//    QQuickStyle::setStyle(QStringLiteral("Fusion"));
//    QQuickStyle::setStyle("Imaging");

    qDebug() << QCoreApplication::applicationDirPath();

    MyQmlFile *pQmlFile =new MyQmlFile();
    engine.rootContext()->setContextProperty("MyQmlFile", pQmlFile);
    SignalList *pSignalList = new SignalList();
    pSignalList->loadSettings(QCoreApplication::applicationDirPath() + "/DataInfo.xml");
//    pSignalList->loadSettings(QStringLiteral("DataInfo.xml"));

    engine.rootContext()->setContextProperty("signalList", pSignalList);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    CLiveService *pLiveService = NULL;

#ifndef _GUI_ONLY_
    CAppInfo *pAppInfo = CAppInfo::GetInstance();
    pAppInfo->SetAppID(g_appMediaServer.dwAppID);

    if (!pAppInfo->Initialize())
    {
        printf("应用程序初始化失败！\n");
        return FALSE;
    }

//    char *p = pAppInfo->GetMachineCode();
//    QString qsCode = p;
//    pQmlFile->SetMachineCode(qsCode);

    CString strKeyFile = ::GetAppPath() + "key.srd";
    if (::IsFileExist(strKeyFile))
    {
        if (CAppInfo::RegistResult_Succeed == pAppInfo->Regist(strKeyFile))
            printf("软件注册成功！\n");
        else
            printf("软件注册失败！\n");

        remove(strKeyFile);
    }

    printf("%s\n", (const char*)pAppInfo->GetRegistInfo(&g_appMediaServer));


    CLiveService liveService;
    pLiveService = &liveService;

    bool bCheckUser = FALSE;
    if (!liveService.Initialize(8888, NULL, bCheckUser))
    {
        printf("初始化服务失败!\n");
        return __LINE__;
    }

    for (int i = 0; i < pSignalList->count(); i ++) {
        auto pItem = pSignalList->get(i);

        if (pItem->hasAudioUrl()) {
            if (!liveService.AddStream(StringHelper::GetRaw(pItem->name()),
                                       StringHelper::GetRaw(pItem->url()),
                                       StringHelper::GetRaw(pItem->audioUrl())))
                    qDebug() << "Add Stream " << pItem->name() << " failed!";
        } else {
//            qDebug() << "Stream " << StringHelper::GetRaw(pItem->url());

            if (!liveService.AddStream(StringHelper::GetRaw(pItem->name()),
                                       pItem->muteAudio(),
                                       StringHelper::GetRaw(pItem->url())))
                    qDebug() << "Add Stream " << pItem->name() << " failed!";
        }
    }
#endif

    ServerNotify *pMediaServer = new ServerNotify(pLiveService, pSignalList);
    engine.rootContext()->setContextProperty("mediaServer", pMediaServer);

    int ret =  app.exec();

#ifndef _GUI_ONLY_
    liveService.Uninitialize();
    pAppInfo->Uninitialize();
#endif

    delete pMediaServer;
    delete pSignalList;
    return ret;
}
