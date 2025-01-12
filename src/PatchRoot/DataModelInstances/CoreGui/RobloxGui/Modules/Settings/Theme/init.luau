local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DarkTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).Themes.DarkTheme;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_getIconSize_0 = v8.App.ImageSet.getIconSize;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local v12 = game:DefineFastFlag("IncreaseUtilityRowTextSizeConsole", false);
local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
local v15 = {
    [Enum.FontSize.Size14] = Enum.FontSize.Size11, 
    [Enum.FontSize.Size18] = Enum.FontSize.Size14, 
    [Enum.FontSize.Size24] = Enum.FontSize.Size18, 
    [Enum.FontSize.Size36] = Enum.FontSize.Size28, 
    [Enum.FontSize.Size48] = Enum.FontSize.Size36
};
local v16 = Color3.fromRGB(0, 0, 0);
local v17 = l_AppFonts_0.default:getDefault();
local v18 = v15[Enum.FontSize.Size24];
local v19 = {
    MenuContainer = {
        Color = Color3.new(0, 0, 0), 
        Transparency = 0.2
    }, 
    IGM_TabSelection = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 0
    }, 
    White = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 0
    }, 
    IGM_Background = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    IGM_Button = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    IGM_ButtonNonInteractable = {
        Color = Color3.fromRGB(100, 100, 100), 
        Transparency = 0
    }, 
    IGM_ButtonHover = {
        Color = Color3.fromRGB(56, 57, 59), 
        Transparency = 0
    }, 
    IGM_Stroke = {
        Color = Color3.new(0.776, 0.776, 0.776), 
        Transparency = 0
    }, 
    IGM_Selected = {
        Color = Color3.fromRGB(217, 217, 217), 
        Transparency = 0
    }, 
    Player_RowSelection = {
        Color = Color3.new(0.396, 0.4, 0.408), 
        Transparency = 0.9
    }
};
local v20 = {
    Confirmation_Font = {
        Font = l_AppFonts_0.default:getBold(), 
        RelativeSize = v15[Enum.FontSize.Size36], 
        TextSize = 28.584000000000003
    }, 
    Button_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        RelativeSize = v15[Enum.FontSize.Size24], 
        TextSize = 17.468
    }, 
    Username = {
        RelativeSize = if v5 then v15[Enum.FontSize.Size24] else v15[Enum.FontSize.Size18]
    }, 
    DisplayName = {
        RelativeSize = if v5 then Enum.FontSize.Size24 else Enum.FontSize.Size18, 
        Font = l_AppFonts_0.default:getMedium()
    }, 
    Settings_Font = {
        Font = l_AppFonts_0.default:getDefault()
    }, 
    Help_Title_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        RelativeSize = v15[Enum.FontSize.Size18]
    }, 
    Help_Text_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        RelativeSize = v15[Enum.FontSize.Size18], 
        TextSize = 14.292000000000002
    }, 
    Help_Gamepad_Font = {
        Font = l_AppFonts_0.default:getMedium()
    }, 
    Help_Touch_Font = {
        Font = l_AppFonts_0.default:getBold(), 
        RelativeSize = v15[Enum.FontSize.Size14]
    }, 
    Game_Settings_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        RelativeSize = v15[Enum.FontSize.Size24]
    }, 
    Conversation_Details_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 12.704
    }, 
    Utility_Text_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 17.468
    }, 
    Utility_Text_Small_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 12.704
    }, 
    Utility_Row_Small_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 12.704
    }, 
    Utility_Row_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        TextSize = v12 and v5 and 19.056 or 12.704
    }, 
    Back_Button_Font = {
        Font = l_AppFonts_0.default:getSemibold(), 
        TextSize = 19.056
    }, 
    Semibold_Font = {
        Font = l_AppFonts_0.default:getSemibold()
    }, 
    Bold_Font = {
        Font = l_AppFonts_0.default:getMedium()
    }
};
setmetatable(v19, {
    __index = function(_, v22) --[[ Line: 165 ]] --[[ Name: __index ]]
        -- upvalues: l_DarkTheme_0 (copy)
        return l_DarkTheme_0[v22];
    end
});
local v23 = {
    SETTINGS_SHIELD = "IGM_Background", 
    SETTINGS_SHIELD_TRANSPARENCY = "IGM_Background", 
    SELECTION_TEXT_COLOR_NORMAL = "White", 
    SELECTION_TEXT_COLOR_HIGHLIGHTED = "White", 
    HubBarContainer = "IGM_Background", 
    HubBarContainerTransparency = "IGM_Background", 
    HubBarContainerHover = "IGM_Background", 
    HubBarHomeButton = "IGM_Background", 
    HubBarHomeButtonHover = "IGM_Background", 
    HubBarHomeButtonTransparency = "IGM_Background", 
    HubBarHomeButtonTransparencyHover = "IGM_Background", 
    DarkenBackground = "Overlay", 
    PlayerRowFrame = "BackgroundDefault", 
    PlayerRowSelection = "Player_RowSelection", 
    TabSelection = "IGM_TabSelection", 
    DefaultButton = "IGM_Button", 
    DefaultButtonHover = "IGM_ButtonHover", 
    DefaultButtonStroke = "SecondaryDefault", 
    WhiteButtonText = "SecondaryContent", 
    MenuContainer = "BackgroundUIContrast", 
    ControlInputText = "SystemPrimaryDefault", 
    ControlInputStroke = "Divider", 
    ControlInputBackground = "BackgroundDefault", 
    ControlInputFocusedStroke = "IGM_TabSelection", 
    InputActionBackground = "BackgroundUIDefault", 
    IconButton = "UIDefault", 
    IconButtonHover = "BackgroundOnHover", 
    ImageButton = "Divider", 
    RowFrameBackground = "BackgroundDefault", 
    DropdownListBg = "BackgroundUIDefault", 
    DropdownListFocusBg = "UIDefault", 
    SELECTED_COLOR = "IGM_Selected", 
    NON_SELECTED_COLOR = "BackgroundUIDefault", 
    NotInteractableSelection = "UIEmphasis", 
    Confirmation = "Confirmation_Font", 
    Button = "Button_Font", 
    SettingsHub = "Settings_Font", 
    HelpTitle = "Help_Title_Font", 
    HelpText = "Help_Text_Font", 
    HelpGamepad = "Help_Gamepad_Font", 
    HelpTouch = "Help_Touch_Font", 
    GameSettings = "Game_Settings_Font", 
    ConversationDetails = "Conversation_Details_Font", 
    UtilityText = "Utility_Text_Font", 
    UtilityRow = "Utility_Row_Font", 
    UtilityRowSmall = "Utility_Row_Small_Font", 
    UtilityTextSmall = "Utility_Text_Small_Font", 
    BackButton = "Back_Button_Font", 
    Semibold = "Semibold_Font", 
    Bold = "Bold_Font", 
    ShareLinkTitle = "Utility_Text_Font", 
    ButtonNonInteractable = "IGM_ButtonNonInteractable"
};
local function v24() --[[ Line: 242 ]] --[[ Name: getViewportSize ]]
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Vector2.new(1024, 1024);
    elseif not workspace.CurrentCamera then
        return nil;
    elseif workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) then
        return nil;
    else
        return workspace.CurrentCamera.ViewportSize;
    end;
