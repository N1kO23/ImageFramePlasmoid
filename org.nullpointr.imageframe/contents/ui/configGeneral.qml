import QtCore
import QtQuick 2.0
import QtQuick.Controls 6.2 as QQC2
import QtQuick.Dialogs as QQD
import QtQuick.Layouts 1.0
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_imagePath: imagePath.text
    property alias cfg_playbackSpeed: playbackSpeed.value
    property alias cfg_smooth: smooth.checked

    RowLayout {
        QQD.FileDialog {
            id: fileDialog

            fileMode: QQD.FileDialog.OpenFile
            currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
            nameFilters: ["Images (*.png *.jpg *.jpeg *.webp *.gif)"]
            onAccepted: {
                imagePath.text = selectedFile.toString().replace("file://", "")
            }
        }

        QQC2.TextField {
            id: imagePath
            Kirigami.FormData.label: i18n("Picture:")
            placeholderText: i18n("No file selected.")
        }

        QQC2.Button {
            text: i18n("Browse")
            icon.name: "folder-symbolic"
            onClicked: fileDialog.open()
        }
    }

    RowLayout {
        QQC2.SpinBox {
            id: playbackSpeed
            Kirigami.FormData.label: i18n("Playback speed:")
            from: 0
            stepSize: 1
            value: 10

            textFromValue: (v) => (v / 10).toFixed(1)
            valueFromText: (t) => Math.round(Number(t) * 10)
            width: 80
        }
    }

    RowLayout {
        QQC2.CheckBox {
            id: smooth
            Kirigami.FormData.label: i18n("Smoothing:")
            text: i18n("Enable smooth scaling")
            checked: true
        }
    }
}
