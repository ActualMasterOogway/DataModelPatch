local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local _ = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local _ = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v15 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v18 = v6.PureComponent:extend("MenuIcon");
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFStringVoiceBetaBadgeLearnMore);
local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadgeLearnMoreLinkFormview);
local l_Parent_0 = script.Parent.Parent.Parent;
local v22 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v23 = require(l_Parent_0.Actions.SetKeepOutArea);
local v24 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v25 = require(l_Parent_0.Constants);
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v28 = require(l_Chrome_0.Enabled);
local v29 = if l_GetFFlagFixChromeReferences_0() then if v28() then require(l_Chrome_0.Service) else nil else if v28 then require(l_Chrome_0.Service) else nil;
v18.validateProps = v8.strictInterface({
    layoutOrder = v8.integer, 
    Analytics = v8.table, 
    setKeepOutArea = v8.optional(v8.callback), 
    removeKeepOutArea = v8.optional(v8.callback)
});
local v30 = {
    FullScreen = 0, 
    FormSheet = 2
};
local v31 = UDim2.fromOffset(31, 11);
local v32 = UDim.new(0, 12);
local v33 = UDim2.fromOffset(330, 185);
local v34 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local function v35() --[[ Line: 64 ]]

end;
openWebview = function(v36) --[[ Line: 69 ]] --[[ Name: openWebview ]]
    -- upvalues: l_HttpService_0 (copy), v20 (copy), v30 (copy), v15 (copy), l_GuiService_0 (copy)
    local v37 = l_HttpService_0:JSONEncode({
        title = game:GetEngineFeature("SetWebViewTitle") and "Help Center" or nil, 
        presentationStyle = if v20() then v30.FormSheet else nil, 
        visible = true, 
        url = v36
    });
    v15:debug("Opening Webview with payload {}", v37);
    l_GuiService_0:BroadcastNotification(v37, 20);
end;
v18.init = function(v38) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v29 (copy), l_VRService_0 (copy), l_GamepadService_0 (copy), l_default_0 (copy), v35 (copy), v19 (copy)
    v38.buttonRef = v6.createRef();
    v38:setState({
        chromeMenuOpen = v29 and v29:status():get() == v29.MenuStatus.Open, 
        vrShowMenuIcon = l_VRService_0.VREnabled and l_GamepadService_0.GamepadCursorEnabled, 
        voiceChatServiceConnected = false, 
        showPopup = false
    });
    if game:GetEngineFeature("VoiceChatSupported") then
        l_default_0:asyncInit():andThen(function() --[[ Line: 94 ]]
            -- upvalues: v38 (copy)
            v38:setState({
                voiceChatServiceConnected = true
            });
        end):catch(v35);
    end;
    v38.menuIconActivated = function() --[[ Line: 102 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showPopup = not v38.state.showPopup
        });
        v38.props.Analytics.EventStream:setRBXEvent("voiceChat", not v38.state.showPopup and "openBetaBadge" or "closeBetaBadge");
    end;
    v38.learnMore = function() --[[ Line: 112 ]]
        -- upvalues: v19 (ref), v38 (copy)
        local v39 = v19();
        openWebview(v39);
        v38.props.Analytics.EventStream:setRBXEvent("voiceChat", "clickBetaBadgeLearnMore");
    end;
end;
v18.didMount = function(v40) --[[ Line: 120 ]] --[[ Name: didMount ]]
    -- upvalues: v29 (copy)
    if v29 then
        v40.chromeMenuStatusConn = v29:status():connect(function() --[[ Line: 122 ]]
            -- upvalues: v40 (copy), v29 (ref)
            v40:setState({
                chromeMenuOpen = v29:status():get() == v29.MenuStatus.Open
            });
        end);
    end;
end;
v18.onUnmount = function(v41) --[[ Line: 130 ]] --[[ Name: onUnmount ]]
    if v41.chromeMenuStatusConn then
        v41.chromeMenuStatusConn:Disconnect();
        v41.chromeMenuStatusConn = nil;
    end;
