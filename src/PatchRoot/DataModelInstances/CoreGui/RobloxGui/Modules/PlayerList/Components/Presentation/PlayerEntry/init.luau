local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_withStyle_0 = v7.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v14 = require(script.Parent.EntryFrame);
local v15 = require(l_Parent_0.PresentationCommon.PlayerIcon);
local v16 = require(script.Parent.PlayerNameTag);
local v17 = require(script.Parent.StatEntry);
local v18 = require(script.Parent.CellExtender);
local l_Parent_1 = l_Parent_0.Parent;
local v20 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v21 = require(l_Parent_1.Actions.OpenPlayerDropDown);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v23 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v24 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateLeaderboardPlayerDropdownViaGUAC;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_SharedFlags_0).GetFFlagLuaAppEnableFoundationColors;
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v28 = v4.PureComponent:extend("PlayerEntry");
v28.validateProps = v6.strictInterface(l_validatePropsWithForwardRef_0({
    player = v23, 
    titlePlayerEntry = v6.boolean, 
    hasDivider = v6.boolean, 
    entrySize = v6.integer, 
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
    [v4.Ref] = v6.optional(v6.table), 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    dropDownOpen = v6.boolean, 
    isSmallTouchDevice = v6.boolean, 
    closeDropDown = v6.callback, 
    openDropDown = v6.callback
}));
v28.init = function(v29) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (copy), l_InExperienceCapabilities_0 (copy)
    v29.state = {
        isHovered = false, 
        isPressed = false
    };
    v29.onActivated = function() --[[ Line: 88 ]]
        -- upvalues: v29 (copy), l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0 (ref), l_InExperienceCapabilities_0 (ref)
        if v29.props.selectedPlayer == v29.props.player and v29.props.dropDownOpen then
            v29.props.closeDropDown();
            return;
        else
            if l_GetFFlagGateLeaderboardPlayerDropdownViaGUAC_0() then
                if l_InExperienceCapabilities_0.canViewPlayerDropdownInLeaderboard then
                    v29.props.openDropDown(v29.props.player);
                    return;
                end;
            else
                v29.props.openDropDown(v29.props.player);
            end;
            return;
        end;
    end;
    v29.onSelectionGained = function() --[[ Line: 102 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = true
        });
    end;
    v29.onSelectionLost = function() --[[ Line: 108 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = false
        });
    end;
    v29.onMouseEnter = function() --[[ Line: 114 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = true
        });
    end;
    v29.onMouseLeave = function() --[[ Line: 120 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isHovered = false, 
            isPressed = false
        });
    end;
    v29.onMouseDown = function() --[[ Line: 127 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isPressed = true
        });
    end;
    v29.onInputEnded = function() --[[ Line: 133 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            isPressed = false
        });
    end;
end;
v28.getBackgroundStyle = function(v30, v31, v32) --[[ Line: 140 ]] --[[ Name: getBackgroundStyle ]]
    -- upvalues: v24 (copy)
    local v33 = if v24() then v32.Theme.BackgroundUIContrast.Color else v32.Theme.BackgroundContrast.Color;
    if not v31.IsTenFoot then
        return {
            Color = v33, 
            Transparency = 1
        };
    else
        local v34 = v30.props.dropDownOpen and v30.props.selectedPlayer == v30.props.player;
        local l_isHovered_0 = v30.state.isHovered;
        if v30.props.titlePlayerEntry then
            if l_isHovered_0 and v31.BackgroundStyle.HoveredTitle then
                return v31.BackgroundStyle.HoveredTitle;
            elseif v31.BackgroundStyle.Title then
                return v31.BackgroundStyle.Title;
            end;
        end;
        if v34 and v31.BackgroundStyle.Selected then
            return v31.BackgroundStyle.Selected;
        elseif l_isHovered_0 and v31.BackgroundStyle.Hovered then
            return v31.BackgroundStyle.Hovered;
        else
            return v31.BackgroundStyle.Default;
        end;
    end;
