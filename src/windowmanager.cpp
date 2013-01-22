#include "windowmanager.h"

WindowManager::WindowManager(QObject *parent) :
    QObject(parent),
    m_appWindow(0),
    m_tabbedPane(0)
{

}

QQuickItem *WindowManager::appWindow() const
{
    return m_appWindow;
}

void WindowManager::setAppWindow(QQuickItem *item)
{
    if (item != m_appWindow) {
        m_appWindow = item;
        emit appWindowChanged();
    }
}

QQuickItem *WindowManager::tabbedPane() const
{
    return m_tabbedPane;
}

void WindowManager::setTabbedPane(QQuickItem *item)
{
    if (item != m_tabbedPane) {
        m_tabbedPane = item;
        emit tabbedPaneChanged();
    }
}
