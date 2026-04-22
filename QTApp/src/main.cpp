#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "dataprovider.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Регистрируем DataProvider как singleton
    DataProvider provider;
    engine.rootContext()->setContextProperty("dataProvider", &provider);

    const QUrl url(QStringLiteral("qrc:/Main.qml"));
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
