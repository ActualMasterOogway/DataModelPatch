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
local v22 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v23 = require(l_Parent_1.Flags.GetFFlagFixDropDownVisibility);
local v24 = require(l_Parent_1.Thunks.BlockPlayer);
local v25 = require(l_Parent_1.Thunks.UnblockPlayer);
local v26 = require(l_Parent_1.Thunks.RequestFriendship);
local v27 = v4.PureComponent:extend("PlayerDropDown");
v27.validateProps = v6.strictInterface({
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
    preferredTransparency = v6.number, 
    closeDropDown = v6.callback, 
    blockPlayer = v6.callback, 
    unblockPlayer = v6.callback, 
    requestFriendship = v6.callback, 
    setPlayerListVisibility = v6.callback
});
local v28 = {
    dampingRatio = 1, 
    frequency = 4
};
v27.init = function(v29) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v7 (copy)
    v29.state = {
        allVisible = false, 
        contentVisible = false
    };
    local v30, v31 = v4.createBinding(1);
    v29.containerScale = v30;
    v29.updateContainerScale = v31;
    v29.containerScaleMotor = v7.createSingleMotor(0);
    v29.containerScaleMotor:onStep(function(v32) --[[ Line: 80 ]]
        -- upvalues: v29 (copy)
        v29.updateContainerScale(v32);
    end);
    v30, v31 = v4.createBinding(1);
    v29.transparency = v30;
    v29.updateTransparency = v31;
    v29.transparencyMotor = v7.createSingleMotor(0);
    v29.transparencyMotor:onStep(function(v33) --[[ Line: 86 ]]
        -- upvalues: v29 (copy)
        v29.updateTransparency(v33);
        if v33 < 0.5 and v29.props.isVisible and v29.props.contentsVisible then
            v29:setState({
                contentVisible = true
            });
        else
            v29:setState({
                contentVisible = false
            });
        end;
        v29:setState({
            allVisible = v33 < 1
        });
    end);
    v30, v31 = v4.createBinding(1);
    v29.buttonTransparency = v30;
    v29.updateButtonTransparency = v31;
    v29.buttonTransparencyMotor = v7.createSingleMotor(0);
    v29.buttonTransparencyMotor:onStep(function(v34) --[[ Line: 104 ]]
        -- upvalues: v29 (copy)
        v29.updateButtonTransparency(v34);
    end);
end;
v27.createFriendButton = function(v35, v36) --[[ Line: 109 ]] --[[ Name: createFriendButton ]]
    -- upvalues: v4 (copy), v14 (copy)
    local l_selectedPlayer_0 = v35.props.selectedPlayer;
    return v4.createElement(v14, {
        layoutOrder = 1, 
        playerRelationship = v36, 
        selectedPlayer = l_selectedPlayer_0, 
        dropDownOpen = v35.props.isVisible, 
        requestFriendship = v35.props.requestFriendship, 
        contentVisible = v35.state.contentVisible
    });
end;
v27.createBlockButton = function(v38, v39) --[[ Line: 121 ]] --[[ Name: createBlockButton ]]
    -- upvalues: v17 (copy), l_Images_0 (copy), v4 (copy), v12 (copy)
    local l_selectedPlayer_1 = v38.props.selectedPlayer;
    local v41 = v17:FormatByKey("PlayerDropDown.Block");
    local v42 = v17:FormatByKey("PlayerDropDown.UnBlock");
    local v43 = l_Images_0["icons/actions/block"];
    return v4.createElement(v12, {
        contentVisible = v38.state.contentVisible, 
        buttonTransparency = v38.buttonTransparency, 
        layoutOrder = 4, 
        text = v39.isBlocked and v42 or v41, 
        icon = v43, 
        lastButton = false, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 135 ]] --[[ Name: onActivated ]]
            -- upvalues: v39 (copy), v38 (copy), l_selectedPlayer_1 (copy)
            if v39.isBlocked then
                v38.props.unblockPlayer(l_selectedPlayer_1);
                return;
            else
                v38.props.blockPlayer(l_selectedPlayer_1);
                return;
            end;
        end
    });
