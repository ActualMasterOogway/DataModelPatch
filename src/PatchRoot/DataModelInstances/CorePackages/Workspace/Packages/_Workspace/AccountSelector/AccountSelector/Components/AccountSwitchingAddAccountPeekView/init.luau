local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_RoactRodux_0 = v2.RoactRodux;
local l_RoactUtils_0 = v2.RoactUtils;
local l_useDispatch_0 = l_RoactUtils_0.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = l_RoactUtils_0.Hooks.RoactRodux.useSelector;
local l_UIBlox_0 = v2.UIBlox;
local l_useLocalization_0 = v2.Localization.Hooks.useLocalization;
local l_React_0 = v2.React;
local l_useEffect_0 = l_React_0.useEffect;
local v11 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v12 = require(l_Parent_0.Analytics.EventConstants);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useNavigation_0 = v2.Hooks.useNavigation;
local l_AppPage_0 = v2.RobloxAppEnums.AppPage;
local l_NavigateDown_0 = v2.NavigationRodux.Thunks.NavigateDown;
local l_PeekView_0 = v2.PeekView.PeekView;
local l_PeekViewState_0 = v2.PeekView.PeekViewState;
local l_useState_0 = l_React_0.useState;
local l_AppBtidLayers_0 = v2.ExperimentLayers.AppBtidLayers;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local v24 = game:DefineFastFlag("EnableAddAccountPeekviewRemoveSuperBriefState", false);
local l_FFlagEnableLuaLoginRevamp_0 = v2.SharedFlags.FFlagEnableLuaLoginRevamp;
local l_FStringLuaLoginRevampIxpLayer_0 = v2.SharedFlags.FStringLuaLoginRevampIxpLayer;
local l_GetFFlagAccountSwitchScrim_0 = v2.SharedFlags.GetFFlagAccountSwitchScrim;
local l_GetFFlagEnableMultiPageSignup_0 = v2.SharedFlags.GetFFlagEnableMultiPageSignup;
local l_GetFFlagLuaAppEnableTopBanner_0 = v2.SharedFlags.GetFFlagLuaAppEnableTopBanner;
local v30 = 240;
local function v56(v31) --[[ Line: 57 ]] --[[ Name: AccountSwitchingAddAccountPeekView ]]
    -- upvalues: l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), l_PeekViewState_0 (copy), l_useSelector_0 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useLocalization_0 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_RoactAppExperiment_0 (copy), l_FStringLuaLoginRevampIxpLayer_0 (copy), l_TextService_0 (copy), v30 (ref), l_useEffect_0 (copy), v11 (copy), v12 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_React_0 (copy), l_GetFFlagAccountSwitchScrim_0 (copy), l_PeekView_0 (copy), v24 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v32 = l_useStyle_0();
    local v33 = l_useNavigation_0();
    local v34 = l_useDispatch_0();
    local l_Color_0 = v32.Theme.BackgroundDefault.Color;
    local v36, v37 = l_useState_0(l_PeekViewState_0.Full);
    local l_BaseSize_0 = v32.Font.BaseSize;
    local v39 = v32.Font.Header1.RelativeSize * l_BaseSize_0;
    local v41 = l_useSelector_0(function(v40) --[[ Line: 66 ]]
        return v40.ScreenSize;
    end);
    local v43 = if l_GetFFlagLuaAppEnableTopBanner_0() then l_useSelector_0(function(v42) --[[ Line: 71 ]]
        return v42.GlobalGuiInset.top;
    end) else 0;
    local v44 = v41.X - 48;
    local function v45() --[[ Line: 78 ]]
        -- upvalues: v34 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v34(l_NavigateDown_0({
            name = l_AppPage_0.MultiPageSignup, 
            extraProps = {
                enforceResetState = true
            }
        }));
    end;
    local v46 = l_useLocalization_0({
        titleText = "Authentication.AccountSwitch.Action.AddAccount", 
        loginText = "Authentication.Login.Heading.LoginRobloxAccountSwitching", 
        createText = "Authentication.AccountSwitch.Action.CreateNewAccount"
    });
    local v47 = {
        showLoginRevamp = false
    };
    if l_FFlagEnableLuaLoginRevamp_0 then
        v47 = l_RoactAppExperiment_0.useBrowserTrackerExperiment({
            l_FStringLuaLoginRevampIxpLayer_0
        }, function(v48) --[[ Line: 93 ]]
            -- upvalues: l_FStringLuaLoginRevampIxpLayer_0 (ref)
            return {
                showLoginRevamp = (v48[l_FStringLuaLoginRevampIxpLayer_0] or {}).showLoginRevamp
            };
        end);
    end;
    if l_GetFFlagLuaAppEnableTopBanner_0() then
        v30 = 193 + l_TextService_0:GetTextSize(v46.titleText, v39, v32.Font.Header1.Font, Vector2.new(0, 0)).Y;
    end;
    local function v50(v49) --[[ Line: 115 ]] --[[ Name: peekHeaderPositionYChange ]]
        -- upvalues: v37 (copy), l_PeekViewState_0 (ref)
        if v49 < 10 then
            v37(l_PeekViewState_0.Closed);
        end;
    end;
    local function v53(v51, _) --[[ Line: 122 ]] --[[ Name: viewStateChanged ]]
        -- upvalues: v37 (copy), l_PeekViewState_0 (ref), v33 (copy)
        v37(v51);
        if v51 == l_PeekViewState_0.Closed or v51 == l_PeekViewState_0.Hidden then
            v33.goBack();
        end;
    end;
    l_useEffect_0(function() --[[ Line: 129 ]]
        -- upvalues: v11 (ref), v12 (ref), v31 (copy)
        v11.sendModalShownEvent(v12.ctx.accountSwitcherAddAccount, v31.origin);
    end, {});
    local function v54() --[[ Line: 133 ]] --[[ Name: navigateToLogin ]]
        -- upvalues: v11 (ref), v12 (ref), v31 (copy), l_FFlagEnableLuaLoginRevamp_0 (ref), v47 (ref)
        v11.sendButtonClickEvent(v12.ctx.accountSwitcherAddAccount, v31.origin, v12.btn.login);
        if l_FFlagEnableLuaLoginRevamp_0 and v47.showLoginRevamp then
            v31.navigateToLoginV2();
            return;
        else
            v31.navigateToLogin();
            return;
        end;
    end;
    local function v55() --[[ Line: 147 ]] --[[ Name: navigateToSignUp ]]
        -- upvalues: v11 (ref), v12 (ref), v31 (copy), l_GetFFlagEnableMultiPageSignup_0 (ref), v45 (copy)
        v11.sendButtonClickEvent(v12.ctx.accountSwitcherAddAccount, v31.origin, v12.btn.signup);
        if l_GetFFlagEnableMultiPageSignup_0() and v31.shouldEnableMultiPageSignup then
            v45();
            return;
        else
            v31.navigateToSignUp();
            return;
        end;
    end;
    return l_React_0.createElement("Frame", {
        Size = if l_GetFFlagLuaAppEnableTopBanner_0() then UDim2.new(1, 0, 0, v41.Y - v43) else UDim2.new(1, 0, 0, v41.Y), 
        BackgroundColor3 = v32.Theme.Overlay.Color, 
        BackgroundTransparency = l_GetFFlagAccountSwitchScrim_0() and 1 or 0.5
    }, {
        l_React_0.createElement(l_PeekView_0, {
            hasScrim = l_GetFFlagAccountSwitchScrim_0() and true or nil, 
            screenSize = v41, 
            briefViewContentHeight = UDim.new(0, v30), 
            superBriefViewContentHeight = if v24 then nil else UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v32, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v50, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v53, 
            peekViewState = v36
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
                        Text = v46.titleText, 
                        TextSize = v39, 
                        TextColor3 = v32.Theme.TextEmphasis.Color, 
                        TextTransparency = v32.Theme.TextDefault.Transparency, 
                        Font = v32.Font.Header2.Font, 
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
                    BackgroundColor3 = v32.Theme.Divider.Color, 
                    BackgroundTransparency = v32.Theme.Divider.Transparency
                }), 
                ButtonContentFrame = l_React_0.createElement("Frame", {
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
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24)
                    }), 
                    LoginButton = l_React_0.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -40, 0, 48), 
                        BackgroundTransparency = 1
                    }, {
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 60)
                        }), 
                        Button = l_React_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = UDim2.new(1, 0, 0, 48), 
                            text = v46.loginText, 
                            onActivated = v54
                        })
                    }), 
                    SignupButton = l_React_0.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -40, 0, 48), 
                        BackgroundTransparency = 1
                    }, {
                        Button = l_React_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            size = UDim2.new(1, 0, 0, 48), 
                            text = v46.createText, 
                            onActivated = v55
                        })
                    })
                })
            })
        })
    });
end;
if l_GetFFlagEnableMultiPageSignup_0() then
    v56 = l_RoactAppExperiment_0.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.SignupLayer
    }, function(v57, _) --[[ Line: 295 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            shouldEnableMultiPageSignup = (v57[l_AppBtidLayers_0.SignupLayer] or {}).shouldEnableMultiPageSignup
        };
    end)(v56);
end;
return (l_RoactRodux_0.connect(nil, function(v59) --[[ Line: 305 ]]
    -- upvalues: l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return {
        navigateToLogin = function() --[[ Line: 307 ]] --[[ Name: navigateToLogin ]]
            -- upvalues: v59 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v59(l_NavigateDown_0({
                name = l_AppPage_0.Login
            }));
        end, 
        navigateToLoginV2 = function() --[[ Line: 311 ]] --[[ Name: navigateToLoginV2 ]]
            -- upvalues: v59 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v59(l_NavigateDown_0({
                name = l_AppPage_0.LoginV2
            }));
        end, 
        navigateToSignUp = function() --[[ Line: 315 ]] --[[ Name: navigateToSignUp ]]
            -- upvalues: v59 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v59(l_NavigateDown_0({
                name = l_AppPage_0.SinglePageSignUp
            }));
        end
    };
end)(v56));