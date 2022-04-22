QT += quick quickcontrols2 xml

CONFIG += c++11

UI_DIR=./UI

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        MediaServerApplication.cpp \
        clientinfo.cpp \
        clientinfolist.cpp \
        main.cpp \
        myqmlfile.cpp \
        servernotify.cpp \
        signallist.cpp \
        signalsource.cpp \
        stringhelper.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

unix:!macx: LIBS += -L$$PWD/../ItSyncLib/lib/ -lLiveFund -lCommonFund

unix:INCLUDEPATH += $$PWD/../ItSyncLib/include
unix:DEPENDPATH += $$PWD/../ItSyncLib/include

HEADERS += \
    MediaServerApplication.h \
    StdAfx.h \
    clientinfo.h \
    clientinfolist.h \
    myqmlfile.h \
    servernotify.h \
    signallist.h \
    signalsource.h \
    stringhelper.h

DISTFILES +=
