#ifndef STRINGHELPER_H
#define STRINGHELPER_H

#include <QtCore>

class StringHelper
{
private:
    StringHelper();

public:

    static void initChineseSupport();

    static bool String2Bool(const QString& str);
    static QString Bool2String(bool value);

    static const char* GetRaw(const QString& str);
};

#endif // STRINGHELPER_H
