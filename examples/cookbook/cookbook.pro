include(../examples.pri)

QT += declarative xml sql network xmlpatterns

SOURCES += main.cpp

OTHER_FILES += bar-descriptor.xml \
    assets/qmldir \
    assets/main.qml \
    assets/common/RecipeItem.qml

RESOURCES += \
    qml.qrc
