#ifndef QUICKCASCADES_PLUGIN_H
#define QUICKCASCADES_PLUGIN_H

#include <QQmlExtensionPlugin>

class QJSEngine;
class QQmlEngine;

class QuickCascadesPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "com.wisetroll.QuickCascades")
public:
    void registerTypes(const char *uri);
    void initializeEngine(QQmlEngine *engine, const char *uri);

private:
    static QString m_themeFileName;

    static QObject *styleObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine);
    static QObject *windowManagerObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine);
};

#endif // QUICKCASCADES_PLUGIN_H

