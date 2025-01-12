local l_IXPService_0 = game:GetService("IXPService");
game:DefineFastFlag("FallbackPlaceIdParamEnabledForAll", false);
game:DefineFastFlag("ActionableSocialContextToastEnabledForAll", false);
local v1 = {};
local function v3() --[[ Line: 9 ]] --[[ Name: waitForIxpInitialization ]]
    -- upvalues: l_IXPService_0 (copy)
    local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
    while l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.None or l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Pending do
        l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
        l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
    end;
    return l_l_IXPService_0_UserLayerLoadingStatus_0;
end;
v1.CheckIsFallbackPlaceIdParamEnabled = function() --[[ Line: 19 ]]
    -- upvalues: v3 (copy), l_IXPService_0 (copy)
    if game:GetFastFlag("FallbackPlaceIdParamEnabledForAll") then
        return true;
    else
        v3();
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
            -- upvalues: l_IXPService_0 (ref)
            return l_IXPService_0:GetUserLayerVariables("PlayerApp.GameJoin.UX");
        end);
        if l_status_0 and l_result_0 and l_result_0.IsJoinWithUserIdParamEnabled then
            return true;
        else
            return false;
        end;
    end;
end;
v1.CheckIsActionableToastEnabled = function() --[[ Line: 37 ]]
    -- upvalues: v3 (copy), l_IXPService_0 (copy)
    if game:GetFastFlag("ActionableSocialContextToastEnabledForAll") then
        return true;
    else
        v3();
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 44 ]]
            -- upvalues: l_IXPService_0 (ref)
            return l_IXPService_0:GetUserLayerVariables("PlayerApp.GameJoin.UX");
        end);
        if l_status_1 and l_result_1 and l_result_1.IsActionableToastsEnabled then
            return true;
        else
            return false;
        end;
    end;
end;
return v1;