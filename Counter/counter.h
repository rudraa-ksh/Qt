#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)

public:
    explicit Counter(QObject *parent = nullptr);

    // Getter for count property
    int count() const;
    
    // Setter for count property
    void setCount(int newCount);

signals:
    // Signal emitted when count changes
    void countChanged();
    
    // Custom signal for reaching milestones
    void milestoneReached(int milestone);

public slots:
    // Slot to increment counter
    void increment();
    
    // Slot to decrement counter
    void decrement();
    
    // Slot to reset counter
    void reset();

private:
    int m_count;
};

#endif // COUNTER_H
