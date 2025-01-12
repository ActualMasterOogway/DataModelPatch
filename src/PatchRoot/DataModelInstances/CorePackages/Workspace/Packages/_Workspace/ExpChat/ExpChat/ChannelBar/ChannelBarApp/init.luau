local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = require(l_script_FirstAncestor_0.Config);
local l_TargetTextChannelPropertyChanged_0 = v5.Actions.TargetTextChannelPropertyChanged;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v9 = require(script.Parent.UI.ChannelBar);
local v10 = v2.Component:extend("ChannelBarApp");
v10.render = function(v11) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy)
    return v3.createElement(v9, {
        channelTabsSettings = v11.props.channelTabsSettings, 
        chatWindowSettings = v11.props.chatWindowSettings, 
        allChannelTabs = v11.props.allChannelTabs, 
        allTextChannels = v11.props.allTextChannels, 
        selectedTabName = v11.props.selectedTabName, 
        onTabSelected = v11.props.onTabSelected, 
        onHovered = v11.props.onHovered, 
        onUnhovered = v11.props.onUnhovered, 
        visible = v11.props.visible, 
        transparencyValue = v11.props.transparencyValue
    });
end;
return v4.connect(function(v12) --[[ Line: 31 ]]
    -- upvalues: v8 (copy), v6 (copy)
    return {
        channelTabsSettings = v8() and v12.ChatLayout.ChannelTabsSettings or {
            BackgroundTransparency = v6.ChannelTabsSettings.BackgroundTransparency, 
            BackgroundColor3 = v6.ChannelTabsSettings.BackgroundColor3, 
            HoverBackgroundColor3 = v6.ChannelTabsSettings.HoverBackgroundColor3, 
            FontFace = v6.ChannelTabsSettings.FontFace, 
            TextSize = v6.ChannelTabsSettings.TextSize, 
            TextColor3 = v6.ChannelTabsSettings.TextColor3, 
            SelectedTabTextColor3 = v6.ChannelTabsSettings.SelectedTabTextColor3, 
            TextStrokeColor3 = v6.ChannelTabsSettings.TextStrokeColor3, 
            TextStrokeTransparency = v6.ChannelTabsSettings.TextStrokeTransparency
        }, 
        allChannelTabs = v8() and v12.ChannelTabs.allChannelTabs or {}, 
        selectedTabName = v8() and v12.ChannelTabs.selectedTabName or "", 
        allTextChannels = v12.TextChannels.allTextChannels
    };
end, function(v13) --[[ Line: 48 ]]
    -- upvalues: v8 (copy), l_TargetTextChannelPropertyChanged_0 (copy)
    return {
        onTabSelected = function(v14, v15) --[[ Line: 50 ]] --[[ Name: onTabSelected ]]
            -- upvalues: v8 (ref), v13 (copy), l_TargetTextChannelPropertyChanged_0 (ref)
            if v8() then
                v13(l_TargetTextChannelPropertyChanged_0(v14, v15));
            end;
        end
    };
end)(v10);