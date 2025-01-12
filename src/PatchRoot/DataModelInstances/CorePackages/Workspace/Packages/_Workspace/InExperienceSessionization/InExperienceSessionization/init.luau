local l_Parent_0 = script.Parent;
local l_SessionServiceWrapper_0 = require(l_Parent_0.SessionizationUtil).SessionServiceWrapper;
local v2 = require(script.SessionType);
local v3 = require(script.ExperienceMenuSessionManager).new(l_SessionServiceWrapper_0);
return {
    SessionType = v2, 
    ExperienceMenuSessionManagerInstance = v3
};