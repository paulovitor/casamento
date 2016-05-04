FROM jboss/wildfly:latest

# COPY docker/jrebel.jar /jrebel.jar
# ENV JAVA_OPTS="-javaagent:/jrebel.jar -Drebel.remoting_plugin=true"

ADD docker/customization /opt/jboss/wildfly/customization/
ADD docker/modules /opt/jboss/wildfly/modules/

# ADD target/casamento.war /opt/jboss/wildfly/customization/casamento.war

ADD target/casamento.war /opt/jboss/wildfly/standalone/deployments/

# RUN /opt/jboss/wildfly/customization/execute.sh
CMD ["/opt/jboss/wildfly/customization/execute.sh"]