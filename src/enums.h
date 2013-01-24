#ifndef QUICKCASCADES_H
#define QUICKCASCADES_H

#include <QObject>

class PageStatus : public QObject
{
    Q_OBJECT
    Q_ENUMS(Status)

public:
    enum Status {
        Inactive,
        Activating,
        Active,
        Deactivating
    };
};

class SidebarState : public QObject
{
    Q_OBJECT
    Q_ENUMS(State)

public:
    enum State {
        Hidden,
        VisibleCompact,
        VisibleFull
    };
};

#endif // QUICKCASCADES_H
