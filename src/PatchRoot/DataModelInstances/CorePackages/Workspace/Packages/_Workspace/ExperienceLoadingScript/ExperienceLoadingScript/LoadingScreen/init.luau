local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v16 = require(l_Parent_0.InGameMenuDependencies);
local l_Roact_0 = v16.Roact;
local l_RoactRodux_0 = v16.RoactRodux;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local v20 = require(l_script_FirstAncestor_0.Thunks.GetGameProductInfo);
local v21 = require(l_script_FirstAncestor_0.Thunks.GetIsSubjectToChinaPolicies);
local v22 = require(l_script_FirstAncestor_0.Thunks.GetUniverseId);
local v23 = require(l_Parent_0.VerifiedBadges);
local v24 = require(l_Parent_0.LoggingProtocol);
local v25 = require(l_Parent_0.UIBlox);
local l_LoadingSpinner_0 = v25.App.Loading.LoadingSpinner;
local l_withStyle_0 = v25.Style.withStyle;
local l_Translator_0 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
local v29 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper(l_HttpRbxApiService_0);
local v30 = game:DefineFastFlag("FixServerInfoLocalization", false);
local v31 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportFirstExperienceCancelled);
local v32 = game:DefineFastFlag("BButtonDestroyLoadedGame", false);
local v33 = 7;
game:DefineFastFlag("IncreaseLoadingScreenOrder", false);
if game:GetFastFlag("IncreaseLoadingScreenOrder") then
    v33 = 8;
end;
local v34 = Vector2.new(768, 432);
local v35 = Color3.fromRGB(101, 102, 104);
local v36 = {
    MOBILE_PORTRAIT = {
        TOP = 44, 
        BOTTOM = 44, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    MOBILE_LANDSCAPE = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 44, 
        RIGHT = 44
    }, 
    DESKTOP = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    CONSOLE = {
        TOP = 64, 
        BOTTOM = 64, 
        LEFT = 64, 
        RIGHT = 64
    }
};
local v37 = l_GuiService_0:IsTenFootInterface();
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v39 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v39 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v40 = {
    150, 
    256
};
local v41 = nil;
local v42 = 0;
local v43 = 1e999;
local function _(v44) --[[ Line: 76 ]] --[[ Name: getPadding ]]
    -- upvalues: v39 (copy), v36 (copy), v37 (copy)
    if v39 then
        return v44 and v36.MOBILE_PORTRAIT or v36.MOBILE_LANDSCAPE;
    elseif v37 then
        return v36.CONSOLE;
    else
        return v36.DESKTOP;
    end;
end;
local function _(v46, v47) --[[ Line: 86 ]] --[[ Name: lerp ]]
    if type(v46) == "table" and #v46 >= 2 then
        local v48 = math.clamp(v47, 0, 1);
        return v46[1] * (1 - v48) + v46[2] * v48;
    else
        return 0;
    end;
