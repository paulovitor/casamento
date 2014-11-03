Site de Casamento (Paulo e Layanne)
=========

The OpenShift `jbossas` cartridge documentation can be found at:

https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-jbossas/README.md

--

Commands history:

Generate project maven
mvn archetype:generate -DgroupId=br.com.paulovitor -DartifactId=casamento -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

--

Add config for eclipse
mvn eclipse:eclipse

--

Access openshift wildfly 8 server:
ssh://5456784f5973cad7e80008f4@casamento-pauloelay.rhcloud.com

--

Show log
rhc tail casamento

--

Show deployments
rhc deployment list casamento
