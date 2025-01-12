local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_getFFlagEnableNewChatTabExperiment_0 = v1.getFFlagEnableNewChatTabExperiment;
local l_getFStringNewChatTabExperimentLayerValue_0 = v1.getFStringNewChatTabExperimentLayerValue;
local l_getFStringNewChatTabExperimentationLayer_0 = v1.getFStringNewChatTabExperimentationLayer;
local l_getFStringNewChatTabExperimentAddFriendsLayerValue_0 = v1.getFStringNewChatTabExperimentAddFriendsLayerValue;
local l_getFStringNewChatTabExperimentAddFriendsNilStateLayerValue_0 = v1.getFStringNewChatTabExperimentAddFriendsNilStateLayerValue;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IxpServiceWrapper).IXPServiceWrapper;
local v8 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local v9 = game:DefineFastFlag("AppChatForceNewChatTab", false);
local v10 = {};
v10.__index = v10;
v10.new = function() --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v11 = {
        _isInitialized = false, 
        _showNewChatTab = false, 
        _showAddFriendsOnHomePageUtilityTray = false, 
        _showAddFriendsOnChatTabNilState = false
    };
    setmetatable(v11, v10);
    return v11;
end;
v10.initialize = function(v12, v13) --[[ Line: 50 ]] --[[ Name: initialize ]]
    -- upvalues: l_getFStringNewChatTabExperimentationLayer_0 (copy), v8 (copy), l_getFStringNewChatTabExperimentLayerValue_0 (copy), l_getFStringNewChatTabExperimentAddFriendsLayerValue_0 (copy), l_getFStringNewChatTabExperimentAddFriendsNilStateLayerValue_0 (copy), l_IXPServiceWrapper_0 (copy)
    local v14 = v13.default:getLayerVariables(l_getFStringNewChatTabExperimentationLayer_0());
    if v14 ~= nil then
        v8:debug("NewChatTabExperimentation.initialize cache ready");
        local v15 = v14[l_getFStringNewChatTabExperimentLayerValue_0()];
        local v16 = v14[l_getFStringNewChatTabExperimentAddFriendsLayerValue_0()];
        local v17 = v14[l_getFStringNewChatTabExperimentAddFriendsNilStateLayerValue_0()];
        if v15 then
            v12._showNewChatTab = v15;
        end;
        if v16 then
            v12._showAddFriendsOnHomePageUtilityTray = v16;
        end;
        if v17 then
            v12._showAddFriendsOnChatTabNilState = v17;
        end;
        v8:debug((("NewChatTabExperimentation.initialize showNewChatTab %* showAddFriendsOnHomePageUtilityTray %*"):format(v15, v16)));
        l_IXPServiceWrapper_0:LogUserLayerExposure(l_getFStringNewChatTabExperimentationLayer_0());
    else
        v8:debug("NewChatTabExperimentation.initialize cache not ready");
    end;
    v12._isInitialized = true;
end;
v10.isEnabled = function() --[[ Line: 83 ]] --[[ Name: isEnabled ]]
    -- upvalues: l_getFFlagEnableNewChatTabExperiment_0 (copy), v9 (copy)
    return l_getFFlagEnableNewChatTabExperiment_0() or v9;
end;
v10.getConnectTabLeadsToChatTab = function(v18) --[[ Line: 87 ]] --[[ Name: getConnectTabLeadsToChatTab ]]
    -- upvalues: v9 (copy)
    return v9 or v18._showNewChatTab;
end;
v10.getShowAddFriendsOnHomePageUtilityTray = function(v19) --[[ Line: 91 ]] --[[ Name: getShowAddFriendsOnHomePageUtilityTray ]]
    return v19._showAddFriendsOnHomePageUtilityTray;
end;
v10.getShowAddFriendsOnChatTabNilState = function(v20) --[[ Line: 95 ]] --[[ Name: getShowAddFriendsOnChatTabNilState ]]
    -- upvalues: v9 (copy)
    return v9 or v20._showAddFriendsOnChatTabNilState;
end;
v10.default = v10.new();
return v10;