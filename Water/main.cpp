#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QUrl> // Ensure this is included

using namespace Qt::StringLiterals; // Enables the modern "u" literals

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Use u""_url for QUrl literals - it's faster and type-safe
    const QUrl url("qrc:/qt/qml/untitled/Main.qml");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}