#include "counter.h"

Counter::Counter(QObject *parent)
    : QObject(parent)
    , m_value(0)
{
}

int Counter::value() const
{
    return m_value;
}

void Counter::setValue(int newValue)
{
    if (m_value != newValue) {
        m_value = newValue;
        emit valueChanged();
    }
}

void Counter::increment()
{
    setValue(m_value + 1);
}

void Counter::decrement()
{
    setValue(m_value - 1);
}

void Counter::reset()
{
    setValue(0);
}
