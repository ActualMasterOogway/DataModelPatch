local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
return {
    displayName = "ChallengeDialog", 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};