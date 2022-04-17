#ifndef SERVERNOTIFY_H
#define SERVERNOTIFY_H

#include <QtCore>

class CLiveService;
class SignalList;

class ServerNotify : public QObject
{
    Q_OBJECT
public:
    explicit ServerNotify(CLiveService *pLiveService, SignalList *pSignalList, QObject *parent = nullptr);

    Q_INVOKABLE void addStream(const QString& name, const QString& url);
    Q_INVOKABLE void removeStream(const QString& name);

    Q_INVOKABLE void updateSignalClient(int index);

signals:

protected:
    CLiveService *m_pLiveService;
    SignalList *m_pSignalList;
};

#endif // SERVERNOTIFY_H
