local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Otter);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RobloxTranslator_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local v10 = require(l_Modules_0.TopBar.Constants);
local v11 = require(l_Modules_0.Chrome.Enabled)();
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v14 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v15 = require(l_Parent_0.PlayerDropDown);
local v16 = require(l_Parent_0.PlayerListSorter);
local l_Connection_0 = l_Parent_1.Components.Connection;
local v18 = require(l_Connection_0.EventConnections);
local v19 = require(l_Connection_0.ContextActionsBinder);
local v20 = require(l_Connection_0.TopStatConnector);
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v22 = require(l_Parent_1.Flags.FFlagPlayerListFixMobileScrolling);
local v23 = require(l_Parent_1.Flags.FFlagPlayerListFixBackgroundFlicker);
local v24 = require(l_Parent_1.Flags.GetFFlagPlayerListChromePushdown);
local v25 = require(l_Parent_1.Flags.GetFFlagFixDropDownVisibility);
local v26 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v27, v28, v29, v30, v31) --[[ Line: 50 ]] --[[ Name: map ]]
    return (v27 - v28) * (v31 - v30) / (v29 - v28) + v30;
end;
local v33 = v2.PureComponent:extend("PlayerListApp");
local function v41(v34) --[[ Line: 56 ]] --[[ Name: playerListSizeFromViewportSize ]]
    -- upvalues: v24 (copy), v11 (copy), v10 (copy)
    local v35 = math.min(v34.x, v34.y);
    local v36 = math.max(v34.x, v34.y);
    local v37 = (v35 - 320) * 60 / 55 + 270;
    local v38 = (v36 - 480) * 46 / 190 + 434;
    v37 = math.clamp(v37, math.min(270, v35 - 24), 500);
    v38 = math.clamp(v38, math.min(434, v36 - 24), 600);
    local v39 = v34.x > v34.y and v38 or v37;
    local v40 = v34.y > v34.x and v38 or v37;
    if v24() and v11 and v34.y < v34.x then
        v40 = v40 - (v10.TopBarHeight - 24);
    end;
    return UDim2.fromOffset(v39, v40);
end;
local _ = function(v42) --[[ Line: 87 ]] --[[ Name: shouldShowNeutralTeam ]]
    for _, v44 in ipairs(v42) do
        if v44.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v56(v46, v47) --[[ Line: 96 ]] --[[ Name: getTeamCount ]]
    local v48 = false;
    local v49 = {};
    local v50 = 0;
    for _, v52 in pairs(v46) do
        if not v49[v52.TeamColor.Number] then
            v49[v52.TeamColor.Number] = true;
            v50 = v50 + 1;
        end;
    end;
    if v50 > 0 then
        local v53;
        for _, v55 in ipairs(v47) do
            if v55.Team == nil then
                v53 = true;
                v48 = true;
            end;
            if v48 then
                break;
            end;
        end;
        if not v48 then
            v53 = false;
        end;
        v48 = false;
        if v53 then
            v50 = v50 + 1;
        end;
    end;
    return v50;