end;
local v86 = {
    FadeIn = function(v50, _, v52, v53) --[[ Line: 95 ]] --[[ Name: FadeIn ]]
        local v54 = {
            1, 
            1
        };
        local v55 = {
            1, 
            0
        };
        local v56 = {
            1, 
            0.2
        };
        if v50 <= 0.6 then
            local v57 = v50 / 0.6;
            local l_iconTransparency_0 = v52.iconTransparency;
            local v59;
            if type(v55) == "table" and #v55 >= 2 then
                local v60 = math.clamp(v57, 0, 1);
                v59 = v55[1] * (1 - v60) + v55[2] * v60;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.iconSize;
            if type(v54) == "table" and #v54 >= 2 then
                local v61 = math.clamp(v57, 0, 1);
                v59 = v54[1] * (1 - v61) + v54[2] * v61;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.infoFrameTransparency;
            if type(v56) == "table" and #v56 >= 2 then
                local v62 = math.clamp(v57, 0, 1);
                v59 = v56[1] * (1 - v62) + v56[2] * v62;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.thumbnailTransparency;
            if type(v55) == "table" and #v55 >= 2 then
                local v63 = math.clamp(v57, 0, 1);
                v59 = v55[1] * (1 - v63) + v55[2] * v63;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.placeTextTransparency;
            if type(v55) == "table" and #v55 >= 2 then
                local v64 = math.clamp(v57, 0, 1);
                v59 = v55[1] * (1 - v64) + v55[2] * v64;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.placeTextSize;
            if type(v54) == "table" and #v54 >= 2 then
                local v65 = math.clamp(v57, 0, 1);
                v59 = v54[1] * (1 - v65) + v54[2] * v65;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.creatorTextTransparency;
            if type(v55) == "table" and #v55 >= 2 then
                local v66 = math.clamp(v57, 0, 1);
                v59 = v55[1] * (1 - v66) + v55[2] * v66;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            l_iconTransparency_0 = v52.creatorTextSize;
            if type(v54) == "table" and #v54 >= 2 then
                local v67 = math.clamp(v57, 0, 1);
                v59 = v54[1] * (1 - v67) + v54[2] * v67;
            else
                v59 = 0;
            end;
            l_iconTransparency_0(v59);
            return;
        else
            v52.iconTransparency(if type(v55) == "table" and #v55 >= 2 then v55[1] * 0 + v55[2] * 1 else 0);
            v52.iconSize(if type(v54) == "table" and #v54 >= 2 then v54[1] * 0 + v54[2] * 1 else 0);
            v52.infoFrameTransparency(if type(v56) == "table" and #v56 >= 2 then v56[1] * 0 + v56[2] * 1 else 0);
            v52.thumbnailTransparency(if type(v55) == "table" and #v55 >= 2 then v55[1] * 0 + v55[2] * 1 else 0);
            v52.placeTextTransparency(if type(v55) == "table" and #v55 >= 2 then v55[1] * 0 + v55[2] * 1 else 0);
            v52.placeTextSize(if type(v54) == "table" and #v54 >= 2 then v54[1] * 0 + v54[2] * 1 else 0);
            v52.creatorTextTransparency(if type(v55) == "table" and #v55 >= 2 then v55[1] * 0 + v55[2] * 1 else 0);
            v52.creatorTextSize(if type(v54) == "table" and #v54 >= 2 then v54[1] * 0 + v54[2] * 1 else 0);
            v53();
            return;
        end;
    end, 
    FadeOut = function(v68, _, v70, v71) --[[ Line: 124 ]] --[[ Name: FadeOut ]]
        -- upvalues: l_RunService_0 (copy)
        local v72 = {
            1, 
            0.6
        };
        local v73 = {
            0, 
            1
        };
        local v74 = {
            0.2, 
            1
        };
        if v68 <= 0.6 then
            local v75 = v68 / 0.6;
            local l_iconTransparency_1 = v70.iconTransparency;
            local v77;
            if type(v73) == "table" and #v73 >= 2 then
                local v78 = math.clamp(v75, 0, 1);
                v77 = v73[1] * (1 - v78) + v73[2] * v78;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.iconSize;
            if type(v72) == "table" and #v72 >= 2 then
                local v79 = math.clamp(v75, 0, 1);
                v77 = v72[1] * (1 - v79) + v72[2] * v79;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.infoFrameTransparency;
            if type(v74) == "table" and #v74 >= 2 then
                local v80 = math.clamp(v75, 0, 1);
                v77 = v74[1] * (1 - v80) + v74[2] * v80;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.thumbnailTransparency;
            if type(v73) == "table" and #v73 >= 2 then
                local v81 = math.clamp(v75, 0, 1);
                v77 = v73[1] * (1 - v81) + v73[2] * v81;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.placeTextTransparency;
            if type(v73) == "table" and #v73 >= 2 then
                local v82 = math.clamp(v75, 0, 1);
                v77 = v73[1] * (1 - v82) + v73[2] * v82;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.placeTextSize;
            if type(v72) == "table" and #v72 >= 2 then
                local v83 = math.clamp(v75, 0, 1);
                v77 = v72[1] * (1 - v83) + v72[2] * v83;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.creatorTextTransparency;
            if type(v73) == "table" and #v73 >= 2 then
                local v84 = math.clamp(v75, 0, 1);
                v77 = v73[1] * (1 - v84) + v73[2] * v84;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            l_iconTransparency_1 = v70.creatorTextSize;
            if type(v72) == "table" and #v72 >= 2 then
                local v85 = math.clamp(v75, 0, 1);
                v77 = v72[1] * (1 - v85) + v72[2] * v85;
            else
                v77 = 0;
            end;
            l_iconTransparency_1(v77);
            return;
        else
            l_RunService_0:SetRobloxGuiFocused(false);
            v70.iconTransparency(if type(v73) == "table" and #v73 >= 2 then v73[1] * 0 + v73[2] * 1 else 0);
            v70.iconSize(if type(v72) == "table" and #v72 >= 2 then v72[1] * 0 + v72[2] * 1 else 0);
            v70.infoFrameTransparency(if type(v74) == "table" and #v74 >= 2 then v74[1] * 0 + v74[2] * 1 else 0);
            v70.thumbnailTransparency(if type(v73) == "table" and #v73 >= 2 then v73[1] * 0 + v73[2] * 1 else 0);
            v70.placeTextTransparency(if type(v73) == "table" and #v73 >= 2 then v73[1] * 0 + v73[2] * 1 else 0);
            v70.placeTextSize(if type(v72) == "table" and #v72 >= 2 then v72[1] * 0 + v72[2] * 1 else 0);
            v70.creatorTextTransparency(if type(v73) == "table" and #v73 >= 2 then v73[1] * 0 + v73[2] * 1 else 0);
            v70.creatorTextSize(if type(v72) == "table" and #v72 >= 2 then v72[1] * 0 + v72[2] * 1 else 0);
            v71();
            return;
        end;
    end
};
local function _() --[[ Line: 157 ]] --[[ Name: disconnectAndCloseHealthStat ]]
    -- upvalues: v41 (ref), l_GuiService_0 (copy)
    if v41 then
        v41:disconnect();
        v41 = nil;
        l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
    end;
end;
local v88 = l_Roact_0.Component:extend("LoadingScreen");
v88.playAnimation = function(v89, v90, v91, v92) --[[ Line: 168 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    v89.animationStartTime = tick();
    v89.animationFunction = v90;
    if not v89.renderSteppedConnection then
        v89.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 173 ]]
            -- upvalues: v89 (copy), v91 (copy), v92 (copy)
            v89.animationFunction(tick() - v89.animationStartTime, v91, v89.updateBindings, function() --[[ Line: 174 ]]
                -- upvalues: v89 (ref), v92 (ref)
                v89:stopAnimation();
                if v92 then
                    v92();
                end;
            end);
        end);
    end;
end;
v88.stopAnimation = function(v93) --[[ Line: 184 ]] --[[ Name: stopAnimation ]]
    if v93.renderSteppedConnection then
        v93.renderSteppedConnection:Disconnect();
        v93.renderSteppedConnection = nil;
    end;
end;
v88.renderBackground = function(v94, v95) --[[ Line: 191 ]] --[[ Name: renderBackground ]]
    -- upvalues: l_Roact_0 (copy), v33 (ref), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_thumbnailScaledWidth_0 = v94.state.thumbnailScaledWidth;
    local l_thumbnailScaledHeight_0 = v94.state.thumbnailScaledHeight;
    local l_thumbnailPositionX_0 = v94.state.thumbnailPositionX;
    local v99 = "";
    if v94.props.placeId and v94.props.placeId > 0 then
        v99 = ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v94.props.placeId);
    end;
    local l_ReducedMotion_0 = v95.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v33, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        l_Roact_0.createElement("Frame", {
            Name = "BackgroundFrame", 
            [l_Roact_0.Change.AbsoluteSize] = v94.onAbsoluteSizeChange, 
            BackgroundColor3 = v95.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Active = true
        }, {
            ThumbnailImage = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v99, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(l_thumbnailPositionX_0, 0.5), 
                Size = UDim2.fromOffset(l_thumbnailScaledWidth_0, l_thumbnailScaledHeight_0), 
                ImageTransparency = v94.bindings.thumbnailTransparency
            }), 
            renderStepped = not l_ReducedMotion_0 and l_Roact_0.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.renderStepped, 
                callback = v94.renderBackgroundSteppedCallback
            })
        })
    });
end;
v88.showConnnectionHealthDebugMenu = function(_, _) --[[ Line: 233 ]] --[[ Name: showConnnectionHealthDebugMenu ]]
    -- upvalues: v42 (ref), v43 (ref), v39 (copy), l_GuiService_0 (copy)
    if v42 == 0 then
        v42 = 1;
        v43 = tick();
        return;
    else
        if v39 and tick() - v43 <= 0.5 then
            l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
        end;
        v42 = 0;
        v43 = 1e999;
        return;
    end;
end;
v88.renderPlaceIcon = function(v103, v104) --[[ Line: 250 ]] --[[ Name: renderPlaceIcon ]]
    -- upvalues: l_Roact_0 (copy), v35 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_shimPos_0 = v103.state.shimPos;
    local v106 = v103.bindings.iconTransparency:getValue();
    local v107 = "";
    if v103.props.universeId and v103.props.universeId > 0 then
        v107 = ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(v103.props.universeId);
    end;
    local l_ReducedMotion_1 = v104.Settings.ReducedMotion;
    local l_createElement_0 = l_Roact_0.createElement;
    local v110 = "Frame";
    local v111 = {
        Name = "IconFrame", 
        BackgroundTransparency = v103.bindings.iconTransparency, 
        BackgroundColor3 = v35, 
        BorderSizePixel = 0, 
        Size = v103.bindings.iconSize, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Active = true
    };
    local v112 = {};
    local v113 = not l_ReducedMotion_1;
    if v113 then
        v113 = l_Roact_0.createElement;
        local v114 = "Frame";
        local v115 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            ZIndex = 2
        };
        local v116 = {
            Corner = l_Roact_0.createElement("UICorner")
        };
        local l_createElement_1 = l_Roact_0.createElement;
        local v118 = "UIGradient";
        local v119 = {
            Rotation = 25, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
            })
        };
        local l_new_0 = NumberSequence.new;
        local v121 = {};
        local l_new_1 = NumberSequenceKeypoint.new;
        local v123 = 0;
        local v124 = {
            0.7, 
            1
        };
        local v125;
        if type(v124) == "table" and #v124 >= 2 then
            local v126 = math.clamp(v106, 0, 1);
            v125 = v124[1] * (1 - v126) + v124[2] * v126;
        else
            v125 = 0;
        end;
        l_new_1 = l_new_1(v123, v125);
        v123 = NumberSequenceKeypoint.new;
        v125 = 0.5;
        local v127 = {
            0.3, 
            1
        };
        if type(v127) == "table" and #v127 >= 2 then
            local v128 = math.clamp(v106, 0, 1);
            v124 = v127[1] * (1 - v128) + v127[2] * v128;
        else
            v124 = 0;
        end;
        v123 = v123(v125, v124);
        v125 = NumberSequenceKeypoint.new;
        v124 = 1;
        local v129 = {
            0.7, 
            1
        };
        if type(v129) == "table" and #v129 >= 2 then
            local v130 = math.clamp(v106, 0, 1);
            v127 = v129[1] * (1 - v130) + v129[2] * v130;
        else
            v127 = 0;
        end;
        v6(v121, 1, l_new_1, v123, v125(v124, v127));
        v119.Transparency = l_new_0(v121);
        v119.Offset = Vector2.new(l_shimPos_0, 0);
        v116.Gradient = l_createElement_1(v118, v119);
        v116.renderStepped = l_Roact_0.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.renderStepped, 
            callback = v103.renderShimmerCallback
        });
        v113 = v113(v114, v115, v116);
    end;
    v112.LoadingOverlay = v113;
    v112.GameIconImage = l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = v107, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        ImageTransparency = v103.bindings.iconTransparency
    }, {
        Corner = l_Roact_0.createElement("UICorner")
    });
    v112.Corner = l_Roact_0.createElement("UICorner");
    return l_createElement_0(v110, v111, v112);
end;
v88.renderInfoFrame = function(v131, v132) --[[ Line: 311 ]] --[[ Name: renderInfoFrame ]]
    -- upvalues: v23 (copy), v40 (copy), l_Roact_0 (copy), v39 (copy)
    local l_productInfo_0 = v131.props.productInfo;
    local v134 = l_productInfo_0 and l_productInfo_0.Name or "";
    local v135 = l_productInfo_0 and l_productInfo_0.Creator.Name or "";
    if l_productInfo_0 and l_productInfo_0.Creator.HasVerifiedBadge then
        v135 = v23.appendVerifiedBadge(v135);
    end;
    local v136 = math.clamp(math.max(v131.state.absoluteSize.X, v131.state.absoluteSize.Y) / 1024 * v40[1], v40[1], v40[2]);
    return l_Roact_0.createElement("Frame", {
        Name = "InfoFrame", 
        BackgroundColor3 = v132.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v131.bindings.infoFrameTransparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v131.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0), 
        Active = true
    }, {
        PlaceIcon = v131:renderPlaceIcon(v132), 
        TextLayoutFrame = l_Roact_0.createElement("Frame", {
            Name = "TextLayout", 
            BackgroundColor3 = v132.Theme.BackgroundMuted.Color, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0, v136 / 2), 
            Size = UDim2.fromScale(1, 0), 
            Active = true
        }, {
            PlaceLabel = l_Roact_0.createElement("TextLabel", {
                Name = "PlaceLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v131.bindings.placeTextTransparency, 
                Size = UDim2.fromScale(0.8, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v132.Font.Title.Font, 
                TextSize = v131.bindings.placeTextSize, 
                TextScaled = false, 
                TextWrapped = true, 
                TextColor3 = v132.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v134, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            CreatorLabel = l_Roact_0.createElement("TextLabel", {
                Name = "CreatorLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v131.bindings.creatorTextTransparency, 
                Size = UDim2.fromScale(0.6, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v132.Font.CaptionBody.Font, 
                TextSize = v131.bindings.creatorTextSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v132.Theme.TextDefault.Color, 
                TextStrokeTransparency = 1, 
                Text = v135, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 2, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v39 and 12 or 36)
            }), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v39 and 12 or 36), 
                PaddingBottom = UDim.new(0, v39 and 12 or 36)
            })
        }), 
        Corner = l_Roact_0.createElement("UICorner")
    });
