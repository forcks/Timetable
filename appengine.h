#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>

class AppEngine : public QObject
{
    Q_OBJECT
public:
    AppEngine();
    void checkFirstStartApplication();
signals:
    void showLessons(QString lesson1,QString lesson2,QString lesson3,QString lesson4,QString lesson5,QString lesson6);
    void showWeekday(QString weekday);
public slots:
    void selectWeekDay(int weekday);
    void editLessons(int weekday,QString lesson1,QString lesson2,QString lesson3,QString lesson4,QString lesson5,QString lesson6);
    void setDefaultLessons(int weekday);
    void clearLessons(int weekday);
};

#endif // APPENGINE_H
