#ifndef MEMBER_H
#define MEMBER_H

#include <QObject>
#include <Qdebug>

class Member : public QObject
{
    Q_OBJECT
public:
    explicit Member(QString name, QObject *parent = nullptr): QObject(parent){
        setObjectName(name);
        qDebug() << "Created: " << objectName();
    };

    ~Member(){
        qDebug() << "Memory Freed for: " << objectName();
    }
};

#endif // MEMBER_H