end;
v27.createReportButton = function(v44) --[[ Line: 145 ]] --[[ Name: createReportButton ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v12 (copy), v17 (copy), v19 (copy), l_RobloxGui_0 (copy)
    local l_selectedPlayer_2 = v44.props.selectedPlayer;
    local v46 = l_Images_0["icons/actions/feedback"];
    return v4.createElement(v12, {
        contentVisible = v44.state.contentVisible, 
        buttonTransparency = v44.buttonTransparency, 
        layoutOrder = 5, 
        text = v17:FormatByKey("PlayerDropDown.Report"), 
        icon = v46, 
        lastButton = true, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 157 ]] --[[ Name: onActivated ]]
            -- upvalues: v19 (ref), l_RobloxGui_0 (ref), l_selectedPlayer_2 (copy), v44 (copy)
            if v19() then
                require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(l_selectedPlayer_2, v44.__componentName);
                return;
            else
                require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_selectedPlayer_2, v44.__componentName);
                v44.props.closeDropDown();
                return;
            end;
        end
    });
end;
v27.createInspectButton = function(v47) --[[ Line: 171 ]] --[[ Name: createInspectButton ]]
    -- upvalues: l_Images_0 (copy), v4 (copy), v12 (copy), v17 (copy), l_LocalPlayer_0 (copy), l_GuiService_0 (copy)
    local l_selectedPlayer_3 = v47.props.selectedPlayer;
    local v49 = l_Images_0["icons/actions/zoomIn"];
    return v4.createElement(v12, {
        contentVisible = v47.state.contentVisible, 
        buttonTransparency = v47.buttonTransparency, 
        layoutOrder = 3, 
        text = v17:FormatByKey("PlayerDropDown.Examine"), 
        icon = v49, 
        lastButton = l_selectedPlayer_3 == l_LocalPlayer_0, 
        forceShowOptions = false, 
        onActivated = function() --[[ Line: 183 ]] --[[ Name: onActivated ]]
            -- upvalues: l_GuiService_0 (ref), l_selectedPlayer_3 (copy), v47 (copy)
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(l_selectedPlayer_3.UserId, "leaderBoard");
            v47.props.closeDropDown();
            v47.props.setPlayerListVisibility(false);
        end
    });
