local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_withStyle_0 = v7.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v16 = require(l_Parent_0.PresentationCommon.PlayerIcon);
local v17 = require(script.Parent.PlayerNameTag);
local v18 = require(script.Parent.StatEntry);
local l_Parent_1 = l_Parent_0.Parent;
local v20 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v21 = require(l_Parent_1.Actions.OpenPlayerDropDown);
local l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateLeaderboardPlayerDropdownViaGUAC;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_SharedFlags_0).GetFFlagLuaAppEnableFoundationColors;
local v24 = v3.PureComponent:extend("PlayerEntry");
v24.validateProps = v6.strictInterface({
    topDiv = v6.optional(v6.boolean), 
    bottomDiv = v6.optional(v6.boolean), 
    player = v12, 
    titlePlayerEntry = v6.boolean, 
    entrySize = v6.integer, 
    layoutOrder = v6.optional(v6.integer), 
    playerStats = v6.map(v6.string, v6.any), 
    playerIconInfo = v6.strictInterface({
        isPlaceOwner = v6.boolean, 
        avatarIcon = v6.optional(v6.table), 
        specialGroupIcon = v6.optional(v6.table)
    }), 
    playerRelationship = v6.strictInterface({
        isBlocked = v6.boolean, 
        friendStatus = v6.enum(Enum.FriendStatus), 
        isFollowing = v6.boolean, 
        isFollower = v6.boolean
    }), 
    gameStats = v6.array(v6.strictInterface({
        name = v6.string, 
        text = v6.string, 
        addId = v6.integer, 
        isPrimary = v6.boolean, 
        priority = v6.number
    })), 
    [v3.Ref] = v6.optional(v6.table), 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    dropDownOpen = v6.boolean, 
    isSmallTouchDevice = v6.boolean, 
    closeDropDown = v6.callback, 
    openDropDown = v6.callback, 
    Position = v6.optional(v6.UDim2)
});
v24.init = function(v25) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (copy), l_InExperienceCapabilities_0 (copy)
    v25.state = {
        isHovered = false, 
        isPressed = false
    };
    v25.onActivated = function() --[[ Line: 89 ]]
        -- upvalues: v25 (copy), l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (ref), l_InExperienceCapabilities_0 (ref)
        if v25.props.dropDownOpen then
            v25.props.closeDropDown();
            return;
        else
            if l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0() then
                if l_InExperienceCapabilities_0.canViewPlayerDropdownInLeaderboard then
                    v25.props.openDropDown(v25.props.player);
                    return;
                end;
            else
                v25.props.openDropDown(v25.props.player);
            end;
            return;
        end;
    end;
    v25.onSelectionGained = function() --[[ Line: 103 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            isHovered = true
        });
    end;
    v25.onSelectionLost = function() --[[ Line: 109 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            isHovered = false
        });
    end;
    v25.onMouseEnter = function() --[[ Line: 115 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            isHovered = true
        });
    end;
    v25.onMouseLeave = function() --[[ Line: 121 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            isHovered = false, 
            isPressed = false
        });
    end;
    v25.onMouseDown = function() --[[ Line: 128 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            isPressed = true
        });
    end;
    v25.onInputEnded = function() --[[ Line: 134 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            isPressed = false
        });
    end;
end;
v24.getBackgroundColor = function(v26, v27) --[[ Line: 141 ]] --[[ Name: getBackgroundColor ]]
    return (v26.state.isHovered or v26.state.isPressed) and v27.RowHoverColor or v27.RowDefaultColor;
