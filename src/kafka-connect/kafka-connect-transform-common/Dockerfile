FROM maven:3.3-jdk-8 AS builder
ARG VERSION=0.1.0.59
ARG PLUGIN_NAME=kafka-connect-transform-common
ARG PLUGIN_PROVIDER=jcustenborder

RUN git clone https://github.com/${PLUGIN_PROVIDER}/${PLUGIN_NAME} -b ${VERSION} /src
WORKDIR /src

RUN mvn verify clean --fail-never

RUN mvn package -DskipTests -Denforcer.fail=false

RUN mkdir -pv  /target/usr/share/kafka-connect

RUN mv -v /src/target/kafka-connect-target/usr/share/kafka-connect/${PLUGIN_NAME} \
     /target/usr/share/kafka-connect/${PLUGIN_NAME}

FROM scratch AS final
COPY --from=builder /target/usr/share/kafka-connect/ /usr/share/kafka-connect/

COPY . /src/this
