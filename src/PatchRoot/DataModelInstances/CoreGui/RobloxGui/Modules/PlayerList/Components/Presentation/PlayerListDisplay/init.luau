local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Otter);
local l_withStyle_0 = v6.Style.withStyle;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v12 = v6.App.ImageSet.getIconSize(l_IconSize_0.Small);
local l_Images_0 = v6.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v18 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v19 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v20 = require(script.Parent.PlayerEntry);
local v21 = require(script.Parent.TeamEntry);
local v22 = require(script.Parent.PlayerDropDown);
local v23 = require(script.Parent.TitleBar);
local l_Parent_1 = l_Parent_0.Parent;
local v25 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v26 = require(l_Parent_1.GetFakeNeutralTeam);
local v27 = game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false);
local v28 = v19() and not v27;
local v29 = {
    dampingRatio = 1, 
    frequency = 4
};
local v30 = v4.PureComponent:extend("PlayerListDisplay");
v30.validateProps = v7.strictInterface({
    isVisible = v7.boolean, 
    isMinimized = v7.boolean, 
    isTenFootInterface = v7.boolean, 
    isUsingGamepad = v7.boolean, 
    screenSizeY = v7.number, 
    entrySize = v7.integer, 
    sortedPlayers = v7.array(v18), 
    sortedTeams = v7.optional(v7.array(v7.instanceIsA("Team"))), 
    teamColorToPlayerMap = v7.optional(v7.map(v7.integer, v7.array(v7.instanceIsA("Player")))), 
    teamScores = v7.optional(v7.map(v7.instanceIsA("Team"), v7.map(v7.string, v7.any))), 
    teamNames = v7.map(v7.instanceIsA("Team"), v7.string), 
    teamColors = v7.map(v7.instanceIsA("Team"), v7.BrickColor), 
    playerTeam = v7.map(v7.integer, v7.instanceIsA("Team")), 
    playerStats = v7.map(v7.integer, v7.map(v7.string, v7.any)), 
    gameStats = v7.array(v7.strictInterface({
        name = v7.string, 
        text = v7.string, 
        addId = v7.integer, 
        isPrimary = v7.boolean, 
        priority = v7.number
    })), 
    playerIconInfo = v7.map(v7.integer, v7.strictInterface({
        isPlaceOwner = v7.boolean, 
        avatarIcon = v7.optional(v7.table), 
        specialGroupIcon = v7.optional(v7.table)
    })), 
    playerRelationship = v7.map(v7.integer, v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    })), 
    dropDownPlayer = v7.optional(v7.instanceIsA("Player")), 
    dropDownVisible = v7.boolean, 
    dismissPlayerList = v7.callback
});
v30.init = function(v31) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy)
    v31.scrollingFrameRef = v4.createRef();
    v31.firstPlayerRef = v4.createRef();
    v31.state = {
        containerSizeY = 100, 
        scrollingFramePositionY = 0, 
        lastCanvasPosition = Vector2.new(0, 0), 
        contentsVisible = true
    };
    v31.absoluteSizeChanged = function(v32) --[[ Line: 116 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            containerSizeY = v32.AbsoluteSize.Y
        });
    end;
    v31.canvasPositionChanged = function(v33) --[[ Line: 122 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            lastCanvasPosition = v33.CanvasPosition
        });
    end;
    v31.absolutePositionChanged = function(v34) --[[ Line: 128 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            scrollingFramePositionY = v34.AbsolutePosition.Y
        });
    end;
    local v35, v36 = v4.createBinding(0);
    v31.minimizedBinding = v35;
    v31.updateMinimizedBinding = v36;
    v31.minimizedMotor = v8.createSingleMotor(0);
    v31.minimizedMotor:onStep(v31.updateMinimizedBinding);
    v31.minimizedMotor:onComplete(function(v37) --[[ Line: 138 ]]
        -- upvalues: v31 (copy)
        if v37 == 0 then
            v31:setState({
                contentsVisible = true
            });
        end;
    end);
