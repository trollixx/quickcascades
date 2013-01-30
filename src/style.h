/****************************************************************************
**
** Copyright (C) 2012-2013 Oleg Shparber.
** All rights reserved.
**
** This file is part of the QuickCascades project.
**
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of the QuickCascades project nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
****************************************************************************/

#ifndef PLATFORMHELPER_H
#define PLATFORMHELPER_H

#include <QColor>
#include <QObject>
#include <QUrl>

class Style : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString themeFileName READ themeFileName NOTIFY themeFileNameChanged)

    // ActionBar
    Q_PROPERTY(QString actionBarDefaultIcon READ actionBarDefaultIcon NOTIFY styleUpdated)
    Q_PROPERTY(QColor actionBarPressedItemColor READ actionBarPressedItemColor NOTIFY styleUpdated)

    // Page
    Q_PROPERTY(QColor pageBackgroundColor READ pageBackgroundColor NOTIFY styleUpdated)
    Q_PROPERTY(QUrl pageBackgroundImage READ pageBackgroundImage NOTIFY styleUpdated)

    // TabBar
    Q_PROPERTY(QString tabBarMenuIcon READ tabBarMenuIcon NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabBarPressedItemColor READ tabBarPressedItemColor NOTIFY styleUpdated)

    // TabMenu
    Q_PROPERTY(QColor tabMenuBackgroundColor READ tabMenuBackgroundColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabMenuCurrentItemColor READ tabMenuCurrentItemColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabMenuPressedItemColor READ tabMenuPressedItemColor NOTIFY styleUpdated)
    Q_PROPERTY(QColor tabMenuPressedItemBorderColor READ tabMenuPressedItemBorderColor NOTIFY styleUpdated)
    Q_PROPERTY(int tabMenuPressedItemBorderWidth READ tabMenuPressedItemBorderWidth NOTIFY styleUpdated)

    // TitleBar
    Q_PROPERTY(QColor titleBarBackgroundColor READ titleBarBackgroundColor NOTIFY styleUpdated)
    Q_PROPERTY(qreal titleBarOpacity READ titleBarOpacity NOTIFY styleUpdated)

    // ToolBar
    Q_PROPERTY(QString toolBarBackBackgroundImage READ toolBarBackBackgroundImage NOTIFY styleUpdated)
    Q_PROPERTY(QString toolBarBackIcon READ toolBarBackIcon NOTIFY styleUpdated)

public:
    Style(QString themeFileName, QObject *parent = 0);
    virtual ~Style() {}

    QString themeFileName() const;
    void setThemeFileName(const QString &fileName);

    bool reload();

    QString actionBarDefaultIcon() const { return m_actionBarDefaultIcon; }
    QColor actionBarPressedItemColor() const { return m_actionBarPressedItemColor; }

    QColor pageBackgroundColor() const { return m_pageBackgroundColor; }
    QUrl pageBackgroundImage() const { return m_pageBackgroundImage; }

    QString tabBarMenuIcon() const { return m_tabBarMenuIcon; }
    QColor tabBarPressedItemColor() const { return m_tabBarPressedItemColor; }

    QColor tabMenuBackgroundColor() const { return m_tabMenuBackgroundColor; }
    QColor tabMenuCurrentItemColor() const { return m_tabMenuCurrentItemColor; }
    QColor tabMenuPressedItemColor() const { return m_tabMenuPressedItemColor; }
    QColor tabMenuPressedItemBorderColor() const { return m_tabMenuPressedItemBorderColor; }
    int tabMenuPressedItemBorderWidth() const { return m_tabMenuPressedItemBorderWidth; }

    QColor titleBarBackgroundColor() const { return m_titleBarBackgroundColor; }
    qreal titleBarOpacity() const { return m_titleBarOpacity; }

    QString toolBarBackBackgroundImage() const { return m_toolBarBackBackgroundImage; }
    QString toolBarBackIcon() const { return m_toolBarBackIcon; }

signals:
    void themeFileNameChanged();
    void styleUpdated();

private:
    QString m_themeFileName;

    QString m_actionBarDefaultIcon;
    QColor m_actionBarPressedItemColor;

    QColor m_pageBackgroundColor;
    QUrl m_pageBackgroundImage;

    QString m_tabBarMenuIcon;
    QColor m_tabBarPressedItemColor;

    QColor m_tabMenuBackgroundColor;
    QColor m_tabMenuCurrentItemColor;
    QColor m_tabMenuPressedItemColor;
    QColor m_tabMenuPressedItemBorderColor;
    int m_tabMenuPressedItemBorderWidth;

    QColor m_titleBarBackgroundColor;
    qreal m_titleBarOpacity;

    QString m_toolBarBackBackgroundImage;
    QString m_toolBarBackIcon;
};

#endif // PLATFORMHELPER_H
