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
                title: "About"
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
                text: "<strong>SailBusDublin</strong> (0.2-2)<br>

Real Time Information App for Dublin bus for the Sailfish Operating System.<br><br>

The source code of this app is available on <a href=\"https://github.com/ShaneQful/SailBusDublin\">GitHub</a>.<br>
<br>

Copyright (c) 2014 Shane Quigley<br><br>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:<br><br>

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.<br><br>

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
            }
        }
    }
}
