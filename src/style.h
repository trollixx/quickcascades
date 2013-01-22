#ifndef PLATFORMHELPER_H
#define PLATFORMHELPER_H

#include <QColor>
#include <QObject>
#include <QUrl>

class Style : public QObject
{
    Q_OBJECT

    // Default styles
    Q_PROPERTY(QColor pageBackgroundColor READ pageBackgroundColor CONSTANT)
    Q_PROPERTY(QUrl pageBackgroundImage READ pageBackgroundImage CONSTANT)

    // ActionBar
    Q_PROPERTY(QColor actionBarBackgroundColor READ actionBarBackgroundColor CONSTANT)

    // Text Field
    Q_PROPERTY(QColor textFieldBackgroundColor READ textFieldBackgroundColor CONSTANT)
    Q_PROPERTY(QColor textFieldBorderColor READ textFieldBorderColor CONSTANT)
    Q_PROPERTY(QColor textFieldBorderColorFocused READ textFieldBorderColorFocused CONSTANT)
public:
    Style(QObject *parent = 0);
    virtual ~Style() {}

    QColor pageBackgroundColor() const { return QColor("#262626"); }
    QUrl pageBackgroundImage() const { return QUrl(); }

    QColor actionBarBackgroundColor() const { return QColor("#2b2b2b"); }

    QColor textFieldBackgroundColor() const { return QColor("#f9f9f9"); }
    QColor textFieldBorderColor() const { return QColor("#aaa"); }
    QColor textFieldBorderColorFocused() const { return QColor("#00a7de"); }
};

#endif // PLATFORMHELPER_H

