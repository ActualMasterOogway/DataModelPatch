local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.UIBlox);
local v5 = require(l_Parent_1.Localization);
local v6 = require(l_Parent_1.Promise);
local v7 = require(l_Parent_1.RobloxAppHooks);
local v8 = require(l_Parent_1.RoactUtils);
local v9 = require(l_Parent_1.RoactServiceTags);
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_withTooltip_0 = v4.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useRoactService_0 = v7.useRoactService;
local l_useEffectOnce_0 = v8.Hooks.useEffectOnce;
local l_AppEventIngestService_0 = v9.AppEventIngestService;
local v19 = require(l_Parent_0.Constants);
local v20 = l_Images_0["icons/logo/studiologo"];
local v21 = Color3.fromRGB(0, 159, 255);
return function(v22) --[[ Line: 38 ]] --[[ Name: StudioCTAIcon ]]
    -- upvalues: v3 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useLocalization_0 (copy), l_useEffectOnce_0 (copy), v19 (copy), l_ControlState_0 (copy), v6 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_withTooltip_0 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v21 (copy)
    local v23, v24 = v3.useState(false);
    local v25 = l_useRoactService_0(l_AppEventIngestService_0);
    local v26 = l_useLocalization_0({
        titleText = "CommonUI.Features.StudioCTA.Tooltip.Title", 
        bodyText = "CommonUI.Features.StudioCTA.Tooltip.Body"
    });
    local v27 = v3.useRef(nil);
    l_useEffectOnce_0(function() --[[ Line: 48 ]]
        -- upvalues: v25 (copy), v19 (ref)
        v25:setRBXEventStream(v19.STUDIO_CTA_EVENT_CONTEXT, v19.STUDIO_CTA_EVENT_NAME_MOUNT);
    end, {});
    if v22.controlState == l_ControlState_0.Hover or v22.controlState == l_ControlState_0.Selected then
        if not v27.current then
            v27.current = v6.delay(0.4):andThenCall(function() --[[ Line: 56 ]]
                -- upvalues: v27 (copy), v24 (copy)
                v27.current = nil;
                v24(true);
            end);
        end;
    else
        if v27.current then
            v27.current:cancel();
            v27.current = nil;
        end;
        if v23 then
            v24(false);
        end;
    end;
    local v28 = {
        headerText = v26.titleText, 
        bodyText = v26.bodyText
    };
    local v29 = {
        preferredOrientation = l_TooltipOrientation_0.Top, 
        guiTarget = l_CoreGui_0, 
        active = v23, 
        DisplayOrder = 10
    };
    return l_withTooltip_0(v28, v29, function(v30) --[[ Line: 83 ]]
        -- upvalues: v3 (ref), l_ImageSetLabel_0 (ref), v20 (ref), v21 (ref)
        return v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Image = v20, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = v21, 
            [v3.Change.AbsoluteSize] = v30, 
            [v3.Change.AbsolutePosition] = v30
        });
    end);
end;