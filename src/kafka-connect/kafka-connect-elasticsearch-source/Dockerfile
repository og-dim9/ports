FROM maven:3.3-jdk-8 AS builder
ARG VERSION=1.5.5
ARG PLUGIN_NAME=kafka-connect-elasticsearch-source
ARG PLUGIN_PROVIDER=dariobalinzo

RUN git clone https://github.com/${PLUGIN_PROVIDER}/${PLUGIN_NAME} -b v.${VERSION} /src
WORKDIR /src

RUN mvn dependency:resolve


COPY ./patches/ /patches/
RUN git apply /patches/*.patch --verbose
RUN mvn clean package -DskipTests -Denforcer.fail=false

RUN mkdir -pv /target/usr/share/java/lib/
RUN cp -v /src/target/elastic-source-connect-${VERSION}-jar-with-dependencies.jar \
    /target/usr/share/java/lib/${PLUGIN_PROVIDER}-${PLUGIN_NAME}-${VERSION}.jar

FROM scratch AS final
COPY --from=builder /target /
