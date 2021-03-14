#include "dbengine.h"
#include <QDebug>
#include <QStandardPaths>
#include <QFile>
#include <QApplication>

QString nameDb = "timetable.db3";
QString pathToDataPath;

dbEngine::dbEngine(){
    pathToDataPath = QApplication::applicationDirPath();
    createDb();
    connectDb();
}
void dbEngine::createDb(){
    QFile dbFile(pathToDataPath+"/"+nameDb);
    dbFile.open(QIODevice::WriteOnly);
    dbFile.close();
}

void dbEngine::connectDb(){
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(pathToDataPath+"/"+nameDb);
}

void dbEngine::clickme(){
    QSqlQuery query;
    db.open();
    QString command = "";
    command = "CREATE TABLE \"lessons\" (";
    command += "\"id\"	INTEGER NOT NULL,";
    command += "\"weekday\"	TEXT,";
    command +=  "\"lesson\"	TEXT,";
    command +=  "\"class\"	INTEGER,";
    command +=  "\"CountionLesson\"	INTEGER,";
    command +=  "PRIMARY KEY(\"id\" AUTOINCREMENT)";
    command +=  ");\"";
    qDebug()<<command;
    query.exec(command);
    //query.exec("INSERT INTO lessons (weekday) VALUES ('понедельник')");
    //query.exec("SELECT id,weekday FROM lessons");
    /*while(query.next()){
        show(query.value(0).toString()+" "+query.value(1).toString());
        qDebug()<<query.value(0).toString()+" "+query.value(1).toString();
    }*/
    qDebug()<<pathToDataPath+"/"+nameDb;
    db.close();
}
