local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v6 = require(l_script_FirstAncestor_0.Hooks.useIsAppLoaded);
local v7 = require(l_script_FirstAncestor_0.App.Hooks.useKeybind);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatFixPartySettingsRealtime);
local v10 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function() --[[ Line: 16 ]] --[[ Name: AppChatAccountSettingsEventRceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v6 (copy), v8 (copy), v7 (copy), v10 (copy), v2 (copy), v5 (copy), v3 (copy), v9 (copy)
    local v11 = l_useDispatch_0();
    local v12 = v6();
    if v8() then
        v7({
            keyCode = Enum.KeyCode.G, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 21 ]]
            -- upvalues: v10 (ref), v11 (copy)
            v10:debug("Ctrl + G pressed, toggling group chat enabled");
            v11({
                type = "Debug_GroupChatEnabledToggled"
            });
        end, {
            v11
        });
    end;
    local v14 = v2.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy), v5 (ref), v10 (ref)
        v11(v5()):andThen(function(v13) --[[ Line: 30 ]]
            -- upvalues: v10 (ref)
            v10:info("Finished fetching chat metadata. Determined isChatEnabled as {}", v13);
        end);
    end, {
        v11
    });
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy), v10 (ref), v14 (copy)
        if not v12 then
            v10:info("App is not loaded, fetching chat metadata");
            v14();
        end;
    end, {
        v14, 
        v12
    });
    v3.useRealtimeNamespace("UserSettingsChanged", function(v15) --[[ Line: 42 ]]
        -- upvalues: v9 (ref), v10 (ref), v14 (copy)
        if v15.SettingsChanged and if v9() then table.find(v15.SettingsChanged, "WhoCanChatWithMeInApp") or table.find(v15.SettingsChanged, "WhoCanGroupChatWithMeInApp") or table.find(v15.SettingsChanged, "WhoCanOneOnOnePartyWithMe") or table.find(v15.SettingsChanged, "WhoCanGroupPartyWithMe") else table.find(v15.SettingsChanged, "WhoCanChatWithMeInApp") or table.find(v15.SettingsChanged, "WhoCanGroupChatWithMeInApp") then
            v10:info("Received privacy setting notification, fetching chat metadata");
            v14();
        end;
    end, {
        v14
    });
    v3.useRealtimeConnectionStateChanged("UserSettingsChanged", function(v16, v17) --[[ Line: 63 ]]
        -- upvalues: v10 (ref), v14 (copy)
        if v16 == Enum.ConnectionState.Connected and v17 then
            v10:info("Reconnected to UserSettingsChanged, fetching chat metadata");
            v14();
        end;
    end, {
        v14
    });
    return nil;
end;