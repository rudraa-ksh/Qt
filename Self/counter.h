#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
    explicit Counter(QObject *parent = nullptr);

    int value() const;
    void setValue(int newValue);

    // Invokable methods can be called from QML
    Q_INVOKABLE void increment();
    Q_INVOKABLE void decrement();
    Q_INVOKABLE void reset();

signals:
    void valueChanged();

private:
    int m_value;
};

#endif // COUNTER_H
