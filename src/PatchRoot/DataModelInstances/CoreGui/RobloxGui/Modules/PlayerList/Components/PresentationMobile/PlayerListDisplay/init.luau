local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v7.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v14 = require(script.Parent.PlayerEntry);
local v15 = require(script.Parent.TeamEntry);
local v16 = require(script.Parent.TitleBar);
local l_Parent_0 = script.Parent.Parent.Parent;
local v18 = require(l_Parent_0.Flags.FFlagPlayerListFixMobileScrolling);
local v19 = require(l_Parent_0.GetFakeNeutralTeam);
local v20 = v5.PureComponent:extend("PlayerListDisplay");
v20.validateProps = v8.strictInterface({
    isVisible = v8.boolean, 
    isMinimized = v8.boolean, 
    isTenFootInterface = v8.boolean, 
    isUsingGamepad = v8.boolean, 
    screenSizeY = v8.integer, 
    entrySize = v8.integer, 
    sortedPlayers = v8.array(v11), 
    sortedTeams = v8.optional(v8.any), 
    teamColorToPlayerMap = v8.optional(v8.map(v8.integer, v8.array(v11))), 
    teamScores = v8.optional(v8.map(v8.instanceIsA("Team"), v8.map(v8.string, v8.any))), 
    teamNames = v8.map(v8.instanceIsA("Team"), v8.string), 
    teamColors = v8.map(v8.instanceIsA("Team"), v8.BrickColor), 
    playerTeam = v8.map(v8.integer, v8.instanceIsA("Team")), 
    playerStats = v8.map(v8.integer, v8.map(v8.string, v8.any)), 
    gameStats = v8.array(v8.strictInterface({
        name = v8.string, 
        text = v8.string, 
        addId = v8.integer, 
        isPrimary = v8.boolean, 
        priority = v8.number
    })), 
    playerIconInfo = v8.map(v8.integer, v8.strictInterface({
        isPlaceOwner = v8.boolean, 
        avatarIcon = v8.optional(v8.table), 
        specialGroupIcon = v8.optional(v8.table)
    })), 
    playerRelationship = v8.map(v8.integer, v8.strictInterface({
        isBlocked = v8.boolean, 
        friendStatus = v8.enum(Enum.FriendStatus), 
        isFollowing = v8.boolean, 
        isFollower = v8.boolean
    })), 
    dropDownPlayer = v8.optional(v11), 
    dropDownVisible = v8.boolean
});
v20.init = function(v21) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v21.scrollingFrameRef = v5.createRef();
    v21.firstPlayerRef = v5.createRef();
    v21.state = {
        lastCanvasPosition = Vector2.new(0, 0), 
        containerSizeY = 100, 
        contentsVisible = true
    };
    v21.absoluteSizeChanged = function(v22) --[[ Line: 100 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            containerSizeY = v22.AbsoluteSize.Y
        });
    end;
    v21.canvasPositionChanged = function(v23) --[[ Line: 106 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            lastCanvasPosition = v23.CanvasPosition
        });
    end;
end;
v20.getShowTitlePlayer = function(v24) --[[ Line: 113 ]] --[[ Name: getShowTitlePlayer ]]
    local v25 = v24.props.sortedPlayers and #v24.props.sortedPlayers > 1 or false;
    local v26 = v24.props.sortedTeams and #v24.props.sortedTeams > 0 or false;
    local v27 = #v24.props.gameStats > 0;
    return v25 or v26 or v27;
end;
v20.inVerticalScrollWindow = function(v28, v29, v30) --[[ Line: 120 ]] --[[ Name: inVerticalScrollWindow ]]
    if v29 + v30 + v30 * 3 < v28.state.lastCanvasPosition.Y then
        return false;
    elseif v29 - v30 * 3 > v28.state.lastCanvasPosition.Y + v28.state.containerSizeY then
        return false;
    else
        return true;
    end;
end;
v20.isPastEndOfContent = function(v31, v32, v33) --[[ Line: 134 ]] --[[ Name: isPastEndOfContent ]]
    if v32 - v33 * 3 > v31.state.lastCanvasPosition.Y + v31.state.containerSizeY then
        return true;
    else
        return false;
    end;
