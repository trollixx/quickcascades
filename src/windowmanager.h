#ifndef WINDOWMANAGER_H
#define WINDOWMANAGER_H

#include <QObject>

class QQuickItem;

class WindowManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQuickItem *appWindow READ appWindow WRITE setAppWindow NOTIFY appWindowChanged)
    Q_PROPERTY(QQuickItem *tabbedPane READ tabbedPane WRITE setTabbedPane NOTIFY tabbedPaneChanged)
public:
    explicit WindowManager(QObject *parent = 0);

    QQuickItem *appWindow() const;
    void setAppWindow(QQuickItem *item);

    QQuickItem *tabbedPane() const;
    void setTabbedPane(QQuickItem *item);

signals:
    void appWindowChanged();
    void tabbedPaneChanged();

public slots:

private:
    QQuickItem *m_appWindow;
    QQuickItem *m_tabbedPane;
};

#endif // WINDOWMANAGER_H

