#include "counter.h"

Counter::Counter(QObject *parent)
    : QObject(parent)
    , m_count(0)
{
}

int Counter::count() const
{
    return m_count;
}

void Counter::setCount(int newCount)
{
    if (m_count != newCount) {
        m_count = newCount;
        emit countChanged();  // Emit signal when count changes
    }
}

void Counter::increment()
{
    setCount(m_count + 1);
    
    // Check for milestones
    if (m_count % 10 == 0 && m_count > 0) {
        emit milestoneReached(m_count);
    }
}

void Counter::decrement()
{
    setCount(m_count - 1);
}

void Counter::reset()
{
    setCount(0);
}
