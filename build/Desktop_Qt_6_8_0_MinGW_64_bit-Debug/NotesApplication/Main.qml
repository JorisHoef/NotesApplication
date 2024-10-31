import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard

Window {
    id: window
    width: 640
    height: 480
    visible: true
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

    // Simple button
    Button {
        id: myButton
        text: "Click Me"
        anchors.centerIn: parent

        onClicked: {
            myButton.enabled = !myButton.enabled;
            myButton2.enabled = !myButton.enabled;
            console.log("Button clicked!");
        }
    }

    Button {
        id: myButton2
        text: "Click Me123"

        onClicked: {
            myButton2.enabled = !myButton2.enabled;
            myButton.enabled = !myButton2.enabled;
            console.log("Button 123 clicked!");
        }
    }
}
