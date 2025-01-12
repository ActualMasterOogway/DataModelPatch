local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.ReactOtter);
local l_useState_0 = v4.useState;
local l_useEffect_0 = v4.useEffect;
local l_useMemo_0 = v4.useMemo;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v13 = require(script.Parent.Parent.Flags.GetFFlagManagerAddDisplayOrderAndBackgroundDismiss);
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local v15 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return function(v16) --[[ Line: 42 ]]
    -- upvalues: l_useState_0 (copy), l_GuiService_0 (copy), l_useEffect_0 (copy), v6 (copy), l_UserInputService_0 (copy), l_useMemo_0 (copy), v15 (copy), v4 (copy), v13 (copy), v5 (copy), l_LocalizationProvider_0 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    local v17, v18 = l_useState_0({});
    local v19, v20 = l_useState_0(l_GuiService_0.MenuIsOpen);
    l_useEffect_0(function() --[[ Line: 50 ]]
        -- upvalues: l_GuiService_0 (ref), v16 (copy), v20 (copy)
        local v21 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v16 (ref), v20 (ref)
            if v16.CloseModal then
                v16.CloseModal();
            end;
            v20(true);
        end);
        local v22 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 57 ]]
            -- upvalues: v20 (ref)
            v20(false);
        end);
        return function() --[[ Line: 60 ]]
            -- upvalues: v21 (copy), v22 (copy)
            v21:Disconnect();
            v22:Disconnect();
        end;
    end, {});
    local v23, v24 = v6.useAnimatedBinding(0, function() --[[ Line: 66 ]]
        -- upvalues: v17 (copy), v16 (copy), v18 (copy)
        if v17 ~= v16 then
            v18(v16);
        end;
    end);
    l_useEffect_0(function() --[[ Line: 75 ]]
        -- upvalues: v16 (copy), v18 (copy), l_UserInputService_0 (ref)
        local v25 = nil;
        if v16.ModalKey then
            v18(v16);
            v25 = l_UserInputService_0.InputBegan:Connect(function(v26) --[[ Line: 85 ]]
                -- upvalues: l_UserInputService_0 (ref), v16 (ref)
                if (v26.KeyCode == Enum.KeyCode.Backspace or v26.KeyCode == Enum.KeyCode.ButtonB) and l_UserInputService_0:GetFocusedTextBox() == nil and v16.CloseModal then
                    v16.CloseModal();
                end;
            end);
        end;
        return function() --[[ Line: 96 ]]
            -- upvalues: v25 (ref)
            if v25 then
                v25:Disconnect();
            end;
        end;
    end, {
        v16
    });
    local v27 = l_useMemo_0(function() --[[ Line: 103 ]]
        -- upvalues: v16 (copy), v19 (copy)
        if v16.ModalKey ~= nil and not v19 then
            return 1;
        else
            return 0;
        end;
    end, {
        v16.ModalKey, 
        v19
    });
    l_useEffect_0(function() --[[ Line: 107 ]]
        -- upvalues: v24 (copy), v6 (ref), v27 (copy), v15 (ref)
        v24(v6.spring(v27, v15));
    end, {
        v27
    });
    return v4.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        DisplayOrder = if v13() then v17.Params and v17.Params.DisplayOrder or 0 else 0, 
        Enabled = v23:map(function(v28) --[[ Line: 118 ]]
            return v28 > 0;
        end)
    }, {
        Background = v4.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 1, 
            BackgroundTransparency = v23:map(function(v29) --[[ Line: 126 ]]
                return 1 - v29 * 0.5;
            end), 
            ZIndex = 0
        }), 
        Container = v4.createElement("TextButton", {
            ZIndex = 1, 
            Text = "", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Selectable = false, 
            Position = v23:map(function(v30) --[[ Line: 139 ]]
                return UDim2.new(0, 0, 1 - v30, 0);
            end), 
            [v5.Event.Activated] = function() --[[ Line: 144 ]]
                -- upvalues: v13 (ref), v17 (copy), v16 (copy)
                local v31 = if v13() then v17.Params and v17.Params.DisableBackgroundDismiss else nil;
                if v16.CloseModal and not v31 then
                    v16.CloseModal();
                end;
            end
        }, {
            LocalizationProvider = v4.createElement(l_LocalizationProvider_0, {
                localization = if l_GetFFlagEnablePushNotificationsUpsellModal_0() then v17.Params and v17.Params.Localization or l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId) else l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
                    ModalComponent = if v17.Component then v4.createElement(v17.Component, v17.Params and v17.Params.Props or {}) else nil
                })
            })
        })
    });
end;