local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v7 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v9 = require(l_ShareGame_0.Components.Header);
local v10 = require(l_ShareGame_0.Components.ConversationList);
local v11 = require(l_ShareGame_0.Components.ErrorToaster);
local v12 = require(l_ShareGame_0.Components.BackButton);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v14 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v15 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v16 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local v17 = UDim.new(0.8, 320);
local v18 = UDim.new(0.7, 500);
local v19 = UDim.new(0.8, 440);
local v20 = Color3.fromRGB(41, 41, 41);
local v21 = v4.PureComponent:extend("ModalShareGamePageFrame");
v21.defaultProps = {
    isVisible = true
};
v21.init = function(v22) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v14 (copy), l_Text_0 (copy), v4 (copy)
    v22.state = {
        promptMessageFitsFrame = true
    };
    v22.onCustomTextAreaSizeChange = function(v23) --[[ Line: 58 ]]
        -- upvalues: v22 (copy), v7 (ref), v14 (ref), l_Text_0 (ref)
        local l_deviceLayout_0 = v22.props.deviceLayout;
        local v25 = v7.LayoutSpecific[l_deviceLayout_0];
        local l_promptMessage_0 = v22.props.promptMessage;
        local v27 = v14.textSize(v25.PAGE_TITLE_TEXT_SIZE);
        v22:setState({
            promptMessageFitsFrame = l_promptMessage_0 and l_Text_0.GetTextWidth(l_promptMessage_0, v14.font(Enum.Font.SourceSans), v27) < v23.AbsoluteSize.X
        });
    end;
    v22.customTextAreaRef = v4.createRef();
    v22.onClosePage = function() --[[ Line: 71 ]]
        -- upvalues: v22 (copy)
        v22.props.closePage();
        if v22.props.onAfterClosePage then
            v22.props.onAfterClosePage();
        end;
    end;
end;
v21.didMount = function(v28) --[[ Line: 79 ]] --[[ Name: didMount ]]
    -- upvalues: v15 (copy), v16 (copy), v7 (copy), l_GameInviteEvents_0 (copy)
    if v15() and v28.customTextAreaRef.current then
        v28.onCustomTextAreaSizeChange(v28.customTextAreaRef.current);
    end;
    if v16() and v28.props.promptMessage and v28.props.analytics then
        v28.props.analytics:sendEvent(v7.Triggers.DeveloperMultiple, l_GameInviteEvents_0.CustomTextShown);
    end;
end;
v21.render = function(v29) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v19 (copy), v17 (copy), v7 (copy), v18 (copy), v14 (copy), v4 (copy), v20 (copy), l_CoreGui_0 (copy), v11 (copy), v9 (copy), v12 (copy), v10 (copy)
    local l_analytics_0 = v29.props.analytics;
    local l_deviceLayout_1 = v29.props.deviceLayout;
    local l_zIndex_0 = v29.props.zIndex;
    local l_searchAreaActive_0 = v29.props.searchAreaActive;
    local l_searchText_0 = v29.props.searchText;
    local l_isVisible_0 = v29.props.isVisible;
    local v36 = v15();
    local v37 = if v36 then v19 else v17;
    local v38 = v36 and v29.props.deviceInfo and v29.props.deviceInfo.DeviceLayout == v7.DeviceLayout.PHONE_LANDSCAPE;
    local v39 = Vector2.new(0.5, 0.5);
    local v40 = UDim2.new(v37.Scale, 0, v18.Scale, 0);
    local v41 = Vector2.new(v37.Offset, v18.Offset);
    local v42 = UDim2.new(0.5, 0, 0.425, 0);
    if v38 then
        v39 = Vector2.new(0.5, 1);
        v40 = UDim2.new(v37.Scale, 0, 1, 0);
        v41 = Vector2.new(v37.Offset, 1e999);
        v42 = UDim2.new(0.5, 0, 1, 4);
    end;
    local v43 = v7.LayoutSpecific[l_deviceLayout_1];
    local l_promptMessage_1 = v29.props.promptMessage;
    local v45 = v14.textSize(v43.PAGE_TITLE_TEXT_SIZE);
    local v46 = v36 and l_promptMessage_1 and v29.state.promptMessageFitsFrame;
    local v47 = if v46 then v45 + 10 else 10;
    local v48 = if v36 then 40 + v47 else 60;
    return v4.createElement("ImageButton", {
        AnchorPoint = v39, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/LuaChat/9-slice/btn-control-sm.png", 
        ImageColor3 = v20, 
        ImageTransparency = 0.1, 
        Modal = l_isVisible_0, 
        Position = v42, 
        Size = v40, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(3, 3), Vector2.new(3, 3))
    }, {
        sizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = v41
        }), 
        uiPadding2 = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 15), 
            PaddingBottom = UDim.new(0, 15)
        }), 
        content = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ZIndex = l_zIndex_0
        }, {
            toasterPortal = v4.createElement(v4.Portal, {
                target = l_CoreGui_0
            }, {
                Toaster = v4.createElement(v11)
            }), 
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = if v36 then v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10)
            }) else nil, 
            Header = v4.createElement(v9, {
                deviceLayout = l_deviceLayout_1, 
                size = UDim2.new(1, 0, 0, v36 and 40 or 60), 
                layoutOrder = 0, 
                zIndex = l_zIndex_0, 
                closePage = v29.onClosePage, 
                searchAreaActive = l_searchAreaActive_0, 
                toggleSearchIcon = true, 
                iconType = v12.IconType.Cross
            }), 
            CustomText = v36 and v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v47), 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextSize = v45, 
                TextColor3 = v7.Color.WHITE, 
                Font = v14.font(Enum.Font.SourceSans), 
                BackgroundTransparency = 1, 
                Text = if v46 then l_promptMessage_1 else "", 
                [v4.Change.AbsoluteSize] = v29.onCustomTextAreaSizeChange, 
                [v4.Ref] = v29.customTextAreaRef
            }), 
            ConversationList = v4.createElement(v10, {
                analytics = l_analytics_0, 
                size = UDim2.new(1, 0, 1, -v48), 
                topPadding = 10, 
                layoutOrder = 1, 
                zIndex = l_zIndex_0, 
                searchText = l_searchText_0, 
                entryHeight = 62, 
                entryPadding = 18, 
                isVisible = l_isVisible_0, 
                trigger = v7.Triggers.DeveloperMultiple, 
                inviteMessageId = v29.props.inviteMessageId, 
                launchData = v29.props.launchData
            })
        })
    });
end;
return (v5.connect(function(v49) --[[ Line: 211 ]]
    return {
        deviceInfo = v49.DeviceInfo
    };
end)(v21));