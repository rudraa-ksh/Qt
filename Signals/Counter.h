#ifndef COUNTER_H
#define COUNTER_H
#include<QObject>

class Counter : public QObject{
    Q_OBJECT

public:
    Counter() {m_value =0;}

    int getValue(){
        return this->m_value;
    }

public slots:
    void setValue(int newValue){
        if(newValue != m_value){
            m_value = newValue;
            emit valueChanged(newValue);
        }
    }


signals:
    void valueChanged(int newValue);

private:
    int m_value;

};

#endif // COUNTER_H
