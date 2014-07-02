FROM andrewrothstein/docker-java
MAINTAINER Andrew Rothstein "andrew.rothstein@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget libjansi-java

RUN wget http://www.scala-lang.org/files/archive/scala-2.11.0.deb 
RUN dpkg -i scala-2.11.0.deb
RUN rm -f scala-2.11.0.deb

RUN wget -O- http://dl.bintray.com/sbt/native-packages/sbt/0.13.5/sbt-0.13.5.tgz \
    | tar zxvf - -C /usr/bin
ENV PATH /usr/bin/sbt/bin:$PATH

RUN java -version
RUN scala -version || true

CMD ["scala"]
