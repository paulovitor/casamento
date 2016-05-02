FROM jboss/wildfly:latest

ADD customization /opt/jboss/wildfly/customization/
ADD modules /opt/jboss/wildfly/modules/

# ADD target/casamento.war /opt/jboss/wildfly/customization/casamento.war

ADD target/casamento.war /opt/jboss/wildfly/standalone/deployments/

# RUN /opt/jboss/wildfly/customization/execute.sh
CMD ["/opt/jboss/wildfly/customization/execute.sh"]