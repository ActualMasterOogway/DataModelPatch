local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Otter);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v12 = require(script.Parent.DropDownButton);
local v13 = require(script.Parent.DropDownPlayerHeader);
local v14 = require(script.Parent.FriendDropDownButton);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v17 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Images_0 = v8.App.ImageSet.Images;
local v19 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local l_Parent_1 = l_Parent_0.Parent;
local v21 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v22 = require(l_Parent_1.Flags.GetFFlagFixDropDownVisibility);
local v23 = require(l_Parent_1.Thunks.BlockPlayer);
local v24 = require(l_Parent_1.Thunks.UnblockPlayer);
local v25 = require(l_Parent_1.Thunks.RequestFriendship);
local v26 = v4.PureComponent:extend("PlayerDropDown");
v26.validateProps = v6.strictInterface({
    positionY = v6.number, 
    minPositionBoundY = v6.number, 
    maxPositionBoundY = v6.number, 
    contentsVisible = v6.boolean, 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    isVisible = v6.boolean, 
    playerRelationship = v6.optional(v6.strictInterface({
        isBlocked = v6.boolean, 
        friendStatus = v6.enum(Enum.FriendStatus), 
        isFollowing = v6.boolean, 
        isFollower = v6.boolean
    })), 
    inspectMenuEnabled = v6.boolean, 
    isTenFootInterface = v6.boolean, 
    subjectToChinaPolicies = v6.boolean, 
    closeDropDown = v6.callback, 
    blockPlayer = v6.callback, 
    unblockPlayer = v6.callback, 
    requestFriendship = v6.callback
});
v26.init = function(v27) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v7 (copy)
    v27.innerFrameRef = v4.createRef();
    v27.motorOptions = {
        dampingRatio = 1, 
        frequency = 4
    };
    v27.motor = v7.createSingleMotor(1);
    v27.motor:onStep(function(v28) --[[ Line: 77 ]]
        -- upvalues: v27 (copy)
        local l_current_0 = v27.innerFrameRef.current;
        if l_current_0 then
            if v28 == 1 then
                l_current_0.Visible = false;
            else
                l_current_0.Visible = true;
            end;
            l_current_0.Position = UDim2.new(v28, 0, 0, 0);
        end;
    end);
    v27.dropDownPosition = 0;
end;
v26.createFriendButton = function(v30, v31) --[[ Line: 93 ]] --[[ Name: createFriendButton ]]
    -- upvalues: v4 (copy), v14 (copy)
    local l_selectedPlayer_0 = v30.props.selectedPlayer;
    return v4.createElement(v14, {
        layoutOrder = 1, 
        playerRelationship = v31, 
        selectedPlayer = l_selectedPlayer_0, 
        dropDownOpen = v30.props.isVisible, 
        requestFriendship = v30.props.requestFriendship, 
        contentVisible = true
    });
end;
v26.createBlockButton = function(v33, v34) --[[ Line: 105 ]] --[[ Name: createBlockButton ]]
    -- upvalues: v17 (copy), l_Images_0 (copy), v4 (copy), v12 (copy)
    local l_selectedPlayer_1 = v33.props.selectedPlayer;
    local v36 = v17:FormatByKey("PlayerDropDown.Block");
    local v37 = v17:FormatByKey("PlayerDropDown.UnBlock");
    local v38 = l_Images_0["icons/actions/block"];
    return v4.createElement(v12, {
        layoutOrder = 4, 
        text = v34.isBlocked and v37 or v36, 
        icon = v38, 
        lastButton = false, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 117 ]] --[[ Name: onActivated ]]
            -- upvalues: v34 (copy), v33 (copy), l_selectedPlayer_1 (copy)
            if v34.isBlocked then
                v33.props.unblockPlayer(l_selectedPlayer_1);
                return;
            else
                v33.props.blockPlayer(l_selectedPlayer_1);
                return;
            end;
        end
    });
end;
v26.createReportButton = function(v39) --[[ Line: 127 ]] --[[ Name: createReportButton ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v12 (copy), v17 (copy), v19 (copy), l_RobloxGui_0 (copy)
    local l_selectedPlayer_2 = v39.props.selectedPlayer;
    local v41 = l_Images_0["icons/actions/feedback"];
    return v4.createElement(v12, {
        layoutOrder = 5, 
        text = v17:FormatByKey("PlayerDropDown.Report"), 
        icon = v41, 
        lastButton = true, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 137 ]] --[[ Name: onActivated ]]
            -- upvalues: v19 (ref), l_RobloxGui_0 (ref), l_selectedPlayer_2 (copy), v39 (copy)
            if v19() then
                require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(l_selectedPlayer_2, v39.__componentName);
                return;
            else
                require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_selectedPlayer_2, v39.__componentName);
                v39.props.closeDropDown();
                return;
            end;
        end
    });
end;
v26.createInspectButton = function(v42) --[[ Line: 151 ]] --[[ Name: createInspectButton ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v12 (copy), v17 (copy), l_LocalPlayer_0 (copy), l_GuiService_0 (copy)
    local l_selectedPlayer_3 = v42.props.selectedPlayer;
    local v44 = l_Images_0["icons/actions/zoomIn"];
    return v4.createElement(v12, {
        layoutOrder = 3, 
        text = v17:FormatByKey("PlayerDropDown.Examine"), 
        icon = v44, 
        lastButton = l_selectedPlayer_3 == l_LocalPlayer_0, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 161 ]] --[[ Name: onActivated ]]
            -- upvalues: l_GuiService_0 (ref), l_selectedPlayer_3 (copy), v42 (copy)
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(l_selectedPlayer_3.UserId, "leaderBoard");
            v42.props.closeDropDown();
        end
    });
