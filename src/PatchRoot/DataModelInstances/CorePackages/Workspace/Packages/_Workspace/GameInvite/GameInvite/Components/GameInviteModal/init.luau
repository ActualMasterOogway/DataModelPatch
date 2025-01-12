local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Actions_0 = l_script_FirstAncestor_0.State.Actions;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.Promise);
local l_GetGameNameAndDescription_0 = require(l_Parent_0.GameDetailRodux).GetGameNameAndDescription;
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v13 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local v14 = require(l_Context_0.GameInviteModalLayoutProvider);
local v15 = require(l_Components_0.GameInviteModalWindow);
local v16 = require(l_Components_0.GameInviteContentWrapper);
local v17 = require(l_script_FirstAncestor_0.GameInviteDependencies);
local v18 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v19 = require(l_Actions_0.ResetUserInviteStatus);
local v20 = require(l_Parent_0.IxpUtils);
local v21 = require(l_Parent_0.VrCompatibility);
local l_VRReadyWrapper_0 = v21.VRReadyWrapper;
local l_VRConstants_0 = v21.VRConstants;
local l_VRPanelWidthIXP_0 = v21.VRPanelWidthIXP;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_networkImpl_0 = v17.networkImpl;
game:DefineFastFlag("LuaEnableGameInviteModal2023V5", false);
local v27 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableGameInviteModalVRSupport_0 = v27.GetFFlagEnableGameInviteModalVRSupport;
local l_GetFFlagAdjustVRFloor_0 = v27.GetFFlagAdjustVRFloor;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v27.GetFFlagVRPanelWidthIXPEnabled;
return function(v31) --[[ Line: 45 ]]
    -- upvalues: l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v20 (copy), l_VRPanelWidthIXP_0 (copy), v8 (copy), l_RunService_0 (copy), v18 (copy), l_useDispatch_0 (copy), v19 (copy), v13 (copy), l_GuiService_0 (copy), v10 (copy), l_RobloxReplicatedStorage_0 (copy), l_GetGameNameAndDescription_0 (copy), l_networkImpl_0 (copy), l_GetFFlagEnableGameInviteModalVRSupport_0 (copy), l_VRReadyWrapper_0 (copy), l_VRConstants_0 (copy), l_GetFFlagAdjustVRFloor_0 (copy), v14 (copy), v15 (copy), v16 (copy)
    if not game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
        return nil;
    else
        local v32 = if l_GetFFlagVRPanelWidthIXPEnabled_0() then v20.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier) else nil;
        local v33 = if l_GetFFlagVRPanelWidthIXPEnabled_0() then v20.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelCurvature) else nil;
        local v34, v35 = v8.useState(false);
        local v36, v37 = v8.useState(false);
        local v38, v39 = v8.useState({});
        local v40, v41 = v8.useState({});
        local v42, v43 = v8.useState("");
        local v44 = not l_RunService_0:IsStudio();
        local v45 = v31.renderLocation == v18.RenderLocation.CoreScripts;
        local v46 = v31.renderLocation == v18.RenderLocation.UniversalApp;
        local v47 = l_useDispatch_0();
        local function v51(v48, v49, v50) --[[ Line: 72 ]]
            -- upvalues: v35 (copy), v37 (copy), v39 (copy), v46 (copy), v47 (copy), v19 (ref)
            v35(v48);
            v37(v49 or false);
            if v50 then
                v39(v50);
            end;
            if v46 and not v48 and v47 then
                v47(v19());
            end;
        end;
        v8.useEffect(function() --[[ Line: 84 ]]
            -- upvalues: v13 (ref), v51 (copy)
            local v52 = v13.ToggleGameInviteModalEvent.Event:Connect(v51);
            return function() --[[ Line: 86 ]]
                -- upvalues: v52 (copy)
                v52:Disconnect();
            end;
        end, {});
        v8.useEffect(function() --[[ Line: 92 ]]
            -- upvalues: v45 (copy), l_GuiService_0 (ref), v34 (copy), v13 (ref)
            if v45 then
                local v53 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 94 ]]
                    -- upvalues: v34 (ref), v13 (ref)
                    if v34 then
                        v13:closeModal();
                    end;
                end);
                return function() --[[ Line: 99 ]]
                    -- upvalues: v53 (copy)
                    v53:Disconnect();
                end;
            else
                return function() --[[ Line: 103 ]]

                end;
            end;
        end, {
            v34, 
            v45
        });
        v8.useEffect(function() --[[ Line: 108 ]]
            -- upvalues: v44 (copy), v34 (copy), v45 (copy), v42 (copy), v10 (ref), l_RobloxReplicatedStorage_0 (ref), v43 (copy), l_GetGameNameAndDescription_0 (ref), v40 (copy), l_networkImpl_0 (ref), v41 (copy)
            if v44 and v34 and v45 then
                if v42 == "" then
                    v10.try(function() --[[ Line: 112 ]]
                        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
                        return l_RobloxReplicatedStorage_0:WaitForChild("GetServerType", 2):InvokeServer();
                    end):andThen(function(v54) --[[ Line: 115 ]]
                        -- upvalues: v43 (ref)
                        v43(v54);
                    end);
                end;
                if l_GetGameNameAndDescription_0 and not v40.Created then
                    l_GetGameNameAndDescription_0(l_networkImpl_0, game.GameId):andThen(function(v55) --[[ Line: 121 ]]
                        -- upvalues: v41 (ref)
                        v41(v55);
                    end);
                end;
            end;
        end, {
            v34
        });
        if v34 then
            if l_GetFFlagEnableGameInviteModalVRSupport_0() and v46 then
                return v8.createElement(l_VRReadyWrapper_0, {
                    component = "ScreenGui", 
                    props = {
                        DisplayOrder = v31.displayOrder, 
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                        IgnoreGuiInset = true, 
                        Name = v18.ParentComponentName
                    }, 
                    vrProps = {
                        partSize = if v32 then Vector2.new(l_VRConstants_0.MainScreenSize.X * v32, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                        offset = if not not l_GetFFlagAdjustVRFloor_0() or l_GetFFlagVRPanelWidthIXPEnabled_0() and v33 == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                        virtualScreenSize = if v32 then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v32, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                        panelName = "GameInviteMenu", 
                        curvature = v33 or l_VRConstants_0.MainScreenCurvature
                    }
                }, {
                    GameInviteModalLayoutProvider = v8.createElement(v14, {
                        isCoreScript = v45
                    }, {
                        ModalWindowContainer = v8.createElement(v15, {}, {
                            GameInviteModalContentWrapper = v8.createElement(v16, {
                                options = v38, 
                                serverType = v42, 
                                gameDetails = v40, 
                                isLoading = v36, 
                                isCoreScript = v45
                            })
                        })
                    })
                });
            else
                return v8.createElement("ScreenGui", {
                    DisplayOrder = v31.displayOrder, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    IgnoreGuiInset = true, 
                    Name = v18.ParentComponentName
                }, {
                    GameInviteModalLayoutProvider = v8.createElement(v14, {
                        isCoreScript = v45
                    }, {
                        ModalWindowContainer = v8.createElement(v15, {}, {
                            GameInviteModalContentWrapper = v8.createElement(v16, {
                                options = v38, 
                                serverType = v42, 
                                gameDetails = v40, 
                                isLoading = v36, 
                                isCoreScript = v45
                            })
                        })
                    })
                });
            end;
        else
            return nil;
        end;
    end;
end;