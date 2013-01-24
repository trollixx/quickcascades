TEMPLATE = lib
TARGET = QuickCascades

QT += quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = QuickCascades

SOURCES += \
    src/plugin.cpp \
    src/style.cpp \
    src/windowmanager.cpp

HEADERS += \
    src/enums.h \
    src/plugin.h \
    src/style.h \
    src/windowmanager.h

OTHER_FILES += \
    qml/QuickCascades/qmldir \
    qml/QuickCascades/AbstractBar.qml \
    qml/QuickCascades/AbstractPane.qml \
    qml/QuickCascades/Action.qml \
    qml/QuickCascades/ApplicationWindow.qml \
    qml/QuickCascades/Label.qml \
    qml/QuickCascades/Page.qml \
    qml/QuickCascades/PageStack.qml \
    qml/QuickCascades/PageStack.js \
    qml/QuickCascades/Tab.qml \
    qml/QuickCascades/TabbedPane.qml \
    qml/QuickCascades/TextField.qml \
    qml/QuickCascades/TitleBar.qml \
    qml/QuickCascades/private/ActionBar.qml \
    qml/QuickCascades/private/ActionBarActionDelegate.qml \
    qml/QuickCascades/private/BackActionDelegate.qml \
    qml/QuickCascades/private/BottomBar.qml \
    qml/QuickCascades/private/TabBar.qml \
    qml/QuickCascades/private/TabBarDelegate.qml \
    qml/QuickCascades/private/TabMenuDelegate.qml

OTHER_FILES += \
    qml/QuickCascades/themes/cascades-light.theme

qmldir.files = qml/QuickCascades/qmldir

DESTDIR = qml/QuickCascades
OBJECTS_DIR = .obj
MOC_DIR = .moc
RCC_DIR = .rcc
UI_DIR = .uic