end;
v18.render = function(v42) --[[ Line: 137 ]] --[[ Name: render ]]
    -- upvalues: l_VRService_0 (copy), v25 (copy), v22 (copy), l_withStyle_0 (copy), v6 (copy), v33 (copy), v34 (copy), v32 (copy), v31 (copy), l_AppFonts_0 (copy), l_GamepadService_0 (copy), l_ExternalEventConnection_0 (copy)
    local v43 = (not l_VRService_0.VREnabled or v42.state.vrShowMenuIcon) and v42.state.voiceChatServiceConnected;
    local function v47(v44) --[[ Line: 140 ]]
        -- upvalues: v43 (copy), v42 (copy), v25 (ref)
        if v43 and v44 then
            local v45 = Vector2.new(v44.AbsolutePosition.X - 2, v44.AbsolutePosition.Y - 2);
            local v46 = Vector2.new(v44.AbsoluteSize.X + 4, v44.AbsoluteSize.Y + 4);
            v42.props.setKeepOutArea(v25.VoiceBetaBadgeKeepOutAreaId, v45, v46);
            return;
        else
            v42.props.removeKeepOutArea(v25.VoiceBetaBadgeKeepOutAreaId);
            return;
        end;
    end;
    if v22 and v42.buttonRef.current then
        v47(v42.buttonRef.current);
    end;
    return l_withStyle_0(function(v48) --[[ Line: 159 ]]
        -- upvalues: v6 (ref), v43 (copy), v42 (copy), v33 (ref), v34 (ref), v32 (ref), v22 (ref), v47 (copy), v31 (ref), l_AppFonts_0 (ref), l_GamepadService_0 (ref), l_ExternalEventConnection_0 (ref), l_VRService_0 (ref)
        local l_Footer_0 = v48.Font.Footer;
        local l_Font_0 = l_Footer_0.Font;
        local v51 = v48.Font.BaseSize * l_Footer_0.RelativeSize;
        local l_BackgroundUIContrast_0 = v48.Theme.BackgroundUIContrast;
        local l_TextEmphasis_0 = v48.Theme.TextEmphasis;
        local l_TextLink_0 = v48.Theme.TextLink;
        local v55 = Color3.fromRGB(238, 206, 83);
        return v6.createFragment({
            PopupWrapper = v6.createElement("Frame", {
                Visible = v43 and v42.state.showPopup, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v42.props.layoutOrder + 1
            }, {
                Popup = v6.createElement("Frame", {
                    Size = v33, 
                    Position = UDim2.fromOffset(0, 10), 
                    BackgroundTransparency = l_BackgroundUIContrast_0.Transparency, 
                    BackgroundColor3 = l_BackgroundUIContrast_0.Color
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Popup = v6.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 0
                    }, {
                        Layout = v6.createElement("UIListLayout", {
                            Padding = UDim.new(0, 0), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Starter = v6.createElement("TextLabel", {
                            Text = v34:FormatByKey("InGame.CommonUI.Badge.Popup.HeaderList"), 
                            TextSize = v51, 
                            Font = l_Font_0, 
                            LayoutOrder = 0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        }), 
                        FirstBullet = v6.createElement("TextLabel", {
                            Text = "\226\128\162 " .. v34:FormatByKey("InGame.CommonUI.Badge.Popup.VoiceChatBullet"), 
                            TextSize = v51, 
                            Font = l_Font_0, 
                            LayoutOrder = 2, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    Text = v6.createElement("TextLabel", {
                        Text = v34:FormatByKey("InGame.CommonUI.Badge.Popup.DisclaimerText2"), 
                        TextSize = v51, 
                        Font = l_Font_0, 
                        LayoutOrder = 0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_TextEmphasis_0.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    LearnMoreLink = v6.createElement("TextButton", {
                        Text = v34:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"), 
                        TextSize = v51, 
                        Font = l_Font_0, 
                        LayoutOrder = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_TextLink_0.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = v42.learnMore
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIPadding = v6.createElement("UIPadding", {
                        PaddingLeft = v32, 
                        PaddingRight = v32, 
                        PaddingBottom = v32, 
                        PaddingTop = v32
                    })
                })
            }), 
            Button = v6.createElement("Frame", {
                Visible = v43, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v42.props.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                [v6.Change.AbsoluteSize] = if v22 then v47 else nil, 
                [v6.Change.AbsolutePosition] = if v22 then v47 else nil, 
                [v6.Ref] = v42.buttonRef
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ActualButton = v6.createElement("Frame", {
                    Visible = v43, 
                    BackgroundTransparency = 0, 
                    Size = v31, 
                    BackgroundColor3 = v55
                }, {
                    Button = v6.createElement("TextButton", {
                        Text = v34:FormatByKey("InGame.CommonUI.Badge.BadgeText"), 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextSize = 8, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = v31, 
                        TextColor3 = l_BackgroundUIContrast_0.Color, 
                        [v6.Event.Activated] = v42.menuIconActivated
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }), 
                    UIStroke = v6.createElement("UIStroke", {
                        Thickness = 2, 
                        Color = l_TextEmphasis_0.Color
                    }), 
                    VREnabledListener = l_GamepadService_0 and v6.createElement(l_ExternalEventConnection_0, {
                        event = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
                        callback = function() --[[ Line: 293 ]]
                            -- upvalues: v42 (ref), l_VRService_0 (ref), l_GamepadService_0 (ref)
                            v42:setState({
                                vrShowMenuIcon = l_VRService_0.VREnabled and l_GamepadService_0.GamepadCursorEnabled
                            });
                        end or nil
                    })
                })
            })
        });
    end);
end;
if v22 then
    return v7.UNSTABLE_connect2(nil, function(v56) --[[ Line: 306 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v23 (copy), v24 (copy)
        return {
            setKeepOutArea = function(v57, v58, v59) --[[ Line: 308 ]] --[[ Name: setKeepOutArea ]]
                -- upvalues: v56 (copy), v23 (ref)
                return v56(v23(v57, v58, v59));
            end, 
            removeKeepOutArea = function(v60) --[[ Line: 311 ]] --[[ Name: removeKeepOutArea ]]
                -- upvalues: v56 (copy), v24 (ref)
                return v56(v24(v60));
            end
        };
    end)(v18);
else
    return v18;
end;