end;
v24.getTextStyle = function(v28, v29, v30) --[[ Line: 146 ]] --[[ Name: getTextStyle ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy)
    if v29.IsTenFoot then
        if v28.state.isHovered then
            return v29.HoveredTextStyle, v29.PlayerNameTextSizeMobile;
        else
            return v29.DefaultTextStyle, v29.PlayerNameTextSizeMobile;
        end;
    elseif v28.props.player == l_LocalPlayer_0 then
        return v30.Theme.TextEmphasis;
    elseif l_GetFFlagLuaAppEnableFoundationColors_0() then
        return v30.Theme.TextDefault;
    else
        return v30.Theme.TextMuted;
    end;
end;
v24.getPlayerNameFont = function(v31, _, v33) --[[ Line: 162 ]] --[[ Name: getPlayerNameFont ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_AppFonts_0 (copy)
    if v31.props.player == l_LocalPlayer_0 then
        return {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = v33.Font.CaptionHeader.RelativeSize * v33.Font.BaseSize, 
            MinSize = v33.Font.Footer.RelativeMinSize * v33.Font.BaseSize
        };
    else
        return {
            Font = l_AppFonts_0.default:getDefault(), 
            Size = v33.Font.CaptionBody.RelativeSize * v33.Font.BaseSize, 
            MinSize = v33.Font.Footer.RelativeMinSize * v33.Font.BaseSize
        };
    end;
end;
v24.render = function(v34) --[[ Line: 179 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v3 (copy), v16 (copy), v17 (copy), v18 (copy)
    return l_WithLayoutValues_0(function(v35) --[[ Line: 180 ]]
        -- upvalues: l_withStyle_0 (ref), v34 (copy), v3 (ref), v16 (ref), v17 (ref), v18 (ref)
        return l_withStyle_0(function(v36) --[[ Line: 181 ]]
            -- upvalues: v34 (ref), v35 (copy), v3 (ref), v16 (ref), v17 (ref), v18 (ref)
            local v37 = v34:getTextStyle(v35, v36);
            local v38 = v34:getPlayerNameFont(v35, v36);
            local v39 = {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameFrame = v3.createElement("Frame", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v35.PlayerNameSizeXMobile, 0, v35.PlayerEntrySizeY), 
                    BackgroundTransparency = 1
                }, {
                    PlayerIcon = v3.createElement(v16, {
                        player = v34.props.player, 
                        playerIconInfo = v34.props.playerIconInfo, 
                        playerRelationship = v34.props.playerRelationship
                    }), 
                    PlayerName = v3.createElement(v17, {
                        player = v34.props.player, 
                        isTitleEntry = v34.props.titlePlayerEntry, 
                        isHovered = v34.state.isHovered, 
                        textStyle = v37, 
                        textFont = v38
                    })
                })
            };
            for v40, v41 in ipairs(v34.props.gameStats) do
                if v35.MaxLeaderstats >= v40 then
                    v39["GameStat_" .. v41.name] = v3.createElement(v18, {
                        statValue = v34.props.playerStats[v41.name], 
                        isTitleEntry = v34.props.titlePlayerEntry, 
                        isTeamEntry = false, 
                        layoutOrder = v40, 
                        textStyle = v37
                    });
                else
                    break;
                end;
            end;
            local v42 = v34.props.topDiv or false;
            local v43 = v34.props.bottomDiv or false;
            return v3.createElement("ImageButton", {
                Position = v34.props.Position, 
                Size = UDim2.new(1, v35.EntryXOffset, 0, v35.PlayerEntrySizeY), 
                AutoButtonColor = false, 
                BackgroundColor3 = v34:getBackgroundColor(v35), 
                BackgroundTransparency = 0.8, 
                BorderSizePixel = 0, 
                Image = "", 
                LayoutOrder = v34.props.layoutOrder, 
                [v3.Event.Activated] = v34.onActivated, 
                [v3.Event.SelectionGained] = v34.onSelectionGained, 
                [v3.Event.SelectionLost] = v34.onSelectionLost, 
                [v3.Event.MouseButton1Down] = v34.onMouseDown, 
                [v3.Event.InputEnded] = v34.onInputEnded
            }, {
                ChildrenFrame = v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, v39), 
                TopDiv = v42 and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 0.8
                }) or nil, 
                BottomDiv = v43 and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 0.8
                }) or nil
            });
        end);
    end);
end;
return v4.connect(function(v44) --[[ Line: 272 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v44.playerDropDown.selectedPlayer, 
        dropDownOpen = v44.playerDropDown.isVisible, 
        isSmallTouchDevice = v44.displayOptions.isSmallTouchDevice
    };
end, function(v45) --[[ Line: 281 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v21 (copy)
    return {
        closeDropDown = function() --[[ Line: 283 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v45 (copy), v20 (ref)
            return v45(v20());
        end, 
        openDropDown = function(v46) --[[ Line: 286 ]] --[[ Name: openDropDown ]]
            -- upvalues: v45 (copy), v21 (ref)
            return v45(v21(v46));
        end
    };
end)(v24);