end;
v33.init = function(v57) --[[ Line: 111 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v4 (copy), v23 (copy)
    v57.state = {
        visible = false
    };
    local v58, v59 = v2.createBinding(0.5);
    v57.bodyTransparency = v58;
    v57.updateBodyTransparency = v59;
    v57.bodyTransparencyMotor = v4.createSingleMotor(v23 and 1 or 0);
    v57.bodyTransparencyMotor:onStep(function(v60) --[[ Line: 118 ]]
        -- upvalues: v57 (copy)
        v57.updateBodyTransparency(v60);
        if v60 < 0.5 and v57.props.displayOptions.isVisible then
            if not v57.state.visible then
                v57:setState({
                    visible = true
                });
            end;
        elseif v57.state.visible then
            v57:setState({
                visible = false
            });
        end;
        local l_setLayerCollectorEnabled_0 = v57.props.setLayerCollectorEnabled;
        local v62 = true;
        if v60 >= 0.99 then
            v62 = v57.props.displayOptions.isVisible;
        end;
        l_setLayerCollectorEnabled_0(v62);
    end);
    v58, v59 = v2.createBinding(0);
    v57.bgTransparency = v58;
    v57.updateBgTransparency = v59;
    v57.bgTransparencyMotor = v4.createSingleMotor(v23 and 1 or 0);
    v57.bgTransparencyMotor:onStep(v57.updateBgTransparency);
    v58, v59 = v2.createBinding(1);
    v57.frameScale = v58;
    v57.updateFrameScale = v59;
    v57.frameScaleMotor = v4.createSingleMotor(0);
    v57.frameScaleMotor:onStep(function(v63) --[[ Line: 140 ]]
        -- upvalues: v57 (copy)
        v57.updateFrameScale(v63);
    end);
    v57.titleRef = v2.createRef();
    v57.closeRef = v2.createRef();
end;
v33.renderBodyChildren = function(v64, _, v66) --[[ Line: 148 ]] --[[ Name: renderBodyChildren ]]
    -- upvalues: v2 (copy), l_AppFonts_0 (copy), l_RobloxTranslator_0 (copy)
    local l_visible_0 = v64.state.visible;
    local l_isDropDownVisible_0 = v64.props.isDropDownVisible;
    return {
        UIScale = v2.createElement("UIScale", {
            Scale = v64.frameScale
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }), 
        TitleText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 44), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getBold(), 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            TextSize = 22, 
            TextColor3 = Color3.fromRGB(240, 240, 240), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_RobloxTranslator_0:FormatByKey("InGame.PlayerList.Leaderboard"), 
            [v2.Ref] = v64.titleRef
        }), 
        CloseButton = v2.createElement("ImageButton", {
            Image = "rbxasset://textures/ui/InspectMenu/x.png", 
            ImageColor3 = Color3.fromRGB(255, 255, 255), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.fromOffset(22, 22), 
            Position = UDim2.fromOffset(11, 22), 
            BackgroundTransparency = 1, 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            ZIndex = 0, 
            [v2.Ref] = v64.closeRef, 
            [v2.Event.Activated] = function() --[[ Line: 186 ]]
                -- upvalues: v64 (copy)
                v64.props.setPlayerListVisible(false);
            end
        }), 
        ContentFrame = v2.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 1, -44), 
            BackgroundTransparency = 1, 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            AutoLocalize = false
        }, v66)
    };
end;
v33.render = function(v69) --[[ Line: 202 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_Players_0 (copy), v56 (copy), v2 (copy), v16 (copy), v18 (copy), v19 (copy), v20 (copy), v22 (copy), v15 (copy), v24 (copy), v11 (copy), v10 (copy), v41 (copy)
    return l_WithLayoutValues_0(function(v70) --[[ Line: 203 ]]
        -- upvalues: v69 (copy), l_Players_0 (ref), v56 (ref), v2 (ref), v16 (ref), v18 (ref), v19 (ref), v20 (ref), v22 (ref), v15 (ref), v24 (ref), v11 (ref), v10 (ref), v41 (ref)
        local v71 = nil;
        if v70.IsTenFoot then
            v71 = v70.EntrySizeX;
        else
            v71 = v70.EntryBaseSizeX + 4 * v70.EntrySizeIncreasePerStat;
            local v72 = v70.PlayerDropDownSizeXMobile + v70.PlayerDropDownOffset;
            local v73 = v70.ContainerPadding * 2 + v72;
            if v69.props.screenSizeX - v73 < v71 then
                v71 = v69.props.screenSizeX - v73;
            end;
        end;
        local v74 = 1e999;
        local v75 = false;
        if l_Players_0.MaxPlayers >= 6 then
            v75 = l_Players_0.MaxPlayers <= 12;
        end;
        if v75 then
            v74 = l_Players_0.MaxPlayers * 26 + v56(v69.props.teams, v69.props.players) * 20;
        end;
        local v76 = {};
        if v69.state.visible then
            v76.PlayerScrollList = v2.createElement(v16, {
                screenSizeY = v69.props.screenSizeY, 
                entrySize = v71
            });
        end;
        v76.EventConnections = v2.createElement(v18);
        v76.ContextActionsBindings = v2.createElement(v19);
        v76.TopStatConnector = v2.createElement(v20);
        return v2.createElement("ImageButton", {
            Active = v69.props.displayOptions.isVisible, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = Color3.fromRGB(17, 18, 20), 
            BackgroundTransparency = v69.bgTransparency, 
            BorderColor3 = Color3.fromRGB(0, 0, 0), 
            BorderSizePixel = 0, 
            AutoLocalize = false, 
            AutoButtonColor = false, 
            Selectable = not v22, 
            Image = "", 
            [v2.Event.Activated] = function() --[[ Line: 251 ]]
                -- upvalues: v69 (ref)
                v69.props.setPlayerListVisible(false);
            end
        }, {
            PlayerDropDown = v2.createElement(v15, {
                contentsVisible = true, 
                selectedPlayer = v69.props.dropDownPlayer
            }), 
            BodyPadding = if v24() and v11 and v69.props.screenSizeY < v69.props.screenSizeX then v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v10.TopBarHeight)
            }) else nil, 
            BodyBackground = v2.createElement("Frame", {
                Size = v41(Vector2.new(v69.props.screenSizeX, v69.props.screenSizeY)), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundColor3 = Color3.fromRGB(17, 18, 20), 
                BackgroundTransparency = v69.bodyTransparency, 
                BorderColor3 = Color3.fromRGB(0, 0, 0), 
                BorderSizePixel = 0
            }, v69:renderBodyChildren(v74, v76))
        });
    end);
