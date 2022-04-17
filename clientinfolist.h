#ifndef CLIENTINFOLIST_H
#define CLIENTINFOLIST_H

#include "clientinfo.h"

class ClientInfoList : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        NameRole = Qt::UserRole,
        ConnectTimeRole,
    };

public:
    explicit ClientInfoList(QObject *parent = 0);
    ~ClientInfoList();

public:
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    int count() const;

    void set(int index, const QString& name, const QDateTime& connectTime);
    void append(const QString& name, const QDateTime& connectTime);

    void remove(int index);
    void clear();

    Q_PROPERTY(int count READ count NOTIFY countChanged)
    Q_INVOKABLE ClientInfo* get(int index);

protected:
    // return the roles mapping to be used by QML
    virtual QHash<int, QByteArray> roleNames() const override;

signals:
    void countChanged(int arg);

private:
    QVector<ClientInfo*> m_data;

    static QHash<int, QByteArray> gm_roleNames;
};

#endif // CLIENTINFOLIST_H
