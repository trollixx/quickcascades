#include "quickcascades_plugin.h"
#include "thememanager.h"

#include <qdeclarative.h>
#include <QDeclarativeContext>
#include <QDeclarativeEngine>

void QuickCascadesPlugin::registerTypes(const char *uri)
{
    // @uri QuickCascades
    //qmlRegisterType<ThemeManager>(uri, 1, 0, "ThemeManager");
}

void QuickCascadesPlugin::initializeEngine(QDeclarativeEngine *engine, const char *uri)
{
    Q_UNUSED(uri)
    engine->rootContext()->setContextProperty("ThemeManager", new ThemeManager());
    engine->addImportPath(":/quickcascades/qml");
}

Q_EXPORT_PLUGIN2(QuickCascades, QuickCascadesPlugin)

