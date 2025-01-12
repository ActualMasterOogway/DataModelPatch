local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Hooks.useSquadState);
local _ = require(l_script_FirstAncestor_0.Enums.SquadButtonSourceEnum);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadButtonClickIntentionEnum);
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Foundation_0 = v4.Foundation;
local l_React_0 = v4.React;
local l_ReactOtter_0 = v4.ReactOtter;
local l_SquadsCore_0 = v4.SquadsCore;
local l_UIBlox_0 = v4.UIBlox;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_SquadExternalContractContext_0 = v4.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadState_0 = v4.SquadsCore.Enums.SquadState;
local l_leaveSquad_0 = v4.SquadsCore.Thunks.leaveSquad;
local l_useDispatch_0 = v4.Hooks.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useSelector_0 = v4.Hooks.useSelector;
local l_Constants_0 = l_SquadsCore_0.Common.Constants;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadPromptType_0 = v4.SquadsCore.Enums.SquadPromptType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local v23 = {
    dampingRatio = 1, 
    frequency = 1
};
return function(v24) --[[ Line: 48 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), v1 (copy), l_ReactOtter_0 (copy), v23 (copy), l_useSelector_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_EventNames_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), l_Foundation_0 (copy), l_SquadState_0 (copy), l_Constants_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v25 = l_useLocalization_0({
        joinButtonText = "Feature.Squads.Action.Join", 
        startButtonText = "Feature.Squads.Action.Start", 
        viewButtonText = "Feature.Squads.Action.View"
    });
    local v26 = l_useDispatch_0();
    local v27 = l_useTokens_0();
    local v28 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v29 = v28.useParentChannelHasGroupUp(v24.conversationId);
    local v30 = v1();
    local v31 = nil;
    local v32 = nil;
    local v34, v35 = l_ReactOtter_0.useAnimatedBinding(1, function(v33) --[[ Line: 64 ]]
        -- upvalues: v24 (copy), v32 (ref), l_ReactOtter_0 (ref), v23 (ref)
        if v24.shouldAnimate then
            task.delay(0.5, function() --[[ Line: 66 ]]
                -- upvalues: v32 (ref), l_ReactOtter_0 (ref), v33 (copy), v23 (ref)
                v32(l_ReactOtter_0.spring(v33 == 1 and 0 or 1, v23));
            end);
        end;
    end);
    v31 = v34;
    v32 = v35;
    l_React_0.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v24 (copy), v32 (ref), l_ReactOtter_0 (ref), v23 (ref)
        if v24.shouldAnimate then
            v32(l_ReactOtter_0.spring(1, v23));
            return;
        else
            v32(l_ReactOtter_0.instant(1));
            return;
        end;
    end, {
        v24.shouldAnimate, 
        v32
    });
    v34 = l_React_0.useCallback(function(v36) --[[ Line: 80 ]]
        if v36.Squad and v36.Squad.Squad then
            return v36.Squad.Squad.currentSquad;
        else
            return nil;
        end;
    end, {});
    v35 = l_useSelector_0(v34);
    local v37 = l_React_0.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v35 (copy), v24 (copy)
        return v35 and v35.parentChannelId == v24.conversationId;
    end, l_dependencyArray_0(v35, v24.conversationId));
    local v38 = l_React_0.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v37 (copy), v3 (ref), v29 (copy)
        if v37 then
            return v3.View;
        elseif v29 then
            return v3.Join;
        else
            return v3.Create;
        end;
    end, l_dependencyArray_0(v37, v29));
    local v39 = l_React_0.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v37 (copy), v25 (copy), v29 (copy)
        if v37 then
            return v25.viewButtonText;
        elseif v29 then
            return v25.joinButtonText;
        else
            return v25.startButtonText;
        end;
    end, l_dependencyArray_0(v29, v37, v25.joinButtonText, v25.startButtonText, v25.viewButtonText));
    local v40 = l_React_0.useCallback(function() --[[ Line: 123 ]]
        -- upvalues: v28 (copy), l_EventNames_0 (ref), v24 (copy), v35 (copy), v38 (copy)
        v28.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v24.conversationId, 
            squadButtonSource = v24.squadButtonSource, 
            squadId = v35 and v35.squadId, 
            squadLocation = v24.squadLocation, 
            userIntention = v38
        });
    end, l_dependencyArray_0(v38, v35, v24.conversationId, v24.squadButtonSource, v24.squadLocation, v28.fireSquadAnalytics));
    local v41 = l_React_0.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v40 (copy), v37 (copy), v35 (copy), v26 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v28 (copy), v24 (copy)
        v40();
        if not v37 and v35 then
            v26(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v28.setSquadPrompt, function() --[[ Line: 145 ]]
                -- upvalues: v24 (ref)
                v24.onActivated(v24.conversationId);
            end));
            return;
        else
            v24.onActivated(v24.conversationId);
            return;
        end;
    end, l_dependencyArray_0(v35, v37, v24.onActivated, v40, v28.setSquadPrompt));
    local v42 = l_React_0.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: v27 (copy), v24 (copy)
        if v27.Config.ColorMode.IsLight == "true" then
            if v24.isInCard then
                return v27.Color.Extended.Gray.Gray_300;
            else
                return v27.Color.Extended.Gray.Gray_200;
            end;
        elseif v24.isInCard then
            return v27.Color.Extended.Gray.Gray_800;
        else
            return v27.Color.Extended.Gray.Gray_900;
        end;
    end, {
        v24.isInCard, 
        v27.Config.ColorMode.IsLight
    });
    return l_React_0.createElement(l_Foundation_0.View, {
        AutomaticSize = if v24.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY, 
        Size = UDim2.new(v24.isFullWidth and 1 or 0, 0, 0, v27.Size.Size_900), 
        backgroundStyle = v27.Color.ActionStandard.Background, 
        cornerRadius = UDim.new(0, v27.Radius.Medium), 
        isDisabled = v30 == l_SquadState_0.Initializing, 
        onActivated = v41, 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        LayoutOrder = v24.layoutOrder, 
        padding = {
            left = UDim.new(0, v27.Padding.Small), 
            right = UDim.new(0, v27.Padding.Medium)
        }, 
        stroke = {
            Color = v27.Color.ActionStandard.Border.Color3, 
            Transparency = v27.Color.ActionStandard.Border.Transparency
        }
    }, {
        UISizeConstraint = if not v24.isFullWidth and v24.maxWidth then l_React_0.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v24.maxWidth, v27.Size.Size_900)
        }) else nil, 
        Container = l_React_0.createElement(l_Foundation_0.View, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.fromOffset(0, v27.Size.Size_900), 
            backgroundStyle = v27.Color.None
        }, {
            GroupIconContainer = l_React_0.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Size = UDim2.fromOffset(l_Constants_0.GROUP_ICON_CONTAINER_SIZE, l_Constants_0.GROUP_ICON_CONTAINER_SIZE), 
                BackgroundTransparency = 1
            }, {
                GroupIcon = l_React_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(l_Constants_0.GROUP_ICON_SIZE, l_Constants_0.GROUP_ICON_SIZE), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/menu/groups"], 
                    ImageColor3 = v27.Color.ActionStandard.Foreground.Color3, 
                    ImageTransparency = v27.Color.ActionStandard.Foreground.Transparency, 
                    ZIndex = 0
                }), 
                GreenDot = if not not v29 or v37 then l_React_0.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    Size = UDim2.fromOffset(v27.Size.Size_200, v27.Size.Size_200), 
                    BackgroundColor3 = v27.Color.Extended.Green.Green_500.Color3, 
                    BackgroundTransparency = v31:map(function(v43) --[[ Line: 222 ]]
                        -- upvalues: v27 (copy)
                        return 1 + (v27.Color.Extended.Green.Green_500.Transparency - 1) * v43;
                    end), 
                    ZIndex = 1
                }, {
                    UICorner = l_React_0.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    UIStroke = l_React_0.createElement("UIStroke", {
                        Color = v42.Color3, 
                        Transparency = v31:map(function(v44) --[[ Line: 232 ]]
                            -- upvalues: v42 (copy)
                            return 1 + (v42.Transparency - 1) * v44;
                        end), 
                        Thickness = v27.Stroke.Thicker
                    })
                }) else nil
            }), 
            TextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                AnchorPoint = Vector2.new(0, 0.5), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0, l_Constants_0.GROUP_ICON_CONTAINER_SIZE + v27.Gap.XSmall, 0.5, 0), 
                backgroundStyle = v27.Color.None, 
                fontStyle = v27.Typography.LabelMedium, 
                Text = v39, 
                textStyle = v27.Color.ActionStandard.Foreground, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false
            })
        })
    });
end;