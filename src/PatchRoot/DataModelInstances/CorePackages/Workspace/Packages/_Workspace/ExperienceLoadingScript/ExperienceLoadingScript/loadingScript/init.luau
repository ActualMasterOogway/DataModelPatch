local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = require(l_Parent_0.MockableProxyServices).Players;
local l_ReplicatedFirst_0 = require(l_Parent_0.MockableProxyServices).ReplicatedFirst;
local l_RunService_0 = require(l_Parent_0.MockableProxyServices).RunService;
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_game_0 = require(l_Parent_0.MockableProxyServices).game;
local l_waitProxy_0 = require(l_Parent_0.MockableProxyServices).waitProxy;
local l_settingsProxy_0 = require(l_Parent_0.MockableProxyServices).settingsProxy;
game:DefineFastInt("FPSAwareSplashScreenTimeout", 30);
local v12 = require(l_Parent_0.UIBlox);
local l_UIBloxInGameConfig_0 = require(l_Parent_0.CoreScriptsInitializer).UIBloxInGameConfig;
v12.init(l_UIBloxInGameConfig_0);
local l_Constants_0 = v12.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_Parent_0.Style).UiModeStyleProvider;
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v17 = require(l_script_FirstAncestor_0.LoadingScreen);
local v18 = require(l_script_FirstAncestor_0.Reducers.LoadingScreenReducer);
local v19 = require(l_Parent_0.LoggingProtocol);
local v21 = (function() --[[ Line: 36 ]] --[[ Name: GenerateDevGUIBlackoutCurtain ]]
    -- upvalues: l_Create_0 (copy), l_CoreGui_0 (copy)
    local v20 = l_Create_0("ScreenGui")({
        Name = "DevGUIBlackoutCurtain", 
        DisplayOrder = 8, 
        IgnoreGuiInset = true
    });
    l_Create_0("Frame")({
        Name = "BlackFrame", 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
        BackgroundTransparency = 0, 
        Size = UDim2.fromScale(10, 10), 
        Position = UDim2.fromOffset(0, 0), 
        Active = true, 
        Parent = v20
    });
    v20.Parent = l_CoreGui_0;
    return v20;
end)();
local function _() --[[ Line: 59 ]]
    -- upvalues: v21 (ref)
    if v21 then
        v21.Enabled = false;
        v21:Destroy();
        v21 = nil;
    end;
end;
local v23 = true;
local v24 = false;
local v25 = false;
local v26 = nil;
local v27 = nil;
local function v35(v28) --[[ Line: 75 ]] --[[ Name: displayDefaultLoadingScreen ]]
    -- upvalues: v27 (ref), l_Parent_0 (copy), v18 (copy), v17 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), l_CoreGui_0 (copy), l_RunService_0 (copy), v21 (ref)
    v27 = require(l_Parent_0.Roact);
    local v29 = require(l_Parent_0.Rodux);
    local v30 = require(l_Parent_0.RoactRodux);
    local v31 = v29.Store.new(v18, {}, {
        v29.thunkMiddleware
    });
    local v32 = v27.createElement(v17, {
        placeId = v28
    });
    local v33 = v27.createElement(v30.StoreProvider, {
        store = v31
    }, {
        v27.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            loadingScreenUI = v32
        })
    });
    local v34 = v27.mount(v33, l_CoreGui_0, "RobloxLoadingGUI");
    l_RunService_0.Heartbeat:Wait();
    v21.Enabled = false;
    return v34;
end;
local v36 = nil;
local function _() --[[ Line: 104 ]]
    -- upvalues: v27 (ref), l_waitProxy_0 (copy), v36 (ref)
    if v27 then
        l_waitProxy_0(0.6);
        if v36 ~= nil then
            v27.unmount(v36);
            v36 = nil;
        end;
    end;
end;
local function v40(v38) --[[ Line: 115 ]] --[[ Name: displayVRLoadingScreen ]]
    -- upvalues: v23 (ref), v27 (ref), l_waitProxy_0 (copy), v36 (ref), l_SplashScreenManager_0 (copy), v26 (ref), v21 (ref), l_script_FirstAncestor_0 (copy)
    v23 = false;
    if v27 then
        l_waitProxy_0(0.6);
        if v36 ~= nil then
            v27.unmount(v36);
            v36 = nil;
        end;
    end;
    l_SplashScreenManager_0.initialize(v38 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), v38);
    l_SplashScreenManager_0.addStatusChangeListener(function(v39) --[[ Line: 121 ]]
        -- upvalues: v23 (ref), v26 (ref)
        v23 = v39;
        if v23 and v26 then
            v26();
        end;
    end);
    v21.Enabled = true;
    require(l_script_FirstAncestor_0.LoadingScreen3D).Parent = v21;
