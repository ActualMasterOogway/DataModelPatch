local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v5 = require(l_Modules_0.Flags.GetFStringInExperienceNotificationsLayer);
local v6 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuIXP);
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
local v8 = {};
v8.__index = v8;
v8.new = function(v9) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_GetFFlagInviteListRerank_0 (copy), v8 (copy)
    local v10 = {
        _ixpServiceWrapper = v9 or v4, 
        _styleEnabled = false, 
        _customizationEnabled = false, 
        _newSendEndpointEnabled = false, 
        _inviteListSortOrder = l_GetFFlagInviteListRerank_0() and 0 or nil
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.getStyleEnabled = function(v11) --[[ Line: 33 ]] --[[ Name: getStyleEnabled ]]
    return v11._styleEnabled;
end;
v8.getCustomizationEnabled = function(v12) --[[ Line: 37 ]] --[[ Name: getCustomizationEnabled ]]
    return v12._customizationEnabled;
end;
v8.getNewSendEndpointEnabled = function(v13) --[[ Line: 41 ]] --[[ Name: getNewSendEndpointEnabled ]]
    return v13._newSendEndpointEnabled;
end;
if l_GetFFlagInviteListRerank_0() then
    v8.getInviteListSortOrder = function(v14) --[[ Line: 46 ]] --[[ Name: getInviteListSortOrder ]]
        return v14._inviteListSortOrder;
    end;
end;
v8.initialize = function(v15) --[[ Line: 51 ]] --[[ Name: initialize ]]
    -- upvalues: v6 (copy), v5 (copy), l_GetFFlagInviteListRerank_0 (copy)
    if not v6() then
        return;
    else
        task.spawn(function() --[[ Line: 56 ]]
            -- upvalues: v15 (copy), v5 (ref), l_GetFFlagInviteListRerank_0 (ref)
            v15._ixpServiceWrapper:WaitForInitialization();
            local l_LayerData_0 = v15._ixpServiceWrapper:GetLayerData(v5());
            if l_LayerData_0 then
                v15._styleEnabled = l_LayerData_0.NewInviteMenuStyleEnabled or false;
                v15._customizationEnabled = l_LayerData_0.NewInviteMenuCustomizationEnabled or false;
                v15._newSendEndpointEnabled = l_LayerData_0.NewInviteMenuEndpointEnabled or false;
                v15._inviteListSortOrder = if l_GetFFlagInviteListRerank_0() then l_LayerData_0.invite_list_sort_order or 0 else nil;
            end;
        end);
        return;
    end;
end;
v8.default = v8.new();
return v8;