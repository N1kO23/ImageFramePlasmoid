import QtCore
import QtQuick 2.0
import QtQuick.Controls 6.2 as QQC2
import QtQuick.Dialogs as QQD
import QtQuick.Layouts 1.0
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_imagePath: variableName.text

    RowLayout {
        QQD.FileDialog {
            id: fileDialog

            fileMode: QQD.FileDialog.OpenFile
            currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
            nameFilters: ["*.png *.jpg *.jpeg *.webp *.gif", "*"]
            onAccepted: {
                variableName.text = fileDialog.selectedFile.toString().replace("file://", "");
            }
        }

        QQC2.TextField {
            id: variableName

            Kirigami.FormData.label: i18n("Picture:")
            placeholderText: i18n("No file selected.")
        }

        QQC2.Button {
            text: i18n("Browse")
            icon.name: "folder-symbolic"
            onClicked: fileDialog.open()
        }

    }

}
