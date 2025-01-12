local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v10 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v11 = require(l_RobloxGui_0.Modules.Common.Constants);
local v12 = require(l_RobloxGui_0.Modules.Shimmer);
local l_FFlag_0 = settings():GetFFlag("LocalizeErrorCodeString");
local v14 = game:DefineFastFlag("FixGamepadDisconnectHighlight2", false);
local v15 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local v16 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0);
local v17 = nil;
local function v18() --[[ Line: 28 ]] --[[ Name: onLocaleIdChanged ]]
    -- upvalues: v17 (ref), l_CoreGui_0 (copy), l_LocalizationService_0 (copy)
    v17 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
end;
v17 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):connect(v18);
local function _(v19, v20, v21) --[[ Line: 36 ]] --[[ Name: attemptTranslate ]]
    -- upvalues: v17 (ref)
    if not v17 then
        return v20;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: v17 (ref), v19 (copy), v21 (copy)
            return v17:FormatByKey(v19, v21);
        end);
        return l_status_0 and l_result_0 or v20;
    end;
end;
local v25 = {
    Default = function() --[[ Line: 49 ]]
        -- upvalues: l_Create_0 (copy), v11 (copy)
        return l_Create_0("Frame")({
            Name = "ErrorPrompt", 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v11.COLORS.FLINT, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v11.ERROR_PROMPT_MAX_WIDTH.Default, 0, v11.ERROR_PROMPT_HEIGHT.Default), 
            Visible = false, 
            AutoLocalize = false, 
            ZIndex = 8; 
            l_Create_0("UIListLayout")({
                Name = "PromptLayout", 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            l_Create_0("UIScale")({
                Name = "PromptScale", 
                Scale = 0
            }), 
            l_Create_0("Frame")({
                Name = "TitleFrame", 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v11.ERROR_TITLE_FRAME_HEIGHT.Default), 
                BorderSizePixel = 0, 
                ZIndex = 8; 
                l_Create_0("UIPadding")({
                    Name = "TitleFramePadding", 
                    PaddingBottom = UDim.new(0, 11), 
                    PaddingTop = UDim.new(0, 11)
                }), 
                l_Create_0("TextLabel")({
                    Name = "ErrorTitle", 
                    TextColor3 = v11.COLORS.WHITE, 
                    TextSize = 25, 
                    Size = UDim2.new(1, 0, 0, 28), 
                    BackgroundTransparency = 1, 
                    Font = Enum.Font.SourceSansSemibold, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 8
                })
            }), 
            l_Create_0("Frame")({
                Name = "SplitLine", 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -2 * v11.SIDE_PADDING, 0, v11.SPLIT_LINE_THICKNESS), 
                BackgroundColor3 = v11.COLORS.PUMICE, 
                BorderSizePixel = 0, 
                ZIndex = 8
            }), 
            l_Create_0("Frame")({
                Name = "MessageArea", 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -v11.ERROR_TITLE_FRAME_HEIGHT.Default - v11.SPLIT_LINE_THICKNESS), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 8; 
                l_Create_0("UIPadding")({
                    Name = "MessageAreaPadding", 
                    PaddingBottom = UDim.new(0, v11.SIDE_PADDING), 
                    PaddingLeft = UDim.new(0, v11.SIDE_PADDING), 
                    PaddingRight = UDim.new(0, v11.SIDE_PADDING), 
                    PaddingTop = UDim.new(0, v11.SIDE_PADDING)
                }), 
                l_Create_0("Frame")({
                    Name = "ErrorFrame", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 8; 
                    l_Create_0("UIListLayout")({
                        Name = "ErrorFrameLayout", 
                        Padding = UDim.new(0, v11.LAYOUT_PADDING), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    l_Create_0("TextLabel")({
                        Name = "ErrorMessage", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 1, -v11.BUTTON_HEIGHT - v11.LAYOUT_PADDING), 
                        TextSize = 20, 
                        TextColor3 = v11.COLORS.PUMICE, 
                        ZIndex = 8, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        Font = Enum.Font.SourceSans
                    }), 
                    l_Create_0("Frame")({
                        Name = "ButtonArea", 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, v11.BUTTON_HEIGHT), 
                        ZIndex = 8, 
                        LayoutOrder = 2, 
                        SelectionGroup = true, 
                        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorRight = Enum.SelectionBehavior.Stop; 
                        l_Create_0("UIGridLayout")({
                            Name = "ButtonLayout", 
                            CellPadding = UDim2.new(0, v11.BUTTON_CELL_PADDING, 0, 0), 
                            CellSize = UDim2.new(1, 0, 0, v11.BUTTON_HEIGHT), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                    })
                })
            })
        });
    end
};
local v29 = {
    Default = function(v26, v27, v28) --[[ Line: 165 ]]
        -- upvalues: l_Create_0 (copy), v11 (copy)
        return l_Create_0("ImageButton")({
            Name = v26 .. "Button", 
            BackgroundTransparency = 1, 
            ImageColor3 = v28 and v11.COLORS.WHITE or v11.COLORS.PUMICE, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = v28 and v11.PRIMARY_BUTTON_TEXTURE or v11.SECONDARY_BUTTON_TEXTURE, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            LayoutOrder = v27, 
            ZIndex = 8; 
            l_Create_0("TextLabel")({
                Name = "ButtonText", 
                Text = v26, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextColor3 = v28 and v11.COLORS.SLATE or v11.COLORS.PUMICE, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = Enum.Font.SourceSans, 
                TextSize = 20, 
                ZIndex = 8
            })
        });
    end
};
local v30 = {};
v30.__index = v30;
v30.new = function(v31, v32) --[[ Line: 203 ]] --[[ Name: new ]]
    -- upvalues: v30 (copy), v25 (copy), l_TweenService_0 (copy), v16 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local v33 = setmetatable({}, v30);
    v33._frame = v31 and v25[v31]() or v25.Default();
    v33._isOpen = false;
    v33._openAnimation = l_TweenService_0:Create(v33._frame.PromptScale, v16, {
        Scale = 1
    });
    v33._closeAnimation = l_TweenService_0:Create(v33._frame.PromptScale, v16, {
        Scale = 0
    });
    v33._buttonCount = 0;
    v33._playAnimation = true;
    v33._hideErrorCode = false;
    v33._menuIsOpenKey = "ErrorPrompt";
    if v32 then
        if v32.PlayAnimation ~= nil then
            v33._playAnimation = v32.PlayAnimation;
        end;
        if v32.HideErrorCode ~= nil then
            v33._hideErrorCode = v32.HideErrorCode;
        end;
        if v32.MenuIsOpenKey ~= nil then
            v33._menuIsOpenKey = v32.MenuIsOpenKey;
        end;
        v33._frame.MessageArea.ErrorFrame.ErrorMessage.TextScaled = v32.MessageTextScaled or false;
    end;
    if l_UserInputService_0.GamepadEnabled then
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 236 ]]
            -- upvalues: v33 (copy), l_GuiService_0 (ref)
            if v33._isOpen and l_GuiService_0.SelectedCoreObject == nil then
                l_GuiService_0:Select(v33._frame.MessageArea.ErrorFrame.ButtonArea);
            end;
        end);
    end;
    return v33;
