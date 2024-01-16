#ifndef QTMQTTPROJECT_H
#define QTMQTTPROJECT_H
#include <QObject>
#include<QtMqtt/QMqttClient>
#include<QtMqtt/QMqttSubscription>
#include <QtQml/qqml.h>

//#define HostName "test.mosquitto.org"
#define HostName  "mqtt.eclipseprojects.io"
#define PortVal 1883
#define topicName "qtmqtt/qttest"



class qtmqttproject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QMqttClient::ClientState valeurState READ getState NOTIFY statereceived)
    Q_PROPERTY(QString message READ getMessage NOTIFY messagereceived)

public:
    explicit qtmqttproject(QObject *parent = nullptr);
    ~qtmqttproject();
    void startsubscription();

    QMqttClient::ClientState getState()const;
    QString getMessage() const;

signals:
    //void messagereceived(const QString &message);
    void statereceived(const QMqttClient::ClientState state);
    void messagereceived(const QString &msg);

public slots:
    void updateStatus(const QMqttClient::ClientState state);
    void UpdateMessage(const QMqttMessage &msg);


private:
    QMqttClient *m_client;
    QMqttClient::ClientState m_state;
    QString mqttMessage;
};
#endif // QTMQTTPROJECT_H
