#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qtmqttproject.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qtmqttproject c;
    engine.rootContext()->setContextProperty("c", &c);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("qmlproject", "Main");

    return app.exec();
}
