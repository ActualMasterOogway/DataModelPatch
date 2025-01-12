local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.UIBlox);
local l_Tokens_0 = v4.App.Style.Tokens;
local l_Constants_0 = v4.App.Style.Constants;
local v7 = require(l_Parent_0.SharedFlags).getFFlagSettingsHubIndependentBackgroundVisibility();
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatInExperienceTabBarAdjustment);
local l_getFFlagAppChatCoreUIConflictFix_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatCoreUIConflictFix;
local v10 = game:DefineFastFlag("AppChatMouseLockFix", false);
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v12 = {};
v12.__index = v12;
v12._new = function() --[[ Line: 55 ]] --[[ Name: _new ]]
    -- upvalues: v12 (copy)
    local v13 = {
        _visible = false, 
        _wasVisible = false, 
        visibilitySignal = Instance.new("BindableEvent"), 
        unreadCount = 0, 
        unreadCountSignal = Instance.new("BindableEvent"), 
        currentSquadId = "", 
        currentSquadIdSignal = Instance.new("BindableEvent"), 
        topMargin = 12
    };
    setmetatable(v13, v12);
    return v13;
end;
v12.initialize = function(v14, v15, v16, v17, v18, v19) --[[ Line: 71 ]] --[[ Name: initialize ]]
    -- upvalues: l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_Tokens_0 (copy), l_Constants_0 (copy), v8 (copy), l_getFFlagAppChatCoreUIConflictFix_0 (copy)
    if v15 then
        v14.topMargin = v15;
    end;
    v14.settingsHub = v16;
    v14._foundationTokens = if l_GetFFlagLuaAppEnableFoundationColors_0() then l_Tokens_0.getFoundationTokensDefaultScale(l_Constants_0.ThemeName.Dark) else nil;
    if v8() then
        v14.viewportUtil = v17;
    end;
    if l_getFFlagAppChatCoreUIConflictFix_0() then
        v14.chatSelector = v18;
        v14.playerListManager = v19;
    end;
end;
v12.setVisible = function(v20, v21) --[[ Line: 99 ]] --[[ Name: setVisible ]]
    -- upvalues: l_getFFlagAppChatCoreUIConflictFix_0 (copy), l_CoreGui_0 (copy), v10 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), v8 (copy), l_GuiService_0 (copy), v7 (copy)
    if v21 == v20._visible then
        return;
    else
        v20._visible = v21;
        v20.visibilitySignal:Fire(v21);
        if v21 then
            if l_getFFlagAppChatCoreUIConflictFix_0() then
                if v20.chatSelector then
                    v20.chatSelector:HideTemp("AppChat", true);
                end;
                if v20.playerListManager then
                    v20.playerListManager:HideTemp("AppChat", true);
                end;
            end;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.DisplayOrder = game:DefineFastInt("AppChatInExperienceStandaloneContainerDisplayOrder", 4);
            l_ScreenGui_0.Parent = l_CoreGui_0;
            l_ScreenGui_0.Name = "InExperienceAppChatModal";
            local l_UIPadding_0 = Instance.new("UIPadding");
            l_UIPadding_0.PaddingTop = UDim.new(0, v20.topMargin);
            l_UIPadding_0.PaddingRight = UDim.new(0, 12);
            l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
            l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
            l_UIPadding_0.Parent = l_ScreenGui_0;
            local l_UIListLayout_0 = Instance.new("UIListLayout");
            l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
            l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
            l_UIListLayout_0.Parent = l_ScreenGui_0;
            local v25 = Instance.new(v10 and "ImageButton" or "Frame");
            v25.BorderSizePixel = 0;
            if v10 then
                v25.AutoButtonColor = false;
                v25.Modal = true;
            end;
            v25.BackgroundTransparency = if l_GetFFlagLuaAppEnableFoundationColors_0() then v20._foundationTokens.Color.OverMedia.OverMedia_0.Transparency else 0.3;
            v25.BackgroundColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v20._foundationTokens.Color.OverMedia.OverMedia_0.Color3 else Color3.fromRGB(0, 0, 0);
            v25.Size = UDim2.fromScale(1, 1);
            v25.Visible = true;
            v25.Parent = l_ScreenGui_0;
            if v8() and v20.viewportUtil then
                local function v27() --[[ Line: 152 ]]
                    -- upvalues: v20 (copy), l_UIPadding_0 (copy), l_GuiService_0 (ref)
                    local v26 = v20.viewportUtil.screenSize:get();
                    if not v26 or not v26.X or not v26.Y then
                        return;
                    elseif v26.Y > v26.X then
                        l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
                        return;
                    else
                        l_UIPadding_0.PaddingBottom = UDim.new(0, l_GuiService_0:GetSafeZoneOffsets().bottom);
                        return;
                    end;
                end;
                v20.viewportUtil.screenSize:connect(v27);
                v27();
            end;
            local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
            l_UISizeConstraint_0.MaxSize = Vector2.new(850, 780);
            l_UISizeConstraint_0.Parent = v25;
            local l_UICorner_0 = Instance.new("UICorner");
            l_UICorner_0.CornerRadius = UDim.new(0, 8);
            l_UICorner_0.Parent = v25;
            v20.frame = v25;
        else
            if v20.frame and v20.frame.Parent then
                v20.frame.Parent:Destroy();
                v20.frame = nil;
            end;
            if l_getFFlagAppChatCoreUIConflictFix_0() then
                if v20.chatSelector then
                    v20.chatSelector:HideTemp("AppChat", false);
                end;
                if v20.playerListManager then
                    v20.playerListManager:HideTemp("AppChat", false);
                end;
            end;
        end;
        if v20.settingsHub and v7 then
            v20.settingsHub:SetBackgroundVisibility(v21, false);
        end;
        return;
    end;
end;
v12.toggleVisibility = function(v30) --[[ Line: 205 ]] --[[ Name: toggleVisibility ]]
    if v30.default then
        local v31 = not v30.default._visible;
        v30.default:setVisible(v31);
    end;
end;
v12.getVisible = function(v32) --[[ Line: 213 ]] --[[ Name: getVisible ]]
    return v32.default._visible;
end;
v12.setUnreadCount = function(v33, v34) --[[ Line: 218 ]] --[[ Name: setUnreadCount ]]
    v33.default.unreadCount = v34;
    v33.default.unreadCountSignal:Fire(v34);
end;
v12.setCurrentSquadId = function(v35, v36) --[[ Line: 223 ]] --[[ Name: setCurrentSquadId ]]
    v35.default.currentSquadId = v36;
    v35.default.currentSquadIdSignal:Fire(v36);
end;
v12.default = v12._new();
return v12;