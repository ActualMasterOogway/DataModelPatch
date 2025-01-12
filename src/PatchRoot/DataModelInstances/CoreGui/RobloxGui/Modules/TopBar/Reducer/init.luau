local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v3 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_createPersistenceMiddleware_0 = v3.Middlewares.createPersistenceMiddleware;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local v6 = require(script.DisplayOptions);
local v7 = require(script.CoreGuiEnabled);
local v8 = require(script.Health);
local v9 = require(script.MoreMenu);
local v10 = require(script.Chat);
local v11 = require(script.Respawn);
local v12 = require(script.GameInfo);
local v13 = {
    displayOptions = v6, 
    coreGuiEnabled = v7, 
    health = v8, 
    moreMenu = v9, 
    chat = v10, 
    respawn = v11, 
    gameInfo = v12
};
if l_GetFFlagEnableCrossExpVoice_0() then
    local v14 = l_createPersistenceMiddleware_0({
        storeKey = v3.Constants.STORAGE_CEV_STORE_KEY
    });
    local v15 = nil;
    local v16 = v14.restore();
    if v16 and v16.Squad and v16.Squad.CrossExperienceVoice then
        v15 = v16.Squad.CrossExperienceVoice;
    end;
    v13.Squad = v1.combineReducers({
        CrossExperienceVoice = v2.installReducer(v15)
    });
end;
return (v1.combineReducers(v13));