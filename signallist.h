#ifndef SIGNALLIST_H
#define SIGNALLIST_H

#include <QtCore>
#include "signalsource.h"

class SignalList : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        NameRole = Qt::UserRole,
        UrlRole,
    };

public:
    explicit SignalList(QObject *parent = 0);
    ~SignalList();

public: // QAbstractItemModel interface
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    int count() const;

//    Q_INVOKABLE void insert(int index, SignalSource* pItem);
//    Q_INVOKABLE void append(SignalSource* pItem);

    Q_INVOKABLE void set(int index, const QString& name, const QString& url, bool hasAudioUrl, const QString& audioUrl, bool muteAudio);
    Q_INVOKABLE void append(const QString& name, const QString& url, bool hasAudioUrl, const QString& audioUrl, bool muteAudio);

    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE void clear();

    Q_PROPERTY(int count READ count NOTIFY countChanged)
    Q_INVOKABLE SignalSource* get(int index);

    Q_INVOKABLE bool loadSettings(const QString& fileName);
    Q_INVOKABLE bool saveSettings();

public:
    static QString XmlTag;

protected:
    // return the roles mapping to be used by QML
    virtual QHash<int, QByteArray> roleNames() const override;

signals:
    void countChanged(int arg);

private:
    QVector<SignalSource*> m_data;
    QString m_dataFileName;
    bool m_allowAllSubServer;

    static QHash<int, QByteArray> gm_roleNames;
};

#endif // SIGNALLIST_H
