local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_0.Common.TextKeys);
local v4 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v4.EventNames;
local l_useAnalytics_0 = v4.useAnalytics;
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_RoactFitComponents_0 = v2.RoactFitComponents;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_SocialLibraries_0 = v2.SocialLibraries;
local v12 = require(l_Parent_1.RoactUtils);
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_useEffectOnce_0 = v12.Hooks.useEffectOnce;
local l_CallbackInputBox_0 = l_SocialLibraries_0.Components.CallbackInputBox;
return function(v24) --[[ Line: 50 ]]
    -- upvalues: l_React_0 (copy), l_useEffectOnce_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_useAnalytics_0 (copy), l_EventNames_0 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), l_ShimmerPanel_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_ButtonType_0 (copy)
    local v25 = l_React_0.useRef(nil);
    local v26, v27 = l_React_0.useState(Vector2.new(0, 0));
    local v28, v29 = l_React_0.useState(v24.alias);
    local v30 = if v24.alias then utf8.len(v24.alias) or 0 else 0;
    local v31, v32 = l_React_0.useState(v30);
    l_useEffectOnce_0(function() --[[ Line: 57 ]]
        -- upvalues: v29 (copy), v24 (copy), v32 (copy), v30 (copy)
        v29(v24.alias);
        v32(v30);
    end, v24.isLoading == false);
    local v33 = l_useStyle_0();
    local l_Font_0 = v33.Font;
    local l_Theme_0 = v33.Theme;
    local v36 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v37 = l_useLocalization_0({
        titleText = v3.CUSTOMIZE_NAME_MODAL_TITLE, 
        cancelButtonText = v3.CANCEL_BUTTON, 
        saveButtonText = v3.SAVE_BUTTON, 
        descriptionText = if v24.displayName then {
            v3.SET_CUSTOM_NAME_DESCRIPTION; 
            displayName = v24.displayName
        } else v3.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION, 
        recognizeFriendsByCustomNameText = v3.RECOGNIZE_FRIENDS_BY_CUSTOM_NAME_DESCRIPTION, 
        customNamePlaceholderText = v3.CUSTOM_NAME_PLACEHOLDER, 
        invalidAliasErrorText = v3.INVALID_ALIAS_ERROR
    });
    local v38 = l_useAnalytics_0();
    local v39 = l_React_0.useRef(false);
    local v40 = not v24.hasSaveAliasError;
    local v42 = l_React_0.useCallback(function(v41) --[[ Line: 85 ]]
        -- upvalues: v26 (copy), v27 (copy)
        if v26.X ~= v41.AbsoluteSize.X then
            v27(v41.AbsoluteSize);
        end;
    end, {
        v26
    });
    local function v43() --[[ Line: 91 ]]
        -- upvalues: v24 (copy), v28 (copy)
        v24.saveOnActivated(v28);
    end;
    local function v44() --[[ Line: 95 ]]
        -- upvalues: v38 (copy), l_EventNames_0 (ref), v24 (copy)
        if v38 then
            v38.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalClosed);
        end;
        v24.cancelOnActivated();
    end;
    local function v48(v45) --[[ Line: 102 ]]
        -- upvalues: v31 (copy), v28 (copy), v25 (copy), v32 (copy), v29 (copy), v24 (copy), v38 (copy), l_EventNames_0 (ref), v39 (copy)
        local v46 = utf8.len(v45);
        if v46 == nil then
            return;
        else
            local l_v46_0 = v46;
            if l_v46_0 > 20 then
                v45 = if v31 == 20 then v28 else string.sub(v45, 1, utf8.offset(v45, 21) - 1);
                l_v46_0 = 20;
                if v25 and v25.current then
                    v25.current.Text = v45;
                end;
            end;
            v32(l_v46_0);
            v29(v45);
            if v24.onTextChanged then
                v24.onTextChanged();
            end;
            if l_v46_0 == 0 and v38 then
                v38.fireAnalyticsEvent(l_EventNames_0.CustomizeNameClearedInput);
            end;
            if l_v46_0 == 20 and v38 and not v39.current then
                v39.current = true;
                v38.fireAnalyticsEvent(l_EventNames_0.CustomizeNameMaximumCharLimitTyped, {
                    alias = v45
                });
            end;
            return;
        end;
    end;
    return l_React_0.createElement(l_InteractiveAlert_0, {
        title = v37.titleText, 
        screenSize = v24.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, v26.Y), 
        middleContent = function() --[[ Line: 156 ]] --[[ Name: middleContent ]]
            -- upvalues: l_React_0 (ref), l_FitFrameVertical_0 (ref), v42 (copy), l_FitTextLabel_0 (ref), v26 (copy), l_Font_0 (copy), v37 (copy), l_Theme_0 (copy), v24 (copy), l_ShimmerPanel_0 (ref), v36 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_CallbackInputBox_0 (ref), l_IconSize_0 (ref), v48 (copy), v25 (copy), v31 (copy)
            return l_React_0.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                contentPadding = UDim.new(0, 16), 
                [l_React_0.Change.AbsoluteSize] = v42
            }, {
                InputGroup = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Description = l_React_0.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v26.X, 
                        Font = l_Font_0.Body.Font, 
                        Text = v37.descriptionText, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        RichText = true
                    }), 
                    RecognizeFriendsByCustomNameContainer = l_React_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    }, {
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 2), 
                            PaddingBottom = UDim.new(0, 24)
                        }), 
                        RecognizeFriendsByCustomName = l_React_0.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            TextWrapped = true, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            maximumWidth = v26.X, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = v37.recognizeFriendsByCustomNameText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    }), 
                    LoadingShimmer = if v24.isLoading then l_React_0.createElement(l_ShimmerPanel_0, {
                        Size = UDim2.new(1, 0, 0, v36 + 20), 
                        LayoutOrder = 3, 
                        cornerRadius = UDim.new(0, 8)
                    }) else nil, 
                    InputBackground = if not v24.isLoading then l_React_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v36 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v36 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if v24.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = l_React_0.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12)
                            }), 
                            Textbox = l_React_0.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v36, 
                                initialInputText = v24.alias, 
                                placeholderText = v37.customNamePlaceholderText, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = v48, 
                                inputBoxRef = v25
                            })
                        })
                    }) else nil
                }), 
                Counter = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2
                }, {
                    l_React_0.createElement(l_FitTextLabel_0, {
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v26.X, 
                        Font = l_Font_0.CaptionBody.Font, 
                        Text = if v24.hasSaveAliasError then v37.invalidAliasErrorText else string.format("%d/%d", v31, 20), 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                        TextColor3 = if not (v31 ~= 20) or v24.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                        TextTransparency = if not (v31 ~= 20) or v24.hasSaveAliasError then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                        AnchorPoint = if v24.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5), 
                        Position = if v24.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
                    }, {
                        UISizeConstraint = l_React_0.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(1e999, l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 2)
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
                        onActivated = v44, 
                        text = v37.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v43, 
                        text = v37.saveButtonText, 
                        isDisabled = not v40
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;