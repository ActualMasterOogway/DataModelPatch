local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.Otter);
local v7 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v8 = require(l_RobloxGui_0.Modules.Stats.StatsUtils);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v11 = require(l_Parent_0.PlayerListSorter);
local v12 = require(l_Parent_0.PlayerEntry);
local v13 = require(l_Parent_0.Parent.PresentationCommon.TenFootSideBar);
local l_Connection_0 = l_Parent_1.Components.Connection;
local v15 = require(l_Connection_0.EventConnections);
local v16 = require(l_Connection_0.ContextActionsBinder);
local v17 = require(l_Connection_0.TopStatConnector);
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v19 = require(l_Parent_1.Flags.FFlagRemoveSideBarABTest);
local v20 = require(l_Parent_1.Flags.GetFStringRemoveSideBarABTestLayerName);
local v21 = {
    dampingRatio = 1, 
    frequency = 7
};
local v22 = v4.PureComponent:extend("PlayerListApp");
local _ = function(v23) --[[ Line: 45 ]] --[[ Name: shouldShowNeutralTeam ]]
    for _, v25 in ipairs(v23) do
        if v25.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v37(v27, v28) --[[ Line: 54 ]] --[[ Name: getTeamCount ]]
    local v29 = false;
    local v30 = {};
    local v31 = 0;
    for _, v33 in pairs(v27) do
        if not v30[v33.TeamColor.Number] then
            v30[v33.TeamColor.Number] = true;
            v31 = v31 + 1;
        end;
    end;
    if v31 > 0 then
        local v34;
        for _, v36 in ipairs(v28) do
            if v36.Team == nil then
                v34 = true;
                v29 = true;
            end;
            if v29 then
                break;
            end;
        end;
        if not v29 then
            v34 = false;
        end;
        v29 = false;
        if v34 then
            v31 = v31 + 1;
        end;
    end;
    return v31;
end;
v22.init = function(v38) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v6 (copy)
    v38.state = {
        visible = true
    };
    local v39, v40 = v4.createBinding(UDim2.new(0, 0, 0, 0));
    v38.positionOffset = v39;
    v38.updatePositionOffset = v40;
    v38.positionMotor = v6.createSingleMotor(0);
    v38.positionMotor:onStep(function(v41) --[[ Line: 77 ]]
        -- upvalues: v38 (copy)
        v38.updatePositionOffset(UDim2.new(v41, 0, 0, 0));
    end);
    v38.positionMotor:onComplete(function(_) --[[ Line: 80 ]]
        -- upvalues: v38 (copy)
        if not v38.props.displayOptions.isVisible then
            v38:setState({
                visible = false
            });
        end;
    end);
