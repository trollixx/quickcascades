#include <QGuiApplication>
#include <QQmlEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //qputenv("QML_IMPORT_TRACE", "1");

    QQuickView *m_view = new QQuickView();
    QObject::connect(m_view->engine(), SIGNAL(quit()), &app, SLOT(quit()));

    m_view->engine()->addPluginPath("../../build");

    m_view->setSource(QUrl::fromLocalFile("assets/main.qml"));
    m_view->setResizeMode(QQuickView::SizeRootObjectToView);

#ifdef Q_OS_BLACKBERRY
    m_view->showFullScreen();
#else
    m_view->resize(720, 1280);
    m_view->show();
#endif

    return app.exec();
}

