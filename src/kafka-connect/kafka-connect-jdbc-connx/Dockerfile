FROM maven:3.3-jdk-8 AS builder
ARG VERSION=10.6.1
ARG PLUGIN_NAME=kafka-connect-jdbc
ARG PLUGIN_PROVIDER=confluentinc
RUN git clone https://github.com/confluentinc/kafka-connect-jdbc -b v${VERSION} /src
WORKDIR /src

RUN mvn dependency:resolve

COPY ./patches/ /patches/
RUN git apply /patches/*.patch --verbose

RUN mvn clean package -DskipTests -Denforcer.fail=false

RUN mkdir -pv /target/usr/share/java/lib/
RUN cp -v /src/target/${PLUGIN_NAME}-${VERSION}.jar \
    /target/usr/share/java/lib/${PLUGIN_PROVIDER}-${PLUGIN_NAME}-${VERSION}.jar

RUN mkdir -pv  /target/usr/share/kafka-connect

RUN mv -v /src/target/${PLUGIN_NAME}-${VERSION}-package/share/java/${PLUGIN_NAME} \
        /target/usr/share/kafka-connect/${PLUGIN_NAME}

FROM scratch AS final
COPY --from=builder /target/usr/share/kafka-connect/ /usr/share/kafka-connect/

