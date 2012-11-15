#include "screen.h"

#include <QGuiApplication>
#include <QScreen>
#include <QWindow>

#define DEBUG_SCREEN 1

Screen::Screen(QObject *parent) :
    QObject(parent),
    m_window(0)
{
    if (QGuiApplication::topLevelWindows().size() > 0) {
        m_window = QGuiApplication::topLevelWindows().at(0);
        connect(m_window, SIGNAL(heightChanged(int)), this, SIGNAL(heightChanged()));
        connect(m_window, SIGNAL(widthChanged(int)), this, SIGNAL(widthChanged()));
    }
}

int Screen::height() const
{
#ifdef DEBUG_SCREEN
    return 1280;
#endif

    if (!m_window)
        return 0;

    return m_window->height();
}

int Screen::width() const
{
#ifdef DEBUG_SCREEN
    return 720;
#endif

    if (!m_window)
        return 0;

    return m_window->width();
}
