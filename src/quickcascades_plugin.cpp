#include "quickcascades_plugin.h"
#include "screen.h"
#include "thememanager.h"

#include <QQmlContext>
#include <QQmlEngine>

void QuickCascadesPlugin::registerTypes(const char *uri)
{
    Q_UNUSED(uri)
    // @uri QuickCascades
    //qmlRegisterType<ThemeManager>(uri, 1, 0, "ThemeManager");
}

void QuickCascadesPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri)

    engine->addImportPath(":/quickcascades");
    engine->rootContext()->setContextProperty("Screen", new Screen());
    engine->rootContext()->setContextProperty("ThemeManager", new ThemeManager());
}
