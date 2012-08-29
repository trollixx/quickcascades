include(../examples.pri)

QT += declarative xml sql network xmlpatterns svg

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

OTHER_FILES += bar-descriptor.xml \
    qml/main.qml \
    qml/qmldir

RESOURCES += \
    qml.qrc
