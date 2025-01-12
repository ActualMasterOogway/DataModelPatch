local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_Cell_0 = v4.App.Table.Cell;
local l_CellHeadDetail_0 = v4.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v4.App.Table.CellTailDescription;
local l_getPageMargin_0 = v4.App.Container.getPageMargin;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v12 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v12.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v12.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v12.Hooks.dependencyArray;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v19 = require(l_script_FirstAncestor_0.Common.Constants);
local v20 = require(l_script_FirstAncestor_0.Common.Enums);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v22 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v23 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v24 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v25 = require(l_script_FirstAncestor_0.Hooks.useCurrentProfileFriendStatus);
local v26 = require(l_script_FirstAncestor_0.Components.QuickLinks.QuickLinkData);
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformQuickLinkMobileUITweak);
local v28 = v27 and 36 or 44;
local v29 = game:DefineFastFlag("ProfilePlatformEnableFriendStatusInQuickLinksEvent", true);
local function v42(v30) --[[ Line: 52 ]] --[[ Name: useQuickLinkData ]]
    -- upvalues: l_useSelector_0 (copy), v24 (copy), v19 (copy), v20 (copy), v3 (copy), v26 (copy), l_useLocalization_0 (copy)
    local v32 = l_useSelector_0(function(v31) --[[ Line: 53 ]]
        -- upvalues: v24 (ref), v19 (ref), v30 (copy), v20 (ref)
        return v24(v31, (("%*.Users.%*.components.%*.%*"):format(v19.RODUX_KEY, v30, v20.Components.QuickLinks, "links"))) or {};
    end);
    local v35 = v3.List.map(v32, function(v33, _) --[[ Line: 60 ]]
        -- upvalues: v26 (ref)
        return v26[v33];
    end);
    local v38 = v3.Dictionary.map(v35, function(v36, _) --[[ Line: 64 ]]
        return v36.Title, v36.Title;
    end);
    local v39 = l_useLocalization_0(v38);
    return (v3.List.map(v35, function(v40, _) --[[ Line: 70 ]]
        -- upvalues: v39 (copy)
        v40.LocalizedTitle = v39[v40.Title];
        return v40;
    end));
end;
return function(v43) --[[ Line: 78 ]] --[[ Name: QuickLinks ]]
    -- upvalues: v2 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v22 (copy), v23 (copy), l_getPageMargin_0 (copy), v27 (copy), v42 (copy), v29 (copy), v25 (copy), l_Cell_0 (copy), v19 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v28 (copy), l_CellHeadDetail_0 (copy), l_CellTailDescription_0 (copy), l_dependencyArray_0 (copy)
    local v44, v45 = v2.useState(24);
    local v46, v47 = v2.useState(24);
    local v48 = l_useStyle_0();
    local v49 = l_useDispatch_0();
    local v50 = v22();
    local l_profileUserId_0 = v23().profileUserId;
    local v54 = v2.useCallback(function(v52) --[[ Line: 87 ]]
        -- upvalues: l_getPageMargin_0 (ref), v27 (ref), v45 (copy), v47 (copy)
        local v53 = l_getPageMargin_0(v52.AbsoluteSize.X);
        if v27 and v53 <= 24 then
            v45(0);
            v47(v53);
            return;
        else
            v45(v53);
            v47(0);
            return;
        end;
    end, {});
    local v55 = v42(l_profileUserId_0);
    local v62 = v2.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v2 (ref), v29 (ref), v25 (ref), v55 (copy), v27 (ref), v46 (copy), v48 (copy), l_Cell_0 (ref), v19 (ref), v50 (copy), v49 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileUserId_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v28 (ref), l_CellHeadDetail_0 (ref), l_CellTailDescription_0 (ref)
        local v56 = {
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        local v57 = if v29 then v25() else nil;
        for v58, v59 in v55 do
            local v60 = ("Cell %*"):format(v58);
            local v61 = v58 ~= 1;
            v56[v60] = v2.createElement("Frame", {
                LayoutOrder = v58, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = if v27 then Enum.HorizontalAlignment.Right else nil
                }), 
                Divider = if v61 then v2.createElement("Frame", {
                    Size = UDim2.new(1, if v27 then -v46 else 0, 0, 1), 
                    BackgroundColor3 = v48.Theme.Divider.Color, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    BackgroundTransparency = v48.Theme.Divider.Transparency, 
                    ZIndex = 2
                }) else nil, 
                Content = v2.createElement(l_Cell_0, {
                    size = UDim2.new(1, 0, 0, v19.CTA_BUTTON_HEIGHT), 
                    horizontalPadding = 0, 
                    layoutOrder = 2, 
                    onActivated = function() --[[ Line: 149 ]] --[[ Name: onActivated ]]
                        -- upvalues: v29 (ref), v50 (ref), v59 (copy), v57 (copy), v49 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileUserId_0 (ref)
                        if v29 then
                            v50.fireAnalyticsEvent(v59.EventName, {
                                friendStatus = v57
                            });
                        else
                            v50.fireAnalyticsEvent(v59.EventName);
                        end;
                        v49(l_NavigateDown_0({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = string.format(v59.Route, l_Url_0.BASE_URL, l_profileUserId_0), 
                            extraProps = {
                                titleKey = v59.Title
                            }
                        }, nil));
                    end, 
                    head = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        Padding = if v27 then v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v46)
                        }) else nil, 
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        Icon = v2.createElement(l_ImageSetLabel_0, {
                            Image = l_Images_0[v59.Icon], 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Size = UDim2.fromOffset(v28, v28), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = v48.Theme.SystemPrimaryDefault.Color, 
                            Position = UDim2.fromScale(0.5, 0.5)
                        }), 
                        Label = v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY
                        }, {
                            UIPadding = v2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12)
                            }), 
                            label = v2.createElement(l_CellHeadDetail_0, {
                                labelText = v59.LocalizedTitle
                            })
                        })
                    }), 
                    tail = v2.createElement("Frame", {
                        BackgroundTransparency = 1
                    }, {
                        UIPadding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 12)
                        }), 
                        tail = v2.createElement(l_CellTailDescription_0, {
                            showArrow = true
                        })
                    })
                })
            });
        end;
        return v56;
    end, l_dependencyArray_0(v55, v50, v48, v49, v46, v44, l_profileUserId_0));
    return v2.createElement("Frame", {
        LayoutOrder = v43.layoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        [v2.Change.AbsoluteSize] = v54
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v27 and 0 or v19.ADDITIONAL_PADDING), 
            PaddingRight = UDim.new(0, v44), 
            PaddingLeft = UDim.new(0, v44)
        }), 
        Table = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v62)
    });
end;