FROM centos:7

RUN yum install java -y

RUN java -version

RUN mkdir /opt/tomcat

WORKDIR /opt/tomcat

RUN curl -O https://mirrors.estointernet.in/apache/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz

RUN tar -xvf apache-tomcat-10.0.20.tar.gz

RUN mv apache-tomcat-10.0.20/* /opt/tomcat

COPY target/restro.war /opt/tomcat/webapps

EXPOSE 8080

CMD [ "/opt/tomcat/bin/catalina.sh", "run" ]