end;
local function _() --[[ Line: 262 ]] --[[ Name: isPortrait ]]
    -- upvalues: v24 (copy)
    local v25 = v24();
    return v25 and v25.Y > v25.X;
end;
local v27 = v24();
local v28 = v27 and l_UserInputService_0.TouchEnabled and (v27.Y < 500 or v27.X < 700);
local function v31() --[[ Line: 271 ]]
    -- upvalues: v24 (copy)
    local v29 = v24();
    if v29 then
        local v30 = true;
        if v29.Y >= 500 then
            v30 = v29.X < 700;
        end;
    end;
    return false;
end;
local v32 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 20), 
    PaddingRight = UDim.new(0, 20), 
    PaddingBottom = UDim.new(0, 14)
};
local v33 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 12), 
    PaddingRight = UDim.new(0, 12), 
    PaddingBottom = UDim.new(0, 12)
};
local _ = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 0), 
    Size = UDim2.new(0.95, 0, 0.95, 0), 
    AutomaticSize = Enum.AutomaticSize.None
};
local _ = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 0), 
    Size = UDim2.new(1, 0, 0.99, 0), 
    AutomaticSize = Enum.AutomaticSize.None
};
local v36 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 10), 
    Size = UDim2.new(0, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
local v37 = {
    AnchorPoint = Vector2.new(0.5, 1), 
    Position = UDim2.new(0.5, 0, 1, 8), 
    Size = UDim2.new(0, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
local v38 = {
    AnchorPoint = Vector2.new(0.5, 0), 
    Position = UDim2.new(0.5, 0, 0, l_l_GuiService_0_GuiInset_0.Y), 
    Size = UDim2.new(1, -24, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.Y
};
return {
    DefaultScrollBarThickness = 1, 
    DefaultCornerRadius = UDim.new(0, 8), 
    MenuContainerCornerRadius = UDim.new(0, 10), 
    DefaultStokeThickness = 1, 
    AlwaysShowBottomBar = function() --[[ Line: 331 ]] --[[ Name: AlwaysShowBottomBar ]]
        -- upvalues: v24 (copy), v28 (ref)
        local v39 = v24();
        if v39 then
            local v40 = true;
            if v39.Y >= 500 then
                v40 = v39.X < 700;
            end;
        end;
        if false then
            return true;
        elseif v28 then
            return false;
        else
            return true;
        end;
    end, 
    UIBloxThemeEnabled = true, 
    UseIconButtons = false, 
    ShowHomeButton = false, 
    EnableVerticalBottomBar = false, 
    UseBiggerText = false, 
    UseStickyBar = v31, 
    EnableDarkenBackground = true, 
    TabHeaderIconPadding = 5, 
    UseInspectAndBuyPanel = function() --[[ Line: 355 ]] --[[ Name: UseInspectAndBuyPanel ]]
        -- upvalues: v28 (ref)
        return v28;
    end, 
    HubPadding = function() --[[ Line: 358 ]] --[[ Name: HubPadding ]]
        -- upvalues: v28 (ref), v33 (copy), v32 (copy)
        if v28 then
            return v33;
        else
            return v32;
        end;
    end, 
    MenuContainerPosition = function() --[[ Line: 365 ]] --[[ Name: MenuContainerPosition ]]
        -- upvalues: v28 (ref), v24 (copy), v38 (copy), v37 (copy), v36 (copy)
        if v28 then
            local v41 = v24();
            if v41 then
                local v42 = true;
                if v41.Y >= 500 then
                    v42 = v41.X < 700;
                end;
            end;
            if false then
                return v38;
            else
                return v37;
            end;
        else
            return v36;
        end;
    end, 
    ButtonHeight = 36, 
    LargeButtonHeight = 48, 
    SelectorArrowButtonWidth = 32, 
    VerticalMenuWidth = 92, 
    Images = l_Images_0, 
    getIconSize = l_getIconSize_0, 
    IconSize = l_IconSize_0, 
    SHIELD_INACTIVE_POSITION = UDim2.new(0, 0, 1, 36), 
    viewportResized = function() --[[ Line: 384 ]] --[[ Name: viewportResized ]]
        -- upvalues: v27 (ref), v24 (copy), v28 (ref), l_UserInputService_0 (copy)
        v27 = v24();
        v28 = v27 and l_UserInputService_0.TouchEnabled and (v27.Y < 500 or v27.X < 700);
    end, 
    color = function(v43, v44) --[[ Line: 390 ]] --[[ Name: color ]]
        -- upvalues: v23 (copy), v19 (copy), v16 (copy)
        v43 = v23[v43] or v43;
        if v19[v43] then
            return v19[v43].Color;
        else
            return v44 or v16;
        end;
    end, 
    transparency = function(v45, v46) --[[ Line: 394 ]] --[[ Name: transparency ]]
        -- upvalues: v23 (copy), v19 (copy)
        v45 = v23[v45] or v45;
        if v19[v45] then
            return v19[v45].Transparency;
        else
            return v46 or 0;
        end;
    end, 
    font = function(v47, v48) --[[ Line: 398 ]] --[[ Name: font ]]
        -- upvalues: v17 (copy), v23 (copy), v20 (copy)
        if not v48 then
            return v17;
        else
            v48 = v23[v48] or v48;
            if v20[v48] then
                return v20[v48].Font;
            else
                return v47 or v17;
            end;
        end;
    end, 
    fontSize = function(v49, v50) --[[ Line: 405 ]] --[[ Name: fontSize ]]
        -- upvalues: v15 (copy), v23 (copy), v20 (copy), v18 (copy)
        if not v50 then
            return v15[v49];
        else
            v50 = v23[v50] or v50;
            if v20[v50] then
                return v20[v50].RelativeSize;
            else
                return v49 or v18;
            end;
        end;
    end, 
    textSize = function(v51, v52) --[[ Line: 412 ]] --[[ Name: textSize ]]
        -- upvalues: v28 (ref), v23 (copy), v20 (copy)
        if not v52 then
            return v51 * 0.794 or 19;
        else
            if v28 and v52 == "UtilityRow" then
                v52 = "UtilityRowSmall";
            elseif v28 and v52 == "UtilityText" then
                v52 = "UtilityTextSmall";
            end;
            v52 = v23[v52] or v52;
            if v20[v52] and v20[v52].TextSize then
                return v20[v52].TextSize;
            else
                return v51 * 0.794 or 19;
            end;
        end;
    end, 
    hydrateLabel = function(v53, v54, v55) --[[ Line: 426 ]] --[[ Name: hydrateLabel ]]
        -- upvalues: v23 (copy), v19 (copy), v20 (copy)
        v54 = v23[v54] or v54;
        if v19[v54] then
            local v56 = v19[v54];
            v53.TextColor3 = v56.Color;
            v53.TextTransparency = v56.Transparency;
        end;
        if v20[v55] then
            local v57 = v20[v54];
            v53.Font = v57.RelativeSize * 19.2;
            v53.TextSize = v57.TextSize;
        end;
    end, 
    platformNameTextSize = 18, 
    platformNameIconSize = UDim2.fromOffset(36, 36), 
    selectionCursor = v19.SelectionCursor
};