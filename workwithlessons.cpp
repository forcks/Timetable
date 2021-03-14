#include "workwithlessons.h"
#include <QFile>
#include <QDir>
#include <QStandardPaths>
#include <QString>

WorkWithLessons::WorkWithLessons()
{

}

QString WorkWithLessons::LoadLessons(int weekday){
     QString content = " ";
    switch (weekday) {
        case 0:
        content = _loadLesson("monday");
            break;
        case 1:
        content = _loadLesson("tuesday");
            break;
        case 2:
        content = _loadLesson("wednesday");
            break;
        case 3:
        content = _loadLesson("thursday");
            break;
        case 4:
        content = _loadLesson("friday");
            break;
        case 5:
        content = _loadLesson("saturday");
            break;
        default:
        return " ";
    }
    return content;
}
QString WorkWithLessons::_loadLesson(QString nameWeekday){
    auto pathToFileSave = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QFile weekdayFile(pathToFileSave+"/"+nameWeekday+".txt");
    QString contentInWeekdayFile = "";
    if(weekdayFile.exists()){
        if(weekdayFile.open(QIODevice::ReadOnly)){
            QByteArray content = weekdayFile.readAll();
            contentInWeekdayFile = QString::fromUtf8(content);
        }
        weekdayFile.close();
    }else{
        if(weekdayFile.open(QIODevice::WriteOnly)){}
        weekdayFile.close();
    }
    return contentInWeekdayFile;
}
void WorkWithLessons::WriteFile(QString nameWeekday,QString content){
    auto pathToFileSave = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QFile weekdayFile(pathToFileSave+"/"+nameWeekday+".txt");
    if(weekdayFile.open(QIODevice::WriteOnly)){
        weekdayFile.write(content.toUtf8());
    }
    weekdayFile.close();
}

void WorkWithLessons::SetDefaultLessons(){
    auto pathToFileSave = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QString nameWeekdays[] = {"monday","tuesday","wednesday","thursday","friday","saturday"};

    QFile mondayFile(pathToFileSave+"/"+nameWeekdays[0]);
    WriteFile(nameWeekdays[0],"численные методы;тех разб по;ит; ; ; ");

    QFile tuesdayFile(pathToFileSave+"/"+nameWeekdays[1]);
    WriteFile(nameWeekdays[1],"архитектура аппаратных ср-в;дискретная математика;физ-культура; ; ; ");

    QFile wednesdayFile(pathToFileSave+"/"+nameWeekdays[2]);
    WriteFile(nameWeekdays[2]," ; ;БЖД;1с;экономика; ");

    QFile thursdayFile(pathToFileSave+"/"+nameWeekdays[3]);
    WriteFile(nameWeekdays[3]," ; ;1с;1с;физ-культура/БЖД; ");

    QFile fridayFile(pathToFileSave+"/"+nameWeekdays[4]);
    WriteFile(nameWeekdays[4],"англ яз/численные методы;комп графика/тех разб по;математика;англ яз; ; ");

    QFile saturdayFile(pathToFileSave+"/"+nameWeekdays[5]);
    WriteFile(nameWeekdays[5]," ;проект и дизайн ис;комп графика;англ яз; ; ");
}

void WorkWithLessons::ClearLessons(){
    auto pathToFileSave = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QString nameWeekdays[] = {"monday","tuesday","wednesday","thursday","friday","saturday"};

    QFile mondayFile(pathToFileSave+"/"+nameWeekdays[0]);
    WriteFile(nameWeekdays[0]," ; ; ; ; ; ");

    QFile tuesdayFile(pathToFileSave+"/"+nameWeekdays[1]);
    WriteFile(nameWeekdays[1]," ; ; ; ; ; ");

    QFile wednesdayFile(pathToFileSave+"/"+nameWeekdays[2]);
    WriteFile(nameWeekdays[2]," ; ; ; ; ; ");

    QFile thursdayFile(pathToFileSave+"/"+nameWeekdays[3]);
    WriteFile(nameWeekdays[3]," ; ; ; ; ; ");

    QFile fridayFile(pathToFileSave+"/"+nameWeekdays[4]);
    WriteFile(nameWeekdays[4]," ; ; ; ; ; ");

    QFile saturdayFile(pathToFileSave+"/"+nameWeekdays[5]);
    WriteFile(nameWeekdays[5]," ; ; ; ; ; ");

}

QString WorkWithLessons::ConvertWeekdayToQString(int weekday){
    QString nameWekday = "none";
    switch (weekday) {
    case 0:
    nameWekday = "monday";
        break;
    case 1:
    nameWekday = "tuesday";
        break;
    case 2:
    nameWekday = "wednesday";
        break;
    case 3:
    nameWekday = "thursday";
        break;
    case 4:
    nameWekday = "friday";
        break;
    case 5:
    nameWekday = "saturday";
        break;
    }
    return nameWekday;
}


















