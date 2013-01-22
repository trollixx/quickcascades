#include "quickcascades_plugin.h"

#include "quickcascades.h"
#include "style.h"
#include "windowmanager.h"

#include <QtQml>
#include <QQmlContext>
#include <QQmlEngine>

static QObject *styleObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new Style();
}

static QObject *windowManagerObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new WindowManager();
}

void QuickCascadesPlugin::registerTypes(const char *uri)
{
    qmlRegisterSingletonType<Style>(uri, 1, 0, "Style", styleObjectProvider);
    qmlRegisterSingletonType<WindowManager>(uri, 1, 0, "WindowManager", windowManagerObjectProvider);

    // @uri QuickCascades
    qmlRegisterUncreatableType<QCPageStatus>(uri, 1, 0, "PageStatus", "");
    qmlRegisterUncreatableType<QCSidebarState>(uri, 1, 0, "SidebarState", "");
}

void QuickCascadesPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(engine)
    Q_UNUSED(uri)
}
