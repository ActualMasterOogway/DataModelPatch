local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_t_0 = v4.t;
local l_BaseMenu_0 = l_UIBlox_0.App.Menu.BaseMenu;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(script.Parent.Connection.FocusHandler);
local v11 = require(script.Parent.Connection.RootedConnection);
local l_Flags_0 = l_Parent_0.Flags;
local v13 = require(l_Flags_0.GetFFlagIGMRefactorPlayerContextualMenuGamepadSupport);
local v14 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v15 = l_Roact_0.PureComponent:extend("PlayerContextualMenu");
v15.validateProps = l_t_0.strictInterface({
    moreActions = l_t_0.table, 
    actionWidth = l_t_0.number, 
    xOffset = l_t_0.number, 
    yOffset = l_t_0.number, 
    onClose = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean
});
v15.init = function(v16) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), l_Roact_0 (copy)
    if v13() then
        v16.firstOptionRef = l_Roact_0.createRef();
        v16.containerRef = l_Roact_0.createRef();
        return;
    else
        v16.firstOptionRef = nil;
        v16.containerRef = nil;
        v16.state = {
            isRooted = false, 
            firstOptionRef = nil, 
            containerRef = nil
        };
        v16.setFirstOptionRef = function(v17) --[[ Line: 50 ]]
            -- upvalues: v16 (copy)
            v16:setState({
                firstOptionRef = v17
            });
        end;
        v16.setContainerRef = function(v18) --[[ Line: 56 ]]
            -- upvalues: v16 (copy)
            v16:setState({
                containerRef = v18
            });
        end;
        v16.onAncestryChanged = function(v19) --[[ Line: 62 ]]
            -- upvalues: v16 (copy)
            if v19:IsDescendantOf(game) then
                v16:setState({
                    isRooted = true
                });
            end;
        end;
        return;
    end;
end;
v15.renderContextualMenuFocusHandler = function(v20, v21, v22) --[[ Line: 72 ]] --[[ Name: renderContextualMenuFocusHandler ]]
    -- upvalues: v13 (copy), l_Roact_0 (copy), v10 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v14 (copy)
    local v23 = nil;
    v23 = if v13() then v20.props.canCaptureFocus and v21 else v20.props.canCaptureFocus and v20.state.isRooted and v20.state.firstOptionRef and v20.state.containerRef;
    return l_Roact_0.createElement(v10, {
        isFocused = v23, 
        didFocus = function(v24) --[[ Line: 86 ]] --[[ Name: didFocus ]]
            -- upvalues: l_ContextActionService_0 (ref), v20 (copy), l_GuiService_0 (ref), v13 (ref), v14 (ref)
            l_ContextActionService_0:BindCoreAction("player_contextual_menu_close_action", function(_, v26) --[[ Line: 87 ]]
                -- upvalues: v20 (ref)
                if v26 == Enum.UserInputState.End and v20.props.onClose then
                    v20.props.onClose();
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
            l_GuiService_0:RemoveSelectionGroup("player_contextual_menu_selection_parent");
            if v13() then
                l_GuiService_0:AddSelectionParent("player_contextual_menu_selection_parent", v20.containerRef:getValue());
                if v14() then
                    l_GuiService_0.SelectedCoreObject = v24 or v20.firstOptionRef:getValue();
                    return;
                else
                    l_GuiService_0.SelectedCoreObject = v20.firstOptionRef:getValue();
                    return;
                end;
            else
                l_GuiService_0:AddSelectionParent("player_contextual_menu_selection_parent", v20.state.containerRef);
                if v14() then
                    l_GuiService_0.SelectedCoreObject = v24 or v20.state.firstOptionRef;
                    return;
                else
                    l_GuiService_0.SelectedCoreObject = v20.state.firstOptionRef;
                    return;
                end;
            end;
        end, 
        didBlur = function() --[[ Line: 117 ]] --[[ Name: didBlur ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("player_contextual_menu_close_action");
        end
    }, v13() and v22 or nil);
end;
v15.render = function(v27) --[[ Line: 123 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_CoreGui_0 (copy), v13 (copy), l_BaseMenu_0 (copy), v11 (copy)
    return l_Roact_0.createElement(l_Roact_0.Portal, {
        target = l_CoreGui_0
    }, {
        InGameMenuContextGui = l_Roact_0.createElement("ScreenGui", {
            DisplayOrder = 2, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            FocusHandler = not v13() and v27:renderContextualMenuFocusHandler() or nil, 
            MoreActionsMenu = not v13() and l_Roact_0.createElement("Frame", {
                [l_Roact_0.Event.AncestryChanged] = v27.onAncestryChanged, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                [l_Roact_0.Ref] = v27.setContainerRef
            }, {
                BaseMenu = l_Roact_0.createElement(l_BaseMenu_0, {
                    buttonProps = v27.props.moreActions, 
                    setFirstItemRef = v27.setFirstOptionRef, 
                    width = UDim.new(0, v27.props.actionWidth), 
                    position = UDim2.fromOffset(v27.props.xOffset, v27.props.yOffset)
                })
            }) or nil, 
            RootedConnection = v13() and l_Roact_0.createElement(v11, {
                render = function(v28) --[[ Line: 153 ]] --[[ Name: render ]]
                    -- upvalues: v27 (copy), l_Roact_0 (ref), l_BaseMenu_0 (ref)
                    return v27:renderContextualMenuFocusHandler(v28, {
                        MoreActionsMenu = l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromScale(1, 1), 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Ref] = v27.containerRef
                        }, {
                            BaseMenu = l_Roact_0.createElement(l_BaseMenu_0, {
                                buttonProps = v27.props.moreActions, 
                                setFirstItemRef = v27.firstOptionRef, 
                                width = UDim.new(0, v27.props.actionWidth), 
                                position = UDim2.fromOffset(v27.props.xOffset, v27.props.yOffset)
                            })
                        })
                    });
                end
            }) or nil
        })
    });
end;
return v15;