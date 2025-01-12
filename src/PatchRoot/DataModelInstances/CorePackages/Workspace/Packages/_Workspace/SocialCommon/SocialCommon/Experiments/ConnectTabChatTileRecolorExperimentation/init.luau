local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_IXPServiceWrapper_0 = require(l_Parent_0.IxpServiceWrapper).IXPServiceWrapper;
local v3 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local l_GetFFlagEnableConnectTabChatTileRecolorExperiment_0 = v1.GetFFlagEnableConnectTabChatTileRecolorExperiment;
local l_GetFStringConnectTabChatTileRecolorLayerValue_0 = v1.GetFStringConnectTabChatTileRecolorLayerValue;
local l_GetFStringConnectTabChatTileRecolorExperimentationLayer_0 = v1.GetFStringConnectTabChatTileRecolorExperimentationLayer;
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v8 = {
        _isInitialized = false, 
        _variant = 0
    };
    setmetatable(v8, v7);
    return v8;
end;
v7.initialize = function(v9, v10) --[[ Line: 26 ]] --[[ Name: initialize ]]
    -- upvalues: l_GetFStringConnectTabChatTileRecolorExperimentationLayer_0 (copy), v3 (copy), l_GetFStringConnectTabChatTileRecolorLayerValue_0 (copy), l_IXPServiceWrapper_0 (copy)
    local v11 = v10.default:getLayerVariables(l_GetFStringConnectTabChatTileRecolorExperimentationLayer_0());
    if v11 ~= nil then
        v3:debug("ConnectTabChatTileRecolorExperimentation.initialize cache ready");
        local v12 = v11[l_GetFStringConnectTabChatTileRecolorLayerValue_0()];
        if v12 then
            v9._variant = v12;
        end;
        l_IXPServiceWrapper_0:LogUserLayerExposure(l_GetFStringConnectTabChatTileRecolorExperimentationLayer_0());
    else
        v3:debug("ConnectTabChatTileRecolorExperimentation.initialize cache not ready");
    end;
    v9._isInitialized = true;
end;
v7.isEnabled = function() --[[ Line: 45 ]] --[[ Name: isEnabled ]]
    -- upvalues: l_GetFFlagEnableConnectTabChatTileRecolorExperiment_0 (copy)
    return l_GetFFlagEnableConnectTabChatTileRecolorExperiment_0();
end;
v7.getIsRecolored = function(v13) --[[ Line: 49 ]] --[[ Name: getIsRecolored ]]
    return v13._variant == 2;
end;
v7.default = v7.new();
return v7;