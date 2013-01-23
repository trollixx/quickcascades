#include "quickcascades_plugin.h"

#include "quickcascades.h"
#include "style.h"
#include "windowmanager.h"

#include <QtQml>
#include <QQmlContext>
#include <QQmlEngine>

QString QuickCascadesPlugin::m_themeFileName;

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
    Q_UNUSED(uri)

    if (engine->property("__qc_themeFileName").isValid()) {
        m_themeFileName = engine->property("__qc_themeFileName").toString();
    } else {
        /// TODO: This is a workaroung to get a plugin path, a patch for Qt is needed
        foreach (QString path, engine->importPathList()) {
            if (QFileInfo(path + "/QuickCascades").exists()) {
                m_themeFileName = path + "/QuickCascades/themes/cascades-light.theme";
                break;
            }
        }
    }
}

QObject *QuickCascadesPlugin::styleObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new Style(m_themeFileName);
}

QObject *QuickCascadesPlugin::windowManagerObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new WindowManager();
}
