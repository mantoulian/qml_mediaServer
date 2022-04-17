#include "stringhelper.h"
#include <QTextCodec>

QString gc_trueString = QStringLiteral("true");
QString gc_falseString = QStringLiteral("false");


StringHelper::StringHelper()
{
}


void StringHelper::initChineseSupport() {
    QTextCodec::setCodecForLocale(QTextCodec::codecForName("GBK"));
}

bool StringHelper::String2Bool(const QString& str) {
    return 0 == QString::compare(str, gc_trueString, Qt::CaseInsensitive);
}

QString StringHelper::Bool2String(bool value)
{
    return value ? gc_trueString : gc_falseString;
}


const char* StringHelper::GetRaw(const QString& str) {
    return (const char*)str.toLocal8Bit().data();
}
