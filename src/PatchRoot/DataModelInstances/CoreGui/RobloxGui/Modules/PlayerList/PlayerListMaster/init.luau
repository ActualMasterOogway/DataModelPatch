local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.Rodux);
local v13 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v14 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Constants_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants;
local v16 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_Parent_0 = script.Parent;
local v19 = require(l_Parent_0.Reducers.Reducer);
local v20 = require(l_Parent_0.GlobalConfig);
local v21 = require(l_Parent_0.PlayerListSwitcher);
local v22 = require(l_Parent_0.Actions.SetPlayerListEnabled);
local v23 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v24 = require(l_Parent_0.Actions.SetTempHideKey);
local v25 = require(l_Parent_0.Actions.SetTenFootInterface);
local v26 = require(l_Parent_0.Actions.SetSmallTouchDevice);
local v27 = require(l_Parent_0.Actions.SetIsUsingGamepad);
local v28 = require(l_Parent_0.Actions.SetHasPermissionToVoiceChat);
local v29 = require(l_Parent_0.Actions.SetMinimized);
local v30 = require(l_Parent_0.Actions.SetSubjectToChinaPolicies);
local v31 = require(l_Parent_0.Actions.SetSettings);
local v32 = require(l_Parent_0.Flags.FFlagRemoveSideBarABTest);
local v33 = game:DefineFastFlag("XboxRemoveLatentVoiceChatPrivilegeCheck", false);
if not l_Players_0.LocalPlayer then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
local function v34() --[[ Line: 54 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: v9 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return false;
    else
        return v9:IsSmallTouchScreen();
    end;
end;
local function v37(v35) --[[ Line: 61 ]] --[[ Name: setupSettings ]]
    -- upvalues: v31 (copy), l_UserGameSettings_0 (copy)
    local function _() --[[ Line: 62 ]] --[[ Name: updateSettings ]]
        -- upvalues: v35 (copy), v31 (ref), l_UserGameSettings_0 (ref)
        v35:dispatch(v31({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end;
    v35:dispatch(v31({
        reducedMotion = l_UserGameSettings_0.ReducedMotion, 
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency
    }));
    l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 71 ]]
        -- upvalues: v35 (copy), v31 (ref), l_UserGameSettings_0 (ref)
        v35:dispatch(v31({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 74 ]]
        -- upvalues: v35 (copy), v31 (ref), l_UserGameSettings_0 (ref)
        v35:dispatch(v31({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end);
end;
local v38 = {};
v38.__index = v38;
v38.new = function() --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v38 (copy), v20 (copy), v11 (copy), v12 (copy), v19 (copy), v37 (copy), l_StarterGui_0 (copy), v22 (copy), v26 (copy), v34 (copy), v25 (copy), v8 (copy), v33 (copy), v28 (copy), v30 (copy), v10 (copy), l_UserInputService_0 (copy), v27 (copy), l_Constants_0 (copy), v14 (copy), v21 (copy), l_ApolloProvider_0 (copy), v16 (copy), v32 (copy), v13 (copy), l_IXPService_0 (copy), l_CoreGui_0 (copy)
    local v39 = setmetatable({}, v38);
    if v20.propValidation then
        v11.setGlobalConfig({
            propValidation = true
        });
    end;
    if v20.elementTracing then
        v11.setGlobalConfig({
            elementTracing = true
        });
    end;
    v39.layerCollectorRef = v11.createRef();
    v39.store = v12.Store.new(v19, nil, {
        v12.thunkMiddleware
    });
    v37(v39.store);
    if not l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
        v39.store:dispatch(v22(false));
    end;
    coroutine.wrap(function() --[[ Line: 108 ]]
        -- upvalues: v39 (copy), v26 (ref), v34 (ref)
        v39.store:dispatch(v26(v34()));
    end)();
    v39.store:dispatch(v25(v8:IsEnabled()));
    if not v33 and v8:IsEnabled() then
        coroutine.wrap(function() --[[ Line: 116 ]]
            -- upvalues: v39 (copy), v28 (ref)
            pcall(function() --[[ Line: 117 ]]
                -- upvalues: v39 (ref), v28 (ref)
                if game:GetService("PlatformService"):BeginCheckXboxPrivilege(205).PrivilegeCheckResult == "NoIssue" then
                    v39.store:dispatch(v28(true));
                end;
            end);
        end)();
    end;
    coroutine.wrap(function() --[[ Line: 131 ]]
        -- upvalues: v39 (copy), v30 (ref), v10 (ref)
        v39.store:dispatch(v30(v10:IsSubjectToChinaPolicies()));
    end)();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v41 = l_l_UserInputService_0_LastInputType_0 and l_l_UserInputService_0_LastInputType_0.Name:find("Gamepad");
    v39.store:dispatch(v27(v41 ~= nil));
    v39:_trackEnabled();
    local v42 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    v39.root = v11.createElement(v14.StoreProvider, {
        store = v39.store
    }, {
        Switcher = v11.createElement(v21, {
            appStyleForUiModeStyleProvider = v42, 
            setLayerCollectorEnabled = function(v43) --[[ Line: 151 ]] --[[ Name: setLayerCollectorEnabled ]]
                -- upvalues: v39 (copy)
                if not v39.layerCollectorRef.current then
                    return;
                else
                    v39.layerCollectorRef.current.Enabled = v43;
                    return;
                end;
            end
        })
    });
    v39.root = v11.createElement(l_ApolloProvider_0, {
        client = v16
    }, {
        StoreProvider = v39.root
    });
    v39.root = v11.createElement("ScreenGui", {
        AutoLocalize = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = 1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        [v11.Ref] = v39.layerCollectorRef
    }, {
        PlayerListMaster = v39.root
    });
    if v32 then
        v39.root = v11.createElement(v13.Provider, {
            value = l_IXPService_0
        }, {
            RoactAppExperimentProvider = v39.root
        });
    end;
    v39.element = v11.mount(v39.root, l_CoreGui_0, "PlayerList");
    v39.topBarEnabled = true;
    v39.mounted = true;
    v39.coreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    v39:_updateMounted();
    v39.SetVisibleChangedEvent = Instance.new("BindableEvent");
    v39.store.changed:connect(function(v44, v45) --[[ Line: 193 ]]
        -- upvalues: v39 (copy)
        if v44.displayOptions.setVisible ~= v45.displayOptions.setVisible then
            v39.SetVisibleChangedEvent:Fire(v44.displayOptions.setVisible);
        end;
    end);
    return v39;
end;
v38._updateMounted = function(v46) --[[ Line: 202 ]] --[[ Name: _updateMounted ]]
    -- upvalues: v8 (copy), v11 (copy), l_CoreGui_0 (copy)
    if not v8:IsEnabled() then
        local v47 = v46.coreGuiEnabled and v46.topBarEnabled;
        if v47 and not v46.mounted then
            v46.element = v11.mount(v46.root, l_CoreGui_0, "PlayerList");
            v46.mounted = true;
            return;
        elseif not v47 and v46.mounted then
            v11.unmount(v46.element);
            v46.mounted = false;
            if v46.inspector then
                v46.inspector:destroy();
                v46.inspector = nil;
            end;
        end;
    end;
end;
v38._trackEnabled = function(v48) --[[ Line: 219 ]] --[[ Name: _trackEnabled ]]
    -- upvalues: l_StarterGui_0 (copy), v22 (copy)
    l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v49, v50) --[[ Line: 220 ]]
        -- upvalues: v48 (copy), v22 (ref)
        if v49 == Enum.CoreGuiType.All or v49 == Enum.CoreGuiType.PlayerList then
            v48.coreGuiEnabled = v50;
            v48:_updateMounted();
            v48.store:dispatch(v22(v50));
        end;
    end);
end;
v38.GetVisibility = function(v51) --[[ Line: 229 ]] --[[ Name: GetVisibility ]]
    return v51.store:getState().displayOptions.isVisible;
end;
v38.GetSetVisible = function(v52) --[[ Line: 233 ]] --[[ Name: GetSetVisible ]]
    return v52.store:getState().displayOptions.setVisible;
end;
v38.GetSetVisibleChangedEvent = function(v53) --[[ Line: 237 ]] --[[ Name: GetSetVisibleChangedEvent ]]
    return v53.SetVisibleChangedEvent;
end;
v38.SetVisibility = function(v54, v55) --[[ Line: 241 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v23 (copy)
    v54.store:dispatch(v23(v55));
end;
v38.HideTemp = function(v56, v57, v58) --[[ Line: 245 ]] --[[ Name: HideTemp ]]
    -- upvalues: v24 (copy)
    if v58 == false then
        v58 = nil;
    end;
    v56.store:dispatch(v24(v57, v58));
end;
v38.SetTopBarEnabled = function(v59, v60) --[[ Line: 252 ]] --[[ Name: SetTopBarEnabled ]]
    v59.topBarEnabled = v60;
    v59:_updateMounted();
end;
v38.SetMinimized = function(v61, v62) --[[ Line: 257 ]] --[[ Name: SetMinimized ]]
    -- upvalues: v29 (copy)
    v61.store:dispatch(v29(v62));
end;
return v38;