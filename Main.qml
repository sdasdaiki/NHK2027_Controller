import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Shapes 1.15

Window {
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    visible: true
    title: "Floor Plan Layout"
    color: "#dcdcdc" // 背景のグレー

    // mmをピクセルに変換するスケール係数 (例: 1000mm = 50px)
    property real scaleFactor: 0.05
    // 左右反転のbool
    property bool isLeftRightFlipped: false
    // 寸法線を描画するためのインラインコンポーネント (Qt 5.15以降)
    Item {
            id: field
            width: 5500 * scaleFactor
            height: 11000 * scaleFactor
            // アンカーを使って、Window(親)のど真ん中にフィールドを固定
            anchors.centerIn: parent
            // 左右反転
            transform: Scale {
                origin.x: field.width / 2
                origin.y: field.height / 2
                // isLeftRightFlipped が true のとき、X方向のスケールが -1 (反転) になる
                xScale: isLeftRightFlipped ? -1 : 1
            }
            Rectangle {
                property real borderWidth: 2
                x: -borderWidth
                y: -borderWidth
                width: parent.width + (borderWidth * 2)
                height: parent.height + (borderWidth * 2)
                color: "black"
                z: -1 // 背景より「奥」に配置
            }
            Rectangle {// フィールドの背景（分かりやすくするための枠）
                anchors.fill: parent // 親(field)と完全に同じ寸法・位置になる
                color: isLeftRightFlipped ? "#aad2e6" : "#f0d2d2"
            }
            Rectangle {//ストレージエリア
                x: 0
                y: 0
                width: 2000 * scaleFactor
                height: 1000 * scaleFactor
                color: isLeftRightFlipped ? "blue" : "red"
            }
            Rectangle {//スタートエリア1
                x: 0
                y: 10300 * scaleFactor
                width: 700 * scaleFactor
                height: 700 * scaleFactor
                color: isLeftRightFlipped ? "blue" : "red"
            }
            Rectangle {//スタートエリア2
                x: 800 * scaleFactor
                y: 10300 * scaleFactor
                width: 700 * scaleFactor
                height: 700 * scaleFactor
                color: isLeftRightFlipped ? "blue" : "red"
            }
            Rectangle {// SKYエリア
                x: 4900 * scaleFactor
                y: 9150 * scaleFactor
                width: 600 * scaleFactor
                height: 1200 * scaleFactor
                color: "gray"
                z: 10 // 通常は0。10に設定しているため、後から書かれた下の紫の四角より「手前」に表示される
                Text {
                    anchors.centerIn: parent
                    text: "SKY"
                    font.pixelSize: 9
                    color: "black"
                }
            }
            Rectangle {// Level 1
                x: 2500 * scaleFactor
                y: 2500 * scaleFactor
                width: 3000 * scaleFactor
                height: 6000 * scaleFactor
                color: isLeftRightFlipped ?  "#96d7dc" : "#ebb4a0"
                border.color: "black"
                border.width: 1 // 枠線の太さ（ピクセル）
            }
            Rectangle {// プラントエリア1
                x: 2530 * scaleFactor
                y: 2530 * scaleFactor
                width: 500 * scaleFactor
                height: 500 * scaleFactor
                color: "green"
            }
            Rectangle {// プラントエリア2
                x: 2530 * scaleFactor
                y: 7970 * scaleFactor
                width: 500 * scaleFactor
                height: 500 * scaleFactor
                color:"green"
            }
            Rectangle {// 共有プラントエリア1
                x: 5000 * scaleFactor
                y: 2530 * scaleFactor
                width: 500 * scaleFactor
                height: 750 * scaleFactor
                color:"green"
            }
            Rectangle {// 共有プラントエリア2
                x: 5000 * scaleFactor
                y: 7720 * scaleFactor
                width: 500 * scaleFactor
                height: 750 * scaleFactor
                color:"green"
            }
            Rectangle {// L2 エリア
                x: 4000 * scaleFactor
                y: 4000 * scaleFactor
                width: 1500 * scaleFactor
                height: 3000 * scaleFactor
                color:"gray"
            }
            Rectangle {// L2プラントエリア1
                x: 4000 * scaleFactor
                y: 4000 * scaleFactor
                width: 500 * scaleFactor
                height: 500 * scaleFactor
                color:"green"
            }
            Rectangle {// L2プラントエリア2
                x: 4000 * scaleFactor
                y: 6500 * scaleFactor
                width: 500 * scaleFactor
                height: 500 * scaleFactor
                color:"green"
            }
            Rectangle {// L1 retry エリア
                x: 3300 * scaleFactor
                y: 2530 * scaleFactor
                width: 700 * scaleFactor
                height: 700 * scaleFactor
                color:"red"
            }
            Rectangle {// ランプ
                x: 1500 * scaleFactor
                y: 2800 * scaleFactor
                width: 1000 * scaleFactor
                height: 3500 * scaleFactor
                color: isLeftRightFlipped ? "#8c96c8" : "#c8968c"
                // zを指定していないのでデフォルトの 0
            }
            Rectangle {// stairs
                x: 1500 * scaleFactor
                y: 7300 * scaleFactor
                width: 1000 * scaleFactor
                height: 900 * scaleFactor
                color: isLeftRightFlipped ? "#8c96c8" : "#c8968c"
                Rectangle {
                    x: 0
                    y: 300 * scaleFactor
                    width: parent.width
                    height: 3
                    color: "black"
                }
                Rectangle {
                    x: 0
                    y: 600 * scaleFactor
                    width: parent.width
                    height: 3
                    color: "black"
                }

            }
            Rectangle {// トランスファーエリア
                x: 1500 * scaleFactor
                y: 6300 * scaleFactor
                width: 1000 * scaleFactor
                height: 1000 * scaleFactor
                color: isLeftRightFlipped ? "#3caaf5" : "#f5aa3c"
            }
            Rectangle {// ムスティカピラー
                x: 5000 * scaleFactor
                y: 1250 * scaleFactor
                width: 500 * scaleFactor
                height: 1000 * scaleFactor
                color: "gray"
                // zを指定していないのでデフォルトの 0
                Text {
                    anchors.centerIn: parent
                    text: "ピラー"
                    font.pixelSize: 9
                    color: "black"
                }
            }
            Shape { // ムスティカ
                x: 5500 * scaleFactor // フィールドの右端（5500mmの位置）
                y: (5500 - 135) * scaleFactor // 中心が y = 5500mm になるように上へ半径分ずらす

                width: 135 * scaleFactor  // 外側に飛び出る半径
                height: 270 * scaleFactor // 直径

                ShapePath {
                    fillColor: "yellow"
                    strokeColor: "black"
                    strokeWidth: 1

                    // ① 上端からスタート
                    startX: 0; startY: 0

                    // ② 上から下へまっすぐ直線を描く（直径分の長さ）
                    PathLine { x: 0; y: 270 * scaleFactor }

                    // ③ 右側に向かってふくらむ半円を描く（半径を指定）
                    PathArc {
                        x: 0; y: 0
                        radiusX: 135 * scaleFactor
                        radiusY: 135 * scaleFactor
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                }
            }       }
    // 画面の左上に配置する「反転ボタン」（フィールドの外側・Windowの基準）
    Rectangle {
        x: 20
        y: 20
        width: 120
        height: 50
        color: "darkgray"
        radius: 8 // 角を少し丸くする
        border.color: "black"
        border.width: 1
        Text {
            anchors.centerIn: parent
            text: isLeftRightFlipped ? "blue" : "red"
            font.pixelSize: 18
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                isLeftRightFlipped = !isLeftRightFlipped
            }
        }
    }
}