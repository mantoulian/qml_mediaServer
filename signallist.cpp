#include "signallist.h"
#include "stringhelper.h"

QHash<int, QByteArray> SignalList::gm_roleNames;
QString SignalList::XmlTag = QStringLiteral("Root");

SignalList::SignalList(QObject *parent)
    : QAbstractListModel(parent)
{
    if (gm_roleNames.count() <= 0) {
        gm_roleNames[NameRole] = "name";
        gm_roleNames[UrlRole] = "url";
    }
    m_allowAllSubServer = false;
}

SignalList::~SignalList()
{
    clear();
}

int SignalList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.size();
}

QVariant SignalList::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (row >= 0 && row < m_data.size())
    {
        auto *pItem = m_data.at(row);
        switch (role) {
        case Roles::NameRole:
            return pItem->name();

        case Roles::UrlRole:
            return pItem->url();
        }
    }

    return QVariant();
}

QHash<int, QByteArray> SignalList::roleNames() const {
    return gm_roleNames;
}

//void SignalList::insert(int index, SignalSource *pItem)
//{
//    if(NULL == pItem || index < 0 || index > m_data.size()) {
//        return;
//    }

//    // view protocol (begin => manipulate => end]
//    emit beginInsertRows(QModelIndex(), index, index);
//    m_data.insert(index, pItem);
//    emit endInsertRows();

//    emit countChanged(m_data.size());
//}

//void SignalList::append(SignalSource *pItem)
//{
//    insert(count(), pItem);
//}

void SignalList::set(int index, const QString& name, const QString& url, bool hasAudioUrl, const QString& audioUrl, bool muteAudio)
{
    if(index < 0 || index >= m_data.size()) {
        return;
    }

    beginResetModel();
    SignalSource *pItem = m_data.at(index);
    pItem->setName(name);
    pItem->setUrl(url);
    pItem->setHasAudioUrl(hasAudioUrl);
    pItem->setAudioUrl(audioUrl);
    pItem->setMuteAudio(muteAudio);
    endResetModel();
}

void SignalList::append(const QString& name, const QString& url, bool hasAudioUrl, const QString& audioUrl, bool muteAudio)
{
    int index = m_data.size();
    SignalSource *pItem = new SignalSource();
    pItem->setName(name);
    pItem->setUrl(url);
    pItem->setHasAudioUrl(hasAudioUrl);
    pItem->setAudioUrl(audioUrl);
    pItem->setMuteAudio(muteAudio);

    emit beginInsertRows(QModelIndex(), index, index);
    m_data.insert(index, pItem);
    emit endInsertRows();

    emit countChanged(m_data.size());
}

void SignalList::remove(int index)
{
    if(index < 0 || index >= m_data.size()) {
        return;
    }

    emit beginRemoveRows(QModelIndex(), index, index);
    auto pItem = m_data.at(index);
    m_data.removeAt(index);
    emit endRemoveRows();
    emit countChanged(m_data.size());

    delete pItem;
}

SignalSource* SignalList::get(int index)
{
    if(index >= 0 && index < m_data.size())
        return m_data.at(index);
    else
        return NULL;
}

void SignalList::clear()
{
    for(auto pItem : m_data) {
        delete pItem;
    }

    m_data.clear();
}

int SignalList::count() const
{
    return rowCount(QModelIndex());
}


bool SignalList::loadSettings(const QString& fileName)
{
    if (fileName.isEmpty())
        return false;

    m_dataFileName = fileName;

    QDomDocument doc;
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly))
        return false;

    if (!doc.setContent(&file)) {
          file.close();
          return false;
    }
    file.close();


    clear();
    m_allowAllSubServer = false;

    QDomElement root = doc.documentElement();
    if (root.tagName() != XmlTag)
        return false;

    m_allowAllSubServer = StringHelper::String2Bool(root.attribute(QStringLiteral("AllowAllSubServer")));;

    for(QDomNode n = root.firstChild(); !n.isNull(); n = n.nextSibling()) {
        SignalSource *pItem = SignalSource::Parse(n.toElement());
        if (NULL != pItem)  m_data.append(pItem);
    }
    return true;
}

bool SignalList::saveSettings() {
    if (m_dataFileName.isEmpty())
        return false;

    QDomDocument doc;
    QDomProcessingInstruction instruction = doc.createProcessingInstruction("xml", "version=\"1.0\" encoding=\"UTF-8\"");
    doc.appendChild(instruction);

    QDomElement root = doc.createElement(XmlTag);
    doc.appendChild(root);
    root.setAttribute(QStringLiteral("AllowAllSubServer"), StringHelper::Bool2String(m_allowAllSubServer));

    for(auto pItem: m_data)
        root.appendChild(pItem->createXmlNode(doc));


    QFile file(m_dataFileName);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate | QIODevice::Text))
        return false;
    QTextStream out(&file);
    out.setCodec("UTF-8");
    doc.save(out, 4, QDomNode::EncodingFromTextStream);
    file.close();
    return true;
}
