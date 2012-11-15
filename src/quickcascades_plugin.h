#ifndef QUICKCASCADES_PLUGIN_H
#define QUICKCASCADES_PLUGIN_H

#include <QQmlExtensionPlugin>

class QuickCascadesPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "com.wisetroll.QuickCascades")
public:
    void registerTypes(const char *uri);
    void initializeEngine(QQmlEngine *engine, const char *uri);
};

#endif // QUICKCASCADES_PLUGIN_H

