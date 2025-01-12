local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_Badge_0 = v7.App.Indicator.Badge;
local l_BadgeStates_0 = v7.App.Indicator.Enum.BadgeStates;
local l_Images_0 = v7.App.ImageSet.Images;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v14 = require(l_RobloxGui_0.Modules.ChatSelector);
local v15 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v16 = require(script.Parent.IconButton);
local l_Parent_0 = script.Parent.Parent.Parent;
local v18 = require(l_Parent_0.Analytics);
local v19 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v20 = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v21 = require(l_Parent_0.Actions.SetKeepOutArea);
local v22 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v23 = require(l_Parent_0.Constants);
local v24 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local l_InExperienceAppChatExperimentation_0 = v24.App.InExperienceAppChatExperimentation;
local v27 = require(script.Parent.ChatIconFtuxTooltip);
local v28 = game:DefineFastFlag("ExpChatGetLabelAndIconFromUtilUnibarHoldout", false);
local l_getExperienceChatVisualConfig_0 = require(l_CorePackages_0.Workspace.Packages.ExpChat).getExperienceChatVisualConfig;
local v30 = game:DefineFastInt("InExperienceChatTooltipShowDelayMs", 1000);
local v31 = game:DefineFastInt("InExperienceChatTooltipDismissDelayMs", 7000);
local v32 = game:DefineFastFlag("UnibarHoldoutChatIconUseNewIconSize", false);
local v33 = l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowInExperienceChatNewIcon;
local v34 = v33 and l_InExperienceAppChatExperimentation_0.default.variant.ShowInExperienceChatTooltip;
local l_GameSettings_0 = UserSettings().GameSettings;
local function _() --[[ Line: 50 ]] --[[ Name: shouldShowEmptyBadge ]]
    return game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService;
