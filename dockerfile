# Pull tomcat latest image from dockerhub
FROM tomcat:8.0.51-jre8-alpine
MAINTAINER aknik2004@gmail.com
# copy war file on to container
ADD /target/newpipeline-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE  8080
USER newpipeline
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
