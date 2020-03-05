PROJECT_BASE = pService
BAL_FILES = $(shell find $(PROJECT_BASE) -type f -name '*.bal')
BUILD_JAR_FILES = $(PROJECT_BASE)/target/bin/*.jar

$(BUILD_JAR_FILES): $(BAL_FILES)
	@cd $(PROJECT_BASE) && ballerina build -a

execute: $(BUILD_JAR_FILES)
	@java -jar $(BUILD_JAR_FILES)
