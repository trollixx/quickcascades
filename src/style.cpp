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

    styleSettings.beginGroup("general");
    styleSettings.endGroup();

    styleSettings.beginGroup("page");
    m_pageBackgroundColor = styleSettings.value("background-color").toString();
    m_pageBackgroundImage = styleSettings.value("background-image").toUrl();
    styleSettings.endGroup();

    return true;
}