end;
v88.renderMain = function(v137, v138) --[[ Line: 404 ]] --[[ Name: renderMain ]]
    -- upvalues: v39 (copy), v36 (copy), v37 (copy), l_Roact_0 (copy), v33 (ref), l_LoadingSpinner_0 (copy)
    local l_isPortrait_0 = v137.isPortrait;
    local v140 = if v39 then l_isPortrait_0 and v36.MOBILE_PORTRAIT or v36.MOBILE_LANDSCAPE else if v37 then v36.CONSOLE else v36.DESKTOP;
    l_isPortrait_0 = v138.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v33 + 1, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        OnTopOfCoreBlur = true
    }, {
        DarkGradient = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Gradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.5, 1), 
                    NumberSequenceKeypoint.new(1, 0.5)
                })
            }), 
            Spinner = l_isPortrait_0 and l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 20
            }, {
                l_Roact_0.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(30, 30), 
                    position = UDim2.new(1, 0, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    rotationRate = 180
                })
            }), 
            infoFrame = v137:renderInfoFrame(v138), 
            serverFrame = v137:renderServerFrame(v138), 
            closeBtn = v137:renderCloseBtn(v138), 
            tenfootCancelBtn = v137:renderTenFootCancelBtn(v138), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v140.LEFT), 
                PaddingRight = UDim.new(0, v140.RIGHT), 
                PaddingTop = UDim.new(0, v140.TOP), 
                PaddingBottom = UDim.new(0, v140.BOTTOM)
            })
        })
    });
