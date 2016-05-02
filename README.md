Site de Casamento (Paulo e Layanne)
=========

Generate project maven:
# mvn archetype:generate -DgroupId=br.com.paulovitor -DartifactId=casamento -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

--

Add config for eclipse:
# mvn eclipse:eclipse

--

Access openshift wildfly 8 server:
# ssh://5456784f5973cad7e80008f4@casamento-pauloelay.rhcloud.com

--

Show log:
# rhc tail casamento

--

Show deployments:
# rhc deployment list casamento

--

Execute profile openshift:
# mvn clean install -P openshift


--- ### ---
Docker
--- ### ---

Construindo a imagem:
# docker build -t casamento .

Executando container mysql:
# docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=santos mysql

ou

# docker run --name mysql -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=casamento -e MYSQL_ROOT_PASSWORD=santos -p 3306:3306 -d mysql

para testar
# mysql -h $(docker-machine ip default) -P 3306 -u root -p

Executando container wildfly:
# docker run --name casamento_web -e MYSQL_URI=$(docker-machine ip default):3306 -p 8080:8080 -d casamento