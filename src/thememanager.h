#ifndef PLATFORMHELPER_H
#define PLATFORMHELPER_H

#include <QColor>
#include <QObject>

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ThemeManager)

    // Default styles
    Q_PROPERTY(QColor backgroundColor READ backgroundColor CONSTANT)
public:
    ThemeManager(QObject *parent = 0);
    ~ThemeManager();

    QColor backgroundColor() const;
};

#endif // PLATFORMHELPER_H

