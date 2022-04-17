#include "signalsource.h"
#include "stringhelper.h"


QString SignalSource::XmlTag = QStringLiteral("Data");

SignalSource::SignalSource()
{
    m_hasAudioUrl = false;
    m_muteAudio = false;
    m_enableRtmp = false;
}

SignalSource::SignalSource(const SignalSource& oldItem)
    : QObject()
    , m_name(oldItem.m_name)
    , m_url(oldItem.m_url)
    , m_hasAudioUrl(oldItem.m_hasAudioUrl)
    , m_audioUrl(oldItem.m_audioUrl)
    , m_muteAudio(oldItem.m_muteAudio)
    , m_enableRtmp(oldItem.m_enableRtmp)
{
}


SignalSource& SignalSource::operator=(const SignalSource& oldItem) {
    m_name = oldItem.m_name;
    m_url = oldItem.m_url;
    m_hasAudioUrl = oldItem.m_hasAudioUrl;
    m_audioUrl = oldItem.m_audioUrl;
    m_muteAudio = oldItem.m_muteAudio;
    m_enableRtmp = oldItem.m_enableRtmp;
    return *this;
}


QString SignalSource::name() const {
    return m_name;
}

void SignalSource::setName(const QString& value) {
    if (m_name != value) {
        m_name = value;
        emit nameChanged(value);
    }
}

QString SignalSource::url() const {
    return m_url;
}

void SignalSource::setUrl(const QString& value) {
    if (m_url != value) {
        m_url = value;
        emit urlChanged(value);
    }
}


bool SignalSource::hasAudioUrl() const {
    return m_hasAudioUrl;
}

void SignalSource::setHasAudioUrl(bool value) {
    if (m_hasAudioUrl != value) {
        m_hasAudioUrl = value;
        emit hasAudioUrlChanged(value);
    }
}

QString SignalSource::audioUrl() const {
    return m_audioUrl;
}

void SignalSource::setAudioUrl(const QString& value) {
    if (m_audioUrl != value) {
        m_audioUrl = value;
        emit audioUrlChanged(value);
    }
}


bool SignalSource::muteAudio() const {
    return m_muteAudio;
}

void SignalSource::setMuteAudio(bool value) {
    if (m_muteAudio != value) {
        m_muteAudio = value;
        emit muteAudioChanged(value);
    }
}


bool SignalSource::enableRtmp() const {
    return m_enableRtmp;
}

void SignalSource::setEnableRtmp(bool value) {
    if (m_enableRtmp != value) {
        m_enableRtmp = value;
        emit enableRtmpChanged(value);
    }
}

ClientInfoList* SignalSource::clients() {
    return &m_clients;
}


SignalSource* SignalSource::Parse(const QDomElement& xmlNode) {
    if (xmlNode.isNull()) return NULL;
    if (xmlNode.tagName() != XmlTag) return NULL;

    SignalSource *pRetValue = new SignalSource();
    pRetValue->m_name = xmlNode.attribute(QStringLiteral("Name"));
    pRetValue->m_url = xmlNode.attribute(QStringLiteral("Path"));

    pRetValue->m_hasAudioUrl = StringHelper::String2Bool(xmlNode.attribute(QStringLiteral("HasAudioPath")));
    pRetValue->m_audioUrl = xmlNode.attribute(QStringLiteral("AudioPath"));
    pRetValue->m_muteAudio = StringHelper::String2Bool(xmlNode.attribute(QStringLiteral("MuteAudio")));
    pRetValue->m_enableRtmp = StringHelper::String2Bool(xmlNode.attribute(QStringLiteral("EnableRtmp")));
    return pRetValue;
}

QDomElement SignalSource::createXmlNode(QDomDocument& doc) {
    QDomElement xmlNode = doc.createElement(XmlTag);
    xmlNode.setAttribute(QStringLiteral("Name"), m_name);
    xmlNode.setAttribute(QStringLiteral("Path"), m_url);

    xmlNode.setAttribute(QStringLiteral("HasAudioPath"), StringHelper::Bool2String(m_hasAudioUrl));
    if (m_hasAudioUrl) xmlNode.setAttribute(QStringLiteral("AudioPath"), m_audioUrl);

    xmlNode.setAttribute(QStringLiteral("MuteAudio"), StringHelper::Bool2String(m_muteAudio));
    xmlNode.setAttribute(QStringLiteral("EnableRtmp"), StringHelper::Bool2String(m_enableRtmp));
    return xmlNode;
}
