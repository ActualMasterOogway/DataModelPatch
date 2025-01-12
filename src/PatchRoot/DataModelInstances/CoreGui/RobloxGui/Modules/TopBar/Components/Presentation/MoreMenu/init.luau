local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local l_Images_0 = v7.App.ImageSet.Images;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v14 = require(l_Actions_0.SetKeepOutArea);
local v15 = require(l_Actions_0.RemoveKeepOutArea);
local v16 = require(l_Actions_0.SetMoreMenuOpen);
local v17 = require(l_Parent_0.Analytics);
local v18 = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v19 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v20 = require(l_Parent_0.Constants);
local l_InputType_0 = v20.InputType;
local v22 = require(script.Parent.IconButton);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v24 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v25 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v26 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v27 = require(l_RobloxGui_0.Modules.BackpackScript);
local v28 = require(l_RobloxGui_0.Modules.ChatSelector);
local v29 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v30 = require(l_RobloxGui_0.Modules.EmotesMenu.Constants);
local v31 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v33 = l_Images_0["icons/controls/emoteOn"];
local v34 = l_Images_0["icons/controls/emoteOff"];
local v35 = v4.PureComponent:extend("MoreMenu");
v35.validateProps = v6.strictInterface({
    layoutOrder = v6.integer, 
    moreMenuOpen = v6.boolean, 
    setMoreMenuOpen = v6.callback, 
    screenSize = v6.Vector2, 
    isSmallTouchDevice = v6.boolean, 
    topBarEnabled = v6.boolean, 
    leaderboardEnabled = v6.boolean, 
    emotesEnabled = v6.boolean, 
    backpackEnabled = v6.boolean, 
    leaderboardOpen = v6.boolean, 
    backpackOpen = v6.boolean, 
    emotesOpen = v6.boolean, 
    inputType = v6.string, 
    setKeepOutArea = v6.callback, 
    removeKeepOutArea = v6.callback
});
v35.init = function(v36) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v18 (copy), v17 (copy)
    v36.rootRef = v4.createRef();
    if v18 then
        v36.analytics = v17.default;
    end;
    v36:setState({
        vrShowMenuIcon = false
    });
    v36.chatWasHidden = false;
    v36.boundAction = false;
    v36.moreButtonActivated = function() --[[ Line: 112 ]]
        -- upvalues: v36 (copy)
        v36.props.setMoreMenuOpen(not v36.props.moreMenuOpen);
        if v36.analytics then
            v36.analytics:onMoreMenuActivated();
        end;
    end;
