TEMPLATE = lib
TARGET = QuickCascades

QT += quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = QuickCascades

SOURCES += \
    src/quickcascades_plugin.cpp \
    src/thememanager.cpp

HEADERS += \
    src/quickcascades_plugin.h \
    src/quickcascades.h \
    src/thememanager.h

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
    qml/QuickCascades/TextField.qml \
    qml/QuickCascades/TitleBar.qml \
    qml/QuickCascades/private/ActionBarActionDelegate.qml


qmldir.files = qml/QuickCascades/qmldir

DESTDIR = qml/QuickCascades
OBJECTS_DIR = .obj
MOC_DIR = .moc
RCC_DIR = .rcc
UI_DIR = .uic
