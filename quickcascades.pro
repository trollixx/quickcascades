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
    qml/QuickCascades/Button.qml \
    qml/QuickCascades/Label.qml \
    qml/QuickCascades/NavigationPane.js \
    qml/QuickCascades/NavigationPane.qml \
    qml/QuickCascades/Page.qml \
    qml/QuickCascades/TabbedPane.qml \
    qml/QuickCascades/TextField.qml \
    qml/QuickCascades/Tab.qml \
    qml/QuickCascades/TabbedPaneBar.qml \
    qml/QuickCascades/TabbedPaneSideBar.qml \
    qml/QuickCascades/TitleBar.qml \
    qml/QuickCascades/private/TabDelegate.qml \
    qml/QuickCascades/private/ActionBarActionDelegate.qml \
    qml/QuickCascades/private/SideBarDelegate.qml


qmldir.files = qml/QuickCascades/qmldir

DESTDIR = qml/QuickCascades
OBJECTS_DIR = .obj
MOC_DIR = .moc
RCC_DIR = .rcc
UI_DIR = .uic
