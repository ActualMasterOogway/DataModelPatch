local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v8 = require(l_Parent_0.LoggingProtocol);
local v9 = require(l_Parent_0.Navigation);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_SessionType_0 = require(l_Parent_0.Sessionization).SessionType;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v13 = nil;
v13 = if l_GetFFlagEnableAppCommonInputHooks_0() then require(l_script_FirstAncestor_0.useLastInputMethod) else v6.useLastInputMethod;
local v14 = require(l_script_FirstAncestor_0.useLastInputMode);
local l_useFocusGuiObject_0 = v6.useFocusGuiObject;
local l_useFocusedGuiObject_0 = v6.useFocusedGuiObject;
local l_useRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useRegistryEntry;
local v18 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v19 = require(l_script_FirstAncestor_0.useAutoFocus);
local v20 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local v21 = game:DefineFastFlag("TenFootUiCorrectAutoFocusLoggingBehavior", false);
local v22 = game:DefineFastInt("AutoFocusFailsafeThreshold", 5);
local v23 = game:DefineFastFlag("AddFocusNavigationSession", false);
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableUniversalFocusNavigation;
local l_FFlagFixSearchFocusBinding_0 = require(l_Parent_0.SharedFlags).FFlagFixSearchFocusBinding;
local l_FFlagEnablePeekViewFocusNav_0 = require(l_Parent_0.SharedFlags).FFlagEnablePeekViewFocusNav;
local v27 = {
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.MouseButton2] = true, 
    [Enum.UserInputType.MouseButton3] = true, 
    [Enum.UserInputType.Touch] = true
};
local v28 = l_MessageBus_0.Subscriber.new();
local l_default_0 = v8.default;
local function v31(v30) --[[ Line: 52 ]] --[[ Name: gameLeaveMessageValidator ]]
    if typeof(v30) == "table" then
        return true;
    else
        return false;
    end;
end;
local function _(v32) --[[ Line: 60 ]] --[[ Name: createGlobalFocusFailureDetection ]]
    -- upvalues: l_RunService_0 (copy), v22 (copy)
    local v33 = 0;
    return (l_RunService_0.Heartbeat:Connect(function(v34) --[[ Line: 62 ]]
        -- upvalues: v33 (ref), v22 (ref), v32 (copy)
        v33 = v33 + v34;
        if v22 < v33 then
            v32();
            v33 = 0;
        end;
    end));
end;
local function v40(v36) --[[ Line: 76 ]] --[[ Name: createGameLeaveSubscription ]]
    -- upvalues: l_MessageBus_0 (copy), v28 (copy), v31 (copy), v22 (copy)
    local v37 = l_MessageBus_0.getMessageId("Game", "onGameLeave");
    local v38 = nil;
    v28:subscribe({
        mid = v37, 
        validateParams = v31
    }, function(_) --[[ Line: 83 ]]
        -- upvalues: v38 (ref), v22 (ref), v36 (copy)
        v38 = task.delay(v22, function() --[[ Line: 84 ]]
            -- upvalues: v36 (ref)
            v36();
        end);
    end);
    return {
        unsubscribe = function() --[[ Line: 89 ]] --[[ Name: unsubscribe ]]
            -- upvalues: v28 (ref), v37 (copy), v38 (ref)
            v28:unsubscribeWithMsgId(v37);
            if v38 then
                task.cancel(v38);
            end;
        end
    };
