#include <QtCore>
#include <QtGui>
#include <QtDeclarative>

#include <QDir>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    //qputenv("QML_IMPORT_TRACE", "1");

    QDeclarativeView *m_view = new QDeclarativeView();
    QObject::connect(m_view->engine(), SIGNAL(quit()), &app, SLOT(quit()));

    m_view->engine()->addPluginPath("../../build");

    m_view->setSource(QUrl("assets/main.qml"));
    m_view->setResizeMode(QDeclarativeView::SizeRootObjectToView);

#ifdef Q_OS_BLACKBERRY
    m_view->showFullScreen();
#else
    m_view->resize(720, 1280);
    m_view->show();
#endif

    return app.exec();
}

