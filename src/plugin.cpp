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

#include "plugin.h"

#include "enums.h"
#include "iconprovider.h"
#include "style.h"
#include "windowmanager.h"

#include <QtQml>
#include <QQmlContext>
#include <QQmlEngine>

QString QuickCascadesPlugin::m_themeFileName;

void QuickCascadesPlugin::registerTypes(const char *uri)
{
    qmlRegisterSingletonType<Style>(uri, 1, 0, "Style", styleObjectProvider);
    qmlRegisterSingletonType<WindowManager>(uri, 1, 0, "WindowManager", windowManagerObjectProvider);

    // @uri QuickCascades
    qmlRegisterUncreatableType<ActionBarAlignment>(uri, 1, 0, "ActionBarAlignment", "");
    qmlRegisterUncreatableType<ChromeVisibility>(uri, 1, 0, "ChromeVisibility", "");
    qmlRegisterUncreatableType<PageStatus>(uri, 1, 0, "PageStatus", "");
    qmlRegisterUncreatableType<SidebarState>(uri, 1, 0, "SidebarState", "");
}

void QuickCascadesPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri)

    /// TODO: This is a workaroung to get a plugin path, a patch for Qt is needed
    QString pluginPath;
    foreach (QString path, engine->importPathList()) {
        if (QFileInfo(path + "/QuickCascades").exists()) {
            pluginPath = path;
            break;
        }
    }
    pluginPath += "/QuickCascades";

    if (engine->property("__qc_themeFileName").isValid())
        m_themeFileName = engine->property("__qc_themeFileName").toString();
    else
        m_themeFileName = pluginPath + "/themes/cascades-light.ini";

    QString iconThemeFileName;
    if (engine->property("__qc_iconThemeFileName").isValid())
        iconThemeFileName = engine->property("__qc_iconThemeFileName").toString();
    else
        iconThemeFileName = pluginPath + "/themes/subway-icons.ini";

    QString iconProviderId;
    if (engine->property("__qc_iconProviderId").isValid())
        iconProviderId = engine->property("__qc_iconProviderId").toString();
    else
        iconProviderId = "icons";

    engine->addImageProvider(iconProviderId, new IconProvider(iconThemeFileName, pluginPath + "/icons"));
}

QObject *QuickCascadesPlugin::styleObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new Style(m_themeFileName);
}

QObject *QuickCascadesPlugin::windowManagerObjectProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return new WindowManager();
}