end;
v22.render = function(v43) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v8 (copy), l_Players_0 (copy), v37 (copy), v4 (copy), v12 (copy), v11 (copy), v15 (copy), v16 (copy), v17 (copy), v19 (copy), v13 (copy)
    return l_WithLayoutValues_0(function(v44) --[[ Line: 90 ]]
        -- upvalues: v43 (copy), v8 (ref), l_Players_0 (ref), v37 (ref), v4 (ref), v12 (ref), v11 (ref), v15 (ref), v16 (ref), v17 (ref), v19 (ref), v13 (ref)
        local l_ContainerPosition_0 = v44.ContainerPosition;
        local l_ContainerSize_0 = v44.ContainerSize;
        local l_AnchorPoint_0 = v44.AnchorPoint;
        if not v44.IsTenFoot and v43.props.displayOptions.performanceStatsVisible then
            l_ContainerPosition_0 = l_ContainerPosition_0 + UDim2.fromOffset(0, v8.ButtonHeight);
        end;
        l_ContainerPosition_0 = l_ContainerPosition_0 + UDim2.fromOffset(0, v44.TopBarOffset);
        local l_MaxLeaderstats_0 = v44.MaxLeaderstats;
        if v43.props.displayOptions.isSmallTouchDevice then
            l_MaxLeaderstats_0 = v44.MaxLeaderstatsSmallScreen;
        end;
        local v49 = math.min(#v43.props.gameStats, l_MaxLeaderstats_0);
        if v49 > 0 then
            local v50 = v44.StatEntrySizeX + v44.EntryPadding;
            l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v50 * v49, 0, 0);
        end;
        local v51 = nil;
        if v44.IsTenFoot then
            v51 = v44.EntrySizeX;
        else
            v51 = v44.EntryBaseSizeX + math.min(4, v49) * v44.EntrySizeIncreasePerStat;
            l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v44.ExtraContainerPadding, 0, 0);
            local v52 = v44.PlayerDropDownSizeX + v44.PlayerDropDownOffset;
            local v53 = l_ContainerSize_0.X.Offset + v44.ContainerPadding * 2 + v52;
            if v43.props.screenSizeX - v53 < v51 then
                v51 = v43.props.screenSizeX - v53;
            end;
            l_ContainerSize_0 = l_ContainerSize_0 + UDim2.new(0, v51, 0, 0);
        end;
        local v54 = 1e999;
        local v55 = false;
        if l_Players_0.MaxPlayers >= 6 then
            v55 = l_Players_0.MaxPlayers <= 12;
        end;
        if v55 then
            v54 = l_Players_0.MaxPlayers * 26 + v37(v43.props.teams, v43.props.players) * 20;
        end;
        local v56 = {};
        if v44.IsTenFoot then
            for _, v58 in ipairs(v43.props.players) do
                if v58 == l_Players_0.LocalPlayer then
                    v56.TitlePlayerEntry = v4.createElement("Frame", {
                        Position = UDim2.fromOffset(0, 0), 
                        Size = UDim2.new(1, v44.EntryXOffset, 0, v44.PlayerEntrySizeY), 
                        BackgroundTransparency = 1
                    }, {
                        PlayerEntry = v4.createElement(v12, {
                            player = v58, 
                            playerStats = v43.props.playerStats[v58.UserId], 
                            playerIconInfo = v43.props.playerIconInfo[v58.UserId], 
                            playerRelationship = v43.props.playerRelationship[v58.UserId], 
                            titlePlayerEntry = true, 
                            hasDivider = false, 
                            gameStats = v43.props.gameStats, 
                            entrySize = v51
                        })
                    });
                    break;
                end;
            end;
        end;
        v56.PlayerScrollList = v4.createElement(v11, {
            screenSizeY = v43.props.screenSizeY, 
            entrySize = v51
        });
        v56.EventConnections = v4.createElement(v15);
        v56.ContextActionsBindings = v4.createElement(v16);
        v56.TopStatConnector = v4.createElement(v17);
        if (not v19 or not v43.props.removeSideBar) and v43.props.displayOptions.isTenFootInterface then
            v56.TenFootSideBar = v4.createElement(v13);
        end;
        return v4.createElement("Frame", {
            Position = l_ContainerPosition_0, 
            AnchorPoint = l_AnchorPoint_0, 
            Size = l_ContainerSize_0, 
            BackgroundTransparency = 1, 
            Visible = v43.state.visible, 
            ZIndex = v44.IsTenFoot and 2 or 1, 
            AutoLocalize = false, 
            [v4.Ref] = v43.rootRef
        }, {
            OffsetFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v43.positionOffset, 
                BackgroundTransparency = 1
            }, v56), 
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, 0), 
                MaxSize = Vector2.new(1e999, v54)
            }) or nil
        });
    end);
end;
v22.didMount = function(v59) --[[ Line: 203 ]] --[[ Name: didMount ]]
    v59:setState({
        visible = v59.props.displayOptions.isVisible
    });
end;
v22.didUpdate = function(v60, v61, _) --[[ Line: 209 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy), v21 (copy)
    if v60.props.displayOptions.isVisible ~= v61.displayOptions.isVisible then
        if v60.props.displayOptions.isTenFootInterface then
            v60:setState({
                visible = v60.props.displayOptions.isVisible
            });
            return;
        elseif v60.props.displayOptions.isVisible then
            v60:setState({
                visible = true
            });
            v60.positionMotor:setGoal(v6.instant(0.2));
            v60.positionMotor:step(0);
            v60.positionMotor:setGoal(v6.spring(0, v21));
            return;
        else
            v60.positionMotor:setGoal(v6.spring(1.1, v21));
        end;
    end;
end;
v22.willUnmount = function(v63) --[[ Line: 230 ]] --[[ Name: willUnmount ]]
    v63.positionMotor:destroy();
    v63.positionMotor = nil;
end;
local function v65(v64) --[[ Line: 235 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSizeX = v64.screenSize.X, 
        screenSizeY = v64.screenSize.Y, 
        displayOptions = v64.displayOptions, 
        players = v64.players, 
        playerStats = v64.playerStats, 
        playerIconInfo = v64.playerIconInfo, 
        playerRelationship = v64.playerRelationship, 
        gameStats = v64.gameStats, 
        teams = v64.teams
    };
end;
if v19 then
    local v66 = v20();
    return v5.connect(v65, nil)(v7.connectUserLayer({
        v66
    }, function(v67, _) --[[ Line: 254 ]]
        -- upvalues: v66 (copy)
        return {
            removeSideBar = (v67[v66] or {}).removeSideBar
        };
    end)(v22));
else
    return v5.UNSTABLE_connect2(v65, nil)(v22);
end;