end;
v20.render = function(v34) --[[ Line: 143 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v5 (copy), v14 (copy), l_LocalPlayer_0 (copy), v16 (copy), v19 (copy), v15 (copy), v18 (copy)
    return l_WithLayoutValues_0(function(v35) --[[ Line: 144 ]]
        -- upvalues: l_withStyle_0 (ref), v34 (copy), v5 (ref), v14 (ref), l_LocalPlayer_0 (ref), v16 (ref), v19 (ref), v15 (ref), v18 (ref)
        return l_withStyle_0(function(_) --[[ Line: 145 ]]
            -- upvalues: v35 (copy), v34 (ref), v5 (ref), v14 (ref), l_LocalPlayer_0 (ref), v16 (ref), v19 (ref), v15 (ref), v18 (ref)
            local l_EntryPadding_0 = v35.EntryPadding;
            local l_TeamEntrySizeY_0 = v35.TeamEntrySizeY;
            local l_PlayerEntrySizeY_0 = v35.PlayerEntrySizeY;
            local v40 = 0;
            local function _() --[[ Line: 151 ]] --[[ Name: getLayoutOrder ]]
                -- upvalues: v40 (ref)
                v40 = v40 + 1;
                return v40;
            end;
            local v42 = {};
            local v43 = 0;
            if v34:getShowTitlePlayer() then
                v42.TitlePlayer = v5.createElement(v14, {
                    player = l_LocalPlayer_0, 
                    playerStats = v34.props.playerStats[l_LocalPlayer_0.UserId] or {}, 
                    playerIconInfo = v34.props.playerIconInfo[l_LocalPlayer_0.UserId] or {
                        isPlaceOwner = false
                    }, 
                    playerRelationship = v34.props.playerRelationship[l_LocalPlayer_0.UserId] or {
                        isBlocked = false, 
                        friendStatus = Enum.FriendStatus.NotFriend, 
                        isFollowing = false, 
                        isFollower = false
                    }, 
                    titlePlayerEntry = true, 
                    gameStats = v34.props.gameStats, 
                    entrySize = v34.props.entrySize, 
                    topDiv = false, 
                    bottomDiv = true, 
                    Position = UDim2.fromOffset(0, v43)
                });
                v43 = v43 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
            end;
            v42.TitleBar = v5.createElement(v16, {
                contentsVisible = v34.state.contentsVisible, 
                gameStats = v34.props.gameStats, 
                Size = UDim2.new(1, 0, 0, 24), 
                entrySize = v34.props.entrySize, 
                Position = UDim2.fromOffset(0, v43)
            });
            v43 = v43 + (l_TeamEntrySizeY_0 + l_EntryPadding_0);
            local l_v43_0 = v43;
            if v34.props.sortedTeams then
                local v45 = true;
                for v46, v47 in ipairs(v34.props.sortedTeams) do
                    local v48 = nil;
                    if v47.team == v19 then
                        v48 = {};
                        for _, v50 in ipairs(v34.props.sortedPlayers) do
                            if v34.props.playerTeam[v50.UserId] == nil then
                                table.insert(v48, v50);
                            end;
                        end;
                    else
                        v48 = v34.props.teamColorToPlayerMap[v47.team.TeamColor.Number] or {};
                    end;
                    l_v43_0 = l_v43_0 + (l_TeamEntrySizeY_0 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0) * #v48);
                    if v34:inVerticalScrollWindow(v43, l_TeamEntrySizeY_0) then
                        local v51 = "Team_" .. tostring(v46);
                        local l_createElement_0 = v5.createElement;
                        local l_v15_0 = v15;
                        local v54 = {
                            teamName = v34.props.teamNames[v47.team], 
                            teamColor = v34.props.teamColors[v47.team], 
                            leaderstats = v34.props.teamScores[v47.team], 
                            gameStats = v34.props.gameStats, 
                            entrySize = v34.props.entrySize
                        };
                        v40 = v40 + 1;
                        v54.layoutOrder = v40;
                        v54.Position = UDim2.fromOffset(0, v43);
                        v42[v51] = l_createElement_0(l_v15_0, v54);
                    end;
                    v43 = v43 + (l_TeamEntrySizeY_0 + l_EntryPadding_0);
                    for v55, v56 in ipairs(v48) do
                        if v45 or not v34:isPastEndOfContent(v43, l_TeamEntrySizeY_0) then
                            if v45 or v34:inVerticalScrollWindow(v43, l_PlayerEntrySizeY_0) then
                                local l_UserId_0 = v56.UserId;
                                v42["Player_" .. tostring(v56.UserId)] = v5.createElement(v14, {
                                    player = v56, 
                                    playerStats = v34.props.playerStats[l_UserId_0], 
                                    playerIconInfo = v34.props.playerIconInfo[l_UserId_0], 
                                    playerRelationship = v34.props.playerRelationship[l_UserId_0], 
                                    titlePlayerEntry = false, 
                                    gameStats = v34.props.gameStats, 
                                    topDiv = true, 
                                    bottomDiv = v55 == #v48, 
                                    entrySize = v34.props.entrySize, 
                                    Position = UDim2.fromOffset(0, v43), 
                                    [v5.Ref] = v45 and v34.firstPlayerRef or nil
                                });
                                v45 = false;
                            end;
                            v43 = v43 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
                        else
                            break;
                        end;
                    end;
                end;
            else
                l_v43_0 = l_v43_0 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0) * #v34.props.sortedPlayers;
                for v58, v59 in ipairs(v34.props.sortedPlayers) do
                    if v58 == 1 or not v34:isPastEndOfContent(v43, l_PlayerEntrySizeY_0) then
                        if v58 == 1 or v34:inVerticalScrollWindow(v43, l_PlayerEntrySizeY_0) then
                            local l_UserId_1 = v59.UserId;
                            local v61 = "Player_" .. tostring(l_UserId_1);
                            local l_createElement_1 = v5.createElement;
                            local l_v14_0 = v14;
                            local v64 = {
                                player = v59, 
                                playerStats = v34.props.playerStats[l_UserId_1], 
                                playerIconInfo = v34.props.playerIconInfo[l_UserId_1], 
                                playerRelationship = v34.props.playerRelationship[l_UserId_1], 
                                titlePlayerEntry = false, 
                                gameStats = v34.props.gameStats, 
                                entrySize = v34.props.entrySize
                            };
                            v40 = v40 + 1;
                            v64.layoutOrder = v40;
                            v64.topDiv = true;
                            v64.bottomDiv = false;
                            v64.Position = UDim2.fromOffset(0, v43);
                            v64[v5.Ref] = v58 == 1 and v34.firstPlayerRef or nil;
                            v42[v61] = l_createElement_1(l_v14_0, v64);
                        end;
                        v43 = v43 + (l_PlayerEntrySizeY_0 + l_EntryPadding_0);
                    else
                        break;
                    end;
                end;
            end;
            local v65 = 1e999;
            if #v34.props.gameStats > 0 then
                v65 = v65 - v35.TitleBarSizeY;
            end;
            local v66 = true;
            if not v18 then
                v66 = not v34.props.dropDownVisible;
            end;
            return v5.createElement("ScrollingFrame", {
                Active = v18, 
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.fromOffset(0, l_v43_0), 
                BackgroundTransparency = 1, 
                ScrollBarImageColor3 = v35.ScrollImageColor, 
                ScrollBarImageTransparency = v35.ScrollImageTransparency, 
                BorderSizePixel = 0, 
                ScrollBarThickness = v35.ScrollBarSizeMobile, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                HorizontalScrollBarInset = Enum.ScrollBarInset.None, 
                ClipsDescendants = true, 
                ScrollingEnabled = v66, 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                Selectable = false, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                [v5.Change.CanvasPosition] = v34.canvasPositionChanged, 
                [v5.Change.AbsoluteSize] = v34.absoluteSizeChanged
            }, v42);
        end);
    end);
end;
v20.didUpdate = function(v67, v68) --[[ Line: 312 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
    if v67.props.isVisible ~= v68.isVisible then
        if v67.props.isVisible then
            if v67.props.isTenFootInterface and v67.props.isUsingGamepad then
                l_GuiService_0.SelectedCoreObject = v67.firstPlayerRef.current;
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            end;
        else
            if v67.props.isTenFootInterface and v67.props.isUsingGamepad then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
            if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v67.scrollingFrameRef.current) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end;
    if v67.props.isMinimized ~= v68.isMinimized then
        v67:setState({
            contentsVisible = not v67.props.isMinimized
        });
    end;
end;
return v6.connect(function(v69) --[[ Line: 339 ]] --[[ Name: mapStateToProps ]]
    return {
        isVisible = v69.displayOptions.isVisible, 
        isMinimized = v69.displayOptions.isMinimized, 
        isTenFootInterface = v69.displayOptions.isTenFootInterface, 
        isUsingGamepad = v69.displayOptions.isUsingGamepad, 
        gameStats = v69.gameStats, 
        teamNames = v69.teamNames, 
        teamColors = v69.teamColors, 
        playerStats = v69.playerStats, 
        playerIconInfo = v69.playerIconInfo, 
        playerRelationship = v69.playerRelationship, 
        playerTeam = v69.playerTeam, 
        dropDownPlayer = v69.playerDropDown.selectedPlayer, 
        dropDownVisible = v69.playerDropDown.isVisible
    };
end, nil)(v20);