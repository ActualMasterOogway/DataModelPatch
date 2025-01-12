local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v11 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v15 = require(l_Parent_0.Parent.PromptType);
local v16 = require(l_Parent_0.PublishAssetPromptSingleStep);
local v17 = require(l_Parent_0.PublishAvatarPrompt.PublishAvatarPrompt);
local v18 = require(l_Parent_0.ResultModal);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider;
local v20 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v21 = v20.FocusNavigationService.new(v20.EngineInterface.CoreGui);
local v22 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_Provider_0 = v22.FocusNavigableSurfaceRegistry.Provider;
local v24 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v22.FocusNavigableSurfaceIdentifierEnum;
local v26 = require(script.Parent.Parent.FFlagPublishAvatarPromptEnabled);
local v27 = game:DefineFastFlag("MigratePublishPromptFromRoactGamepad", false);
local v28 = v6.PureComponent:extend("PublishAssetPromptApp");
local v29 = game:DefineFastFlag("FixFocusOnResultModal", false);
v28.validateProps = v9.strictInterface({
    assetType = v9.optional(v9.enum(Enum.AssetType)), 
    assetInstance = v9.optional(v9.Instance)
});
local function _(v30) --[[ Line: 59 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), v11 (copy)
    return l_getInputGroup_0(v30) == v11.InputTypeConstants.Gamepad;
end;
v28.init = function(v32) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v11 (copy), v8 (copy)
    local v33 = {};
    local v34;
    if v27 then
        v34 = nil;
    else
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        v34 = l_getInputGroup_0(l_l_UserInputService_0_LastInputType_0) == v11.InputTypeConstants.Gamepad;
    end;
    v33.isGamepad = v34;
    v33.screenSize = Vector2.new(0, 0);
    v32:setState(v33);
    v32.absoluteSizeChanged = function(v36) --[[ Line: 72 ]]
        -- upvalues: v32 (copy)
        if v32.state.screenSize ~= v36.AbsoluteSize then
            v32:setState({
                screenSize = v36.AbsoluteSize
            });
        end;
    end;
    v32.focusController = if v27 then nil else v8.createFocusController();
    v32.selectedCoreGuiObject = nil;
    v32.selectedGuiObject = nil;
end;
v28.render = function(v37) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v18 (copy), v15 (copy), v16 (copy), v26 (copy), v17 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v11 (copy), v8 (copy), v27 (copy), l_SelectionCursorProvider_0 (copy), v20 (copy), v21 (copy), l_Provider_0 (copy), v24 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v38 = nil;
    if v37.props.resultModalType then
        v38 = v6.createElement(v18, {
            screenSize = v37.state.screenSize
        });
    elseif v37.props.assetInstance then
        if v37.props.promptType == v15.PublishAssetSingleStep then
            v38 = v6.createElement(v16, {
                screenSize = v37.state.screenSize
            });
        end;
    elseif v26 and v37.props.promptType == v15.PublishAvatar then
        v38 = v6.createElement(v17, {
            screenSize = v37.state.screenSize
        });
    end;
    return v6.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = -1, 
        [v6.Change.AbsoluteSize] = v37.absoluteSizeChanged
    }, {
        LastInputTypeConnection = v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v39) --[[ Line: 120 ]] --[[ Name: callback ]]
                -- upvalues: v37 (copy), l_getInputGroup_0 (ref), v11 (ref)
                v37:setState({
                    isGamepad = l_getInputGroup_0(v39) == v11.InputTypeConstants.Gamepad
                });
            end
        }) or nil, 
        PromptFrame = v6.createElement(v8.Focusable.Frame, {
            focusController = if v27 then nil else v37.focusController, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            Prompt = if v27 then nil else v38, 
            CursorProvider = if v27 then v6.createElement(l_SelectionCursorProvider_0, {}, {
                FocusNavigationProvider = v6.createElement(v20.FocusNavigationContext.Provider, {
                    value = v21
                }, {
                    FocusNavigationRegistryProvider = v6.createElement(l_Provider_0, nil, {
                        FocusNavigationEffects = v6.createElement(v24, {
                            selectionGroupName = "PublishAssetPromptApp", 
                            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView
                        }, {
                            Prompt = v38
                        })
                    })
                })
            }) else nil
        }) or nil
    });
end;
if not v27 then
    v28.revertSelectedGuiObject = function(v40) --[[ Line: 163 ]] --[[ Name: revertSelectedGuiObject ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
        local v41 = nil;
        if l_LocalPlayer_0 then
            v41 = l_LocalPlayer_0:FindFirstChildWhichIsA("PlayerGui");
        end;
        if v40.selectedCoreGuiObject and v40.selectedCoreGuiObject:IsDescendantOf(l_CoreGui_0) then
            l_GuiService_0.SelectedCoreObject = v40.selectedCoreGuiObject;
        elseif v40.selectedGuiObject and v40.selectedGuiObject:IsDescendantOf(v41) then
            l_GuiService_0.SelectedObject = v40.selectedGuiObject;
            l_GuiService_0.SelectedCoreObject = nil;
        else
            l_GuiService_0.SelectedCoreObject = nil;
        end;
        v40.selectedCoreGuiObject = nil;
        v40.selectedGuiObject = nil;
    end;
    v28.didUpdate = function(v42, v43, v44) --[[ Line: 182 ]] --[[ Name: didUpdate ]]
        -- upvalues: v29 (copy), l_GuiService_0 (copy)
        local v45 = nil;
        local v46 = nil;
        if v29 then
            v45 = v42.state.isGamepad and (v42.props.assetInstance ~= nil or v42.props.resultModalType ~= nil);
            v46 = v44.isGamepad and (v43.assetInstance ~= nil or v43.resultModalType ~= nil);
        else
            v45 = v42.state.isGamepad and v42.props.assetInstance ~= nil;
            v46 = v44.isGamepad and v43.assetInstance ~= nil;
        end;
        if v45 ~= v46 then
            if v45 then
                v42.selectedCoreGuiObject = l_GuiService_0.SelectedCoreObject;
                v42.selectedGuiObject = l_GuiService_0.SelectedObject;
                l_GuiService_0.SelectedObject = nil;
                v42.focusController.captureFocus();
                return;
            else
                v42.focusController.releaseFocus();
                if v42.state.isGamepad then
                    v42:revertSelectedGuiObject();
                end;
            end;
        end;
    end;
    v28.willUnmount = function(v47) --[[ Line: 211 ]] --[[ Name: willUnmount ]]
        if v47.state.isGamepad then
            v47:revertSelectedGuiObject();
        end;
    end;
end;
return v7.connect(function(v48) --[[ Line: 218 ]] --[[ Name: mapStateToProps ]]
    return {
        resultModalType = v48.promptRequest.resultModalType, 
        promptType = v48.promptRequest.promptInfo.promptType, 
        assetInstance = v48.promptRequest.promptInfo.assetInstance, 
        assetType = v48.promptRequest.promptInfo.assetType
    };
end)(v28);