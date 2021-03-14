#include <QStringList>
#include <QDebug>
#include <QFile>
#include <QStandardPaths>

#include <QProcess>
#include <QApplication>

#include "appengine.h"
#include "workwithlessons.h"


WorkWithLessons *workWithLessons = new WorkWithLessons;

AppEngine::AppEngine()
{

}

void AppEngine::selectWeekDay(int weekday){
    //workWithLessons->SetDefaultLessons();
    QString content = workWithLessons->LoadLessons(weekday);
    QStringList lessons = content.split(";");
    showLessons(lessons[0],lessons[1],lessons[2],lessons[3],lessons[4],lessons[5]);
    switch (weekday) {
    case 0:
    showWeekday("Monday");
        break;
    case 1:
    showWeekday("Tuesday");
        break;
    case 2:
    showWeekday("Wednesday");
        break;
    case 3:
    showWeekday("Thursday");
        break;
    case 4:
    showWeekday("Friday");
        break;
    case 5:
    showWeekday("Saturday");
        break;
    }
}

void AppEngine::editLessons(int weekday,QString lesson1,QString lesson2,QString lesson3,QString lesson4,QString lesson5,QString lesson6){
    if(lesson1 == "") lesson1 = " ";
    if(lesson2 == "") lesson2 = " ";
    if(lesson3 == "") lesson3 = " ";
    if(lesson4 == "") lesson4 = " ";
    if(lesson5 == "") lesson5 = " ";
    if(lesson6 == "") lesson6 = " ";

    QString content = lesson1+";"+lesson2+";"+lesson3+";"+lesson4+";"+lesson5+";"+lesson6;
    QString weekdayStr = workWithLessons->ConvertWeekdayToQString(weekday);
    workWithLessons->WriteFile(weekdayStr,content);
    selectWeekDay(weekday);
}

void AppEngine::checkFirstStartApplication(){
    auto pathToFileSave = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QFile checkFile(pathToFileSave+"/applicationReady.txt");
    if(!checkFile.exists()){
        workWithLessons->SetDefaultLessons();
        if(checkFile.open(QIODevice::WriteOnly))
            checkFile.write(" ");
        checkFile.close();
    }
}

void AppEngine::setDefaultLessons(int weekday){
    workWithLessons->SetDefaultLessons();
    selectWeekDay(weekday);
}

void AppEngine::clearLessons(int weekday){
    workWithLessons->ClearLessons();
    selectWeekDay(weekday);
}


