#include <QtCore>
#include <QDebug>

#ifndef Q_OS_LINUX
    #define _GUI_ONLY_
#endif

#ifndef _GUI_ONLY_
    #include "StdAfx.h"
#endif

#include "servernotify.h"
#include "stringhelper.h"
#include "signallist.h"

ServerNotify::ServerNotify(CLiveService *pLiveService, SignalList *pSignalList, QObject *parent) : QObject(parent)
{
    m_pLiveService = pLiveService;
    m_pSignalList = pSignalList;
}


void ServerNotify::addStream(const QString& name, const QString& url)
{
#ifndef _GUI_ONLY_
    if (NULL != m_pLiveService) {
        if (!m_pLiveService->AddStream(StringHelper::GetRaw(name),
                                   false,//pItem->muteAudio(),
                                   StringHelper::GetRaw(url)))
            qDebug() << "Add Stream " << name << " failed!";
    }
#endif
}

void ServerNotify::removeStream(const QString& name)
{
#ifndef _GUI_ONLY_
    if (NULL != m_pLiveService)
        m_pLiveService->RemoveStream(StringHelper::GetRaw(name));
#endif
}

void ServerNotify::updateSignalClient(int index) {
#ifndef _GUI_ONLY_
    if (NULL != m_pLiveService && NULL != m_pSignalList
            && index >= 0 && index < m_pSignalList->count()) {
        SignalSource *pSignalSource = m_pSignalList->get(index);
        if (NULL != pSignalSource) {
            CClientInfoArray arrClientInfo;
            if (m_pLiveService->GetStreamClientInfo(StringHelper::GetRaw(pSignalSource->name()), arrClientInfo)) {
                int clientNum = arrClientInfo.GetSize();
                ClientInfoList *pClientList = pSignalSource->clients();
                int oldClientNum = pClientList->count();
                for (int i = 0; i < clientNum; i++) {
                    QString name((const char*)arrClientInfo[i]->GetClientName());
                    QDateTime connectTime = QDateTime::fromTime_t(arrClientInfo[i]->GetConnectTime());

                    if (i < oldClientNum)
                        pClientList->set(i, name, connectTime);
                    else
                        pClientList->append(name, connectTime);
                }

                while(oldClientNum > clientNum) {
                    pClientList->remove(--oldClientNum);
                }
            }
        }
    }
#endif
}
