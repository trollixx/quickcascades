#ifndef QUICKCASCADES_H
#define QUICKCASCADES_H

#include <QObject>

class ActionBarAlignment : public QObject
{
    Q_OBJECT
    Q_ENUMS(Alignment)

public:
    enum Alignment {
        Center,
        Justify,
        Left,
        Right
    };
};

class BarMode : public QObject
{
    Q_OBJECT
    Q_ENUMS(Mode)

public:
    enum Mode {
        BuiltIn,
        Overlay
    };
};

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
