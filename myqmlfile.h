#ifndef MYQMLFILE_H
#define MYQMLFILE_H

#include <QObject>
#include <QFile>

class MyQmlFile : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString m_code READ m_code WRITE QString m_fileName READ m_code WRITE)
public:
    explicit MyQmlFile(QObject *parent = nullptr);

    Q_INVOKABLE QString GetMachineCode();
    Q_INVOKABLE bool WriteMachineCodeToFile(QString fileName);




signals:

private:


};

#endif // MYQMLFILE_H
