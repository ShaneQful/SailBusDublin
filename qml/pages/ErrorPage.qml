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

    SilicaFlickable {
        anchors.fill: parent

        contentHeight: column.height
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Error Contacting Backend"
            }
            Text {
                width: parent.width - 2*Theme.paddingLarge
                x: Theme.paddingLarge
                color: Theme.secondaryColor
                wrapMode: Text.Wrap
                textFormat: Text.StyledText
                horizontalAlignment: Text.AlignHCenter
                linkColor: Theme.highlightColor
                font.pixelSize: Theme.fontSizeSmall
                onLinkActivated: Qt.openUrlExternally(link)
                text: "There was an issue contacting the backend, please log an issue if the issue persists. <br><br>
<a href=\"https://github.com/ShaneQful/SailBusDublin/issues/\">Issue Tracker</a><br>
"
            }
        }
    }
}