end;
local function _() --[[ Line: 134 ]] --[[ Name: waitForCharacterLoaded ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.CharacterAutoLoads then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        if not l_LocalPlayer_0.Character then
            l_LocalPlayer_0.CharacterAdded:Wait();
        end;
    end;
end;
local function v47() --[[ Line: 147 ]] --[[ Name: handleFinishedReplicating ]]
    -- upvalues: l_game_0 (copy), l_Players_0 (copy), v24 (ref), v26 (ref)
    if l_game_0:IsLoaded() then
        if l_Players_0.CharacterAutoLoads then
            local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
            if not l_LocalPlayer_1 then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                l_LocalPlayer_1 = l_Players_0.LocalPlayer;
            end;
            if not l_LocalPlayer_1.Character then
                l_LocalPlayer_1.CharacterAdded:Wait();
            end;
        end;
        v24 = true;
        if v26 then
            v26();
            return;
        end;
    else
        local v44 = nil;
        do
            local l_v44_0 = v44;
            l_v44_0 = l_game_0.Loaded:Connect(function() --[[ Line: 156 ]]
                -- upvalues: l_v44_0 (ref), l_Players_0 (ref), v24 (ref), v26 (ref)
                l_v44_0:Disconnect();
                l_v44_0 = nil;
                if l_Players_0.CharacterAutoLoads then
                    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                    if not l_LocalPlayer_2 then
                        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                        l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                    end;
                    if not l_LocalPlayer_2.Character then
                        l_LocalPlayer_2.CharacterAdded:Wait();
                    end;
                end;
                v24 = true;
                if v26 then
                    v26();
                end;
            end);
        end;
    end;
end;
return function(v48, v49) --[[ Line: 169 ]]
    -- upvalues: l_VRService_0 (copy), l_IsVRAppBuild_0 (copy), v40 (copy), v36 (ref), v35 (copy), v26 (ref), v23 (ref), l_settingsProxy_0 (copy), v21 (ref), l_ReplicatedFirst_0 (copy), v19 (copy), v24 (ref), v25 (ref), v27 (ref), l_waitProxy_0 (copy), v47 (copy)
    if l_VRService_0.VREnabled or l_IsVRAppBuild_0() then
        v40(v49);
    else
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 174 ]]
            -- upvalues: l_VRService_0 (ref), v40 (ref), v49 (copy)
            if l_VRService_0.VREnabled then
                v40(v49);
            end;
        end);
        v36 = v35(v48);
    end;
    v26 = function() --[[ Line: 184 ]]
        -- upvalues: l_VRService_0 (ref), v23 (ref), l_settingsProxy_0 (ref), v21 (ref), l_ReplicatedFirst_0 (ref), v19 (ref), v24 (ref), v25 (ref), v27 (ref), l_waitProxy_0 (ref), v36 (ref)
        if l_VRService_0.VREnabled then
            if v23 or l_settingsProxy_0().Rendering.QualityLevel ~= Enum.QualityLevel.Automatic then
                if v21 then
                    v21.Enabled = false;
                    v21:Destroy();
                    v21 = nil;
                end;
                l_ReplicatedFirst_0:SetDefaultLoadingGuiRemoved();
                v19.default:logEventOnce("first_experience_interactive");
                return;
            end;
        elseif v24 or v25 then
            if v27 then
                l_waitProxy_0(0.6);
                if v36 ~= nil then
                    v27.unmount(v36);
                    v36 = nil;
                end;
            end;
            if v21 then
                v21.Enabled = false;
                v21:Destroy();
                v21 = nil;
            end;
            l_ReplicatedFirst_0:SetDefaultLoadingGuiRemoved();
            v19.default:logEventOnce("first_experience_interactive");
        end;
    end;
    l_ReplicatedFirst_0.FinishedReplicating:Connect(v47);
    if l_ReplicatedFirst_0:IsFinishedReplicating() then
        v47();
    end;
    l_ReplicatedFirst_0.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ Line: 214 ]]
        -- upvalues: v25 (ref), v26 (ref)
        v25 = true;
        v26();
    end);
    if l_ReplicatedFirst_0:IsDefaultLoadingGuiRemoved() then
        v25 = true;
        v26();
    end;
end;