end;
local v37 = v4.PureComponent:extend("ChatIcon");
v37.validateProps = v6.strictInterface({
    layoutOrder = v6.integer, 
    chatVisible = v6.boolean, 
    unreadMessages = v6.integer, 
    topBarEnabled = v6.boolean, 
    chatEnabled = v6.boolean, 
    setKeepOutArea = v6.callback, 
    removeKeepOutArea = v6.callback
});
v37.init = function(v38) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v34 (copy), l_Signal_0 (copy), v14 (copy), l_GameSettings_0 (copy), v20 (copy), v18 (copy), l_AppStorageService_0 (copy)
    v38.buttonRef = v4.createRef();
    v38.iconClickedSignal = if v34 then l_Signal_0.new() else nil;
    v38.chatIconActivated = function() --[[ Line: 83 ]]
        -- upvalues: v14 (ref), l_GameSettings_0 (ref), v20 (ref), v18 (ref), v34 (ref), v38 (copy), l_AppStorageService_0 (ref)
        v14:ToggleVisibility();
        l_GameSettings_0.ChatVisible = v14:GetVisibility();
        if v20 then
            v18.default:onChatButtonActivated(l_GameSettings_0.ChatVisible);
        end;
        if v34 then
            v38.iconClickedSignal:fire(l_GameSettings_0.ChatVisible);
            pcall(function() --[[ Line: 91 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                l_AppStorageService_0:SetItem("HasSeenExpChatFtuxTooltip", "true");
            end);
        end;
    end;
end;
v37.render = function(v39) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v15 (copy), l_VRService_0 (copy), v28 (copy), l_getExperienceChatVisualConfig_0 (copy), l_Images_0 (copy), v33 (copy), v23 (copy), v19 (copy), v4 (copy), v16 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v32 (copy), v34 (copy), v27 (copy), v30 (copy), v31 (copy), l_Badge_0 (copy), l_BadgeStates_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 99 ]]
        -- upvalues: v39 (copy), v15 (ref), l_VRService_0 (ref), v28 (ref), l_getExperienceChatVisualConfig_0 (ref), l_Images_0 (ref), v33 (ref), v23 (ref), v19 (ref), v4 (ref), v16 (ref), l_GetFFlagEnableAppChatInExperience_0 (ref), v32 (ref), v34 (ref), v27 (ref), v30 (ref), v31 (ref), l_Badge_0 (ref), l_BadgeStates_0 (ref)
        local v41 = v39.props.topBarEnabled and v39.props.chatEnabled and not v15:IsEnabled() and not l_VRService_0.VREnabled;
        local v42 = nil;
        local v43 = nil;
        if v28 then
            local v44 = l_getExperienceChatVisualConfig_0();
            v42 = v44.iconSize;
            v43 = l_Images_0[v44.icon.on];
            if not v39.props.chatVisible then
                v43 = l_Images_0[v44.icon.off];
            end;
        else
            v42 = 20;
            v43 = "rbxasset://textures/ui/TopBar/chatOn.png";
            if not v39.props.chatVisible then
                v43 = "rbxasset://textures/ui/TopBar/chatOff.png";
            end;
            if v33 then
                v42 = 30;
                v43 = l_Images_0["icons/menu/publicChatOn"];
                if not v39.props.chatVisible then
                    v43 = l_Images_0["icons/menu/publicChatOff"];
                end;
            end;
        end;
        local function v46(v45) --[[ Line: 131 ]]
            -- upvalues: v41 (copy), v39 (ref), v23 (ref)
            if v41 and v45 then
                v39.props.setKeepOutArea(v23.ChatIconKeepOutAreaId, v45.AbsolutePosition, v45.AbsoluteSize);
                return;
            else
                v39.props.removeKeepOutArea(v23.ChatIconKeepOutAreaId);
                return;
            end;
        end;
        local function v49(v47) --[[ Line: 139 ]]
            -- upvalues: v39 (ref), v41 (copy), v23 (ref)
            if v47 then
                v39.buttonRef.current = v47;
                local l_current_0 = v39.buttonRef.current;
                if v41 and l_current_0 then
                    v39.props.setKeepOutArea(v23.ChatIconKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
                    return;
                else
                    v39.props.removeKeepOutArea(v23.ChatIconKeepOutAreaId);
                end;
            end;
        end;
        if v19 and v39.buttonRef.current then
            local l_current_1 = v39.buttonRef.current;
            if v41 and l_current_1 then
                v39.props.setKeepOutArea(v23.ChatIconKeepOutAreaId, l_current_1.AbsolutePosition, l_current_1.AbsoluteSize);
            else
                v39.props.removeKeepOutArea(v23.ChatIconKeepOutAreaId);
            end;
        end;
        local v51 = v4.createElement(v16, {
            icon = v43, 
            iconSize = if not not l_GetFFlagEnableAppChatInExperience_0() or v32 then v42 else 20, 
            onActivated = v39.chatIconActivated, 
            [v4.Change.AbsoluteSize] = if v19 then v46 else nil, 
            [v4.Change.AbsolutePosition] = if v19 then v46 else nil, 
            [v4.Ref] = v49
        });
        local l_createElement_0 = v4.createElement;
        local v53 = "TextButton";
        local v54 = {
            Text = "", 
            Visible = v41, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 44, 1, 0), 
            LayoutOrder = v39.props.layoutOrder, 
            Selectable = false
        };
        local v55 = {
            IconAndTooltipContainer = if v34 then v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.fromScale(0, 0), 
                Position = UDim2.fromScale(0, 1)
            }, {
                Background = v51, 
                Tooltip = v4.createElement(v27, {
                    iconClickedSignal = v39.iconClickedSignal, 
                    headerKey = "CoreScripts.FTUX.Heading.NewIconUpdate", 
                    bodyKey = "CoreScripts.FTUX.Label.ChatWithOthersInExperienceChat", 
                    localStorageKey = "HasSeenExpChatFtuxTooltip", 
                    showDelay = v30, 
                    dismissDelay = v31
                })
            }) else nil, 
            Background = if v34 then nil else v51
        };
        local l_createElement_1 = v4.createElement;
        local v57 = "Frame";
        local v58 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        };
        local v59 = {};
        local v60 = false;
        if v39.props.unreadMessages > 0 then
            v60 = v4.createElement(l_Badge_0, {
                position = UDim2.fromOffset(18, game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and 6 or 2), 
                anchorPoint = Vector2.new(0, 0), 
                hasShadow = false, 
                value = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and l_BadgeStates_0.isEmpty or v39.props.unreadMessages
            });
        end;
        v59.Badge = v60;
        v55.BadgeContainer = l_createElement_1(v57, v58, v59);
        return l_createElement_0(v53, v54, v55);
    end);
end;
return v5.UNSTABLE_connect2(function(v61) --[[ Line: 212 ]] --[[ Name: mapStateToProps ]]
    return {
        chatVisible = v61.chat.visible, 
        unreadMessages = v61.chat.unreadMessages, 
        topBarEnabled = v61.displayOptions.topbarEnabled, 
        chatEnabled = v61.coreGuiEnabled[Enum.CoreGuiType.Chat]
    };
end, function(v62) --[[ Line: 222 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v22 (copy)
    return {
        setKeepOutArea = function(v63, v64, v65) --[[ Line: 224 ]] --[[ Name: setKeepOutArea ]]
            -- upvalues: v62 (copy), v21 (ref)
            return v62(v21(v63, v64, v65));
        end, 
        removeKeepOutArea = function(v66) --[[ Line: 227 ]] --[[ Name: removeKeepOutArea ]]
            -- upvalues: v62 (copy), v22 (ref)
            return v62(v22(v66));
        end
    };
end)(v37);