end;
v28.getOverlayStyle = function(v36, v37, v38) --[[ Line: 174 ]] --[[ Name: getOverlayStyle ]]
    if not v37.IsTenFoot then
        local v39 = v36.props.dropDownOpen and v36.props.selectedPlayer == v36.props.player;
        if v36.state.isPressed then
            return v38.Theme.BackgroundOnPress;
        elseif v39 then
            return v38.Theme.BackgroundOnPress;
        elseif v36.state.isHovered then
            return v38.Theme.BackgroundOnHover;
        end;
    end;
    return {
        Transparency = 1, 
        Color = Color3.new(1, 1, 1)
    };
end;
v28.getTextStyle = function(v40, v41, v42) --[[ Line: 192 ]] --[[ Name: getTextStyle ]]
    -- upvalues: l_Players_0 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy)
    if v41.IsTenFoot then
        if v40.state.isHovered then
            return v41.HoveredTextStyle, v41.PlayerNameTextSize;
        else
            return v41.DefaultTextStyle, v41.PlayerNameTextSize;
        end;
    elseif v40.props.player == l_Players_0.LocalPlayer then
        return v42.Theme.TextEmphasis;
    elseif l_GetFFlagLuaAppEnableFoundationColors_0() then
        return v42.Theme.TextDefault;
    else
        return v42.Theme.TextMuted;
    end;
end;
v28.getPlayerNameFont = function(v43, v44, v45) --[[ Line: 208 ]] --[[ Name: getPlayerNameFont ]]
    -- upvalues: l_Players_0 (copy)
    if v44.IsTenFoot then
        if v43.props.titlePlayerEntry then
            return {
                Font = v44.TitlePlayerEntryFont, 
                Size = v44.PlayerNameTextSize, 
                MinSize = v44.PlayerNameTextSize
            };
        else
            return {
                Font = v44.PlayerEntryFont, 
                Size = v44.PlayerNameTextSize, 
                MinSize = v44.PlayerNameTextSize
            };
        end;
    elseif v43.props.player == l_Players_0.LocalPlayer then
        return {
            Font = v45.Font.CaptionHeader.Font, 
            Size = v45.Font.CaptionHeader.RelativeSize * v45.Font.BaseSize, 
            MinSize = v45.Font.Footer.RelativeMinSize * v45.Font.BaseSize
        };
    else
        return {
            Font = v45.Font.CaptionBody.Font, 
            Size = v45.Font.CaptionBody.RelativeSize * v45.Font.BaseSize, 
            MinSize = v45.Font.Footer.RelativeMinSize * v45.Font.BaseSize
        };
    end;
