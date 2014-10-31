Site de Casamento (Paulo e Layanne)
=========


Commands history:

Generate project maven
mvn archetype:generate -DgroupId=br.com.paulovitor -DartifactId=casamento -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

--

Add config for eclipse
mvn eclipse:eclipse


Copy war to openshift:
scp sample.war 545291eb4382ec4ad10001f2@casamento-pauloelay.rhcloud.com:~/app-root/dependencies/jbossews/webapps

--

Access openshift tomcat 7 server:
ssh 545291eb4382ec4ad10001f2@casamento-pauloelay.rhcloud.com

--

Add remote in local repository
git remote add openshift ssh://545291eb4382ec4ad10001f2@casamento-pauloelay.rhcloud.com/~/git/casamento.git/

--

Show log
rhc tail casamento

--

Show deployments
rhc deployment list casamento