end;
v27.render = function(v50) --[[ Line: 191 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v4 (copy), v13 (copy), l_LocalPlayer_0 (copy)
    return l_WithLayoutValues_0(function(v51) --[[ Line: 192 ]]
        -- upvalues: v50 (copy), v4 (ref), v13 (ref), l_LocalPlayer_0 (ref)
        local l_selectedPlayer_4 = v50.props.selectedPlayer;
        if not l_selectedPlayer_4 or v50.props.isTenFootInterface then
            return nil;
        else
            local v53 = {
                UIScale = v4.createElement("UIScale", {
                    Scale = v50.containerScale
                }), 
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v51.DropDownButtonPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerHeader = v4.createElement(v13, {
                    player = v50.props.selectedPlayer, 
                    contentVisible = v50.state.contentVisible, 
                    transparency = v50.transparency
                })
            };
            local v54 = 4 * v51.DropDownButtonSizeY + v51.DropDownHeaderSizeY;
            local v55 = v51.DropDownButtonPadding + v51.DropDownHeaderSizeY;
            local l_playerRelationship_0 = v50.props.playerRelationship;
            if l_selectedPlayer_4 ~= l_LocalPlayer_0 then
                if not l_playerRelationship_0.isBlocked then
                    v53.FriendButton = v50:createFriendButton(l_playerRelationship_0);
                    v55 = v55 + v51.DropDownButtonPadding + v51.DropDownButtonSizeY;
                end;
                v53.BlockButton = v50:createBlockButton(l_playerRelationship_0);
                v55 = v55 + v51.DropDownButtonPadding + v51.DropDownButtonSizeY;
                v53.ReportButton = v50:createReportButton();
                v55 = v55 + v51.DropDownButtonPadding + v51.DropDownButtonSizeY;
            end;
            if v50.props.inspectMenuEnabled then
                v53.InspectButton = v50:createInspectButton();
                v55 = v55 + v51.DropDownButtonPadding + v51.DropDownButtonSizeY;
            end;
            v55 = v55 - v51.DropDownButtonPadding;
            return v4.createElement("ImageButton", {
                LayoutOrder = v50.props.layoutOrder, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Modal = false, 
                Visible = v50.state.allVisible, 
                AutoButtonColor = false, 
                Active = v50.props.isVisible, 
                Image = "", 
                [v4.Event.Activated] = v50.props.closeDropDown, 
                [v4.Ref] = v50.imageButtonRef
            }, {
                Container = v4.createElement("Frame", {
                    LayoutOrder = v50.props.layoutOrder, 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, -v54 / 2), 
                    Size = UDim2.new(0, v51.PlayerDropDownSizeXMobile, 0, v55), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true
                }, v53)
            });
        end;
    end);
end;
v27.getScale = function(v57) --[[ Line: 267 ]] --[[ Name: getScale ]]
    if v57.props.isVisible and v57.props.contentsVisible then
        return 1;
    else
        return 1.25;
    end;
end;
v27.getTransparency = function(v58) --[[ Line: 274 ]] --[[ Name: getTransparency ]]
    if v58.props.isVisible and v58.props.contentsVisible then
        return 0;
    else
        return 1;
    end;
end;
v27.getButtonTransparency = function(v59) --[[ Line: 281 ]] --[[ Name: getButtonTransparency ]]
    if v59.props.isVisible and v59.props.contentsVisible then
        return v59.props.preferredTransparency * 0.3;
    else
        return 1;
    end;
end;
v27.didUpdate = function(v60, _, _) --[[ Line: 288 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v28 (copy)
    v60.containerScaleMotor:setGoal(v7.spring(v60:getScale(), v28));
    v60.transparencyMotor:setGoal(v7.spring(v60:getTransparency(), v28));
    v60.buttonTransparencyMotor:setGoal(v7.spring(v60:getButtonTransparency(), v28));
end;
v27.didMount = function(_) --[[ Line: 294 ]] --[[ Name: didMount ]]

end;
v27.willUnmount = function(v64) --[[ Line: 296 ]] --[[ Name: willUnmount ]]
    v64.transparencyMotor:destroy();
    v64.containerScaleMotor:destroy();
    v64.buttonTransparencyMotor:destroy();
    v64.transparencyMotor = nil;
    v64.containerScaleMotor = nil;
    v64.buttonTransparencyMotor = nil;
end;
return v5.connect(function(v65) --[[ Line: 306 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v23 (copy)
    local l_selectedPlayer_5 = v65.playerDropDown.selectedPlayer;
    local v67 = if v23() then v65.playerDropDown.isVisible and v65.displayOptions.isVisible else v65.playerDropDown.isVisible;
    return {
        selectedPlayer = l_selectedPlayer_5, 
        isVisible = v67, 
        playerRelationship = l_selectedPlayer_5 and v65.playerRelationship[l_selectedPlayer_5.UserId], 
        inspectMenuEnabled = v65.displayOptions.inspectMenuEnabled, 
        isTenFootInterface = v65.displayOptions.isTenFootInterface, 
        subjectToChinaPolicies = v65.displayOptions.subjectToChinaPolicies, 
        preferredTransparency = v65.settings.preferredTransparency
    };
end, function(v68) --[[ Line: 324 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v22 (copy), v24 (copy), v25 (copy), v26 (copy)
    return {
        closeDropDown = function() --[[ Line: 326 ]] --[[ Name: closeDropDown ]]
            -- upvalues: v68 (copy), v21 (ref)
            return v68(v21());
        end, 
        setPlayerListVisibility = function(v69) --[[ Line: 330 ]] --[[ Name: setPlayerListVisibility ]]
            -- upvalues: v68 (copy), v22 (ref)
            return v68(v22(v69));
        end, 
        blockPlayer = function(v70) --[[ Line: 334 ]] --[[ Name: blockPlayer ]]
            -- upvalues: v68 (copy), v24 (ref)
            return v68(v24(v70));
        end, 
        unblockPlayer = function(v71) --[[ Line: 338 ]] --[[ Name: unblockPlayer ]]
            -- upvalues: v68 (copy), v25 (ref)
            return v68(v25(v71));
        end, 
        requestFriendship = function(v72, _) --[[ Line: 342 ]] --[[ Name: requestFriendship ]]
            -- upvalues: v68 (copy), v26 (ref)
            return v68(v26(v72));
        end
    };
end)(v27);