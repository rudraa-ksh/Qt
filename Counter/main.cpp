#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "counter.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Create the QML engine
    QQmlApplicationEngine engine;

    // Create an instance of our Counter class
    Counter counter;

    // Expose the counter object to QML
    // It will be accessible as "counter" in QML
    engine.rootContext()->setContextProperty("counter", &counter);

    // Load the main QML file
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    engine.load(url);

    // Check if QML loaded successfully
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
