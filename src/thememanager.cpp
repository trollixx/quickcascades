#include "thememanager.h"

#include <qdeclarative.h>

ThemeManager::ThemeManager(QObject *parent):
    QObject(parent)
{
    // By default, QDeclarativeItem does not draw anything. If you subclass
    // QDeclarativeItem to create a visual item, you will need to uncomment the
    // following line:

    // setFlag(ItemHasNoContents, false);
}

ThemeManager::~ThemeManager()
{
}

QColor ThemeManager::backgroundColor() const
{
    return QColor("#262626");
}

