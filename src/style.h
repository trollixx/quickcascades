#ifndef PLATFORMHELPER_H
#define PLATFORMHELPER_H

#include <QColor>
#include <QObject>
#include <QUrl>

class Style : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString themeFileName READ themeFileName NOTIFY themeFileNameChanged)

    // Default
    Q_PROPERTY(QColor defaultHighlightColor READ defaultHighlightColor NOTIFY styleUpdated)

    // Page
    Q_PROPERTY(QColor pageBackgroundColor READ pageBackgroundColor NOTIFY styleUpdated)
    Q_PROPERTY(QUrl pageBackgroundImage READ pageBackgroundImage NOTIFY styleUpdated)

    // TabMenu
    Q_PROPERTY(QColor tabMenuBackgroundColor READ tabMenuBackgroundColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabMenuCurrentItemColor READ tabMenuCurrentItemColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabMenuPressedItemColor READ tabMenuPressedItemColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabMenuPressedItemBorderColor READ tabMenuPressedItemBorderColor NOTIFY styleUpdated)
    Q_PROPERTY(int tabMenuPressedItemBorderWidth READ tabMenuPressedItemBorderWidth NOTIFY styleUpdated)

    // TitleBar


    // ActionBar
    Q_PROPERTY(QColor actionBarBackgroundColor READ actionBarBackgroundColor NOTIFY styleUpdated)

    // Text Field
    Q_PROPERTY(QColor textFieldBackgroundColor READ textFieldBackgroundColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor textFieldBorderColor READ textFieldBorderColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor textFieldBorderColorFocused READ textFieldBorderColorFocused NOTIFY styleUpdated)
public:
    Style(QString themeFileName, QObject *parent = 0);
    virtual ~Style() {}

    QString themeFileName() const;
    void setThemeFileName(const QString &fileName);

    bool reload();

    // Style related methods
    QColor defaultHighlightColor() const { return QColor("#262626"); }

    QColor actionBarBackgroundColor() const { return QColor("#2b2b2b"); }

    QColor textFieldBackgroundColor() const { return QColor("#f9f9f9"); }
    QColor textFieldBorderColor() const { return QColor("#aaa"); }
    QColor textFieldBorderColorFocused() const { return QColor("#00a7de"); }

    QColor pageBackgroundColor() const { return m_pageBackgroundColor; }
    QUrl pageBackgroundImage() const { return m_pageBackgroundImage; }

    QColor tabMenuBackgroundColor() const { return m_tabMenuBackgroundColor; }
    QColor tabMenuCurrentItemColor() const { return m_tabMenuCurrentItemColor; }
    QColor tabMenuPressedItemColor() const { return m_tabMenuPressedItemColor; }
    QColor tabMenuPressedItemBorderColor() const { return m_tabMenuPressedItemBorderColor; }
    int tabMenuPressedItemBorderWidth() const { return m_tabMenuPressedItemBorderWidth; }

signals:
    void themeFileNameChanged();
    void styleUpdated();

private:
    QString m_themeFileName;

    QColor m_defaultHighlightColor;

    QColor m_tabMenuBackgroundColor;
    QColor m_tabMenuCurrentItemColor;
    QColor m_tabMenuPressedItemColor;
    QColor m_tabMenuPressedItemBorderColor;
    int m_tabMenuPressedItemBorderWidth;

    QColor m_pageBackgroundColor;
    QUrl m_pageBackgroundImage;
};

#endif // PLATFORMHELPER_H

