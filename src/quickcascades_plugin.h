#ifndef QUICKCASCADES_PLUGIN_H
#define QUICKCASCADES_PLUGIN_H

#include <QDeclarativeExtensionPlugin>

class QuickCascadesPlugin : public QDeclarativeExtensionPlugin
{
    Q_OBJECT

public:
    void registerTypes(const char *uri);
    void initializeEngine(QDeclarativeEngine *engine, const char *uri);
};

#endif // QUICKCASCADES_PLUGIN_H

