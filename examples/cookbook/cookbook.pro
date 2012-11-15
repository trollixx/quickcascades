include(../examples.pri)

QT += quick xml sql network xml xmlpatterns

SOURCES += main.cpp

OTHER_FILES += bar-descriptor.xml \
    assets/qmldir \
    assets/main.qml \
    assets/common/RecipeItem.qml

RESOURCES +=