end;
v33.didMount = function(v77) --[[ Line: 280 ]] --[[ Name: didMount ]]
    v77.props.setLayerCollectorEnabled(false);
    v77:setState({
        visible = v77.props.displayOptions.isVisible
    });
end;
v33.willUnmount = function(v78) --[[ Line: 287 ]] --[[ Name: willUnmount ]]
    v78.props.setLayerCollectorEnabled(true);
end;
v33.didUpdate = function(v79, v80, _) --[[ Line: 291 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), v26 (copy), v25 (copy)
    local l_isVisible_0 = v79.props.displayOptions.isVisible;
    local l_isDropDownVisible_1 = v79.props.isDropDownVisible;
    if l_isVisible_0 ~= v80.displayOptions.isVisible and not l_isVisible_0 then
        v79:setState({
            visible = l_isVisible_0
        });
    end;
    local v84 = (not not l_isDropDownVisible_1 or l_isVisible_0) and 0.7 or 1;
    v79.bgTransparencyMotor:setGoal(v4.spring(v84, v26));
    local v85 = if v25 then l_isDropDownVisible_1 and l_isVisible_0 else l_isDropDownVisible_1;
    local v86 = 1.25;
    if v85 then
        v86 = 0.95;
    elseif l_isVisible_0 then
        v86 = 1;
    end;
    v79.frameScaleMotor:setGoal(v4.spring(v86, v26));
    local v87 = 1;
    if v85 then
        v87 = 0.8 * v79.props.preferredTransparency;
    elseif l_isVisible_0 then
        v87 = 0.2 * v79.props.preferredTransparency;
    end;
    v79.bodyTransparencyMotor:setGoal(v4.spring(v87, v26));
end;
return v3.connect(function(v88) --[[ Line: 327 ]] --[[ Name: mapStateToProps ]]
    return {
        isDropDownVisible = v88.playerDropDown.isVisible, 
        screenSizeX = v88.screenSize.X, 
        screenSizeY = v88.screenSize.Y, 
        preferredTransparency = v88.settings.preferredTransparency, 
        displayOptions = v88.displayOptions, 
        players = v88.players, 
        playerStats = v88.playerStats, 
        playerIconInfo = v88.playerIconInfo, 
        playerRelationship = v88.playerRelationship, 
        gameStats = v88.gameStats, 
        teams = v88.teams
    };
end, function(v89) --[[ Line: 347 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        setPlayerListVisible = function(v90) --[[ Line: 349 ]] --[[ Name: setPlayerListVisible ]]
            -- upvalues: v89 (copy), v14 (ref)
            return v89(v14(v90));
        end
    };
end)(v33);