end;
v30._open = function(v34, v35, v36) --[[ Line: 246 ]] --[[ Name: _open ]]
    -- upvalues: v15 (copy), l_RobloxGui_0 (copy), v10 (copy), l_GuiService_0 (copy), v14 (copy), l_VRService_0 (copy)
    v34:setErrorText(v35, v36);
    if v15() then
        v34:resizeHeight(l_RobloxGui_0.AbsoluteSize.Y);
    else
        v34:resizeHeight();
    end;
    if not v34._isOpen then
        v10.push("ErrorPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        l_GuiService_0:SetMenuIsOpen(true, v34._menuIsOpenKey);
        v34._frame.Visible = true;
        v34._isOpen = true;
        if v34._playAnimation then
            v34._openAnimation:Play();
            v34._openAnimation.Completed:wait();
            v34._frame.PromptScale.Scale = 1;
        else
            v34._frame.PromptScale.Scale = 1;
        end;
        if not v14 and (l_VRService_0.VREnabled or l_GuiService_0:IsTenFootInterface()) then
            l_GuiService_0:Select(v34._frame.MessageArea.ErrorFrame.ButtonArea);
        end;
    end;
    if v14 and v34._isOpen and (l_VRService_0.VREnabled or l_GuiService_0:IsTenFootInterface()) then
        l_GuiService_0:Select(v34._frame.MessageArea.ErrorFrame.ButtonArea);
    end;
end;
v30._close = function(v37) --[[ Line: 280 ]] --[[ Name: _close ]]
    -- upvalues: v10 (copy), l_GuiService_0 (copy)
    if v37._isOpen then
        v10.pop("ErrorPromptOverride");
        l_GuiService_0:SetMenuIsOpen(false, v37._menuIsOpenKey);
        v37._isOpen = false;
        if v37._playAnimation then
            v37._closeAnimation:Play();
            v37._closeAnimation.Completed:wait();
        else
            v37._frame.PromptScale.Scale = 0;
        end;
        v37._frame.Visible = false;
    end;
end;
v30.setParent = function(v38, v39) --[[ Line: 295 ]] --[[ Name: setParent ]]
    v38._frame.Parent = v39;
end;
v30.setErrorText = function(v40, v41, v42) --[[ Line: 299 ]] --[[ Name: setErrorText ]]
    -- upvalues: l_FFlag_0 (copy), v17 (ref)
    local l_ErrorMessage_0 = v40._frame.MessageArea.ErrorFrame.ErrorMessage;
    if v40._hideErrorCode then
        l_ErrorMessage_0.Text = v41;
        return;
    elseif l_FFlag_0 then
        local v44 = -1;
        if v42 then
            v44 = v42.Value;
        end;
        local v45 = ("Error Code: %d"):format(v44);
        local v46 = {
            ERROR_CODE = tostring(v44)
        };
        local v47;
        if not v17 then
            v47 = v45;
        else
            local l_pcall_0 = pcall;
            local v49 = "InGame.ConnectionError.Message.ErrorCode";
            local v50;
            l_pcall_0, v50 = l_pcall_0(function() --[[ Line: 41 ]]
                -- upvalues: v17 (ref), v49 (copy), v46 (copy)
                return v17:FormatByKey(v49, v46);
            end);
            v47 = l_pcall_0 and v50 or v45;
        end;
        l_ErrorMessage_0.Text = ("%s\n(%s)"):format(v41, v47);
        return;
    elseif not v42 then
        l_ErrorMessage_0.Text = ("%s\n(Error Code: -1)"):format(v41);
        return;
    else
        l_ErrorMessage_0.Text = ("%s\n(Error Code: %d)"):format(v41, v42.Value);
        return;
    end;
end;
v30.setErrorTitle = function(v51, v52, v53) --[[ Line: 327 ]] --[[ Name: setErrorTitle ]]
    -- upvalues: v17 (ref)
    if not v52 then
        return;
    else
        local l_ErrorTitle_0 = v51._frame.TitleFrame.ErrorTitle;
        if v53 then
            local v55;
            if not v17 then
                v55 = v52;
            else
                local l_pcall_1 = pcall;
                local v57 = nil;
                local v58;
                l_pcall_1, v58 = l_pcall_1(function() --[[ Line: 41 ]]
                    -- upvalues: v17 (ref), v53 (copy), v57 (copy)
                    return v17:FormatByKey(v53, v57);
                end);
                v55 = l_pcall_1 and v58 or v52;
            end;
            l_ErrorTitle_0.Text = v55;
            return;
        else
            l_ErrorTitle_0.Text = v52;
            return;
        end;
    end;
end;
v30.onErrorChanged = function(v59, v60, v61) --[[ Line: 339 ]] --[[ Name: onErrorChanged ]]
    if v60 == "" then
        v59:_close();
        return;
    else
        if v60 ~= "" then
            v59:_open(v60, v61);
        end;
        return;
    end;
end;
v30._relayout = function(v62) --[[ Line: 348 ]] --[[ Name: _relayout ]]
    -- upvalues: v11 (copy)
    local l_ButtonArea_0 = v62._frame.MessageArea.ErrorFrame.ButtonArea;
    if v62._buttonCount == 0 then
        l_ButtonArea_0.Visible = false;
        return;
    else
        local v64 = (v62._frame.Size.X.Offset - (v62._buttonCount - 1) * v11.BUTTON_CELL_PADDING - 2 * v11.SIDE_PADDING) / v62._buttonCount;
        l_ButtonArea_0.Visible = true;
        l_ButtonArea_0.ButtonLayout.CellSize = UDim2.new(0, v64, 0, v11.BUTTON_HEIGHT);
        return;
    end;
end;
v30.clearButtons = function(v65) --[[ Line: 360 ]] --[[ Name: clearButtons ]]
    local l_ButtonArea_1 = v65._frame.MessageArea.ErrorFrame.ButtonArea;
    if v65._primaryShimmer then
        v65._primaryShimmer = nil;
    end;
    local l_l_ButtonArea_1_Children_0 = l_ButtonArea_1:GetChildren();
    for _, v69 in pairs(l_l_ButtonArea_1_Children_0) do
        if v69.name ~= "ButtonLayout" then
            v69:Destroy();
        end;
    end;
end;
v30.updateButtons = function(v70, v71, v72) --[[ Line: 393 ]] --[[ Name: updateButtons ]]
    -- upvalues: v17 (ref), v29 (copy), v12 (copy)
    if not v71 then
        v71 = {};
    end;
    if not v72 then
        v72 = "Default";
    end;
    v70:clearButtons();
    local l_ButtonArea_2 = v70._frame.MessageArea.ErrorFrame.ButtonArea;
    local v74 = 0;
    for _, v76 in pairs(v71) do
        local l_Text_0 = v76.Text;
        if v76.LocalizationKey then
            local l_LocalizationKey_0 = v76.LocalizationKey;
            local l_Text_1 = v76.Text;
            if not v17 then
                l_Text_0 = l_Text_1;
            else
                local l_pcall_2 = pcall;
                local v81 = nil;
                local l_l_LocalizationKey_0_0 = l_LocalizationKey_0 --[[ copy: 11 -> 16 ]];
                local v83;
                l_pcall_2, v83 = l_pcall_2(function() --[[ Line: 41 ]]
                    -- upvalues: v17 (ref), l_l_LocalizationKey_0_0 (copy), v81 (copy)
                    return v17:FormatByKey(l_l_LocalizationKey_0_0, v81);
                end);
                l_Text_0 = l_pcall_2 and v83 or l_Text_1;
            end;
        end;
        local v84 = v29[v72](l_Text_0, v76.LayoutOrder, v76.Primary);
        if v76.Primary then
            v70._primaryShimmer = v12.new(v84, "PrimaryButton");
        end;
        v84.Parent = l_ButtonArea_2;
        v84.Activated:connect(v76.Callback);
        v74 = v74 + 1;
    end;
    if v70._buttonCount ~= v74 then
        v70._buttonCount = v74;
        v70:_relayout();
    end;
end;
v30.primaryShimmerPlay = function(v85) --[[ Line: 427 ]] --[[ Name: primaryShimmerPlay ]]
    if v85._primaryShimmer then
        v85._primaryShimmer:play();
    end;
end;
v30.primaryShimmerStop = function(v86) --[[ Line: 433 ]] --[[ Name: primaryShimmerStop ]]
    if v86._primaryShimmer then
        v86._primaryShimmer:stop();
    end;
end;
v30.resizeWidthAndHeight = function(v87, v88, v89) --[[ Line: 439 ]] --[[ Name: resizeWidthAndHeight ]]
    v87:resizeWidth(v88);
    v87:resizeHeight(v89);
    v87:_relayout();
end;
v30.resizeWidth = function(v90, v91) --[[ Line: 447 ]] --[[ Name: resizeWidth ]]
    -- upvalues: v11 (copy), v15 (copy)
    local l_Offset_0 = v90._frame.Size.X.Offset;
    local v93 = v91 - 2 * v11.SIDE_MARGIN;
    if v11.ERROR_PROMPT_MAX_WIDTH.Default < v93 then
        if l_Offset_0 == v11.ERROR_PROMPT_MAX_WIDTH.Default then
            return;
        else
            v93 = v11.ERROR_PROMPT_MAX_WIDTH.Default;
        end;
    end;
    if v93 < v11.ERROR_PROMPT_MIN_WIDTH.Default then
        if l_Offset_0 == v11.ERROR_PROMPT_MIN_WIDTH.Default then
            return;
        else
            v93 = v11.ERROR_PROMPT_MIN_WIDTH.Default;
        end;
    end;
    v90._frame.Size = UDim2.new(0, v93, 0, v90._frame.Size.Y.Offset);
    if not v15() then
        v90:resizeHeight();
        v90:_relayout();
    end;
end;
v30.resizeHeight = function(v94, v95) --[[ Line: 476 ]] --[[ Name: resizeHeight ]]
    -- upvalues: v11 (copy), l_TextService_0 (copy), v15 (copy)
    local l_ErrorMessage_1 = v94._frame.MessageArea.ErrorFrame.ErrorMessage;
    local v97 = Vector2.new(v94._frame.Size.X.Offset - 2 * v11.SIDE_PADDING, 1000);
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_ErrorMessage_1.Text, l_ErrorMessage_1.TextSize, l_ErrorMessage_1.Font, v97);
    local v99 = v11.ERROR_TITLE_FRAME_HEIGHT.Default + l_l_TextService_0_TextSize_0.Y + v11.SPLIT_LINE_THICKNESS + v11.BUTTON_HEIGHT + v11.LAYOUT_PADDING + 2 * v11.SIDE_PADDING + 1;
    if v15() then
        v99 = math.max(math.min(v99, v95 - 2 * v11.VERTICAL_MARGIN), v11.ERROR_PROMPT_MIN_HEIGHT.Default);
    end;
    v94._frame.Size = UDim2.new(0, v94._frame.Size.X.Offset, 0, v99);
end;
return v30;