end;
v26.render = function(v45) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v4 (copy), v13 (copy), l_LocalPlayer_0 (copy)
    return l_WithLayoutValues_0(function(v46) --[[ Line: 169 ]]
        -- upvalues: v45 (copy), v4 (ref), v13 (ref), l_LocalPlayer_0 (ref)
        local l_selectedPlayer_4 = v45.props.selectedPlayer;
        if not l_selectedPlayer_4 or v45.props.isTenFootInterface then
            return nil;
        else
            local v48 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v46.DropDownButtonPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerHeader = v4.createElement(v13, {
                    player = v45.props.selectedPlayer
                })
            };
            local v49 = v46.DropDownButtonPadding + v46.DropDownHeaderSizeY;
            local l_playerRelationship_0 = v45.props.playerRelationship;
            if l_selectedPlayer_4 ~= l_LocalPlayer_0 then
                if not l_playerRelationship_0.isBlocked then
                    v48.FriendButton = v45:createFriendButton(l_playerRelationship_0);
                    v49 = v49 + v46.DropDownButtonPadding + v46.DropDownButtonSizeY;
                end;
                v48.BlockButton = v45:createBlockButton(l_playerRelationship_0);
                v49 = v49 + v46.DropDownButtonPadding + v46.DropDownButtonSizeY;
                v48.ReportButton = v45:createReportButton();
                v49 = v49 + v46.DropDownButtonPadding + v46.DropDownButtonSizeY;
            end;
            if v45.props.inspectMenuEnabled then
                v48.InspectButton = v45:createInspectButton();
                v49 = v49 + v46.DropDownButtonPadding + v46.DropDownButtonSizeY;
            end;
            v49 = v49 - v46.DropDownButtonPadding;
            local v51 = v45.dropDownPosition + (v46.DropDownHeaderBackgroundSize - v46.DropDownHeaderSizeY);
            if v51 + v49 > v45.props.maxPositionBoundY then
                v51 = v51 - (v51 + v49 - v45.props.maxPositionBoundY);
            elseif v51 < v45.props.minPositionBoundY then
                v51 = v51 + (v45.props.minPositionBoundY - v51);
            end;
            return v4.createElement("Frame", {
                LayoutOrder = v45.props.layoutOrder, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(0, 0, 0, v51), 
                Size = UDim2.new(0, v46.PlayerDropDownSizeX + v46.PlayerDropDownOffset, 0, v49), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                InnerFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, -v46.PlayerDropDownOffset, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v4.Ref] = v45.innerFrameRef
                }, v48)
            });
        end;
    end);
end;
v26.getDropDownPosition = function(v52) --[[ Line: 243 ]] --[[ Name: getDropDownPosition ]]
    if v52.props.isVisible and v52.props.contentsVisible then
        return 0;
    else
        return 1;
    end;
end;
v26.didMount = function(v53) --[[ Line: 250 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy)
    local v54 = v53:getDropDownPosition();
    v53.motor:start();
    v53.motor:setGoal(v7.spring(v54, v53.motorOptions));
end;
v26.willUpdate = function(v55, v56, _) --[[ Line: 256 ]] --[[ Name: willUpdate ]]
    if v56.selectedPlayer ~= v55.props.selectedPlayer then
        v55.dropDownPosition = v56.positionY;
    end;
end;
v26.didUpdate = function(v58, v59, _) --[[ Line: 262 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    if v59.selectedPlayer ~= v58.props.selectedPlayer then
        v58.motor:setGoal(v7.instant(1));
        v58.motor:step(0);
    end;
    local v61 = v58:getDropDownPosition();
    v58.motor:setGoal(v7.spring(v61, v58.motorOptions));
end;
v26.willUnmount = function(v62) --[[ Line: 272 ]] --[[ Name: willUnmount ]]
    v62.motor:destroy();
end;
return v5.UNSTABLE_connect2(function(v63) --[[ Line: 276 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v22 (copy)
    local l_selectedPlayer_5 = v63.playerDropDown.selectedPlayer;
    local v65 = if v22() then v63.playerDropDown.isVisible and v63.displayOptions.isVisible else v63.playerDropDown.isVisible;
    return {
        selectedPlayer = l_selectedPlayer_5, 
        isVisible = v65, 
        playerRelationship = l_selectedPlayer_5 and v63.playerRelationship[l_selectedPlayer_5.UserId], 
        inspectMenuEnabled = v63.displayOptions.inspectMenuEnabled, 
        isTenFootInterface = v63.displayOptions.isTenFootInterface, 
        subjectToChinaPolicies = v63.displayOptions.subjectToChinaPolicies
    };
end, function(v66) --[[ Line: 292 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v23 (copy), v24 (copy), v25 (copy)
    return {
        closeDropDown = function() --[[ Line: 294 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v66 (copy), v21 (ref)
            return v66(v21());
        end, 
        blockPlayer = function(v67) --[[ Line: 298 ]] --[[ Name: blockPlayer ]]
            -- upvalues: v66 (copy), v23 (ref)
            return v66(v23(v67));
        end, 
        unblockPlayer = function(v68) --[[ Line: 302 ]] --[[ Name: unblockPlayer ]]
            -- upvalues: v66 (copy), v24 (ref)
            return v66(v24(v68));
        end, 
        requestFriendship = function(v69, _) --[[ Line: 306 ]] --[[ Name: requestFriendship ]]
            -- upvalues: v66 (copy), v25 (ref)
            return v66(v25(v69));
        end
    };
end)(v26);