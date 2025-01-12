local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Config);
local v4 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Interactable_0 = require(l_Parent_0.UIBlox).Core.Control.Interactable;
local v7 = require(l_script_FirstAncestor_0.GameLocalization);
local v8 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v9 = Color3.fromRGB(255, 255, 255);
local v10 = {
    channelName = "", 
    isDividerVisible = false, 
    isTabCollapsed = false, 
    isTabSelected = false, 
    onTabSelected = nil, 
    setTransparency = nil
};
return v7.connect(function(v11) --[[ Line: 125 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy)
    local l_channelName_0 = v11.channelName;
    if string.find(l_channelName_0, "RBXGeneral") then
        l_channelName_0 = "General";
    elseif string.find(l_channelName_0, "RBXSystem") then
        l_channelName_0 = "System";
    elseif string.find(l_channelName_0, "^RBXTeam") then
        l_channelName_0 = "Team";
    elseif string.find(l_channelName_0, "^RBXWhisper") and v11.textChannel and l_Players_0.LocalPlayer then
        local v13 = v8(v11.textChannel, l_Players_0.LocalPlayer);
        if v13 then
            l_channelName_0 = v13;
        end;
    end;
    return {
        channelName = l_channelName_0
    };
end)(function(v14) --[[ Line: 48 ]] --[[ Name: ChannelTab ]]
    -- upvalues: l_Dictionary_0 (copy), v10 (copy), v4 (copy), l_Interactable_0 (copy), v3 (copy), v9 (copy)
    local v15 = l_Dictionary_0.join(v10, v14);
    local v16, v17 = v4.useState(v15.channelTabsSettings.BackgroundColor3);
    return v4.createElement(l_Interactable_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = v15.isTabCollapsed and v15.setTransparency(v15.channelTabsSettings.BackgroundTransparency) or 1, 
        BackgroundColor3 = v15.isTabCollapsed and v16 or v15.channelTabsSettings.BackgroundColor3, 
        BorderSizePixel = 0, 
        onStateChanged = function() --[[ Line: 60 ]] --[[ Name: onStateChanged ]]

        end, 
        [v4.Event.Activated] = v15.onTabSelected, 
        [v4.Event.MouseEnter] = function() --[[ Line: 62 ]]
            -- upvalues: v15 (copy), v17 (copy)
            if v15.isTabCollapsed then
                v17(v15.channelTabsSettings.HoverBackgroundColor3);
            end;
        end, 
        [v4.Event.MouseLeave] = function() --[[ Line: 67 ]]
            -- upvalues: v15 (copy), v17 (copy)
            if v15.isTabCollapsed then
                v17(v15.channelTabsSettings.BackgroundColor3);
            end;
        end
    }, {
        TextLabel = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = v15.channelName, 
            FontFace = v15.channelTabsSettings.FontFace, 
            TextSize = v15.channelTabsSettings.TextSize, 
            TextColor3 = v15.isTabSelected and v15.channelTabsSettings.SelectedTabTextColor3 or v15.channelTabsSettings.TextColor3, 
            TextTransparency = v15.setTransparency(0), 
            TextStrokeColor3 = v15.channelTabsSettings.TextStrokeColor3, 
            TextStrokeTransparency = v15.setTransparency(v15.channelTabsSettings.TextStrokeTransparency), 
            TextXAlignment = v15.isTabCollapsed and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BorderSizePixel = 0
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20 + (v15.isTabCollapsed and 4 or 0)), 
                PaddingRight = UDim.new(0, 20)
            })
        }), 
        UnreadDot = v15.hasUnreadMessages and v4.createElement("Frame", {
            Size = UDim2.new(0, 8, 0, 8), 
            Position = UDim2.new(0, 18, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundColor3 = v3.ChannelTabsSettings.UnreadDotColor3, 
            BackgroundTransparency = v15.setTransparency(0), 
            BorderSizePixel = 0
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Highlight = v15.isTabSelected and v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 4), 
            Position = UDim2.new(0, 0, 1, -4), 
            BackgroundColor3 = v9, 
            BackgroundTransparency = v15.setTransparency(0), 
            BorderSizePixel = 0
        }), 
        Divider = v15.isDividerVisible and v4.createElement("Frame", {
            AnchorPoint = v15.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5), 
            Position = v15.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5), 
            Size = v15.isTabCollapsed and UDim2.new(1, 0, 0, v3.ChannelTabsSettings.DividerSize) or UDim2.new(0, v3.ChannelTabsSettings.DividerSize, 0.8, 0), 
            BackgroundTransparency = v15.setTransparency(v3.ChannelTabsSettings.DividerTransparency), 
            BackgroundColor3 = v3.ChannelTabsSettings.DividerColor3, 
            BorderSizePixel = 0
        })
    });
end);