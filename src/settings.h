#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = 0);

public slots:
    void saveCode(const QString& code);
    QString code() const;

};

#endif // SETTINGS_H
