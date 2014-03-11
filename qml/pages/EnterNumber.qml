import QtQuick 2.0
import Sailfish.Silica 1.0
import "../state.js" as StateLogic

Page {
    id: page
    property bool loading: false
    function successRoute() {
        page.loading = false;
        Qt.dublinBusState = StateLogic.state;
        Qt.dublinBusState.stopOpenedByRoute = true;
        pageStack.push(Qt.resolvedUrl("Route.qml"));
    }

    function successStop() {
        page.loading = false;
        Qt.dublinBusState = StateLogic.state;
        Qt.dublinBusState.stopOpenedByRoute = false;
        pageStack.push(Qt.resolvedUrl("Stop.qml"));
    }

    function error() {
        page.loading = false;
        console.log("Error");
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: page.loading
        visible: page.loading
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Open Stop"
                onClicked: {
                    page.loading = true;
                    StateLogic.state.openStop(routenumber.text.toUpperCase().trim(), successStop, error);
                }
            }
            MenuItem {
                text: "Open Route"
                onClicked: {
                    page.loading = true;
                    StateLogic.state.openRoute(routenumber.text.toUpperCase().trim(), successRoute, error);
                }
            }
        }

        contentHeight: column.height
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Enter Route or Stop Number"
            }
            TextArea {
                id: routenumber
                width: parent.width
                inputMethodHints: Qt.ImhPreferNumbers
            }
        }
    }
}