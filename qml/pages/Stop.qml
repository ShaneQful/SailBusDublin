/*
* Copyright (c) 2014 Shane Quigley
*
* This software is MIT licensed see link for details
* http://www.opensource.org/licenses/MIT
*
* @author Shane Quigley
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property bool loading: false

    BusyIndicator {
        anchors.centerIn: parent
        running: page.loading
        visible: page.loading
    }

    SilicaListView {
        id: listView
        PullDownMenu {
            MenuItem {
                text: "Refresh"
                onClicked: {
                    page.loading = true;
                    Qt.dublinBusState.openStop(Qt.dublinBusState.getCurrentStop(), function () {
                        page.loading = false;
                        pageStack.replace(Qt.resolvedUrl("Stop.qml"));
                    }, function() {
                        page.loading = false;
                        pageStack.push(Qt.resolvedUrl("ErrorPage.qml"));
                    });
                }
            }
            MenuItem {
                text: "Open Location"
                onClicked: {
                    page.loading = true;
                    Qt.dublinBusState.getStopLocation(function (loc) {
                        page.loading = false;
                        Qt.openUrlExternally("geo:" + loc);
                    }, function () {
                        page.loading = false;
                        console.log("Error - No location found");
                    });
                }
            }
        }
        model: Qt.dublinBusState.getStopData().length
        anchors.fill: parent
        header: PageHeader {
            title: Qt.dublinBusState.getCurrentStop() + " - Stop"
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                text: Qt.dublinBusState.getBusString(index)
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
        }
        VerticalScrollDecorator {}
    }
}





