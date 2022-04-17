#include "clientinfolist.h"

QHash<int, QByteArray> ClientInfoList::gm_roleNames;

ClientInfoList::ClientInfoList(QObject *parent)
    : QAbstractListModel(parent)
{
    if (gm_roleNames.count() <= 0) {
        gm_roleNames[NameRole] = "name";
        gm_roleNames[ConnectTimeRole] = "connectTime";
    }
}

ClientInfoList::~ClientInfoList()
{
    clear();
}

int ClientInfoList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.size();
}

QVariant ClientInfoList::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (row >= 0 && row < m_data.size())
    {
        auto *pItem = m_data.at(row);
        switch (role) {
        case Roles::NameRole:
            return pItem->name();

        case Roles::ConnectTimeRole:
            return pItem->connectTime();
        }
    }

    return QVariant();
}

QHash<int, QByteArray> ClientInfoList::roleNames() const {
    return gm_roleNames;
}

void ClientInfoList::set(int index, const QString& name, const QDateTime& connectTime)
{
    if(index < 0 || index >= m_data.size()) {
        return;
    }

    beginResetModel();
    ClientInfo *pItem = m_data.at(index);
    pItem->setName(name);
    pItem->setConnectTime(connectTime);
    endResetModel();
}

void ClientInfoList::append(const QString& name, const QDateTime& connectTime)
{
    int index = m_data.size();
    ClientInfo *pItem = new ClientInfo();
    pItem->setName(name);
    pItem->setConnectTime(connectTime);

    emit beginInsertRows(QModelIndex(), index, index);
    m_data.insert(index, pItem);
    emit endInsertRows();

    emit countChanged(m_data.size());
}

void ClientInfoList::remove(int index)
{
    if(index < 0 || index >= m_data.size()) {
        return;
    }

    emit beginRemoveRows(QModelIndex(), index, index);
    auto pItem = m_data.at(index);
    m_data.removeAt(index);
    emit endRemoveRows();
    emit countChanged(m_data.size());

    delete pItem;
}

ClientInfo* ClientInfoList::get(int index)
{
    if(index >= 0 && index < m_data.size())
        return m_data.at(index);
    else
        return NULL;
}

void ClientInfoList::clear()
{
    for(auto pItem : m_data) {
        delete pItem;
    }

    m_data.clear();
}

int ClientInfoList::count() const
{
    return rowCount(QModelIndex());
}

