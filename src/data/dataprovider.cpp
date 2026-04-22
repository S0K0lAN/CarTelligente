#include "dataprovider.h"

DataProvider::DataProvider(QObject *parent)
    : QObject(parent)
{
    m_engine = new EngineData(this);
    m_battery = new BatteryData(this);
    m_resource = new ResourceData(this);
}
