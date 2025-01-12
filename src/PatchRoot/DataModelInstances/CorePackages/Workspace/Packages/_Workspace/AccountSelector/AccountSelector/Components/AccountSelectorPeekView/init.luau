local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_PeekView_0 = v1.PeekView.PeekView;
local l_Cryo_0 = v1.Cryo;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_PeekViewState_0 = v1.PeekView.PeekViewState;
local l_useNavigation_0 = v1.Hooks.useNavigation;
local l_useState_0 = l_React_0.useState;
local l_useEffect_0 = l_React_0.useEffect;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_useSelector_0 = v1.RoactUtils.Hooks.RoactRodux.useSelector;
local v14 = require(script.Parent.AccountSelectionList);
local _ = require(script.Parent.AccountSelection);
local v16 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v17 = game:DefineFastFlag("MoveAccountSelectorClosingAfterOperation", false);
local v18 = game:DefineFastFlag("AddMaxLimitToAccountSelector", false);
local v19 = game:DefineFastInt("AccountSelectorInitialRowsShown", 6);
local v20 = game:DefineFastFlag("EnableAccountSelectorPeekviewRemoveSuperBriefState", false);
local l_GetFFlagAccountSwitchScrim_0 = v1.SharedFlags.GetFFlagAccountSwitchScrim;
local l_GetFFlagLuaAppEnableTopBanner_0 = v1.SharedFlags.GetFFlagLuaAppEnableTopBanner;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v57 = l_RoactNavigation_0.withNavigationFocus(function(v24) --[[ Line: 56 ]] --[[ Name: AccountSelectorPeekView ]]
    -- upvalues: l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useState_0 (copy), l_PeekViewState_0 (copy), l_useDesignTokens_0 (copy), v18 (copy), v19 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_React_0 (copy), l_useEffect_0 (copy), v16 (copy), v17 (copy), l_GetFFlagAccountSwitchScrim_0 (copy), l_PeekView_0 (copy), v20 (copy), v14 (copy)
    local v25 = l_useStyle_0();
    local v26 = l_useNavigation_0();
    local v27, v28 = l_useState_0(false);
    local v29, v30 = l_useState_0(l_PeekViewState_0.Full);
    local l_BaseSize_0 = v25.Font.BaseSize;
    local v32 = v25.Font.Header1.RelativeSize * l_BaseSize_0;
    local v33 = l_useDesignTokens_0();
    local v34 = #v24.users;
    local l_Size_800_0 = v33.Global.Size_800;
    local v36 = l_Size_800_0 * 100.5;
    local v37 = l_Size_800_0 * (v34 + 1.25 + 1);
    if v18 then
        v37 = l_Size_800_0 * (math.min(v19, v34) + 1.25 + 1);
    end;
    local v38 = v34 < 100 and l_Size_800_0 * v34 or v36;
    local v39 = l_useLocalization_0({
        titleText = v24.titleTextKey, 
        helpText = v24.helpTextKey
    });
    local v41 = l_useSelector_0(function(v40) --[[ Line: 97 ]]
        return v40.ScreenSize;
    end);
    local v43 = if l_GetFFlagLuaAppEnableTopBanner_0() then l_useSelector_0(function(v42) --[[ Line: 102 ]]
        return v42.GlobalGuiInset.top;
    end) else 0;
    local v44 = v41.X - 48;
    local v45 = l_React_0.useRef(false);
    local l_Color_0 = v25.Theme.BackgroundDefault.Color;
    l_useEffect_0(function() --[[ Line: 111 ]]
        -- upvalues: v24 (copy), v16 (ref), v45 (copy)
        local v47 = "";
        for _, v49 in v24.users do
            v47 = v47 .. tostring(v49.id) .. ",";
        end;
        v47 = v47:sub(1, -2);
        v16.sendPageLoadEvent(v24.context, v24.origin, v47);
        return function() --[[ Line: 120 ]]
            -- upvalues: v45 (ref), v24 (ref)
            if not v45.current then
                v24.onAccountSelectionAbandoned();
            end;
        end;
    end, {});
    local function v51(v50) --[[ Line: 129 ]] --[[ Name: handleAccountSelection ]]
        -- upvalues: v17 (ref), v30 (copy), l_PeekViewState_0 (ref), v28 (copy), v24 (copy), v16 (ref), v45 (copy)
        if not v17 then
            v30(l_PeekViewState_0.Closed);
        end;
        v28(true);
        v24.onAccountSelection(v50);
        v16.sendSelectEvent(v24.context, v24.origin, (tostring(v50)));
        v45.current = true;
        if v17 then
            v30(l_PeekViewState_0.Closed);
        end;
    end;
    local function v54(v52, _) --[[ Line: 142 ]] --[[ Name: viewStateChanged ]]
        -- upvalues: v30 (copy), l_PeekViewState_0 (ref), v26 (copy)
        v30(v52);
        if v52 == l_PeekViewState_0.Closed or v52 == l_PeekViewState_0.Hidden then
            v26.goBack();
        end;
    end;
    local function v56(v55) --[[ Line: 149 ]] --[[ Name: peekHeaderPositionYChange ]]
        -- upvalues: v30 (copy), l_PeekViewState_0 (ref)
        if v55 < 10 then
            v30(l_PeekViewState_0.Closed);
        end;
    end;
    return l_React_0.createElement("Frame", {
        Size = if l_GetFFlagLuaAppEnableTopBanner_0() then UDim2.new(1, 0, 0, v41.Y - v43) else UDim2.new(1, 0, 0, v41.Y), 
        BackgroundColor3 = v25.Theme.Overlay.Color, 
        BackgroundTransparency = l_GetFFlagAccountSwitchScrim_0() and 1 or 0.5
    }, {
        PeekView = l_React_0.createElement(l_PeekView_0, {
            hasScrim = l_GetFFlagAccountSwitchScrim_0() and true or nil, 
            briefViewContentHeight = UDim.new(0, v37), 
            superBriefViewContentHeight = if v20 then nil else UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v25, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            mountAnimation = true, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v56, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v54, 
            peekViewState = v29
        }, {
            Content = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 0, 
                BorderColor3 = l_Color_0, 
                BackgroundColor3 = l_Color_0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ContentPadding = l_React_0.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 48)
                }), 
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                TitleFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ContentPadding = l_React_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    TitleText = l_React_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v39.titleText, 
                        TextSize = v32, 
                        TextColor3 = v25.Theme.TextEmphasis.Color, 
                        TextTransparency = v25.Theme.TextDefault.Transparency, 
                        Font = v25.Font.Header2.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v44, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                Divider = l_React_0.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v25.Theme.Divider.Color, 
                    BackgroundTransparency = v25.Theme.Divider.Transparency
                }), 
                HelpText = if v39.helpText then l_React_0.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v39.helpText, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v25.Theme.TextDefault.Color, 
                    TextTransparency = v25.Theme.TextDefault.Transparency, 
                    Font = v25.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v44, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }) else nil, 
                AccountSelectionContent = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    AccountSelectionList = l_React_0.createElement(v14, {
                        users = v24.users, 
                        onAccountSelection = v51, 
                        height = v38, 
                        isDisabled = v27, 
                        LayoutOrder = 0, 
                        isScrollable = false
                    }), 
                    FooterContent = l_React_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundColor3 = v25.Theme.BackgroundUIDefault.Color, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Contents = if v24.renderFooterComponent then v24.renderFooterComponent() else nil
                    })
                })
            })
        })
    });
end);
return l_React_0.forwardRef(function(v58, v59) --[[ Line: 287 ]]
    -- upvalues: l_React_0 (copy), v57 (ref), l_Cryo_0 (copy)
    return l_React_0.createElement(v57, l_Cryo_0.Dictionary.join(v58, {
        defaultChildRef = v59
    }));
end);