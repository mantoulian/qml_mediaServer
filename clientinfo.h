#ifndef CLIENTINFO_H
#define CLIENTINFO_H

#include <QtCore>

class ClientInfo : public QObject
{
    Q_OBJECT
public:
    explicit ClientInfo(QObject *parent = nullptr);

    QString name() const;
    void setName(const QString& value);

    QDateTime connectTime() const;
    void setConnectTime(const QDateTime& value);

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QDateTime connectTime READ connectTime WRITE setConnectTime NOTIFY connectTimeChanged)

signals:
    void nameChanged(const QString& arg);
    void connectTimeChanged(const QDateTime& arg);

private:
    QString m_name;
    QDateTime m_connectTime;
};

#endif // CLIENTINFO_H
