// CustomButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: button
    property alias buttonText: button.text
    property color defaultColor: "lightblue"
    property color pressedColor: "blue"
    signal customClicked

    background: Rectangle {
        color: button.pressed ? button.pressedColor : button.defaultColor
        radius: 5
    }

    onClicked: {
        customClicked(); // Emit the custom signal when the button is clicked
    }
}
