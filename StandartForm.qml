import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Item{
    property int _width: 100
    property int _height: 50
    property color _color: "lightgrey"
    property alias _radius: mainRec.radius
    property alias _borderSize: mainRec.border.width
    width: _width
    height: _height
    Rectangle{
        id:mainRec
        width: parent.width
        height: parent.height
        color: _color
        radius: 0
        border.width: 0;
    }
}
