local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v10 = require(script.Parent.Connection);
local l_Prompts_0 = script.Parent.Prompts;
local v12 = require(l_Prompts_0.AllowInventoryReadAccessPrompt);
local v13 = require(l_Prompts_0.SaveAvatarPrompt);
local v14 = require(l_Prompts_0.CreateOutfitPrompt);
local v15 = require(l_Prompts_0.EnterOutfitNamePrompt);
local v16 = require(l_Prompts_0.SetFavoritePrompt);
local v17 = require(l_Prompts_0.DeleteOutfitPrompt);
local v18 = require(l_Prompts_0.RenameOutfitPrompt);
local v19 = require(l_Prompts_0.UpdateOutfitPrompt);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent.Parent;
local v22 = require(l_Parent_0.PromptType);
local v23 = require(l_Parent_0.Actions.ScreenSizeUpdated);
local v24 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v25 = {
    [v22.AllowInventoryReadAccess] = v12, 
    [v22.SaveAvatar] = v13, 
    [v22.CreateOutfit] = v14, 
    [v22.EnterOutfitName] = v15, 
    [v22.SetFavorite] = v16, 
    [v22.DeleteOutfit] = v17, 
    [v22.RenameOutfit] = v18, 
    [v22.UpdateOutfit] = v19
};
local v26 = v5.PureComponent:extend("AvatarEditorPromptsApp");
v26.validateProps = v8.strictInterface({
    promptType = v8.optional(v8.userdata), 
    screenSizeUpdated = v8.callback
});
v26.init = function(v27) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), l_UserInputService_0 (copy), v7 (copy)
    v27:setState({
        isGamepad = v24[l_UserInputService_0:GetLastInputType()] or false
    });
    v27.absoluteSizeChanged = function(v28) --[[ Line: 73 ]]
        -- upvalues: v27 (copy)
        v27.props.screenSizeUpdated(v28.AbsoluteSize);
    end;
    v27.focusController = v7.createFocusController();
    v27.selectedCoreGuiObject = nil;
    v27.selectedGuiObject = nil;
end;
v26.render = function(v29) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), v5 (copy), v10 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v24 (copy), v7 (copy)
    local v30 = nil;
    if v29.props.promptType then
        local v31 = v25[v29.props.promptType];
        if v31 then
            v30 = v5.createElement(v31);
        else
            error("Unexpected prompt type!");
        end;
    end;
    return v5.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = -1, 
        [v5.Change.AbsoluteSize] = v29.absoluteSizeChanged
    }, {
        Connection = v5.createElement(v10), 
        LastInputTypeConnection = v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v32) --[[ Line: 106 ]] --[[ Name: callback ]]
                -- upvalues: v29 (copy), v24 (ref)
                v29:setState({
                    isGamepad = v24[v32] or false
                });
            end
        }) or nil, 
        PromptFrame = v5.createElement(v7.Focusable.Frame, {
            focusController = v29.focusController, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            Prompt = v30
        }) or nil
    });
end;
v26.revertSelectedGuiObject = function(v33) --[[ Line: 124 ]] --[[ Name: revertSelectedGuiObject ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    local v34 = l_LocalPlayer_0 and l_LocalPlayer_0:FindFirstChildWhichIsA("PlayerGui");
    if v33.selectedCoreGuiObject and v33.selectedCoreGuiObject:IsDescendantOf(l_CoreGui_0) then
        l_GuiService_0.SelectedCoreObject = v33.selectedCoreGuiObject;
    elseif v33.selectedGuiObject and v33.selectedGuiObject:IsDescendantOf(v34) then
        l_GuiService_0.SelectedObject = v33.selectedGuiObject;
        l_GuiService_0.SelectedCoreObject = nil;
    else
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    v33.selectedCoreGuiObject = nil;
    v33.selectedGuiObject = nil;
end;
v26.didUpdate = function(v35, v36, v37) --[[ Line: 140 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy)
    local v38 = v35.state.isGamepad and v35.props.promptType ~= nil;
    if v38 ~= (v37.isGamepad and v36.promptType ~= nil) then
        if v38 then
            v35.selectedCoreGuiObject = l_GuiService_0.SelectedCoreObject;
            v35.selectedGuiObject = l_GuiService_0.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            v35.focusController.captureFocus();
            return;
        else
            v35.focusController.releaseFocus();
            if v35.state.isGamepad then
                v35:revertSelectedGuiObject();
            end;
        end;
    end;
end;
v26.willUnmount = function(v39) --[[ Line: 159 ]] --[[ Name: willUnmount ]]
    if v39.state.isGamepad then
        v39:revertSelectedGuiObject();
    end;
end;
return v6.connect(function(v40) --[[ Line: 165 ]] --[[ Name: mapStateToProps ]]
    return {
        promptType = v40.promptInfo.promptType
    };
end, function(v41) --[[ Line: 171 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v23 (copy)
    return {
        screenSizeUpdated = function(v42) --[[ Line: 173 ]] --[[ Name: screenSizeUpdated ]]
            -- upvalues: v41 (copy), v23 (ref)
            return v41(v23(v42));
        end
    };
end)(v26);