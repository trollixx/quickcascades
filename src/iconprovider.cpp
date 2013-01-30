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

#include "iconprovider.h"

#include <QSettings>
#include <QFileInfo>

IconProvider::IconProvider(const QString themeFileName, const QString iconPath) :
    QQuickImageProvider(Image, ForceAsynchronousImageLoading),
    m_themeFileName(themeFileName),
    m_iconPath(iconPath)
{
    if (!iconPath.isEmpty())
        m_iconPath += "/";
    reload();
}

bool IconProvider::reload()
{
    QSettings settings(m_themeFileName, QSettings::IniFormat);
    if (settings.status() != QSettings::NoError || !settings.allKeys().count()) {
        qWarning("Cannot load '%s' icon theme file.", m_themeFileName.toStdString().c_str());
        return false;
    }

    foreach (QString key, settings.allKeys()) {
        if (!QFileInfo(m_iconPath + settings.value(key).toString()).exists())
            continue;

        QImage icon(m_iconPath + settings.value(key).toString());

        if (icon.isNull())
            continue;

        m_cache.insert(key, icon);
    }

    return true;
}

QImage IconProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    QImage icon = m_cache.value(id);
    if (requestedSize.isValid() && icon.size() != requestedSize)
        icon = icon.scaled(requestedSize, Qt::KeepAspectRatio, Qt::SmoothTransformation);
    *size = icon.size();
    return icon;
}
