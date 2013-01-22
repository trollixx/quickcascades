TEMPLATE = lib
TARGET = QuickCascades

QT += quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = QuickCascades

SOURCES += \
    src/quickcascades_plugin.cpp \
    src/style.cpp

HEADERS += \
    src/quickcascades_plugin.h \
    src/quickcascades.h \
    src/style.h

OTHER_FILES += \
    qml/QuickCascades/qmldir \
    qml/QuickCascades/AbstractPane.qml \
    qml/QuickCascades/Action.qml \
    qml/QuickCascades/ActionBar.qml \
    qml/QuickCascades/Label.qml \
    qml/QuickCascades/Page.qml \
    qml/QuickCascades/PageStack.qml \
    qml/QuickCascades/PageStack.js \
    qml/QuickCascades/Tab.qml \
    qml/QuickCascades/TabbedPane.qml \
    qml/QuickCascades/TextField.qml \
    qml/QuickCascades/TitleBar.qml \
    qml/QuickCascades/private/ActionBarActionDelegate.qml \
    qml/QuickCascades/private/BackActionDelegate.qml \
    qml/QuickCascades/private/BottomBar.qml \
    qml/QuickCascades/private/TabMenuDelegate.qml

qmldir.files = qml/QuickCascades/qmldir

DESTDIR = qml/QuickCascades
OBJECTS_DIR = .obj
MOC_DIR = .moc
RCC_DIR = .rcc
UI_DIR = .uic
