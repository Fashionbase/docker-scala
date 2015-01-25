FROM andrewrothstein/docker-java
MAINTAINER Andrew Rothstein "andrew.rothstein@gmail.com"

RUN apt-get update && apt-get install -y wget libjansi-java

RUN wget http://www.scala-lang.org/files/archive/scala-2.11.5.deb && \
    dpkg -i scala-2.11.5.deb && \
    rm -f scala-2.11.5.deb

RUN wget -O- http://dl.bintray.com/sbt/native-packages/sbt/0.13.7/sbt-0.13.7.tgz \
    | tar zxvf - -C /usr/bin
ENV PATH /usr/bin/sbt/bin:$PATH

RUN java -version
RUN scala -version || true

CMD ["scala"]