end;
v88.renderCloseBtn = function(v141, _) --[[ Line: 461 ]] --[[ Name: renderCloseBtn ]]
    -- upvalues: v37 (copy), l_Roact_0 (copy), v31 (copy), v24 (copy)
    if not v141.state.showCloseBtn and tick() - v141.startTime > 5 and not v37 then
        v141:setState({
            showCloseBtn = true
        });
    end;
    return v141.state.showCloseBtn and l_Roact_0.createElement("ImageButton", {
        Name = "CloseButton", 
        Image = "rbxasset://textures/loading/cancelButton.png", 
        ImageTransparency = 0, 
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromOffset(32, 32), 
        Active = false, 
        ZIndex = 10, 
        [l_Roact_0.Event.MouseButton1Click] = function() --[[ Line: 477 ]]
            -- upvalues: v31 (ref), v24 (ref)
            if v31 then
                v24.default:logEventOnce("first_experience_cancelled");
            end;
            game:Shutdown();
        end
    });
end;
v88.renderServerFrame = function(v143, v144) --[[ Line: 486 ]] --[[ Name: renderServerFrame ]]
    -- upvalues: v37 (copy), l_Roact_0 (copy), l_Translator_0 (copy), v30 (copy), l_CoreGui_0 (copy)
    local l_serverStatusText_0 = v143.state.serverStatusText;
    local l_isSubjectToChinaPolicies_0 = v143.props.isSubjectToChinaPolicies;
    local v147 = v37 and 16 or 12;
    local v148 = v37 and 16 or 12;
    return l_Roact_0.createElement("Frame", {
        Name = "ServerFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.fromScale(0.5, 1), 
        Size = UDim2.new(1, -48, 0.2, 0), 
        Active = true
    }, {
        PolicyLabel = l_isSubjectToChinaPolicies_0 and l_Roact_0.createElement("TextLabel", {
            Name = "PolicyLabel", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 2 * v148), 
            Position = UDim2.new(0, 0, 1, -4 * v147 - 2 * v148), 
            Font = v144.Font.Footer.Font, 
            TextSize = v148, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v144.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_Translator_0:FormatByKey("Authentication.Login.WeChat.AntiAddictionText"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2
        }), 
        JoinServerLabel = l_Roact_0.createElement("TextLabel", {
            Name = "JoinText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 4 * v147), 
            Position = UDim2.new(0, 0, 1, -2 * v147), 
            Font = v144.Font.Footer.Font, 
            TextSize = v147, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v144.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_serverStatusText_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            RootLocalizationTable = if v30 then l_CoreGui_0.CoreScriptLocalization else nil, 
            [l_Roact_0.Event.InputBegan] = not v143.props.isSubjectToChinaPolicies and v143.showConnnectionHealthDebugMenu or nil
        })
    });
