#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    // Set up the environment for the virtual keyboard
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Connect to handle object creation failure
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Load the QML file directly
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml"))); // Ensure Main.qml is accessible in resource file (qrc)

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
