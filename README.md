# Site de Casamento (Paulo e Layanne)


## Maven commands

**Generate project:**
```
mvn archetype:generate -DgroupId=br.com.paulovitor -DartifactId=casamento -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```

**Add config for eclipse:**
```
mvn eclipse:eclipse
```

## Openshift commands

**Access wildfly 8 server:**
```
ssh://5456784f5973cad7e80008f4@casamento-pauloelay.rhcloud.com
```

**Show log:**
```
rhc tail casamento
```

**Show deployments:**
```
rhc deployment list casamento
```

**Execute profile openshift:**
```
mvn clean install -P openshift
```

## Docker commands

**Build image:**
```
docker build -t casamento .
```

**Run mysql container:**
```
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=santos mysql
docker run --name mysql -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=casamento -e MYSQL_ROOT_PASSWORD=santos -p 3306:3306 -d mysql
```

**Test connection:**
```
mysql -h $(docker-machine ip default) -P 3306 -u root -p
```

**Run wildfly container:**
```
docker run --name casamento_web -e MYSQL_URI=$(docker-machine ip default):3306 -p 8080:8080 -d casamento
```

**Run with docker-compose:**
```
docker-compose --x-networking up -d
```