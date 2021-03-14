#ifndef WORKWITHLESSONS_H
#define WORKWITHLESSONS_H

#include <QString>

class WorkWithLessons
{
public:
    WorkWithLessons();
    QString LoadLessons(int weekday);
    void WriteFile(QString nameWeekday,QString content);
    void SetDefaultLessons();
    void ClearLessons();
    QString ConvertWeekdayToQString(int weekday);
private:
    QString _loadLesson(QString nameWeekday);
};

#endif // WORKWITHLESSONS_H
