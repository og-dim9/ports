
all: kafka-connect kafka-connect-push

kafka-connect:
	@cd src/kafka-connect/kafka-connect-elasticsearch-source && make build
	@cd src/kafka-connect/kafka-connect-jdbc-connx && make build
	@cd src/kafka-connect/kafka-connect-transform-archive && make build
	@cd src/kafka-connect/kafka-connect-transform-cobol && make build
	@cd src/kafka-connect/kafka-connect-transform-common && make build

kafka-connect-push: kafka-connect
	@cd src/kafka-connect/kafka-connect-elasticsearch-source && make push
	@cd src/kafka-connect/kafka-connect-jdbc-connx && make push
	@cd src/kafka-connect/kafka-connect-transform-archive && make push
	@cd src/kafka-connect/kafka-connect-transform-cobol && make push
	@cd src/kafka-connect/kafka-connect-transform-common && make push