end;
v35.renderWithStyle = function(v37, v38) --[[ Line: 120 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_InputType_0 (copy), v31 (copy), l_VRService_0 (copy), l_RobloxGui_0 (copy), v29 (copy), v33 (copy), v34 (copy), v30 (copy), v26 (copy), v28 (copy), v27 (copy), v24 (copy), v20 (copy), v19 (copy), v4 (copy), v22 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_ExternalEventConnection_0 (copy), v25 (copy)
    local v39 = {};
    local v40 = false;
    local v41 = v37.props.inputType == l_InputType_0.MouseAndKeyBoard;
    if v37.props.leaderboardEnabled then
        local v42 = "rbxasset://textures/ui/TopBar/leaderboardOn.png";
        if not v37.props.leaderboardOpen then
            v42 = "rbxasset://textures/ui/TopBar/leaderboardOff.png";
        end;
        table.insert(v39, {
            icon = v42, 
            text = v31:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
            keyCodeLabel = v41 and Enum.KeyCode.Tab or nil, 
            onActivated = function() --[[ Line: 137 ]] --[[ Name: onActivated ]]
                -- upvalues: v37 (copy), l_VRService_0 (ref), l_RobloxGui_0 (ref), v29 (ref)
                local l_leaderboardOpen_0 = v37.props.leaderboardOpen;
                if l_VRService_0.VREnabled then
                    require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
                else
                    v29:SetVisibility(not v29:GetSetVisible());
                    v37.props.setMoreMenuOpen(false);
                end;
                if v37.analytics then
                    v37.analytics:onLeaderboardActivated(not l_leaderboardOpen_0);
                end;
            end
        });
        v40 = true;
    end;
    if v37.props.emotesEnabled then
        local l_v33_0 = v33;
        if not v37.props.emotesOpen then
            l_v33_0 = v34;
        end;
        local l_EmoteMenuOpenKey_0 = v30.EmoteMenuOpenKey;
        table.insert(v39, {
            icon = l_v33_0, 
            text = v31:FormatByKey("CoreScripts.TopBar.Emotes"), 
            keyCodeLabel = v41 and l_EmoteMenuOpenKey_0 or nil, 
            onActivated = function() --[[ Line: 166 ]] --[[ Name: onActivated ]]
                -- upvalues: v26 (ref), v37 (copy), v28 (ref)
                if v26:isOpen() then
                    v26:close();
                else
                    if v37.chatWasHidden then
                        v28:SetVisible(true);
                        v37.chatWasHidden = false;
                    end;
                    v26:open();
                end;
                v37.props.setMoreMenuOpen(false);
                if v37.analytics then
                    v37.analytics:onEmotesActivated(v26:isOpen());
                end;
            end
        });
        v40 = true;
    end;
    if v37.props.backpackEnabled then
        local v46 = "rbxasset://textures/ui/TopBar/inventoryOn.png";
        if not v37.props.backpackOpen then
            v46 = "rbxasset://textures/ui/TopBar/inventoryOff.png";
        end;
        table.insert(v39, {
            icon = v46, 
            text = v31:FormatByKey("CoreScripts.TopBar.Inventory"), 
            keyCodeLabel = v41 and Enum.KeyCode.Backquote or nil, 
            onActivated = function() --[[ Line: 195 ]] --[[ Name: onActivated ]]
                -- upvalues: v27 (ref), v37 (copy)
                v27:OpenClose();
                v37.props.setMoreMenuOpen(false);
                if v37.analytics then
                    v37.analytics:onInventoryActivated(v27.IsOpen);
                end;
            end
        });
        v40 = true;
    end;
    local v47 = UDim2.new(0, 324, 0, v37.props.screenSize.Y);
    if v37.props.screenSize.X < 450 then
        v47 = UDim2.new(0, v37.props.screenSize.X - 24, 0, v37.props.screenSize.Y);
    end;
    local v48 = "rbxasset://textures/ui/TopBar/moreOn.png";
    if not v37.props.moreMenuOpen then
        v48 = "rbxasset://textures/ui/TopBar/moreOff.png";
    end;
    local v49 = not v24:IsEnabled() and v37.props.topBarEnabled and v40 and not l_VRService_0.VREnabled;
    local function v51(v50) --[[ Line: 221 ]]
        -- upvalues: v49 (copy), v37 (copy), v20 (ref)
        if v49 and v50 then
            v37.props.setKeepOutArea(v20.MoreMenuKeepOutAreaId, v50.AbsolutePosition, v50.AbsoluteSize);
            return;
        else
            v37.props.removeKeepOutArea(v20.MoreMenuKeepOutAreaId);
            return;
        end;
    end;
    if v19 and v37.rootRef.current then
        local l_current_0 = v37.rootRef.current;
        if v49 and l_current_0 then
            v37.props.setKeepOutArea(v20.MoreMenuKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
        else
            v37.props.removeKeepOutArea(v20.MoreMenuKeepOutAreaId);
        end;
    end;
    return v4.createElement("Frame", {
        Visible = v49, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 32, 1, 0), 
        LayoutOrder = v37.props.layoutOrder, 
        [v4.Change.AbsoluteSize] = if v19 then v51 else nil, 
        [v4.Change.AbsolutePosition] = if v19 then v51 else nil, 
        [v4.Ref] = v37.rootRef
    }, {
        OpenButton = v4.createElement(v22, {
            icon = v48, 
            iconSize = 24, 
            onActivated = v37.moreButtonActivated
        }), 
        MoreMenuContainer = v4.createElement("Frame", {
            ZIndex = 3, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, 12, 0, 0), 
            Size = v47, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ContextualMenu = v4.createElement(l_ContextualMenu_0, {
                buttonProps = v39, 
                open = v37.props.moreMenuOpen, 
                menuDirection = l_MenuDirection_0.Down, 
                openPositionY = UDim.new(0, v20.TopBarHeight + 12), 
                background = v38.Theme.BackgroundUIContrast, 
                closeBackgroundVisible = false, 
                screenSize = v37.props.screenSize, 
                onDismiss = function() --[[ Line: 270 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v37 (copy), v29 (ref)
                    v37.props.setMoreMenuOpen(false);
                    v29:SetMinimized(false);
                end
            })
        }), 
        ShowTopBarListener = v4.createElement(l_ExternalEventConnection_0, {
            event = v25.ShowTopBarChanged.Event, 
            callback = function() --[[ Line: 278 ]] --[[ Name: callback ]]
                -- upvalues: v37 (copy), l_VRService_0 (ref), v25 (ref), v40 (ref)
                v37:setState({
                    vrShowMenuIcon = l_VRService_0.VREnabled and v25.ShowTopBar and v40
                });
            end
        })
    });
end;
v35.render = function(v53) --[[ Line: 287 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v54) --[[ Line: 288 ]]
        -- upvalues: v53 (copy)
        return v53:renderWithStyle(v54);
    end);
end;
v35.updateActionBound = function(v55) --[[ Line: 293 ]] --[[ Name: updateActionBound ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v55.props.moreMenuOpen then
        l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", function(_, v57, _) --[[ Line: 295 ]]
            -- upvalues: v55 (copy)
            if v57 == Enum.UserInputState.Begin then
                v55.props.setMoreMenuOpen(false);
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.Escape);
        v55.boundAction = true;
        return;
    else
        if v55.boundAction then
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
            v55.boundAction = false;
        end;
        return;
    end;
end;
v35.didUpdate = function(v59, v60, _) --[[ Line: 311 ]] --[[ Name: didUpdate ]]
    -- upvalues: v29 (copy), v28 (copy)
    if v59.props.moreMenuOpen ~= v60.moreMenuOpen then
        v29:SetMinimized(v59.props.moreMenuOpen);
        v59:updateActionBound();
        if v59.props.screenSize.X < 600 then
            if v59.props.moreMenuOpen and v28:GetVisibility() then
                v59.chatWasHidden = true;
                v28:SetVisible(false);
                return;
            elseif not v59.props.moreMenuOpen and v59.chatWasHidden then
                v28:SetVisible(true);
                v59.chatWasHidden = false;
            end;
        end;
    end;
end;
return v5.UNSTABLE_connect2(function(v62) --[[ Line: 329 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v62.displayOptions.screenSize, 
        moreMenuOpen = v62.moreMenu.open, 
        isSmallTouchDevice = v62.displayOptions.isSmallTouchDevice, 
        topBarEnabled = v62.displayOptions.topbarEnabled, 
        leaderboardEnabled = v62.coreGuiEnabled[Enum.CoreGuiType.PlayerList], 
        emotesEnabled = v62.moreMenu.emotesEnabled and v62.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu], 
        backpackEnabled = v62.coreGuiEnabled[Enum.CoreGuiType.Backpack], 
        leaderboardOpen = v62.moreMenu.leaderboardOpen, 
        backpackOpen = v62.moreMenu.backpackOpen, 
        emotesOpen = v62.moreMenu.emotesOpen, 
        inputType = v62.displayOptions.inputType
    };
end, function(v63) --[[ Line: 349 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v14 (copy), v15 (copy)
    return {
        setMoreMenuOpen = function(v64) --[[ Line: 351 ]] --[[ Name: setMoreMenuOpen ]]
            -- upvalues: v63 (copy), v16 (ref)
            return v63(v16(v64));
        end, 
        setKeepOutArea = function(v65, v66, v67) --[[ Line: 354 ]] --[[ Name: setKeepOutArea ]]
            -- upvalues: v63 (copy), v14 (ref)
            return v63(v14(v65, v66, v67));
        end, 
        removeKeepOutArea = function(v68) --[[ Line: 357 ]] --[[ Name: removeKeepOutArea ]]
            -- upvalues: v63 (copy), v15 (ref)
            return v63(v15(v68));
        end
    };
end)(v35);