#include "quickcascades_plugin.h"

#include "quickcascades.h"
#include "screen.h"
#include "thememanager.h"

#include <QQmlContext>
#include <QQmlEngine>

void QuickCascadesPlugin::registerTypes(const char *uri)
{
    // @uri QuickCascades
    qmlRegisterUncreatableType<QCPageStatus>(uri, 1, 0, "PageStatus", "");
}

void QuickCascadesPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri)

    //engine->rootContext()->setContextProperty("Screen", new Screen());
    engine->rootContext()->setContextProperty("ThemeManager", new ThemeManager());
}