end;
v30.inVerticalScrollWindow = function(v38, v39, v40) --[[ Line: 147 ]] --[[ Name: inVerticalScrollWindow ]]
    if v39 + v40 + v40 * 3 < v38.state.lastCanvasPosition.Y then
        return false;
    elseif v39 - v40 * 3 > v38.state.lastCanvasPosition.Y + v38.state.containerSizeY then
        return false;
    else
        return true;
    end;
end;
v30.calculateDropDownAbsPosition = function(v41, v42, v43) --[[ Line: 163 ]] --[[ Name: calculateDropDownAbsPosition ]]
    local l_current_0 = v41.scrollingFrameRef.current;
    if l_current_0 then
        v42 = v42 - l_current_0.CanvasPosition.Y;
        if v42 + v43 >= l_current_0.AbsoluteSize.Y then
            local v45 = v42 + v43 - l_current_0.AbsoluteSize.Y;
            return v42 - v45, Vector2.new(0, l_current_0.CanvasPosition.Y + v45);
        else
            return v42, nil;
        end;
    else
        return v42, nil;
    end;
end;
v30.render = function(v46) --[[ Line: 176 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v4 (copy), v21 (copy), v26 (copy), v20 (copy), v19 (copy), v28 (copy), v12 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v23 (copy), v22 (copy)
    return l_WithLayoutValues_0(function(v47) --[[ Line: 177 ]]
        -- upvalues: l_withStyle_0 (ref), v46 (copy), v4 (ref), v21 (ref), v26 (ref), v20 (ref), v19 (ref), v28 (ref), v12 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v23 (ref), v22 (ref)
        return l_withStyle_0(function(v48) --[[ Line: 178 ]]
            -- upvalues: v47 (copy), v46 (ref), v4 (ref), v21 (ref), v26 (ref), v20 (ref), v19 (ref), v28 (ref), v12 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v23 (ref), v22 (ref)
            local l_EntryPadding_0 = v47.EntryPadding;
            local l_TeamEntrySizeY_0 = v47.TeamEntrySizeY;
            local l_PlayerEntrySizeY_0 = v47.PlayerEntrySizeY;
            local v52 = {};
            local v53 = 0;
            local v54 = 0;
            if v46.props.sortedTeams then
                local v55 = 0;
                local v56 = true;
                for v57, v58 in ipairs(v46.props.sortedTeams) do
                    if v46:inVerticalScrollWindow(v53, l_TeamEntrySizeY_0) then
                        v52["t_" .. tostring(v57)] = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, v53), 
                            Size = UDim2.new(1, v47.EntryXOffset, 0, v47.TeamEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            v4.createElement(v21, {
                                teamName = v46.props.teamNames[v58.team], 
                                teamColor = v46.props.teamColors[v58.team], 
                                leaderstats = v46.props.teamScores[v58.team], 
                                gameStats = v46.props.gameStats, 
                                entrySize = v46.props.entrySize
                            })
                        });
                    end;
                    v55 = v55 + 1;
                    v53 = v53 + l_TeamEntrySizeY_0 + l_EntryPadding_0;
                    local v59 = nil;
                    if v58.team == v26 then
                        v59 = {};
                        for _, v61 in ipairs(v46.props.sortedPlayers) do
                            if v46.props.playerTeam[v61.UserId] == nil then
                                table.insert(v59, v61);
                            end;
                        end;
                    else
                        v59 = v46.props.teamColorToPlayerMap[v58.team.TeamColor.Number] or {};
                    end;
                    for v62, v63 in ipairs(v59) do
                        if v56 or v46:inVerticalScrollWindow(v53, l_PlayerEntrySizeY_0) then
                            local l_UserId_0 = v63.UserId;
                            v52["p_" .. tostring(l_UserId_0)] = v4.createElement("Frame", {
                                Position = UDim2.fromOffset(0, v53), 
                                Size = UDim2.new(1, v47.EntryXOffset, 0, v47.PlayerEntrySizeY), 
                                BackgroundTransparency = 1
                            }, {
                                v4.createElement(v20, {
                                    player = v63, 
                                    playerStats = v46.props.playerStats[l_UserId_0], 
                                    playerIconInfo = v46.props.playerIconInfo[l_UserId_0], 
                                    playerRelationship = v46.props.playerRelationship[l_UserId_0], 
                                    titlePlayerEntry = false, 
                                    gameStats = v46.props.gameStats, 
                                    hasDivider = not (v62 == #v59), 
                                    entrySize = v46.props.entrySize, 
                                    [v4.Ref] = v56 and v46.firstPlayerRef or nil
                                })
                            });
                        end;
                        v56 = false;
                        if v63 == v46.props.dropDownPlayer then
                            v54 = v53;
                        end;
                        v53 = v53 + l_PlayerEntrySizeY_0 + l_EntryPadding_0;
                        v55 = v55 + 1;
                    end;
                end;
            else
                for v65, v66 in ipairs(v46.props.sortedPlayers) do
                    if v65 == 1 or v46:inVerticalScrollWindow(v53, l_PlayerEntrySizeY_0) then
                        local l_UserId_1 = v66.UserId;
                        v52["p_" .. tostring(l_UserId_1)] = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, v53), 
                            Size = UDim2.new(1, v47.EntryXOffset, 0, v47.PlayerEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            v4.createElement(v20, {
                                player = v66, 
                                playerStats = v46.props.playerStats[l_UserId_1], 
                                playerIconInfo = v46.props.playerIconInfo[l_UserId_1], 
                                playerRelationship = v46.props.playerRelationship[l_UserId_1], 
                                titlePlayerEntry = false, 
                                gameStats = v46.props.gameStats, 
                                hasDivider = v65 ~= #v46.props.sortedPlayers, 
                                entrySize = v46.props.entrySize, 
                                [v4.Ref] = v65 == 1 and v46.firstPlayerRef or nil
                            })
                        });
                    end;
                    if v66 == v46.props.dropDownPlayer then
                        v54 = v53;
                    end;
                    v53 = v53 + l_PlayerEntrySizeY_0 + l_EntryPadding_0;
                end;
            end;
            local v68, v69 = v46:calculateDropDownAbsPosition(v54, l_PlayerEntrySizeY_0);
            if v47.IsTenFoot then
                return v4.createElement("Frame", {
                    Position = v47.PlayerScrollListPosition, 
                    Size = v47.PlayerScrollListSize, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v46.absoluteSizeChanged
                }, {
                    ScollingFrame = v4.createElement("ScrollingFrame", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        CanvasSize = UDim2.new(0, 0, 0, v53), 
                        BackgroundTransparency = 1, 
                        ScrollBarImageColor3 = v47.ScrollImageColor, 
                        ScrollBarImageTransparency = v47.ScrollImageTransparency, 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = 6, 
                        ScrollingEnabled = not v46.props.dropDownVisible, 
                        Selectable = false, 
                        CanvasPosition = v46.props.dropDownVisible and v69 or v46.state.lastCanvasPosition, 
                        [v4.Change.CanvasPosition] = v46.canvasPositionChanged, 
                        [v4.Ref] = v46.scrollingFrameRef
                    }, v52)
                });
            else
                local v70 = v46.state.containerSizeY - 8;
                if #v46.props.gameStats > 0 then
                    v70 = v70 - v47.TitleBarSizeY;
                end;
                local v71 = if v19() then v48.Theme.BackgroundUIContrast.Color else v48.Theme.BackgroundContrast.Color;
                local v74 = v46.minimizedBinding:map(function(v72) --[[ Line: 326 ]]
                    -- upvalues: v47 (ref), v48 (copy)
                    local v73 = v47.OverrideBackgroundTransparency * v48.Settings.PreferredTransparency;
                    return v73 + (v47.FadedBackgroundTransparency - v73) * v72;
                end);
                local l_contentsVisible_0 = v46.state.contentsVisible;
                local l_createElement_0 = v4.createElement;
                local v77 = "Frame";
                local v78 = {
                    Position = v47.PlayerScrollListPosition, 
                    Size = v47.PlayerScrollListSize, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v46.absoluteSizeChanged
                };
                local v79 = {};
                local l_createElement_1 = v4.createElement;
                local v81 = "Frame";
                local v82 = {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v84 = {
                    UIScale = v4.createElement("UIScale", {
                        Scale = v46.minimizedBinding:map(function(v83) --[[ Line: 350 ]]
                            -- upvalues: v47 (ref)
                            return 1 - v47.FadedBackgroundScaleDelta * v83;
                        end)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    TopRoundedRect = if not v28 then v4.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                        ImageColor3 = v71, 
                        ImageTransparency = v74, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 24, 18), 
                        SliceScale = 0.5, 
                        Size = UDim2.new(1, 0, 0, 4)
                    }) else v4.createElement("Frame", {
                        LayoutOrder = 1, 
                        ClipsDescendants = true, 
                        Size = UDim2.new(1, 0, 0, v12 + 2), 
                        BackgroundTransparency = 1
                    }, {
                        DismissIconFrame = v4.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, (v12 + 2) * 2), 
                            BackgroundColor3 = v71, 
                            BackgroundTransparency = v74
                        }, {
                            DismissButton = v4.createElement(l_IconButton_0, {
                                position = UDim2.new(0, 1, 0, 1), 
                                iconSize = l_IconSize_0.Small, 
                                icon = l_Images_0["icons/navigation/close"], 
                                onActivated = v46.props.dismissPlayerList
                            }), 
                            UICorner = v4.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 7)
                            })
                        })
                    })
                };
                local v85 = false;
                if #v46.props.gameStats > 0 then
                    v85 = v4.createElement(v23, {
                        LayoutOrder = 2, 
                        contentsVisible = v46.state.contentsVisible, 
                        backgroundTransparency = v74, 
                        gameStats = v46.props.gameStats, 
                        Size = UDim2.new(1, 0, 0, v47.TitleBarSizeY), 
                        entrySize = v46.props.entrySize
                    });
                end;
                v84.TitleBar = v85;
                v84.ScrollingFrameContainer = v4.createElement("Frame", {
                    LayoutOrder = 3, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 0, (math.min(v53, v70))), 
                    BackgroundColor3 = v71, 
                    BackgroundTransparency = v74, 
                    BorderSizePixel = 0, 
                    [v4.Change.AbsolutePosition] = v46.absolutePositionChanged
                }, {
                    PlayerDropDown = v4.createElement(v22, {
                        contentsVisible = l_contentsVisible_0, 
                        selectedPlayer = v46.props.dropDownPlayer, 
                        positionY = v68, 
                        minPositionBoundY = -v46.state.scrollingFramePositionY + v47.DropDownScreenSidePadding, 
                        maxPositionBoundY = v46.props.screenSizeY - v46.state.scrollingFramePositionY - v47.DropDownScreenSidePadding
                    }), 
                    ScrollingFrameClippingFrame = v4.createElement("Frame", {
                        Visible = v46.state.contentsVisible, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ClipsDescendants = true
                    }, {
                        ScollingFrame = v4.createElement("ScrollingFrame", {
                            Size = UDim2.new(1, -v47.ScrollBarOffset, 1, 0), 
                            CanvasSize = UDim2.new(0, 0, 0, v53), 
                            BackgroundTransparency = 1, 
                            ScrollBarImageColor3 = v47.ScrollImageColor, 
                            ScrollBarImageTransparency = v47.ScrollImageTransparency, 
                            BorderSizePixel = 0, 
                            ScrollBarThickness = v47.ScrollBarSize, 
                            VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                            ClipsDescendants = false, 
                            ScrollingEnabled = not v46.props.dropDownVisible, 
                            Selectable = false, 
                            CanvasPosition = v46.props.dropDownVisible and v69 or v46.state.lastCanvasPosition, 
                            [v4.Change.CanvasPosition] = v46.canvasPositionChanged, 
                            [v4.Ref] = v46.scrollingFrameRef
                        }, {
                            OffsetUndoFrame = v4.createElement("Frame", {
                                Size = UDim2.new(1, v47.ScrollBarOffset + v47.ScrollBarSize, 0, v53), 
                                BackgroundTransparency = 1
                            }, v52)
                        })
                    })
                });
                v84.BottomRoundedRect = if not v28 then v4.createElement("ImageLabel", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                    ImageColor3 = v71, 
                    ImageTransparency = v74, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    Size = UDim2.new(1, 0, 0, 4)
                }) else v4.createElement("Frame", {
                    LayoutOrder = 4, 
                    ClipsDescendants = true, 
                    Size = UDim2.new(1, 0, 0, 7), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    v4.createElement("Frame", {
                        Position = UDim2.new(0, 0, 0, -8), 
                        Size = UDim2.new(1, 0, 0, 14), 
                        BackgroundColor3 = v71, 
                        BackgroundTransparency = v74, 
                        BorderSizePixel = 0
                    }, {
                        v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 7)
                        })
                    })
                });
                v79.SizeOffsetFrame = l_createElement_1(v81, v82, v84);
                return l_createElement_0(v77, v78, v79);
            end;
        end);
    end);
