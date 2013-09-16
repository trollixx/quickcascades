TEMPLATE = lib
TARGET = QuickCascades

QT += quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = QuickCascades

SOURCES += $$files(src/*.cpp)

HEADERS += $$files(src/*.h)

OTHER_FILES += \
    qml/QuickCascades/qmldir \
    $$files(qml/QuickCascades/*.qml) \
    $$files(qml/QuickCascades/private/*.qml)

OTHER_FILES += \
    qml/QuickCascades/themes/cascades-light.ini

qmldir.files = qml/QuickCascades/qmldir

DESTDIR = qml/QuickCascades
OBJECTS_DIR = .obj
MOC_DIR = .moc
RCC_DIR = .rcc
UI_DIR = .uic
