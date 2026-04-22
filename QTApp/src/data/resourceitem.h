#ifndef RESOURCEITEM_H
#define RESOURCEITEM_H

#include <QString>

struct ResourceItem
{
    QString name;
    int percentage = 0;
    QString nextServiceMonth;
    int kmRemaining = 0;
    QString color;
};

#endif // RESOURCEITEM_H
