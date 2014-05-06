/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow
{
    id:root



    function sendRequest(uri) {

        var code = "";
        var doc = new XMLHttpRequest();
        doc.open("GET", "http://hd1.freebox.fr/pub/remote_control?code="+code+"&key="+uri);
        doc.send();




    }








    Component.onCompleted: {
        console.debug("salut")
        root.pageStack.pushAttached(secondPage,"")

    }







    initialPage: Component {

        Page {
            id:page

            SilicaFlickable {
                anchors.fill: parent

                PullDownMenu {

                    MenuItem {
                        text: "Accueil Freebox"
                        onClicked: console.log("home")
                    }
                    MenuItem {
                        text: "Enregistrer"
                        onClicked: sendRequest("rec")
                    }

                    MenuItem {
                        text: "Activé / Désactiver le son"
                        onClicked: sendRequest("mute")
                    }



                }


                PushUpMenu {
                    MenuItem {
                        text: "Eteindre / Allumer la Freebox"
                        onClicked: sendRequest("power")
                    }

                }


                Column {
                    id: column
                    spacing: Theme.paddingMedium
                    y: Theme.paddingLarge
                    width: page.width


                    PageHeader {
                        title: "FreeRemote"
                    }

                    Grid {
                        columns: 3
                        rows: 3

                    }

                    Row {

                        anchors.horizontalCenter: parent.horizontalCenter

                        Button {
                            text: "Volume +"
                            onClicked: sendRequest("vol_inc")
                        }


                        Button {
                            text: "Volume -"
                            onClicked: sendRequest("vol_dec")
                        }

                    }

                    Keypad {
                        symbolsVisible: false
                        onClicked: sendRequest(number)

                    }

                    Row {
                        spacing: 50
                        anchors.horizontalCenter: parent.horizontalCenter

                        IconButton {
                            icon.source: "image://theme/icon-m-previous-song"
                            icon.scale: 2
                            onClicked: sendRequest("bwd")


                        }

                        IconButton {
                            icon.source: "image://theme/icon-cover-next-song"
                            icon.scale: 1
                             onClicked: sendRequest("play")

                        }



                        IconButton {
                            icon.source: "image://theme/icon-m-next-song"
                            icon.scale: 2
                             onClicked: sendRequest("fwd")
                        }






                    }


                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            text: "Programme +"
                            onClicked: sendRequest("prgm_inc")
                        }


                        Button {
                            text: "Programme -"
                              onClicked: sendRequest("prgm_dec")
                        }

                    }

                }

            }
        }
    }


    Component {

        id:secondPage
        Page {

            Grid {
                anchors.centerIn: parent
                columns: 3
                rows: 3
                spacing: 60

                ColorButton {
                    color:"red"
                    onClicked: sendRequest("red")

                }



                IconButton {
                    icon.source: "image://theme/icon-direction-forward"
                    icon.horizontalAlignment: Image.AlignHCenter
                    width: 120
                    height: 120
                    onClicked: sendRequest("up")

                }

                ColorButton {
                    color:"blue"
                    onClicked: sendRequest("blue")
                }

                IconButton {
                    icon.source: "image://theme/icon-direction-forward"
                    icon.horizontalAlignment: Image.AlignHCenter
                    width: 120
                    height: 120
                    rotation:-90
                    onClicked: sendRequest("left")

                }

                Label {
                    width: 120
                    height: 120
                    text:"OK"
                    font.pixelSize:Theme.fontSizeExtraLarge
                    font.family: Theme.fontFamily
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color:okLabel.pressed ? Theme.highlightColor : Theme.primaryColor

                    MouseArea{
                        id:okLabel
                        anchors.fill: parent
                        onClicked: sendRequest("ok")
                    }

                }

                IconButton {
                    icon.source: "image://theme/icon-direction-forward"
                    icon.horizontalAlignment: Image.AlignHCenter
                    width: 120
                    height: 120
                    rotation:90
                    onClicked: sendRequest("right")

                }

                ColorButton {
                    color:"green"
                    onClicked: sendRequest("green")
                }


                IconButton {
                    icon.source: "image://theme/icon-direction-forward"
                    icon.horizontalAlignment: Image.AlignHCenter
                    width: 120
                    height: 120
                    rotation:180
                    onClicked: sendRequest("down")

                }

                ColorButton {
                    color:"yellow"
                    onClicked: sendRequest("yellow")
                }


            }


        }

    }



}


