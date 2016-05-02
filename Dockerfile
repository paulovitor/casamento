FROM jboss/wildfly:latest

ADD customization /opt/jboss/wildfly/customization/
ADD modules /opt/jboss/wildfly/modules/

# ADD target/casamento.war /opt/jboss/wildfly/customization/casamento.war

# USER root

# RUN /opt/jboss/wildfly/customization/execute.sh

# RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current/*
# RUN chown -R jboss:jboss /opt/jboss/wildfly/

ADD target/casamento.war /opt/jboss/wildfly/standalone/deployments/

CMD ["/opt/jboss/wildfly/customization/execute.sh"]