local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v4 = l_CoreGui_0:WaitForChild("RobloxGui", 1e999);
local v5 = require(v4.Modules.Common.Constants);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v8 = require(l_CorePackages_0.Packages.Promise);
local v9 = require(v4.Modules.Settings.Utility);
local v10 = require(v4.Modules.Settings.Theme);
local v11 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v12 = require(l_CorePackages_0.Packages.Roact);
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v15 = require(l_Modules_0.Common.httpRequest);
local v16 = require(l_ShareGame_0.Components.Header);
local v17 = require(l_ShareGame_0.Components.ConversationList);
local v18 = require(l_ShareGame_0.Constants);
local v19 = require(l_ShareGame_0.Components.ShareInviteLink);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v21 = require(l_ShareGame_0.Components.BackButton);
local v22 = require(l_ShareGame_0.Actions.SetGameInfoCreated);
local v23 = 10;
local v24 = 44;
if v11() then
    v23 = 16;
    v24 = 52;
end;
local v25 = v12.PureComponent:extend("ShareGamePageFrame");
local v26 = require(l_ShareGame_0.Components.ErrorToaster);
v25.init = function(v27) --[[ Line: 44 ]] --[[ Name: init ]]
    v27.state = {
        serverType = nil
    };
end;
v25.shouldShowInviteLink = function(v28, v29) --[[ Line: 50 ]] --[[ Name: shouldShowInviteLink ]]
    -- upvalues: v5 (copy), v9 (copy)
    if v28.props.experienceInviteShareLinkEnabled and v28.state.serverType == v5.STANDARD_SERVER and v9:IsExperienceOlderThanOneWeek(v29) then
        return true;
    else
        return false;
    end;
end;
v25.didMount = function(v30) --[[ Line: 62 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy), l_RobloxReplicatedStorage_0 (copy)
    v30.props.fetchGameInfo();
    if v30.state.serverType == nil then
        v8.try(function() --[[ Line: 65 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref)
            return l_RobloxReplicatedStorage_0:WaitForChild("GetServerType", 1e999):InvokeServer();
        end):andThen(function(v31) --[[ Line: 68 ]]
            -- upvalues: v30 (copy)
            v30:setState({
                serverType = v31
            });
        end);
    end;
end;
v25.render = function(v32) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v21 (copy), v10 (copy), v24 (ref), v12 (copy), l_CoreGui_0 (copy), v26 (copy), v16 (copy), v19 (copy), v17 (copy), v23 (ref)
    local l_analytics_0 = v32.props.analytics;
    local l_deviceLayout_0 = v32.props.deviceLayout;
    local l_zIndex_0 = v32.props.zIndex;
    local l_closePage_0 = v32.props.closePage;
    local l_searchAreaActive_0 = v32.props.searchAreaActive;
    local l_searchText_0 = v32.props.searchText;
    local v39 = v18.LayoutSpecific[l_deviceLayout_0];
    local l_HEADER_HEIGHT_0 = v39.HEADER_HEIGHT;
    local v41 = l_deviceLayout_0 == v18.DeviceLayout.DESKTOP;
    local v42 = not v41 and v21.IconType.Arrow or v21.IconType.None;
    local v43 = not v41;
    local l_isVisible_0 = v32.props.isVisible;
    local v45 = v32:shouldShowInviteLink(v32.props.gameInfo);
    local v46 = 0;
    local v47 = 0;
    if v45 and v10.UIBloxThemeEnabled then
        v46 = v46 - v24;
        v47 = 10;
    end;
    return v12.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ZIndex = l_zIndex_0, 
        AutoLocalize = false
    }, {
        toasterPortal = v12.createElement(v12.Portal, {
            target = l_CoreGui_0
        }, {
            Toaster = v12.createElement(v26)
        }), 
        Header = v12.createElement(v16, {
            deviceLayout = l_deviceLayout_0, 
            size = UDim2.new(1, 0, 0, l_HEADER_HEIGHT_0), 
            position = UDim2.new(0, 0, 0, -l_HEADER_HEIGHT_0), 
            layoutOrder = 0, 
            zIndex = l_zIndex_0, 
            closePage = l_closePage_0, 
            searchAreaActive = l_searchAreaActive_0, 
            toggleSearchIcon = v43, 
            iconType = v42, 
            analytics = l_analytics_0
        }), 
        ShareInviteLink = v45 and v12.createElement(v19, {
            position = UDim2.new(0, 0, 0, v47), 
            analytics = l_analytics_0, 
            deviceLayout = l_deviceLayout_0, 
            size = UDim2.new(1, 0, 0, v24), 
            layoutOrder = 1, 
            zIndex = l_zIndex_0
        }) or nil, 
        ConversationList = v12.createElement(v17, {
            analytics = l_analytics_0, 
            size = UDim2.new(1, 0, 1, v39.EXTEND_BOTTOM_SIZE - v23 + v46), 
            topPadding = v45 and v23 + v24 + v47 or v23, 
            layoutOrder = v45 and 2 or 1, 
            zIndex = l_zIndex_0, 
            searchText = l_searchText_0, 
            isVisible = l_isVisible_0, 
            trigger = "GameMenu"
        })
    });
end;
v25 = v13.connect(function(v48) --[[ Line: 144 ]]
    return {
        gameInfo = v48.GameInfo
    };
end, function(v49) --[[ Line: 148 ]]
    -- upvalues: v15 (copy), l_HttpRbxApiService_0 (copy), l_GetGameNameAndDescription_0 (copy), v22 (copy)
    return {
        fetchGameInfo = function() --[[ Line: 150 ]] --[[ Name: fetchGameInfo ]]
            -- upvalues: v15 (ref), l_HttpRbxApiService_0 (ref), l_GetGameNameAndDescription_0 (ref), v49 (copy), v22 (ref)
            local v50 = v15(l_HttpRbxApiService_0);
            l_GetGameNameAndDescription_0(v50, game.GameId):andThen(function(v51) --[[ Line: 152 ]]
                -- upvalues: v49 (ref), v22 (ref)
                v49(v22(v51.Created));
            end);
        end
    };
end)(v25);
return (l_RoactAppPolicy_0.connect(function(v52) --[[ Line: 159 ]]
    return {
        experienceInviteShareLinkEnabled = v52.getExperienceInviteShareLinkEnabled()
    };
end)(v25));