local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Packages_0 = l_CorePackages_0.Packages;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Packages_0.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v7 = require(script.Parent.Parent.Utils.FaceChatUtils);
local v8 = require(script.Parent.Parent.Utils.ModelUtils);
local v9 = require(l_Packages_0.UIBlox);
local l_withTooltip_0 = v9.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v9.App.Dialog.Enum.TooltipOrientation;
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local l_ICON_SIZE_0 = require(l_Chrome_0.ChromeShared.Unibar.Constants).ICON_SIZE;
local v14 = require(script.Parent.CameraStatusDot);
local v15 = require(script.Parent.FaceClone);
local v16 = require(script.Parent.Parent.Hooks.useCameraOn);
local v17 = require(script.Parent.Parent.Hooks.useLocalPlayer);
local v18 = require(script.Parent.Parent.Hooks.useTooltipDismissal);
local l_SelfieView_0 = script.Parent.Parent.Parent.SelfieView;
local v20 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewDontWaitForCharacter);
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local l_GetFFlagSelfieViewUseNewErrorBody_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfieViewUseNewErrorBody;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v24 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
return function(v25) --[[ Line: 44 ]] --[[ Name: Icon ]]
    -- upvalues: l_GetFFlagSelfieViewUseNewErrorBody_0 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v16 (copy), v17 (copy), v4 (copy), l_GetFFlagSelfViewVisibilityFix_0 (copy), v15 (copy), v18 (copy), v7 (copy), v20 (copy), v8 (copy), v24 (copy), l_withTooltip_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v14 (copy), l_ICON_SIZE_0 (copy)
    local v27 = if l_GetFFlagSelfieViewUseNewErrorBody_0() then l_useAppPolicy_0(function(v26) --[[ Line: 46 ]]
        return v26.getShowUpdatedCameraPath();
    end) else false;
    local v28 = l_useLocalization_0({
        robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader", 
        robloxPermissionErrorBody = l_GetFFlagSelfieViewUseNewErrorBody_0() and v27 and "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" or "CoreScripts.TopBar.RobloxPermissionErrorBody", 
        dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader", 
        dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody"
    });
    local v29 = v16();
    local v30 = v17();
    local v31 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: l_GetFFlagSelfViewVisibilityFix_0 (ref), v15 (ref), v30 (copy), v31 (copy), v25 (copy)
        if _G.__TESTEZ_RUNNING_TEST__ then
            return;
        else
            local v32 = if l_GetFFlagSelfViewVisibilityFix_0() then v15(v30, v31.current, v25.outerContainerFrameName) else v15(v30, v31.current);
            return function() --[[ Line: 75 ]]
                -- upvalues: v32 (copy)
                if v32 then
                    v32();
                end;
            end;
        end;
    end, {
        v31
    });
    local v33, v34, v35, v36 = v18(2000);
    v4.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v25 (copy), v7 (ref), v36 (copy), v28 (copy), v20 (ref), v30 (copy), v8 (ref), v24 (ref)
        local v37 = v25.activatedSignal:connect(function() --[[ Line: 85 ]]
            -- upvalues: v7 (ref), v36 (ref), v28 (ref), v20 (ref), v30 (ref), v8 (ref), v24 (ref)
            if not v7.getPermissions().userCamEligible then
                return;
            elseif not v7.getPermissions().userCamEnabled then
                v36(v28.robloxPermissionErrorHeader, v28.robloxPermissionErrorBody);
                return;
            else
                if v20() then
                    if v30.Character and not v8.hasDynamicHead(v30.Character) and not v7.isCameraOn() then
                        v36(v28.dynamicAvatarMissingErrorHeader, v28.dynamicAvatarMissingErrorBody);
                    end;
                elseif not v8.hasDynamicHead(v30.Character or v30.CharacterAdded:Wait()) and not v7.isCameraOn() then
                    v36(v28.dynamicAvatarMissingErrorHeader, v28.dynamicAvatarMissingErrorBody);
                end;
                v24:setLastCtx("SelfView");
                v7.toggleVideoAnimation();
                return;
            end;
        end);
        return function() --[[ Line: 112 ]]
            -- upvalues: v37 (copy)
            v37.disconnect();
        end;
    end, {
        v25.activatedSignal
    });
    return l_withTooltip_0({
        headerText = v33, 
        bodyText = v34, 
        textXAlignment = Enum.TextXAlignment.Left
    }, {
        guiTarget = l_CoreGui_0, 
        active = v35, 
        DisplayOrder = 100, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    }, function(v38) --[[ Line: 127 ]]
        -- upvalues: v4 (ref), v29 (copy), v14 (ref), v31 (copy), l_ICON_SIZE_0 (ref)
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v38, 
            [v4.Change.AbsolutePosition] = v38
        }, {
            CameraStatusDot = v29 and v4.createElement(v14, {
                Position = UDim2.fromScale(0.8, 0.7), 
                ZIndex = 2
            }) or nil, 
            WrapperCanvasGroup = v4.createElement("CanvasGroup", {
                ref = v31, 
                Size = UDim2.fromOffset(l_ICON_SIZE_0, l_ICON_SIZE_0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = Color3.fromHex("#DEEBF1")
            }, {
                Corner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        });
    end);
end;