end;
return function(v41) --[[ Line: 101 ]] --[[ Name: useGlobalFocusHandler ]]
    -- upvalues: v13 (ref), l_useFocusGuiObject_0 (copy), v23 (copy), l_useFocusedGuiObject_0 (copy), v5 (copy), l_FFlagEnableUniversalFocusNavigation_0 (copy), v14 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy), l_UserInputService_0 (copy), v27 (copy), v9 (copy), l_useRegistryEntry_0 (copy), v18 (copy), l_FFlagFixSearchFocusBinding_0 (copy), l_FFlagEnablePeekViewFocusNav_0 (copy), v19 (copy), v20 (copy), v21 (copy), l_mutedError_0 (copy), l_default_0 (copy), l_RunService_0 (copy), v22 (copy), v40 (copy)
    local v42 = v13();
    local v43 = l_useFocusGuiObject_0();
    local v44 = if v23 then l_useFocusedGuiObject_0() else nil;
    local v45 = if v23 then v5.useRef(v44) else nil;
    local v46 = if l_FFlagEnableUniversalFocusNavigation_0 then v14() else nil;
    local v47 = if l_FFlagEnableUniversalFocusNavigation_0 then v46 == "Focus" else v42 == "Gamepad";
    if v23 then
        v5.useEffect(function() --[[ Line: 113 ]]
            -- upvalues: v44 (copy), v45 (copy), l_SessionService_0 (ref), l_SessionType_0 (ref), v42 (copy)
            if v44 ~= nil and v45.current == nil then
                l_SessionService_0:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.FocusNavigation, v42);
                v45.current = v44;
            end;
        end, {
            v44
        });
    end;
    v5.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: l_UserInputService_0 (ref), v27 (ref), v23 (ref), v45 (copy), l_SessionService_0 (ref), l_SessionType_0 (ref), v43 (copy)
        local v49 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v48) --[[ Line: 126 ]]
            -- upvalues: v27 (ref), v23 (ref), v45 (ref), l_SessionService_0 (ref), l_SessionType_0 (ref), v43 (ref)
            if v27[v48] then
                if v23 and v45.current ~= nil then
                    l_SessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.FocusNavigation);
                    v45.current = nil;
                    v43(nil);
                    return;
                else
                    v43(nil);
                end;
            end;
        end);
        return function() --[[ Line: 139 ]]
            -- upvalues: v49 (copy)
            v49:Disconnect();
        end;
    end, {
        v43
    });
    if l_FFlagEnableUniversalFocusNavigation_0 then
        local v50 = v9.useNavigation();
        local v51 = if v50 then v50.state else nil;
        local v52 = if v51 then v51.index else nil;
        local v53 = v5.useRef(v52);
        local l_v53_0 = v53 --[[ copy: 10 -> 27 ]];
        local l_v52_0 = v52 --[[ copy: 9 -> 28 ]];
        v5.useEffect(function() --[[ Line: 149 ]]
            -- upvalues: v47 (copy), l_v53_0 (copy), l_v52_0 (copy), v43 (copy)
            if v47 and l_v53_0.current ~= nil and l_v52_0 ~= nil and l_v53_0.current < l_v52_0 then
                l_v53_0.current = l_v52_0;
                v43(nil);
            end;
        end, {
            v52, 
            v47
        });
    end;
    local v56 = l_useRegistryEntry_0(v18.NavBar);
    local v57 = l_useRegistryEntry_0(v18.RouterView);
    local v58 = l_useRegistryEntry_0(v18.CentralOverlay);
    local v59 = l_useRegistryEntry_0(v18.ModerationOverlay);
    local v60 = if l_FFlagEnableUniversalFocusNavigation_0 then l_useRegistryEntry_0(v18.PopUp) else nil;
    local v61 = if l_FFlagEnableUniversalFocusNavigation_0 then l_useRegistryEntry_0(v18.ContextualMenu) else nil;
    local v62 = if l_FFlagFixSearchFocusBinding_0 then l_useRegistryEntry_0(v18.SearchBar) else nil;
    local v63 = if l_FFlagEnablePeekViewFocusNav_0 then l_useRegistryEntry_0(v18.PeekView) else nil;
    local v65 = v5.useMemo(function() --[[ Line: 203 ]]
        -- upvalues: v59 (copy), v58 (copy), v61 (copy), v60 (copy), v63 (copy), v57 (copy), v56 (copy), l_FFlagFixSearchFocusBinding_0 (ref), v62 (copy)
        local v64 = {};
        if v59 then
            table.insert(v64, v59);
            return v64;
        elseif v58 then
            table.insert(v64, v58);
            return v64;
        elseif v61 then
            table.insert(v64, v61);
            return v64;
        elseif v60 then
            table.insert(v64, v60);
            return v64;
        elseif v63 then
            table.insert(v64, v63);
            return v64;
        else
            if v57 then
                table.insert(v64, v57);
            end;
            if v56 then
                table.insert(v64, v56);
            end;
            if l_FFlagFixSearchFocusBinding_0 and v62 then
                table.insert(v64, v62);
            end;
            return v64;
        end;
    end, {
        v59, 
        v57, 
        v56, 
        v58, 
        v61, 
        v60, 
        v63
    });
    local v66 = v19(v65, 0.1);
    local v67 = v20(v56);
    local v68 = v20(v57);
    local v69 = v20(v58);
    local v70 = v20(v59);
    local v71 = if l_FFlagEnableUniversalFocusNavigation_0 then v20(v61) else false;
    local v72 = if l_FFlagEnableUniversalFocusNavigation_0 then v20(v60) else false;
    local v73 = if l_FFlagFixSearchFocusBinding_0 then v20(v62) else false;
    local v74 = if l_FFlagEnablePeekViewFocusNav_0 then v20(v63) else false;
    local v75 = nil;
    v75 = if v59 then v70 else if v58 then v69 else if v61 then v71 else if v60 then v72 else if v63 then v74 else v67 or v68 or l_FFlagFixSearchFocusBinding_0 and v73;
    local v76 = v47 and not v75 and not v41;
    v5.useEffect(function() --[[ Line: 272 ]]
        -- upvalues: v66 (copy), v76 (copy), v21 (ref), l_mutedError_0 (ref), v65 (copy), l_default_0 (ref), l_RunService_0 (ref), v22 (ref), v40 (ref)
        local v77 = nil;
        local v78 = nil;
        local function v79() --[[ Line: 276 ]] --[[ Name: setAutoFocusing ]]
            -- upvalues: v77 (ref), v66 (ref)
            if v77 then
                v77.cancel();
            end;
            v77 = v66();
        end;
        if v76 then
            if v77 then
                v77.cancel();
            end;
            v77 = v66();
            local function v80() --[[ Line: 285 ]]
                -- upvalues: v21 (ref), l_mutedError_0 (ref), v65 (ref), l_default_0 (ref), v77 (ref), v66 (ref)
                if v21 then
                    l_mutedError_0("[useGlobalFocusHandler] globalFocusHandler failed to autofocus with " .. #v65 .. " targets, retrying");
                else
                    l_default_0:logEvent("GamePadFocusFailsafeActivated", {
                        targetCount = #v65
                    });
                end;
                if v77 then
                    v77.cancel();
                end;
                v77 = v66();
            end;
            local v81 = 0;
            local l_v80_0 = v80 --[[ copy: 3 -> 5 ]];
            do
                local l_v81_0 = v81;
                v78 = l_RunService_0.Heartbeat:Connect(function(v84) --[[ Line: 62 ]]
                    -- upvalues: l_v81_0 (ref), v22 (ref), l_v80_0 (copy)
                    l_v81_0 = l_v81_0 + v84;
                    if v22 < l_v81_0 then
                        l_v80_0();
                        l_v81_0 = 0;
                    end;
                end);
            end;
        end;
        local v85 = nil;
        if v76 then
            v85 = v40(v79);
        end;
        return function() --[[ Line: 305 ]]
            -- upvalues: v77 (ref), v85 (ref), v78 (ref)
            if v77 then
                v77.cancel();
            end;
            if v85 then
                v85.unsubscribe();
            end;
            if v78 then
                v78:Disconnect();
            end;
        end;
    end, {
        v76, 
        v66, 
        v65
    });
end;