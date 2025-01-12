local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.React);
local l_useExternalEvent_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Hooks.useExternalEvent;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v10 = require(l_CoreGui_0.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog);
return function(v11) --[[ Line: 29 ]] --[[ Name: MenuNavigationToggleDialog ]]
    -- upvalues: l_useDesignTokens_0 (copy), v10 (copy), l_UserInputService_0 (copy), v5 (copy), l_LocalizationService_0 (copy), l_useExternalEvent_0 (copy), l_Localization_0 (copy), l_GetTextSize_0 (copy)
    local v12 = l_useDesignTokens_0();
    local l_CaptionHeader_0 = v12.Semantic.Typography.CaptionHeader;
    local l_Space_200_0 = v12.Global.Space_200;
    local l_Space_75_0 = v12.Global.Space_75;
    local l_Medium_0 = v12.Semantic.Radius.Medium;
    local l_Size_300_0 = v12.Global.Size_300;
    local l_Contrast_0 = v12.Semantic.Color.BackgroundUi.Contrast;
    local l_Color3_0 = v12.Semantic.Color.Text.Emphasis.Color3;
    local l_Space_50_0 = v12.Global.Space_50;
    local v21 = if v10 and game:GetEngineFeature("GetImageForKeyCode") then l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png";
    local v22 = nil;
    local v23 = nil;
    if v10 then
        local v24, v25 = v5.useState(l_LocalizationService_0.RobloxLocaleId);
        local l_v25_0 = v25 --[[ copy: 14 -> 17 ]];
        l_useExternalEvent_0(l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ Line: 48 ]]
            -- upvalues: l_v25_0 (copy), l_LocalizationService_0 (ref)
            l_v25_0(l_LocalizationService_0.RobloxLocaleId);
        end);
        local l_v24_0 = v24 --[[ copy: 13 -> 18 ]];
        local v34, v35 = v5.useMemo(function() --[[ Line: 58 ]]
            -- upvalues: l_Localization_0 (ref), l_v24_0 (copy)
            local v28 = l_Localization_0.new(l_v24_0);
            local l_status_0, l_result_0 = pcall(v28.Format, v28, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon");
            local l_status_1, l_result_1 = pcall(v28.Format, v28, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon");
            local v33 = if l_status_0 then l_result_0 else "Some experiences require pressing";
            if l_status_1 then
                return v33, l_result_1;
            else
                return v33, "to toggle menu navigation";
            end;
        end, {
            v24
        });
        v22 = v34;
        v23 = v35;
    else
        local v36 = {
            VirtualCursorHintPreIcon = "Some experiences require pressing ", 
            VirtualCursorHintPostIcon = " to toggle menu navigation"
        };
        v22 = v36.VirtualCursorHintPreIcon;
        v23 = v36.VirtualCursorHintPostIcon;
    end;
    local v37, v38 = v5.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: l_GetTextSize_0 (ref), v22 (ref), l_CaptionHeader_0 (copy), v23 (ref)
        return l_GetTextSize_0(v22, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, Vector2.new(1e999, 1e999)), (l_GetTextSize_0(v23, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, Vector2.new(1e999, 1e999)));
    end, {
        l_CaptionHeader_0.FontSize, 
        l_CaptionHeader_0.Font, 
        v22, 
        v23
    });
    return v5.createElement("Frame", {
        BackgroundColor3 = l_Contrast_0.Color3, 
        BackgroundTransparency = l_Contrast_0.Transparency, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v11.Position
    }, {
        Corner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_Medium_0)
        }), 
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = if v10 then UDim.new(0, l_Space_50_0) else nil
        }), 
        LeftText = v5.createElement("TextLabel", {
            Size = UDim2.fromOffset(v37.X, v37.Y), 
            Text = v22, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Color3_0, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.FontSize, 
            TextWrapped = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }), 
        Icon = v5.createElement("ImageLabel", {
            Size = UDim2.fromOffset(l_Size_300_0, l_Size_300_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 100, 
            Image = v21
        }), 
        RightText = v5.createElement("TextLabel", {
            Size = UDim2.fromOffset(v38.X, v38.Y), 
            Text = v23, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Color3_0, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.FontSize, 
            TextWrapped = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 200
        }), 
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_75_0), 
            PaddingBottom = UDim.new(0, l_Space_75_0), 
            PaddingLeft = UDim.new(0, l_Space_200_0), 
            PaddingRight = UDim.new(0, l_Space_200_0)
        })
    });
end;