end;
v30.didUpdate = function(v86, v87) --[[ Line: 505 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy), v8 (copy), v29 (copy)
    if v86.props.isVisible ~= v87.isVisible then
        if v86.props.isVisible then
            if v86.props.isTenFootInterface and v86.props.isUsingGamepad then
                l_GuiService_0.SelectedCoreObject = v86.firstPlayerRef.current;
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            end;
            l_GuiService_0:AddSelectionParent("PlayerlistGuiSelection", v86.scrollingFrameRef.current);
        else
            if v86.props.isTenFootInterface and v86.props.isUsingGamepad then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
            if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v86.scrollingFrameRef.current) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            l_GuiService_0:RemoveSelectionGroup("PlayerlistGuiSelection");
        end;
    end;
    if v86.props.isMinimized ~= v87.isMinimized then
        v86.minimizedMotor:setGoal(v8.spring(v86.props.isMinimized and 1 or 0, v29));
        if v86.props.isMinimized then
            v86:setState({
                contentsVisible = false
            });
        end;
    end;
end;
return v5.UNSTABLE_connect2(function(v88) --[[ Line: 545 ]] --[[ Name: mapStateToProps ]]
    local l_isMinimized_0 = v88.displayOptions.isMinimized;
    return {
        isVisible = v88.displayOptions.isVisible, 
        isMinimized = l_isMinimized_0, 
        isTenFootInterface = v88.displayOptions.isTenFootInterface, 
        isUsingGamepad = v88.displayOptions.isUsingGamepad, 
        gameStats = v88.gameStats, 
        teamNames = v88.teamNames, 
        teamColors = v88.teamColors, 
        playerStats = v88.playerStats, 
        playerIconInfo = v88.playerIconInfo, 
        playerRelationship = v88.playerRelationship, 
        playerTeam = v88.playerTeam, 
        dropDownPlayer = v88.playerDropDown.selectedPlayer, 
        dropDownVisible = v88.playerDropDown.isVisible
    };
end, function(v90) --[[ Line: 537 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy)
    return {
        dismissPlayerList = function() --[[ Line: 539 ]] --[[ Name: dismissPlayerList ]]
            -- upvalues: v90 (copy), v25 (ref)
            return v90(v25(false));
        end
    };
end)(v30);