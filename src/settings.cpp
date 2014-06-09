#include "settings.h"
#include <QDebug>
Settings::Settings(QObject *parent) :
    QObject(parent)
{
}

void Settings::saveCode(const QString &code)
{
    QSettings set;
    set.setValue("code",code);
}

QString Settings::code() const
{

   QSettings set;

   return set.value("code").toString();
}
