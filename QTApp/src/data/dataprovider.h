#ifndef DATAPROVIDER_H
#define DATAPROVIDER_H

#include <QObject>
#include "enginedata.h"
#include "batterydata.h"
#include "resourcedata.h"

class DataProvider : public QObject
{
    Q_OBJECT
    Q_PROPERTY(EngineData *engine READ engine CONSTANT)
    Q_PROPERTY(BatteryData *battery READ battery CONSTANT)
    Q_PROPERTY(ResourceData *resource READ resource CONSTANT)

public:
    explicit DataProvider(QObject *parent = nullptr);

    EngineData *engine() { return m_engine; }
    BatteryData *battery() { return m_battery; }
    ResourceData *resource() { return m_resource; }

private:
    EngineData *m_engine;
    BatteryData *m_battery;
    ResourceData *m_resource;
};

#endif // DATAPROVIDER_H
