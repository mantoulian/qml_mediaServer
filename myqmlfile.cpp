#include "myqmlfile.h"
#include <QDebug>
#include <QTextCodec>


#ifndef Q_OS_LINUX
    #define _GUI_ONLY_
#endif

#ifndef _GUI_ONLY_
    #include "StdAfx.h"
    extern APP_DEFINE g_appMediaServer;
#endif

MyQmlFile::MyQmlFile(QObject *parent) : QObject(parent)
{

}

 QString GBK2UTF8(const QString &inStr)
{
    QTextCodec *gbk = QTextCodec::codecForName("GB18030");
    QTextCodec *utf8 = QTextCodec::codecForName("UTF-8");

    QString g2u = gbk->toUnicode(gbk->fromUnicode(inStr));			  // gbk  convert utf8
    return g2u;
}

QString MyQmlFile::GetMachineCode()
{
     QString qsCode;

    CAppInfo *pAppInfo = CAppInfo::GetInstance();
    if(nullptr == pAppInfo)
        return qsCode;

    CString strCode = pAppInfo->GetMachineCode();
    const char* p = (const char*)strCode;

    //qDebug()<<"machine code :"<<p;

    qsCode = QLatin1String(p);

    //QString codeUTF8 = GBK2UTF8(qsCode);
    //qDebug()<<"machine_code_UTF8 :"<<codeUTF8;

    return qsCode;
}

bool MyQmlFile::WriteMachineCodeToFile(QString fileName)
{
    CAppInfo *pAppInfo = CAppInfo::GetInstance();
    if(NULL == pAppInfo)
        return false;

    QByteArray ba = fileName.toLatin1();
    const char *p = ba;
    if(NULL == p)
        return false;
    qDebug()<<"p:"<<p;
    CString strFileName = p;

    return pAppInfo->WriteMachineCodeToFile(strFileName);
    return false;
}

//void MyQmlFile::SetfileName(QString fileName)
//{
//    m_fileName = fileName;
//}

//QString MyQmlFile::GetfileName()
//{
//    return m_fileName;
//}
