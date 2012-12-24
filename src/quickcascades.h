#ifndef QUICKCASCADES_H
#define QUICKCASCADES_H

#include <QObject>

class QCPageStatus : public QObject
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


#endif // QUICKCASCADES_H
