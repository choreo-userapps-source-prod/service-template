

out.jar: service.bal
	@ballerina build -o out.jar service.bal

execute: out.jar
	@java -jar out.jar
