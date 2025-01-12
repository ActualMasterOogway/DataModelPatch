local l_Parent_0 = script.Parent;
return {
    findFirstInstance = require(l_Parent_0.TestUtils).findFirstInstance, 
    testOnActivated = require(script.testOnActivated), 
    findFirstElement = require(script.findFirstElement), 
    countInstances = require(script.countInstances), 
    typeTextIntoElement = require(script.typeTextIntoElement), 
    typeTextIntoInstance = require(script.typeTextIntoInstance), 
    clickInstance = require(script.clickInstance)
};