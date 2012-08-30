TEMPLATE = lib
TARGET = QuickCascades
QT += declarative
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = QuickCascades

SOURCES += \
    src/quickcascades_plugin.cpp \
    src/thememanager.cpp

HEADERS += \
    src/quickcascades_plugin.h \
    src/thememanager.h


RESOURCES += \
    qml/qml.qrc

OTHER_FILES += \
    qml/QuickCascades/qmldir \
    qml/QuickCascades/AbstractActionItem.qml \
    qml/QuickCascades/AbstractPane.qml \
    qml/QuickCascades/ActionBar.qml \
    qml/QuickCascades/ActionItem.qml \
    qml/QuickCascades/Button.qml \
    qml/QuickCascades/Label.qml \
    qml/QuickCascades/NavigationPane.qml \
    qml/QuickCascades/Page.qml \
    qml/QuickCascades/TabbedPane.qml \
    qml/QuickCascades/TextField.qml \
    qml/QuickCascades/Tab.qml \
    qml/QuickCascades/TabbedPaneBar.qml \
    qml/QuickCascades/TabbedPaneSideBar.qml \
    qml/QuickCascades/TitleBar.qml \
    qml/QuickCascades/delegates/TabDelegate.qml \
    qml/QuickCascades/delegates/ActionBarActionDelegate.qml \
    qml/QuickCascades/delegates/SideBarDelegate.qml


!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qml/QuickCascades/qmldir

DESTDIR = build
OBJECTS_DIR = .obj
MOC_DIR = .moc
RCC_DIR = .rcc
UI_DIR = .uic