end;
v28.render = function(v46) --[[ Line: 240 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v4 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy)
    return l_WithLayoutValues_0(function(v47) --[[ Line: 241 ]]
        -- upvalues: l_withStyle_0 (ref), v46 (copy), v4 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
        return l_withStyle_0(function(v48) --[[ Line: 242 ]]
            -- upvalues: v46 (ref), v47 (copy), v4 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
            local v49 = v46:getBackgroundStyle(v47, v48);
            local v50 = v46:getTextStyle(v47, v48);
            local v51 = v46:getPlayerNameFont(v47, v48);
            local v52 = v46:getOverlayStyle(v47, v48);
            local l_entrySize_0 = v46.props.entrySize;
            local v54 = {};
            local v55 = nil;
            if v47.IsTenFoot then
                v55 = UDim.new(0, v47.PlayerEntryPadding);
            end;
            v54.Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = v55
            });
            local l_isPressed_0 = v46.state.isPressed;
            local l_forwardRef_0 = v46.props.forwardRef;
            v54.NameFrame = v4.createElement("Frame", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_entrySize_0, 0, v47.PlayerEntrySizeY), 
                BackgroundTransparency = 1
            }, {
                Shadow = v4.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v47.ShadowImage, 
                    Position = UDim2.new(0, -v47.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v47.ShadowSize * 2, 1, v47.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v47.ShadowSliceRect, 
                    Visible = v47.IsTenFoot
                }), 
                BGFrame = v4.createElement(v14, {
                    sizeX = l_entrySize_0, 
                    sizeY = v47.PlayerEntrySizeY, 
                    isTeamFrame = false, 
                    backgroundStyle = v49, 
                    overlayStyle = v52, 
                    doubleOverlay = l_isPressed_0, 
                    onActivated = v46.onActivated, 
                    onSelectionGained = v46.onSelectionGained, 
                    onSelectionLost = v46.onSelectionLost, 
                    onMouseEnter = v46.onMouseEnter, 
                    onMouseLeave = v46.onMouseLeave, 
                    onMouseDown = v46.onMouseDown, 
                    onInputEnded = v46.onInputEnded, 
                    [v4.Ref] = l_forwardRef_0
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v47.PlayerEntryNamePadding)
                    }), 
                    InitalPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v47.InitalPlayerEntryPadding)
                    }), 
                    PlayerIcon = v4.createElement(v15, {
                        player = v46.props.player, 
                        playerIconInfo = v46.props.playerIconInfo, 
                        playerRelationship = v46.props.playerRelationship, 
                        layoutOrder = 1
                    }), 
                    PlayerName = v4.createElement(v16, {
                        player = v46.props.player, 
                        isTitleEntry = v46.props.titlePlayerEntry, 
                        isHovered = v46.state.isHovered, 
                        layoutOrder = 3, 
                        textStyle = v50, 
                        textFont = v51
                    })
                })
            });
            local l_MaxLeaderstats_0 = v47.MaxLeaderstats;
            if v46.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v47.MaxLeaderstatsSmallScreen;
            end;
            for v59, v60 in ipairs(v46.props.gameStats) do
                if l_MaxLeaderstats_0 >= v59 then
                    v54["GameStat_" .. v60.name] = v4.createElement(v17, {
                        statName = v60.name, 
                        statValue = v46.props.playerStats[v60.name], 
                        isTitleEntry = v46.props.titlePlayerEntry, 
                        isTeamEntry = false, 
                        layoutOrder = v59, 
                        backgroundStyle = v49, 
                        overlayStyle = v52, 
                        doubleOverlay = l_isPressed_0, 
                        textStyle = v50, 
                        onActivated = v46.onActivated, 
                        onSelectionGained = v46.onSelectionGained, 
                        onSelectionLost = v46.onSelectionLost, 
                        onMouseEnter = v46.onMouseEnter, 
                        onMouseLeave = v46.onMouseLeave, 
                        onMouseDown = v46.onMouseDown, 
                        onInputEnded = v46.onInputEnded
                    });
                else
                    break;
                end;
            end;
            if not v47.IsTenFoot then
                v54.BackgroundExtender = v4.createElement(v18, {
                    layoutOrder = 100, 
                    size = UDim2.new(0, v47.ExtraContainerPadding, 1, 0), 
                    backgroundStyle = v49, 
                    overlayStyle = v52, 
                    doubleOverlay = l_isPressed_0
                });
            end;
            return v4.createFragment({
                ChildrenFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, v54), 
                Divider = not v47.IsTenFoot and v46.props.hasDivider and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v48.Theme.Divider.Transparency, 
                    BackgroundColor3 = v48.Theme.Divider.Color, 
                    BorderSizePixel = 0
                })
            });
        end);
    end);
end;
v28 = v5.UNSTABLE_connect2(function(v61) --[[ Line: 394 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v61.playerDropDown.selectedPlayer, 
        dropDownOpen = v61.playerDropDown.isVisible, 
        isSmallTouchDevice = v61.displayOptions.isSmallTouchDevice
    };
end, function(v62) --[[ Line: 403 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v21 (copy)
    return {
        closeDropDown = function() --[[ Line: 405 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v62 (copy), v20 (ref)
            return v62(v20());
        end, 
        openDropDown = function(v63) --[[ Line: 408 ]] --[[ Name: openDropDown ]]
            -- upvalues: v62 (copy), v21 (ref)
            return v62(v21(v63));
        end
    };
end)(v28);
return v4.forwardRef(function(v64, v65) --[[ Line: 416 ]]
    -- upvalues: v4 (copy), v28 (ref), v3 (copy)
    return v4.createElement(v28, v3.Dictionary.join(v64, {
        forwardRef = v65
    }));
end);