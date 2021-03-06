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

#include "style.h"

#include <QDir>
#include <QSettings>

Style::Style(QString themeFileName, QObject *parent):
    QObject(parent),
    m_themeFileName(themeFileName)
{
    reload();
}

QString Style::themeFileName() const
{
    return m_themeFileName;
}

void Style::setThemeFileName(const QString &fileName)
{
    if (fileName != m_themeFileName) {
        m_themeFileName = fileName;
        emit themeFileNameChanged();
    }
}

bool Style::reload()
{
    QSettings styleSettings(m_themeFileName, QSettings::IniFormat);
    if (styleSettings.status() != QSettings::NoError || !styleSettings.allKeys().count()) {
        qWarning("Cannot load '%s' theme file.", m_themeFileName.toStdString().c_str());
        return false;
    }

    styleSettings.beginGroup("General");
    styleSettings.endGroup();

    styleSettings.beginGroup("ActionBar");
    m_actionBarDefaultIcon = styleSettings.value("default-icon").toString();
    m_actionBarPressedItemColor = styleSettings.value("pressed-item-color").toString();
    styleSettings.endGroup();

    styleSettings.beginGroup("Page");
    m_pageBackgroundColor = styleSettings.value("background-color").toString();
    m_pageBackgroundImage = styleSettings.value("background-image").toUrl();
    styleSettings.endGroup();

    styleSettings.beginGroup("TabBar");
    m_tabBarMenuIcon = styleSettings.value("menu-icon").toString();
    m_tabBarPressedItemColor = styleSettings.value("pressed-item-color").toString();
    styleSettings.endGroup();

    styleSettings.beginGroup("TabMenu");
    m_tabMenuBackgroundColor = styleSettings.value("background-color").toString();
    m_tabMenuCurrentItemColor = styleSettings.value("current-item-color").toString();
    m_tabMenuPressedItemColor = styleSettings.value("pressed-item-color").toString();
    m_tabMenuPressedItemBorderColor = styleSettings.value("pressed-item-border-color").toString();
    m_tabMenuPressedItemBorderWidth = styleSettings.value("pressed-item-border-width").toInt();
    styleSettings.endGroup();

    styleSettings.beginGroup("TitleBar");
    m_titleBarBackgroundColor = styleSettings.value("background-color").toString();
    m_titleBarOpacity = styleSettings.value("opacity").toReal();
    styleSettings.endGroup();

    styleSettings.beginGroup("ToolBar");
    m_toolBarBackBackgroundImage = styleSettings.value("back-background-image").toString();
    m_toolBarBackIcon = styleSettings.value("back-icon").toString();
    styleSettings.endGroup();

    return true;
}
