#priority 32768

static loggerID as string = "[" ~ "GrassUtils" ~ "]" ~ " ";

function sendInfo(message as string) {
    print(loggerID ~ message);
}

function sendWarning(message as string) {
    logger.logWarning(loggerID ~ message);
}

function sendCommand(message as string) {
    logger.logCommand(loggerID ~ message);
}

function sendError(message as string) {
    logger.logError(loggerID ~ message);
}