import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id:_root
    width: 480
    height: 800
    visible: true
    title: qsTr("Time table")

    property int activeWeekday: 0;

    header:Text {
        id:_text_
        anchors.top: _root.top
        anchors.centerIn: parent
        font.pointSize: (_root.width+_root.height)/50
        text: qsTr("Time table")

    }

    StackView{
        id:_mainStackView
        anchors.fill: parent
        initialItem: _mainPage1
    }

    Page{
        id:_mainPage2
        anchors.fill: parent
        visible: false
        Button{
            id:_toNormal
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: _thButton.top
            anchors.left:parent.left
            text: qsTr("End \nEditing")
            onClicked: {
                _mainStackView.pop(_mainPage1)
            }
        }

        Button{
            id:_editButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: _saButton.top
            anchors.right: parent.right
            text: qsTr("Save \nEditing...");
            onClicked: {
                appEngine.editLessons(activeWeekday,_inputOneLesson.text,_inputTwoLesson.text,_inputThreeLesson.text,_inputFourLesson.text,_inputFiveLesson.text,_inputSixLesson.text);
            }
        }
        Button{
            id:_setStandartLessonButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: _tuButton.top
            anchors.left:_toNormal.right
            text: qsTr("Set \nDefault");
            onClicked: {
                appEngine.setDefaultLessons(activeWeekday);
            }
        }

        Button{
            id:_clearLessonsButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: _weButton.top
            anchors.right:_editButton.left
            text: qsTr("Clear \nAll");
            onClicked: {
                appEngine.clearLessons(activeWeekday);
            }
        }


        StandartForm {
            id:_oneLesson
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: _root.width/2 - _oneLesson.width/2
            anchors.topMargin: _root.height / 20
            Text {
                text: qsTr("1 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            TextInput{
                id:_inputOneLesson
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                maximumLength: 40


                Connections{
                    target:appEngine
                    onShowLessons:_inputOneLesson.text = lesson1
                }
            }
        }

        StandartForm {
            id:_twoLesson
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _oneLesson.top
            anchors.leftMargin: _root.width/2 - _oneLesson.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("2 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            TextInput{
                id:_inputTwoLesson
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                maximumLength: 40

                Connections{
                    target:appEngine
                    onShowLessons:_inputTwoLesson.text = lesson2
                }
            }
        }

        StandartForm {
            id:_threeLesson
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _twoLesson.top
            anchors.leftMargin: _root.width/2 - _oneLesson.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("3 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            TextInput{
                id:_inputThreeLesson
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                maximumLength: 40

                Connections{
                    target:appEngine
                    onShowLessons:_inputThreeLesson.text = lesson3
                }
            }
        }

        StandartForm {
            id:_fourLesson
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _threeLesson.top
            anchors.leftMargin: _root.width/2 - _oneLesson.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("4 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            TextInput{
                id:_inputFourLesson
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                maximumLength: 40

                Connections{
                    target:appEngine
                    onShowLessons:_inputFourLesson.text = lesson4
                }
            }
        }

        StandartForm {
            id:_fiveLesson
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _fourLesson.top
            anchors.leftMargin: _root.width/2 - _oneLesson.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("5 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            TextInput{
                id:_inputFiveLesson
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                maximumLength: 40

                Connections{
                    target:appEngine
                    onShowLessons:_inputFiveLesson.text = lesson5
                }
            }
        }

        StandartForm {
            id:_sixLesson
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _fiveLesson.top
            anchors.leftMargin: _root.width/2 - _oneLesson.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("6 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            TextInput{
                id:_inputSixLesson
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                maximumLength: 40

                Connections{
                    target:appEngine
                    onShowLessons:_inputSixLesson.text = lesson6
                }
            }
        }


        Button{
            id:_moButton
            width: _root.height/10
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _root.left
            text: qsTr("Mo");
            onClicked: {
                appEngine.selectWeekDay(0);
            }
        }

        Button{
            id:_tuButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _moButton.right
            text: qsTr("Tu");
            onClicked: {
                appEngine.selectWeekDay(1);
                activeWeekday = 1;
            }
        }

        Button{
            id:_weButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _tuButton.right
            text: qsTr("We");
            onClicked: {
                appEngine.selectWeekDay(2);
                activeWeekday = 2;
            }
        }

        Button{
            id:_thButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _weButton.right
            text: qsTr("Th");
            onClicked: {
                appEngine.selectWeekDay(3);
                activeWeekday = 3;
            }
        }

        Button{
            id:_frButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _thButton.right
            text: qsTr("Fr");
            onClicked: {
                appEngine.selectWeekDay(4);
                activeWeekday = 4;
            }
        }

        Button{
            id:_saButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _frButton.right
            text: qsTr("Sa");
            onClicked: {
                appEngine.selectWeekDay(5);
                activeWeekday = 5;
            }
        }
        Text{
            id:_nameWeekday
            anchors.bottom: _moButton.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: (_root.width+_root.height)/60
            text: qsTr("Monday")
            Connections{
                target: appEngine
                onShowWeekday:_nameWeekday.text = weekday
            }
        }
    }
    Page{
        id:_mainPage1
        anchors.fill: parent

        Button{
            id:_toEdit
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: _MoButton.top
            anchors.left: _root.right;
            text: qsTr("Edit...")
            onClicked: {
                _mainStackView.push(_mainPage2)
            }
        }

        StandartForm {
            id:_oneLessonShow
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: _root.width/2 - _oneLessonShow.width/2
            anchors.topMargin: _root.height / 20
            Text{
                text: qsTr("1 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            Text{
                id:_OneLessonText
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                Connections{
                    target:appEngine
                    onShowLessons:_OneLessonText.text = lesson1
                }
            }
        }

        StandartForm {
            id:_twoLessonShow
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _oneLessonShow.top
            anchors.leftMargin: _root.width/2 - _twoLessonShow.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("2 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            Text{
                id:_TwoLessonText
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                Connections{
                    target:appEngine
                    onShowLessons:_TwoLessonText.text = lesson2
                }
            }
        }

        StandartForm {
            id:_threeLessonShow
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _twoLessonShow.top
            anchors.leftMargin: _root.width/2 - _threeLessonShow.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("3 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            Text{
                id:_ThreeLessonText
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                Connections{
                    target:appEngine
                    onShowLessons:_ThreeLessonText.text = lesson3
                }
            }
        }

        StandartForm {
            id:_fourLessonShow
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _threeLessonShow.top
            anchors.leftMargin: _root.width/2 - _fourLessonShow.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("4 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            Text{
                id:_FourLessonText
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                Connections{
                    target:appEngine
                    onShowLessons:_FourLessonText.text = lesson4
                }
            }
        }

        StandartForm {
            id:_fiveLessonShow
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _fourLessonShow.top
            anchors.leftMargin: _root.width/2 - _fiveLessonShow.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("5 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            Text{
                id:_FiveLessonText
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                Connections{
                    target:appEngine
                    onShowLessons:_FiveLessonText.text = lesson5
                }
            }
        }

        StandartForm {
            id:_sixLessonShow
            _width:_root.width/1.2
            _height:_root.height/20
            _borderSize: 1
            _radius:7
            anchors.left: parent.left
            anchors.top: _fiveLessonShow.top
            anchors.leftMargin: _root.width/2 - _sixLessonShow.width/2
            anchors.topMargin: _root.height / 10
            Text {
                text: qsTr("6 lesson")
                font.pointSize: (_root.width+_root.height)/ 100
                anchors.bottom: parent.top
            }
            Text{
                id:_SixLessonText
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: (_root.width+_root.height)/60
                horizontalAlignment: TextInput.AlignHCenter
                Connections{
                    target:appEngine
                    onShowLessons:_SixLessonText.text = lesson6
                }
            }
        }


        Button{
            id:_MoButton
            width: _root.height/10
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _root.left
            text: qsTr("Mo");
            onClicked: {
                appEngine.selectWeekDay(0);
            }
        }

        Button{
            id:_TuButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _MoButton.right
            text: qsTr("Tu");
            onClicked: {
                appEngine.selectWeekDay(1);
                activeWeekday = 1;
            }
        }

        Button{
            id:_WeButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _TuButton.right
            text: qsTr("We");
            onClicked: {
                appEngine.selectWeekDay(2);
                activeWeekday = 2;
            }
        }

        Button{
            id:_ThButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _WeButton.right
            text: qsTr("Th");
            onClicked: {
                appEngine.selectWeekDay(3);
                activeWeekday = 3;
            }
        }

        Button{
            id:_FrButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _ThButton.right
            text: qsTr("Fr");
            onClicked: {
                appEngine.selectWeekDay(4);
                activeWeekday = 4;
            }
        }

        Button{
            id:_SaButton
            width: _root.width/6
            height: _root.height/10
            anchors.bottom: parent.bottom
            anchors.left: _FrButton.right
            text: qsTr("Sa");
            onClicked: {
                appEngine.selectWeekDay(5);
                activeWeekday = 5;
            }
        }
        Text{
            id:_NameWeekday
            anchors.bottom: _MoButton.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: (_root.width+_root.height)/60
            text: qsTr("Monday")
            Connections{
                target: appEngine
                onShowWeekday:_NameWeekday.text = weekday
            }
        }
    }
}

