#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QDate>

#include "appengine.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    AppEngine *appEngine = new AppEngine;
    appEngine->checkFirstStartApplication();
    engine.rootContext()->setContextProperty("appEngine",appEngine);
    engine.load(url);

    QDate curentDate = QDate::currentDate();
    int weekday = curentDate.dayOfWeek() - 1;
    weekday = weekday == 6?0:weekday;
    appEngine->selectWeekDay(weekday);

    return app.exec();
}
