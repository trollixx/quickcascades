#include <QtCore>
#include <QtGui>
#include <QtDeclarative>

#include <QDir>
//#include <QGLWidget>
//#include <QGLFormat>

int main(int argc, char *argv[])
{
    //QApplication::setGraphicsSystem("opengl");

    QApplication app(argc, argv);

    //qputenv("QML_IMPORT_TRACE", "1");

    QDeclarativeView *m_view = new QDeclarativeView();

    m_view->engine()->addPluginPath("../../build");

    /* GL viewport increases performance on blackberry
    QGLFormat format = QGLFormat::defaultFormat();
    format.setSampleBuffers(false);
    QGLWidget *glWidget = new QGLWidget(format);
    glWidget->setAutoFillBackground(false);

    view->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);
    view->setAttribute(Qt::WA_OpaquePaintEvent);
    view->setAttribute(Qt::WA_NoSystemBackground);
    view->viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    view->viewport()->setAttribute(Qt::WA_NoSystemBackground);*/

    //QGLFormat format = QGLFormat::defaultFormat();
    //format.setSampleBuffers(false);

    //QGLWidget *glWidget = new QGLWidget(format);
    // Comment the following line if you get display problems
    // (usually when the top-level element is an Item and not a Rectangle)
    //glWidget->setAutoFillBackground(false);
    //m_view->setViewport(glWidget);

    //m_view->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);
    //m_view->setAttribute(Qt::WA_OpaquePaintEvent);
    //m_view->setAttribute(Qt::WA_NoSystemBackground);
    //m_view->viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    //m_view->viewport()->setAttribute(Qt::WA_NoSystemBackground);

    m_view->setSource(QUrl("qrc:/qml/main.qml"));
    //m_view->setSource(QUrl("qml/main.qml"));
    m_view->setResizeMode(QDeclarativeView::SizeRootObjectToView);

    /* Prepare the QML view and load the game content */
    /*m_view->setSource(QUrl("qrc:qml/main.qml"));
    m_view->setResizeMode(QDeclarativeView::SizeRootObjectToView);*/
    //m_view->showFullScreen();
    m_view->resize(1280, 720);
    m_view->show();

    QObject::connect(m_view->engine(), SIGNAL(quit()), &app, SLOT(quit()));

    return app.exec();
}

