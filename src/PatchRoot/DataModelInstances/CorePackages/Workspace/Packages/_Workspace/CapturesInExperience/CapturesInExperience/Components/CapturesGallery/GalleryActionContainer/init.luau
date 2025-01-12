local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.UIBlox);
local v7 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local v19 = require(l_Parent_0.Actions.CaptureManagerOpened);
local v20 = require(l_Parent_0.App.CapturesPolicy);
local v21 = require(l_Parent_0.Constants);
local v22 = require(l_Parent_0.Analytics.EventNames);
local v23 = require(l_Parent_0.Utils.getCaptureStorageUsage);
return (v20.connect(function(v24) --[[ Line: 184 ]]
    return {
        enableCapturesBulkManagement = v24.enableCapturesBulkManagement()
    };
end)(function(v25) --[[ Line: 43 ]]
    -- upvalues: v7 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v21 (copy), v22 (copy), v19 (copy), v23 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy)
    local v26 = v7();
    local v27 = l_useStyle_0();
    local v28 = l_useDispatch_0();
    local l_Color_0 = v27.Theme.TextDefault.Color;
    local l_Font_0 = v27.Font.CaptionBody.Font;
    local v31 = v27.Font.BaseSize * v27.Font.CaptionBody.RelativeSize;
    local v32, v33 = v4.useState(false);
    local v34 = l_useLocalization_0({
        oneCaptureLabel = "Feature.Captures.Label.OneCapture", 
        multipleCapturesLabel = {
            "Feature.Captures.Label.CaptureCounts"; 
            numberOfCaptures = v25.itemCount
        }, 
        tooltipTitle = "Feature.Captures.Title.CaptureStorageTooltipTitle", 
        tooltipBody = "Feature.Captures.Label.CaptureStorageTooltipLabel"
    });
    local v36 = l_useSelector_0(function(v35) --[[ Line: 64 ]]
        -- upvalues: v21 (ref)
        return v35[v21.RoduxKey].Captures;
    end);
    local v37 = v4.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v33 (copy), v26 (copy), v22 (ref), v28 (copy), v19 (ref)
        v33(false);
        v26.fireEvent(v22.CapturesManagerOpened);
        v28(v19());
    end, {});
    local v39 = v4.useCallback(function(_) --[[ Line: 74 ]]
        -- upvalues: v33 (copy), v32 (copy)
        v33(not v32);
    end, {
        v32
    });
    local v40 = v4.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v23 (ref), v36 (copy)
        return v23(v36);
    end, {
        v36
    });
    local v41 = if v25.itemCount == 1 then v34.oneCaptureLabel else v34.multipleCapturesLabel;
    if not v25.enableCapturesBulkManagement then
        return nil;
    else
        return v4.createElement("Frame", {
            BackgroundColor3 = v27.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v27.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = v25.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 36)
        }, {
            GridLayout = v4.createElement("UIGridLayout", {
                CellSize = UDim2.new(0.5, -4, 0, 36), 
                FillDirection = Enum.FillDirection.Horizontal, 
                FillDirectionMaxCells = 2, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            IconFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0)
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                SettingIcon = v4.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/common/settings"], 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v37, 
                    showBackground = false
                })
            }), 
            TextFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                ZIndex = 3
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                ItemCountAndStorageSpaceLabel = v4.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 0, 0, 20), 
                    Text = ("%*, %*"):format(v41, v40), 
                    TextColor3 = l_Color_0, 
                    TextSize = v31, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                InfoIconWithTooltip = l_withTooltip_0({
                    headerText = v34.tooltipTitle, 
                    bodyText = v34.tooltipBody
                }, {
                    preferredOrientation = l_TooltipOrientation_0.Bottom, 
                    guiTarget = l_CoreGui_0, 
                    DisplayOrder = 100, 
                    active = v32
                }, function(v42) --[[ Line: 157 ]]
                    -- upvalues: v33 (copy), v4 (ref), l_Interactable_0 (ref), v39 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
                    local function v44(v43) --[[ Line: 158 ]]
                        -- upvalues: v33 (ref), v42 (copy)
                        v33(false);
                        v42(v43);
                    end;
                    return v4.createElement(l_Interactable_0, {
                        AnchorPoint = Vector2.new(1, 0.5), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        Position = UDim2.new(1, 0, 0.5, 0), 
                        Size = UDim2.fromOffset(16, 16), 
                        [v4.Change.AbsolutePosition] = v44, 
                        [v4.Change.AbsoluteSize] = v44, 
                        [v4.Event.Activated] = v39
                    }, {
                        InfoIcon = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(1, 1), 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/actions/info_small"]
                        })
                    });
                end)
            })
        });
    end;
end));