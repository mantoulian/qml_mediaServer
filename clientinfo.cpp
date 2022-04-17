#include "clientinfo.h"

ClientInfo::ClientInfo(QObject *parent) : QObject(parent)
{

}


QString ClientInfo::name() const {
    return m_name;
}

void ClientInfo::setName(const QString& value) {
    if (m_name != value) {
        m_name = value;
        emit nameChanged(value);
    }
}

QDateTime ClientInfo::connectTime() const{
    return m_connectTime;
}

void ClientInfo::setConnectTime(const QDateTime& value) {
    if (m_connectTime != value) {
        m_connectTime = value;
        emit connectTimeChanged(value);
    }
}
