#ifndef SCREEN_H
#define SCREEN_H

#include <QtQml>
#include <QObject>

class QWindow;

class Screen : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int height READ height NOTIFY heightChanged)
    Q_PROPERTY(int width READ width NOTIFY widthChanged)
public:
    explicit Screen(QObject *parent = 0);

    int height() const;
    int width() const;

signals:
    void heightChanged();
    void widthChanged();

private:
    QWindow *m_window;
};

#endif // SCREEN_H