end;
v88.renderTenFootCancelBtn = function(v149, v150) --[[ Line: 539 ]] --[[ Name: renderTenFootCancelBtn ]]
    -- upvalues: l_Roact_0 (copy), l_Translator_0 (copy)
    return v149.state.showTenFootCancelBtn and l_Roact_0.createElement("Frame", {
        Name = "TenfootCancelFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        Size = UDim2.fromOffset(150, 48), 
        Active = true
    }, {
        CancelIcon = l_Roact_0.createElement("ImageLabel", {
            Name = "TenfootCancel", 
            Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(24, 24), 
            Active = false, 
            ZIndex = 10, 
            LayoutOrder = 0
        }), 
        CancelLabel = l_Roact_0.createElement("TextLabel", {
            Name = "CancelText", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Font = v150.Font.SubHeader1.Font, 
            TextSize = 24, 
            TextWrapped = true, 
            TextColor3 = v150.Theme.TextEmphasis.Color, 
            TextStrokeTransparency = 1, 
            Text = l_Translator_0:FormatByKey("CoreScripts.TopBar.Back"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            LayoutOrder = 1
        }), 
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 5)
        })
    });
end;
v88.init = function(v151) --[[ Line: 584 ]] --[[ Name: init ]]
    -- upvalues: v34 (copy), v37 (copy), l_ContextActionService_0 (copy), v86 (copy), l_Roact_0 (copy), v40 (copy), v39 (copy), l_GuiService_0 (copy), v32 (copy)
    v151.thumbnailMoveSpd = 0.05;
    v151.fadeinComplete = false;
    v151.isPortrait = false;
    v151.startTime = tick();
    v151.numberOfTaps = 0;
    v151.lastTapTime = 1e999;
    v151:setState({
        visible = true, 
        absoluteSize = Vector2.new(0, 0), 
        thumbnailPositionX = 0.5, 
        thumbnailScaledWidth = v34.x, 
        thumbnailScaledHeight = v34.y, 
        shimPos = 0, 
        serverStatusText = "", 
        showCloseBtn = false, 
        showTenFootCancelBtn = v37
    });
    v151.onAbsoluteSizeChange = function(v152) --[[ Line: 608 ]]
        -- upvalues: v151 (copy)
        v151:setState({
            absoluteSize = v152.AbsoluteSize
        });
        v151.isPortrait = v152.AbsoluteSize.X < v152.AbsoluteSize.Y;
        v151.updateBindings.iconSize(1);
    end;
    game.Loaded:Connect(function() --[[ Line: 617 ]]
        -- upvalues: v37 (ref), l_ContextActionService_0 (ref), v151 (copy), v86 (ref)
        if v37 then
            l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
        end;
        while not v151.fadeinComplete do
            wait();
        end;
        v151:stopAnimation();
        v151:playAnimation(v86.FadeOut, {}, function() --[[ Line: 625 ]]
            -- upvalues: v151 (ref)
            v151:setState({
                visible = false
            });
        end);
    end);
    local v153, v154 = l_Roact_0.createBinding(1);
    local v155, v156 = l_Roact_0.createBinding(1);
    local v157, v158 = l_Roact_0.createBinding(0);
    local v159, v160 = l_Roact_0.createBinding(1);
    local v161, v162 = l_Roact_0.createBinding(0);
    local v163, v164 = l_Roact_0.createBinding(1);
    local v165, v166 = l_Roact_0.createBinding(0);
    local v167, v168 = l_Roact_0.createBinding(1);
    v151.bindings = {
        thumbnailTransparency = v153, 
        iconTransparency = v155, 
        iconSize = v157:map(function(v169) --[[ Line: 645 ]]
            -- upvalues: v151 (copy), v40 (ref)
            local v170 = math.clamp(math.max(v151.state.absoluteSize.X, v151.state.absoluteSize.Y) / 1024 * v40[1], v40[1], v40[2]);
            return UDim2.fromOffset(v170 * v169, v170 * v169);
        end), 
        placeTextTransparency = v159, 
        placeTextSize = v161:map(function(v171) --[[ Line: 651 ]]
            -- upvalues: v39 (ref)
            return (v39 and 20 or 36) * v171;
        end), 
        creatorTextTransparency = v163, 
        creatorTextSize = v165:map(function(v172) --[[ Line: 655 ]]
            return 20 * v172;
        end), 
        infoFrameTransparency = v167
    };
    v151.updateBindings = {
        thumbnailTransparency = v154, 
        iconTransparency = v156, 
        iconSize = v158, 
        placeTextTransparency = v160, 
        placeTextSize = v162, 
        creatorTextTransparency = v164, 
        creatorTextSize = v166, 
        infoFrameTransparency = v168
    };
    v151.renderBackgroundSteppedCallback = function(v173) --[[ Line: 673 ]]
        -- upvalues: v151 (copy), v34 (ref)
        local l_absoluteSize_0 = v151.state.absoluteSize;
        local v175 = l_absoluteSize_0.x * 1.5;
        local v176 = v175 / v34.x * v34.y;
        if v176 < l_absoluteSize_0.y then
            v175 = l_absoluteSize_0.y / v34.y * v34.x;
            v176 = l_absoluteSize_0.y;
        end;
        local v177 = v175 / l_absoluteSize_0.x / 2;
        local v178 = math.max(v177, 1 - v177);
        local v179 = math.min(v177, 1 - v177);
        local v180 = v151.state.thumbnailPositionX + v151.thumbnailMoveSpd * v173;
        if v178 <= v180 or v180 <= v179 then
            v151.thumbnailMoveSpd = -v151.thumbnailMoveSpd;
            v180 = math.clamp(v180, v179, v178);
        end;
        v151:setState({
            thumbnailPositionX = v180, 
            thumbnailScaledHeight = v176, 
            thumbnailScaledWidth = v175
        });
    end;
    v151.renderShimmerCallback = function(v181) --[[ Line: 700 ]]
        -- upvalues: v151 (copy)
        local v182 = v151.state.shimPos + v181 * 1;
        if v182 > 1 then
            v182 = -1;
        end;
        v151:setState({
            shimPos = v182
        });
    end;
    if l_GuiService_0:GetUiMessage() ~= "" then
        v151:setState({
            serverStatusText = l_GuiService_0:GetUiMessage()
        });
    end;
    l_GuiService_0.UiMessageChanged:Connect(function(v183, v184) --[[ Line: 717 ]]
        -- upvalues: v151 (copy)
        if v183 == Enum.UiMessageType.UiMessageInfo then
            v151:setState({
                serverStatusText = v184
            });
        end;
    end);
    if v37 then
        local v185 = false;
        do
            local l_v185_0 = v185;
            l_ContextActionService_0:BindCoreAction("CancelGameLoad", function(_, v188, _) --[[ Line: 727 ]]
                -- upvalues: l_v185_0 (ref), v151 (copy), l_ContextActionService_0 (ref), v32 (ref)
                if v188 == Enum.UserInputState.Begin then
                    l_v185_0 = true;
                    return;
                else
                    if v188 == Enum.UserInputState.End and l_v185_0 then
                        v151:setState({
                            showTenFootCancelBtn = false
                        });
                        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
                        if v32 then
                            if not game:IsLoaded() then
                                game:Shutdown();
                                return;
                            end;
                        else
                            game:Shutdown();
                        end;
                    end;
                    return;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end;
    end;
end;
v88.render = function(v190) --[[ Line: 749 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy)
    return l_withStyle_0(function(v191) --[[ Line: 752 ]]
        -- upvalues: v190 (copy), l_Roact_0 (ref)
        return v190.state.visible and l_Roact_0.createElement("Folder", {}, {
            BackgroundScreen = v190:renderBackground(v191), 
            MainScreen = v190:renderMain(v191)
        });
    end);
end;
v88.willUpdate = function(_, _, _) --[[ Line: 761 ]] --[[ Name: willUpdate ]]

end;
v88.didMount = function(v195) --[[ Line: 763 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v86 (copy)
    l_RunService_0:SetRobloxGuiFocused(true);
    v195.props.fetchUniverseId(v195.props.placeId);
    v195.props.fetchGameProductInfo(v195.props.placeId);
    v195.props.fetchSubjectToChinaPolicies();
    v195:playAnimation(v86.FadeIn, {}, function() --[[ Line: 772 ]]
        -- upvalues: v195 (copy)
        v195.fadeinComplete = true;
    end);
end;
v88.willUnmount = function(_) --[[ Line: 777 ]] --[[ Name: willUnmount ]]
    -- upvalues: v32 (copy), v37 (copy), l_ContextActionService_0 (copy), l_RunService_0 (copy), v41 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v32 and v37 then
        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
    end;
    l_RunService_0:SetRobloxGuiFocused(false);
    if not v41 then
        v41 = l_UserInputService_0.InputBegan:Connect(function() --[[ Line: 786 ]]
            -- upvalues: v41 (ref), l_GuiService_0 (ref)
            if v41 then
                v41:disconnect();
                v41 = nil;
                l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
            end;
        end);
    end;
end;
return (l_RoactRodux_0.connect(function(v197, v198) --[[ Line: 792 ]]
    return {
        productInfo = v197.productInfo, 
        isSubjectToChinaPolicies = v197.isSubjectToChinaPolicies, 
        placeId = v197.gameIds and v197.gameIds.placeId or v198.placeId, 
        universeId = v197.gameIds and v197.gameIds.universeId or 0, 
        settings = v197.settings
    };
end, function(v199) --[[ Line: 800 ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), v29 (copy)
    return {
        fetchGameProductInfo = function(v200) --[[ Line: 802 ]] --[[ Name: fetchGameProductInfo ]]
            -- upvalues: v199 (copy), v20 (ref)
            v199(v20(v200));
        end, 
        fetchSubjectToChinaPolicies = function() --[[ Line: 805 ]] --[[ Name: fetchSubjectToChinaPolicies ]]
            -- upvalues: v199 (copy), v21 (ref)
            v199(v21());
        end, 
        fetchUniverseId = function(v201) --[[ Line: 808 ]] --[[ Name: fetchUniverseId ]]
            -- upvalues: v199 (copy), v22 (ref), v29 (ref)
            v199(v22(v29, v201));
        end
    };
end)(v88));