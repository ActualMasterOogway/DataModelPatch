return {
    dependencies = require(script.dependencies), 
    Events = require(script.Events), 
    EventStreamConstants = require(script.Constants.EventStreamConstants), 
    ["jest.config"] = script["jest.config"]
};