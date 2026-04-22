#ifndef ENGINEDATA_H
#define ENGINEDATA_H

#include <QObject>
#include <QString>

class EngineData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int temperature READ temperature NOTIFY temperatureChanged)
    Q_PROPERTY(int oilLevel READ oilLevel NOTIFY oilLevelChanged)
    Q_PROPERTY(int rpm READ rpm NOTIFY rpmChanged)
    Q_PROPERTY(double turboPressure READ turboPressure NOTIFY turboPressureChanged)
    Q_PROPERTY(QString carModel READ carModel CONSTANT)
    Q_PROPERTY(bool isHealthy READ isHealthy NOTIFY healthChanged)

public:
    explicit EngineData(QObject *parent = nullptr);

    int temperature() const { return m_temperature; }
    int oilLevel() const { return m_oilLevel; }
    int rpm() const { return m_rpm; }
    double turboPressure() const { return m_turboPressure; }
    QString carModel() const { return m_carModel; }
    bool isHealthy() const { return m_isHealthy; }

signals:
    void temperatureChanged();
    void oilLevelChanged();
    void rpmChanged();
    void turboPressureChanged();
    void healthChanged();

private:
    int m_temperature = 92;
    int m_oilLevel = 85;
    int m_rpm = 2400;
    double m_turboPressure = 1.2;
    QString m_carModel = "Toyota Camry 2020";
    bool m_isHealthy = true;
};

#endif // ENGINEDATA_H
