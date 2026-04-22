#ifndef BATTERYDATA_H
#define BATTERYDATA_H

#include <QObject>

class BatteryData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int chargeLevel READ chargeLevel NOTIFY chargeLevelChanged)
    Q_PROPERTY(double voltage READ voltage NOTIFY voltageChanged)
    Q_PROPERTY(int health READ health NOTIFY healthChanged)
    Q_PROPERTY(int capacity READ capacity CONSTANT)
    Q_PROPERTY(int temperature READ temperature NOTIFY temperatureChanged)

public:
    explicit BatteryData(QObject *parent = nullptr);

    int chargeLevel() const { return m_chargeLevel; }
    double voltage() const { return m_voltage; }
    int health() const { return m_health; }
    int capacity() const { return m_capacity; }
    int temperature() const { return m_temperature; }

signals:
    void chargeLevelChanged();
    void voltageChanged();
    void healthChanged();
    void temperatureChanged();

private:
    int m_chargeLevel = 78;
    double m_voltage = 12.6;
    int m_health = 85;
    int m_capacity = 60;
    int m_temperature = 24;
};

#endif // BATTERYDATA_H
