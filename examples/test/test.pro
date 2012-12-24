include(../examples.pri)

QT += quick xml sql network

SOURCES += main.cpp

OTHER_FILES += bar-descriptor.xml \
    assets/qmldir \
    assets/main.qml

