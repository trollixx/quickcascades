#include "quickcascades_plugin.h"

#include "quickcascades.h"
#include "style.h"

#include <QtQml>
#include <QQmlContext>
#include <QQmlEngine>

#include <QDebug>

static QObject *styleObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new Style();
}

void QuickCascadesPlugin::registerTypes(const char *uri)
{
    // @uri QuickCascades
    qmlRegisterSingletonType<Style>(uri, 1, 0, "Style", styleObjectProvider);
    /*qmlRegisterSingletonType<WindowManager>(uri, 1, 0, "WindowManager",
                                            [&](QQmlEngine *, QJSEngine *) -> QObject* { return new WindowManager(); });*/

    qmlRegisterUncreatableType<QCPageStatus>(uri, 1, 0, "PageStatus", "");
    qmlRegisterUncreatableType<QCSidebarState>(uri, 1, 0, "SidebarState", "");
}

void QuickCascadesPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(engine)
    Q_UNUSED(uri)
}
