#ifndef ICONPROVIDER_H
#define ICONPROVIDER_H

#include <QHash>
#include <QQuickImageProvider>

class IconProvider : public QQuickImageProvider
{
public:
    explicit IconProvider(const QString themeFileName, const QString iconPath = QString());

    bool reload();

    QImage requestImage(const QString &id, QSize *size, const QSize& requestedSize);

private:
    QString m_themeFileName;
    QString m_iconPath;
    QHash<QString, QImage> m_cache;
};

#endif // ICONPROVIDER_H
