local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Config);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v8 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v9 = require(script.Parent.Parent.ChannelTab);
local v10 = l_Images_0["icons/navigation/cycleDown"];
local v11 = Color3.fromRGB(255, 255, 255);
local v12 = Color3.fromRGB(100, 100, 100);
local _ = function(v13) --[[ Line: 54 ]] --[[ Name: countAllChannelTabs ]]
    local v14 = 0;
    for _ in pairs(v13) do
        v14 = v14 + 1;
    end;
    return v14;
end;
local function v20(v17, v18) --[[ Line: 62 ]] --[[ Name: setTransparency ]]
    return v18:map(function(v19) --[[ Line: 63 ]]
        -- upvalues: v17 (copy)
        if v17 == nil then
            return 1;
        else
            return v17 + v19 * (1 - v17);
        end;
    end);
end;
return function(v21) --[[ Line: 68 ]] --[[ Name: ChannelBar ]]
    -- upvalues: v3 (copy), v4 (copy), v9 (copy), v20 (copy), l_TextChatService_0 (copy), v8 (copy), v12 (copy), l_ImageSetLabel_0 (copy), v10 (copy), v11 (copy)
    local l_allChannelTabs_0 = v21.allChannelTabs;
    local v23 = 0;
    for _ in pairs(l_allChannelTabs_0) do
        v23 = v23 + 1;
    end;
    local l_v23_0 = v23;
    l_allChannelTabs_0 = v3.ChatWindowSize.Y.Scale * v21.chatWindowSettings.HeightScale * v3.ChatWindowMaxWidth;
    local v26;
    v23, v26 = v4.useState(false);
    local v27, v28 = v4.useState(false);
    local v29, v30 = v4.useState(1024);
    local v31 = v29 < l_v23_0 * v3.ChannelTabsSettings.MinTabWidth;
    local v32 = not v31 and l_v23_0 or math.floor((v29 - v3.ChannelTabsSettings.DropdownIconContainerWidth) / v3.ChannelTabsSettings.MinTabWidth);
    local v33 = (v29 - (v31 and v3.ChannelTabsSettings.DropdownIconContainerWidth or 0)) / v32;
    local v34 = (l_v23_0 - v32) * 40;
    local v37 = v4.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v21 (copy), v32 (copy)
        for _, v36 in pairs(v21.allChannelTabs) do
            if v36.TabIndex > v32 and v36.HasUnreadMessages then
                return true;
            end;
        end;
        return false;
    end);
    local v38 = {
        ["$layout"] = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        })
    };
    local v39 = {
        ["$layout"] = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    for v40, v41 in pairs(v21.allChannelTabs) do
        local v42 = v41.TabIndex <= v32;
        local v43 = v21.allTextChannels[v40];
        local v45 = v4.createElement(v9, {
            channelTabsSettings = v21.channelTabsSettings, 
            channelName = v40, 
            textChannel = v43, 
            hasUnreadMessages = v41.HasUnreadMessages, 
            isDividerVisible = (not (v41.TabIndex >= v32) or v31) and v41.TabIndex < l_v23_0, 
            isTabCollapsed = not v42, 
            isTabSelected = v21.selectedTabName and v21.selectedTabName == v40, 
            onTabSelected = function() --[[ Line: 126 ]] --[[ Name: onTabSelected ]]
                -- upvalues: v21 (copy), v43 (copy), v42 (copy), v28 (copy)
                v21.onTabSelected(v43, not v42);
                v28(false);
            end, 
            setTransparency = function(v44) --[[ Line: 130 ]] --[[ Name: setTransparency ]]
                -- upvalues: v20 (ref), v21 (copy)
                return v20(v44, v21.transparencyValue);
            end
        });
        if v42 then
            v38[v41.TabIndex] = v4.createElement("Frame", {
                Size = UDim2.new(0, v33, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = v41.TabIndex
            }, {
                ChannelTab = v45
            });
        else
            local v46 = v41.TabIndex - v32;
            v39[v46] = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = v46
            }, {
                ChannelTab = v45
            });
            if v41.HasUnreadMessages then
                v37 = true;
            end;
        end;
    end;
    local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
    local l_channelTabsSettings_0 = v21.channelTabsSettings;
    local l_BackgroundTransparency_0 = v8(l_channelTabsSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v8(l_channelTabsSettings_0).BackgroundColor3;
    local l_createElement_0 = v4.createElement;
    local v52 = "Frame";
    local v55 = {
        Size = UDim2.new(1, 0, 0, v3.ChannelTabsSettings.HorizontalBarHeight), 
        BackgroundTransparency = 1, 
        Visible = v21.visible, 
        BorderSizePixel = 0, 
        [v4.Event.MouseEnter] = v21.onHovered, 
        [v4.Event.MouseLeave] = v21.onUnhovered, 
        [v4.Change.AbsoluteSize] = function(v53) --[[ Line: 171 ]]
            -- upvalues: v30 (copy), l_ChannelTabsConfiguration_0 (copy)
            v30(v53.AbsoluteSize.X);
            if l_ChannelTabsConfiguration_0 then
                l_ChannelTabsConfiguration_0:SetAbsoluteSize(v53.AbsoluteSize);
            end;
        end, 
        [v4.Change.AbsolutePosition] = function(v54) --[[ Line: 177 ]]
            -- upvalues: l_ChannelTabsConfiguration_0 (copy)
            if l_ChannelTabsConfiguration_0 then
                l_ChannelTabsConfiguration_0:SetAbsolutePosition(v54.AbsolutePosition);
            end;
        end
    };
    local v56 = {};
    local l_createElement_1 = v4.createElement;
    local v58 = "Frame";
    local v59 = {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v61 = {
        ContentContainer = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v38), 
        TopCorner = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            ImageColor3 = l_BackgroundColor3_0, 
            ImageTransparency = v21.transparencyValue:map(function(v60) --[[ Line: 63 ]]
                -- upvalues: l_BackgroundTransparency_0 (copy)
                if l_BackgroundTransparency_0 == nil then
                    return 1;
                else
                    return l_BackgroundTransparency_0 + v60 * (1 - l_BackgroundTransparency_0);
                end;
            end), 
            Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 8), 
            SliceCenter = Rect.new(8, 8, 24, 32), 
            BorderSizePixel = 0
        })
    };
    local l_createElement_2 = v4.createElement;
    local v63 = "Frame";
    local v64 = {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 1, -1), 
        BackgroundColor3 = v3.ChannelTabsSettings.BorderColor3
    };
    local l_BorderTransparency_0 = v3.ChannelTabsSettings.BorderTransparency;
    local l_l_BorderTransparency_0_0 = l_BorderTransparency_0 --[[ copy: 33 -> 42 ]];
    v64.BackgroundTransparency = v21.transparencyValue:map(function(v67) --[[ Line: 63 ]]
        -- upvalues: l_l_BorderTransparency_0_0 (copy)
        if l_l_BorderTransparency_0_0 == nil then
            return 1;
        else
            return l_l_BorderTransparency_0_0 + v67 * (1 - l_l_BorderTransparency_0_0);
        end;
    end);
    v64.BorderSizePixel = 0;
    v61.BottomBorder = l_createElement_2(v63, v64);
    v61.Background = v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.ChannelTabsSettings.HorizontalBarHeight - 8 - 1), 
        Position = UDim2.new(0, 0, 0, 8), 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v21.transparencyValue:map(function(v68) --[[ Line: 63 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            if l_BackgroundTransparency_0 == nil then
                return 1;
            else
                return l_BackgroundTransparency_0 + v68 * (1 - l_BackgroundTransparency_0);
            end;
        end), 
        BorderSizePixel = 0
    });
    v56.HorizontalBar = l_createElement_1(v58, v59, v61);
    l_createElement_1 = v31;
    if l_createElement_1 then
        l_createElement_1 = v4.createElement;
        v58 = "Frame";
        v59 = {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 8), 
            Size = UDim2.new(0, v3.ChannelTabsSettings.DropdownIconContainerWidth, 1, -9), 
            BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        };
        v61 = {};
        l_createElement_2 = v4.createElement;
        v63 = "TextButton";
        v64 = {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v3.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4), 
            Size = UDim2.new(0, 27, 0, 27)
        };
        l_BorderTransparency_0 = v23 and 0.3 or 1;
        local l_l_BorderTransparency_0_1 = l_BorderTransparency_0 --[[ copy: 33 -> 45 ]];
        v64.BackgroundTransparency = v21.transparencyValue:map(function(v70) --[[ Line: 63 ]]
            -- upvalues: l_l_BorderTransparency_0_1 (copy)
            if l_l_BorderTransparency_0_1 == nil then
                return 1;
            else
                return l_l_BorderTransparency_0_1 + v70 * (1 - l_l_BorderTransparency_0_1);
            end;
        end);
        v64.BackgroundColor3 = v12;
        v64.Text = "";
        v64.BorderSizePixel = 0;
        v64[v4.Event.MouseEnter] = function() --[[ Line: 247 ]]
            -- upvalues: v26 (copy)
            v26(true);
        end;
        v64[v4.Event.MouseLeave] = function() --[[ Line: 250 ]]
            -- upvalues: v26 (copy)
            v26(false);
        end;
        v64[v4.Event.Activated] = function() --[[ Line: 253 ]]
            -- upvalues: v28 (copy), v27 (copy)
            v28(not v27);
        end;
        local v71 = {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 27)
            })
        };
        l_BorderTransparency_0 = v4.createElement;
        local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
        local v73 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(0.6, 0.6), 
            BackgroundTransparency = 1, 
            Image = v10, 
            ImageColor3 = v11
        };
        local l_transparencyValue_0 = v21.transparencyValue;
        local v75 = 0;
        v73.ImageTransparency = l_transparencyValue_0:map(function(v76) --[[ Line: 63 ]]
            -- upvalues: v75 (copy)
            if v75 == nil then
                return 1;
            else
                return v75 + v76 * (1 - v75);
            end;
        end);
        v73.ScaleType = Enum.ScaleType.Stretch;
        v73.BorderSizePixel = 0;
        v71.DropdownIconImage = l_BorderTransparency_0(l_l_ImageSetLabel_0_0, v73);
        v61.TextButton = l_createElement_2(v63, v64, v71);
        l_createElement_2 = v37;
        if l_createElement_2 then
            l_createElement_2 = v4.createElement;
            v63 = "Frame";
            v64 = {
                Size = UDim2.new(0, 8, 0, 8), 
                Position = UDim2.new(0, 18, 0.5, -4), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundColor3 = v3.ChannelTabsSettings.UnreadDotColor3
            };
            l_BorderTransparency_0 = v21.transparencyValue;
            l_transparencyValue_0 = 0;
            local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 37 -> 46 ]];
            v64.BackgroundTransparency = l_BorderTransparency_0:map(function(v78) --[[ Line: 63 ]]
                -- upvalues: l_l_transparencyValue_0_0 (copy)
                if l_l_transparencyValue_0_0 == nil then
                    return 1;
                else
                    return l_l_transparencyValue_0_0 + v78 * (1 - l_l_transparencyValue_0_0);
                end;
            end);
            v64.BorderSizePixel = 0;
            l_createElement_2 = l_createElement_2(v63, v64, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            });
        end;
        v61.UnreadDot = l_createElement_2;
        l_createElement_1 = l_createElement_1(v58, v59, v61);
    end;
    v56.DropdownButton = l_createElement_1;
    l_createElement_1 = v31;
    if l_createElement_1 then
        l_createElement_1 = v4.createElement;
        v58 = "Frame";
        v59 = {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -1, 0, v3.ChannelTabsSettings.HorizontalBarHeight + 1), 
            Size = UDim2.new(0, 150, 0, v34), 
            BackgroundTransparency = 1, 
            Visible = v27
        };
        v61 = {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(150, l_allChannelTabs_0)
            })
        };
        l_createElement_2 = v4.createElement;
        v63 = "UIStroke";
        v64 = {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v3.ChannelTabsSettings.BorderColor3
        };
        l_BorderTransparency_0 = v3.ChannelTabsSettings.BorderTransparency;
        local l_l_BorderTransparency_0_2 = l_BorderTransparency_0 --[[ copy: 33 -> 43 ]];
        v64.Transparency = v21.transparencyValue:map(function(v80) --[[ Line: 63 ]]
            -- upvalues: l_l_BorderTransparency_0_2 (copy)
            if l_l_BorderTransparency_0_2 == nil then
                return 1;
            else
                return l_l_BorderTransparency_0_2 + v80 * (1 - l_l_BorderTransparency_0_2);
            end;
        end);
        v61.Border = l_createElement_2(v63, v64);
        l_createElement_2 = v4.createElement;
        v63 = "ScrollingFrame";
        v64 = {
            Size = UDim2.fromScale(1, 1), 
            CanvasSize = UDim2.new(0, 150, 0, v34)
        };
        l_BorderTransparency_0 = v21.transparencyValue;
        local v81 = 0;
        local l_v81_0 = v81 --[[ copy: 37 -> 44 ]];
        v64.BackgroundTransparency = l_BorderTransparency_0:map(function(v83) --[[ Line: 63 ]]
            -- upvalues: l_v81_0 (copy)
            if l_v81_0 == nil then
                return 1;
            else
                return l_v81_0 + v83 * (1 - l_v81_0);
            end;
        end);
        v64.ScrollBarThickness = 4;
        l_BorderTransparency_0 = v21.transparencyValue;
        v81 = 0;
        v64.ScrollBarImageTransparency = l_BorderTransparency_0:map(function(v84) --[[ Line: 63 ]]
            -- upvalues: v81 (copy)
            if v81 == nil then
                return 1;
            else
                return v81 + v84 * (1 - v81);
            end;
        end);
        v64.ScrollingDirection = Enum.ScrollingDirection.Y;
        v64.ElasticBehavior = Enum.ElasticBehavior.Always;
        v64.ClipsDescendants = true;
        v64.BorderSizePixel = 0;
        v61.ScrollView = l_createElement_2(v63, v64, v39);
        l_createElement_1 = l_createElement_1(v58, v59, v61);
    end;
    v56.DropdownMenu = l_createElement_1;
    return l_createElement_0(v52, v55, v56);
end;