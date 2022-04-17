#ifndef SIGNALSOURCE_H
#define SIGNALSOURCE_H

#include <QtCore>
#include <QFile>
#include <QtXml/QtXml>
#include <QtXml/QDomDocument>

#include "clientinfolist.h"

class SignalSource : public QObject
{
    Q_OBJECT

public:
    SignalSource();
    SignalSource(const SignalSource& oldItem);

    SignalSource& operator=(const SignalSource& oldItem);

    QString name() const;
    void setName(const QString& value);

    QString url() const;
    void setUrl(const QString& value);

    bool hasAudioUrl() const;
    void setHasAudioUrl(bool value);

    QString audioUrl() const;
    void setAudioUrl(const QString& value);

    bool muteAudio() const;
    void setMuteAudio(bool value);

    bool enableRtmp() const;
    void setEnableRtmp(bool value);

    ClientInfoList* clients();

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY urlChanged)
    Q_PROPERTY(bool hasAudioUrl READ hasAudioUrl WRITE setHasAudioUrl NOTIFY hasAudioUrlChanged)
    Q_PROPERTY(QString audioUrl READ audioUrl WRITE setAudioUrl NOTIFY audioUrlChanged)
    Q_PROPERTY(bool muteAudio READ muteAudio WRITE setMuteAudio NOTIFY muteAudioChanged)
    Q_PROPERTY(bool enableRtmp READ enableRtmp WRITE setEnableRtmp NOTIFY enableRtmpChanged)

    Q_PROPERTY(ClientInfoList* clients READ clients)

public:
    static QString XmlTag;

    static SignalSource* Parse(const QDomElement& xmlNode);
    QDomElement createXmlNode(QDomDocument& doc);

signals:
    void nameChanged(const QString& arg);
    void urlChanged(const QString& arg);
    void hasAudioUrlChanged(bool arg);
    void audioUrlChanged(const QString& arg);
    void muteAudioChanged(bool arg);
    void enableRtmpChanged(bool arg);

protected:
    QString m_name;
    QString m_url;
    bool m_hasAudioUrl;
    QString m_audioUrl;
    bool m_muteAudio;
    bool m_enableRtmp;

    ClientInfoList m_clients;


};



#endif // SIGNALSOURCE_H
