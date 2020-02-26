

out.jar: main.bal
	@ballerina build -o out.jar main.bal

execute: out.jar
	@java -jar out.jar
