local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_CallbackInputBox_0 = v3.SocialLibraries.config({}).Components.CallbackInputBox;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v16.clearTimeout;
local l_setTimeout_0 = v16.setTimeout;
local v19 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v20 = require(l_script_FirstAncestor_0.Flags.InternationalNamesIXP);
local v21 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v21.EventNames;
local l_useAnalytics_0 = v21.useAnalytics;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v25 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local v26 = game:DefineFastInt("EditProfileModalNetworkDelay", 500);
return function(v27) --[[ Line: 60 ]]
    -- upvalues: v4 (copy), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (copy), v25 (copy), l_useLocalization_0 (copy), v15 (copy), v19 (copy), l_useAnalytics_0 (copy), l_useStyle_0 (copy), l_setTimeout_0 (copy), v26 (copy), v14 (copy), v20 (copy), l_clearTimeout_0 (copy), l_EventNames_0 (copy), l_HttpService_0 (copy), l_InteractiveAlert_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_ButtonType_0 (copy)
    local v28 = v4.useRef(nil);
    local v29 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v29 = v25();
    end;
    local v30, v31 = v4.useState(v27.initialText);
    local v32 = utf8.len(v30) or 0;
    local v33 = l_useLocalization_0({
        cancelButtonText = v15.CancelButtonText, 
        saveButtonText = v15.SaveButtonText, 
        displayNameFailed = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v15.DisplayNameError, 
        displayNameTooShort = if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then nil else v15.DisplayNameTooShort
    });
    local v34 = if v19.useIsExperimentEnabled() then l_useAnalytics_0() else nil;
    local v35 = l_useStyle_0();
    local l_Font_0 = v35.Font;
    local l_Theme_0 = v35.Theme;
    local v38 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v39, v40 = v4.useState(true);
    local v41, v42 = v4.useState(false);
    local v43, v44 = v4.useState(if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v29.displayNameChangeError else v33.displayNameFailed);
    local v45 = v4.useRef(l_setTimeout_0(function() --[[ Line: 95 ]]

    end, v26));
    local v46 = v4.useRef(false);
    local function v49(v47) --[[ Line: 98 ]] --[[ Name: getErrorMessage ]]
        -- upvalues: v14 (ref), v29 (ref), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v33 (copy)
        local v48 = {
            [v14.DisplayNameValidationErrorCodes.TooShort] = v29.nameTooShortError, 
            [v14.DisplayNameValidationErrorCodes.TooLong] = v29.nameTooLongError, 
            [v14.DisplayNameValidationErrorCodes.InvalidCharacters] = v29.nameUnsupportedCharsError, 
            [v14.DisplayNameValidationErrorCodes.Moderated] = v29.nameInappropriateError, 
            [v14.DisplayNameValidationErrorCodes.Throttled] = v29.nameHasChangedError, 
            [v14.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = v29.displayNameChangeMixedCharactersError
        };
        if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
            return v48[v47] or v29.displayNameChangeError;
        else
            return v33.displayNameFailed;
        end;
    end;
    local function v58(v50) --[[ Line: 115 ]] --[[ Name: textChanged ]]
        -- upvalues: v20 (ref), v27 (copy), v46 (copy), l_clearTimeout_0 (ref), v45 (copy), v40 (copy), v34 (copy), l_EventNames_0 (ref), v44 (copy), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v29 (ref), v33 (copy), v42 (copy), v31 (copy), v32 (copy), v30 (copy), v28 (copy), l_setTimeout_0 (ref), l_HttpService_0 (ref), v49 (copy), v26 (ref)
        if v20.FFlagIsSetupEnabled() and v50 ~= v27.initialText and not v46.current then
            v46.current = true;
            v20.logExposure();
        end;
        l_clearTimeout_0(v45.current);
        v40(false);
        local v51 = utf8.len(v50);
        if v51 == nil then
            return;
        elseif v51 < 3 then
            if v34 then
                v34.fireAnalyticsEvent(l_EventNames_0.DisplayNameTooShort, {
                    displayName = v50
                });
            end;
            v44(if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v29.displayNameTooShortError else v33.displayNameTooShort);
            v42(true);
            v31(v50);
            return;
        elseif v51 > 20 then
            v50 = if v32 == 20 then v30 else string.sub(v50, 1, utf8.offset(v50, 21) - 1);
            v51 = 20;
            if v28 and v28.current then
                v28.current.Text = v50;
            end;
            v31(v50);
            return;
        else
            v31(v50);
            v45.current = l_setTimeout_0(function() --[[ Line: 169 ]]
                -- upvalues: v27 (ref), l_HttpService_0 (ref), v50 (ref), v42 (ref), v40 (ref), v20 (ref), v49 (ref), v34 (ref), l_EventNames_0 (ref), v44 (ref), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v29 (ref), v33 (ref)
                v27.validateDisplayName(l_HttpService_0:UrlEncode(v50)):andThen(function(_) --[[ Line: 172 ]]
                    -- upvalues: v42 (ref), v40 (ref)
                    v42(false);
                    v40(true);
                end):catch(function(v53) --[[ Line: 176 ]]
                    -- upvalues: v20 (ref), l_HttpService_0 (ref), v49 (ref), v34 (ref), l_EventNames_0 (ref), v50 (ref), v44 (ref), l_FFlagRealNamesInDisplayNameExperimentEnabled_0 (ref), v29 (ref), v33 (ref), v42 (ref)
                    local v54 = nil;
                    if v20.FFlagIsSetupEnabled() then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 179 ]]
                            -- upvalues: l_HttpService_0 (ref), v53 (copy)
                            return l_HttpService_0:JSONDecode(v53.Body);
                        end);
                        local v57 = -1;
                        if l_status_0 then
                            v57 = l_result_0 and l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code or -1;
                        end;
                        v54 = v49(v57);
                    end;
                    if v34 then
                        v34.fireAnalyticsEvent(l_EventNames_0.FilteredDisplayName, {
                            displayName = v50
                        });
                    end;
                    v44(if v20.FFlagIsSetupEnabled() then v54 else if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v29.displayNameChangeError else v33.displayNameFailed);
                    v42(true);
                end);
            end, v26);
            return;
        end;
    end;
    return v4.createElement(l_InteractiveAlert_0, {
        title = v27.title, 
        screenSize = v27.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, 117), 
        middleContent = function() --[[ Line: 219 ]] --[[ Name: middleContent ]]
            -- upvalues: v4 (ref), l_Font_0 (copy), v27 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), v38 (copy), l_Images_0 (ref), v41 (copy), l_CallbackInputBox_0 (ref), l_IconSize_0 (ref), v58 (copy), v28 (copy), v43 (copy), v32 (copy)
            return v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                InputGroup = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Description = v4.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = v27.description, 
                        TextSize = 14, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        RichText = true
                    }), 
                    Padding = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 24), 
                        LayoutOrder = 2
                    }), 
                    InputBackground = v4.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v38 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = v4.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v38 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if v41 then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = v4.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12)
                            }), 
                            Textbox = v4.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v38, 
                                initialInputText = v27.initialText, 
                                placeholderText = v27.initialText, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = v58, 
                                inputBoxRef = v28
                            })
                        })
                    }), 
                    AdditonalPadding = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 8), 
                        LayoutOrder = 4
                    }), 
                    Counter = v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 5
                    }, {
                        v4.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = if v41 then v43 else string.format("%d/%d", v32, 20), 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = if not (v32 ~= 20) or v41 then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                            TextTransparency = if not (v32 ~= 20) or v41 then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                            AnchorPoint = if v41 then nil else Vector2.new(1, 0), 
                            Position = if v41 then nil else UDim2.fromScale(1, 0), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }, {
                            UISizeConstraint = v4.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(1e999, l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 2)
                            })
                        })
                    })
                })
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v27.cancelOnActivated, 
                        text = v33.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 206 ]] --[[ Name: onSave ]]
                            -- upvalues: v30 (copy), v27 (copy)
                            if v30 == v27.initialText then
                                v27.cancelOnActivated();
                                return;
                            else
                                v27.saveOnActivated(v30);
                                return;
                            end;
                        end, 
                        text = v33.saveButtonText, 
                        isDisabled = not v39
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;