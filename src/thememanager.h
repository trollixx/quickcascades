#ifndef PLATFORMHELPER_H
#define PLATFORMHELPER_H

#include <QColor>
#include <QObject>

/// FIXME: This temprorary stupid hardcoded ThemeManager to be replaced with new one easily customizable through ini-file

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ThemeManager)

    // Default styles
    Q_PROPERTY(QColor backgroundColor READ backgroundColor CONSTANT)

    // Text Field
    Q_PROPERTY(QColor textFieldBackgroundColor READ textFieldBackgroundColor CONSTANT)
    Q_PROPERTY(QColor textFieldBorderColor READ textFieldBorderColor CONSTANT)
    Q_PROPERTY(QColor textFieldBorderColorFocused READ textFieldBorderColorFocused CONSTANT)
public:
    ThemeManager(QObject *parent = 0);
    ~ThemeManager() {}

    QColor backgroundColor() const { return QColor("#262626"); }

    QColor textFieldBackgroundColor() const { return QColor("#f9f9f9"); }
    QColor textFieldBorderColor() const { return QColor("#aaa"); }
    QColor textFieldBorderColorFocused() const { return QColor("#00a7de"); }
};

#endif // PLATFORMHELPER_H

