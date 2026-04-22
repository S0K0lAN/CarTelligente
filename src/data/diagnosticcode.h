#ifndef DIAGNOSTICCODE_H
#define DIAGNOSTICCODE_H

#include <QString>
#include <QDateTime>

struct DiagnosticCode
{
    QString code;
    QString description;
    QDateTime detectedDate;
    bool isActive;
};

#endif // DIAGNOSTICCODE_H
