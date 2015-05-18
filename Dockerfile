FROM dockerfile/java:oracle-java8
MAINTAINER Andrew Rothstein "andrew.rothstein@gmail.com"

ENV SCALA_VER 2.11.6
ENV SBT_VER 0.13.8

RUN wget http://www.scala-lang.org/files/archive/scala-${SCALA_VER}.deb && \
    dpkg -i scala-${SCALA_VER}.deb && \
    rm -f scala-${SCALA_VER}.deb

RUN wget -O- http://dl.bintray.com/sbt/native-packages/sbt/${SBT_VER}/sbt-${SBT_VER}.tgz \
    | tar zxvf - -C /usr/bin
ENV PATH /usr/bin/sbt/bin:$PATH

RUN java -version
RUN scala -version || true

CMD ["scala"]
