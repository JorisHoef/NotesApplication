// Main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    // Input panel for the virtual keyboard
    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }

        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    Column {
        anchors.fill: parent
        spacing: 10

        // ListView to display a list of items
        ListView {
            width: parent.width
            height: 200
            model: ListModel {
                ListElement { text: "Item 1" }
                ListElement { text: "Item 2" }
                ListElement { text: "Item 3" }
            }

            delegate: Item {
                width: parent.width
                height: 40

                Rectangle {
                    width: parent.width
                    height: 40
                    color: "lightgray"
                    border.color: "gray"

                    Text {
                        text: model.text
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            textArea.text = model.text + " details...";
                        }
                    }
                }
            }
        }

        // TextArea that shows details of the selected item
        TextArea {
            id: textArea
            width: parent.width
            height: 200
            placeholderText: "Select an item from the list to see details."
        }

        // Instance of CustomButton
        CustomButton {
            buttonText: "Another Custom Button"
            onCustomClicked: {
                console.log("Another CustomButton clicked in Main.qml");
            }
        }
    }

    Button {
        id: myButton
        text: "Click Me"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        onClicked: {
            myButton.enabled = !myButton.enabled;
            myButton2.enabled = !myButton.enabled;
            console.log("Button clicked!");
        }
    }

    Button {
        id: myButton2
        text: "Click Me 123"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: myButton.top
        anchors.bottomMargin: 10

        onClicked: {
            myButton2.enabled = !myButton2.enabled;
            myButton.enabled = !myButton2.enabled;
            console.log("Button 123 clicked!");
        }
    }

    Slider {
        id: mySlider
        from: 0
        to: 100
        value: 50

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: myButton2.top
        anchors.bottomMargin: 10

        onValueChanged: {
            myButton.text = value.toString(); // Update button text with slider value
        }
    }
}
