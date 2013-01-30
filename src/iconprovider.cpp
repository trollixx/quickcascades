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
