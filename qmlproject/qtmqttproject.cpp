#include "qtmqttproject.h"
#include<QDebug>

using namespace Qt::StringLiterals;
 qtmqttproject::qtmqttproject( QObject *parent)
    : QObject(parent)


{


    m_client = new QMqttClient(this);
    m_client->setHostname(HostName);
    m_client->setPort(static_cast<quint16>(PortVal));

    m_client->connectToHost();
    connect(m_client, &QMqttClient::stateChanged, this, &qtmqttproject::updateStatus);
    //connect(m_client, &QMqttClient::messageReceived, this, &qtmqttproject::UpdateMessage);


}

qtmqttproject::~qtmqttproject()
{

}

void qtmqttproject::updateStatus(const QMqttClient::ClientState state)
{

    if(state==QMqttClient::Connecting){
        qDebug()<<"Connecting, State = "<< state;
    }else if(state==QMqttClient::Connected){
        startsubscription();
        qDebug()<<"start subscription";
        qDebug()<<"State = "<<state;
        m_state=state;
        emit statereceived(m_state);

    }

}

void qtmqttproject::startsubscription()
{
    auto subscriptiontopic = m_client->subscribe(QString(topicName),0);
    if(!subscriptiontopic){
        qDebug()<<"error of subscription" <<QString(topicName);
        return;
    }else{
        qDebug()<<"Subscription completed";
    }
    QObject::connect(subscriptiontopic, &QMqttSubscription::messageReceived, this, &qtmqttproject::UpdateMessage);

}



QMqttClient::ClientState qtmqttproject::getState() const
{
    return m_state;
}

QString qtmqttproject::getMessage() const
{
    return mqttMessage;
}





void qtmqttproject::UpdateMessage(const QMqttMessage &msg){
    mqttMessage =msg.payload();
    qDebug()<<"message received";
    qDebug()<<msg.payload();
    emit messagereceived(msg.payload());


}
