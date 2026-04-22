#ifndef RESOURCEDATA_H
#define RESOURCEDATA_H

#include <QObject>
#include <QList>
#include <QString>

struct ResourceItem
{
    QString name;
    int percentage;
    QString nextServiceMonth;
    int kmRemaining;
    QString color;
};

class ResourceData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentMileage READ currentMileage CONSTANT)
    Q_PROPERTY(QString nextServiceName READ nextServiceName CONSTANT)
    Q_PROPERTY(int nextServiceKm READ nextServiceKm CONSTANT)
    Q_PROPERTY(QList<QObject *> resources READ resources CONSTANT)

public:
    explicit ResourceData(QObject *parent = nullptr);

    int currentMileage() const { return m_currentMileage; }
    QString nextServiceName() const { return m_nextServiceName; }
    int nextServiceKm() const { return m_nextServiceKm; }
    QList<QObject *> resources() const { return m_resources; }

private:
    int m_currentMileage = 85230;
    QString m_nextServiceName = "Замена свечей зажигания";
    int m_nextServiceKm = 4000;
    QList<QObject *> m_resources;
};

#endif // RESOURCEDATA_H
