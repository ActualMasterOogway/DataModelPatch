local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.ArgCheck);
local v11 = require(l_Parent_0.t);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v16 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v16.AppEventIngestService;
local l_RoactNetworking_0 = v16.RoactNetworking;
local v19 = require(l_Parent_0.ToastRodux);
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_SetCurrentToastMessage_0 = v19.Actions.SetCurrentToastMessage;
local l_UserInputService_0 = game:GetService("UserInputService");
local v23 = require(l_script_FirstAncestor_0.Thunks.SubmitGamePlayerFeedback);
local _ = require(l_script_FirstAncestor_0.Types);
local v25 = require(l_script_FirstAncestor_0.Analytics.Events.PlayerFeedbackEvents);
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
local function v40(v28) --[[ Line: 49 ]] --[[ Name: CategoryCheckboxes ]]
    -- upvalues: v2 (copy), v9 (copy), l_Checkbox_0 (copy)
    local l_category_0 = v28.category;
    local l_selectedCategoryIds_0 = v28.selectedCategoryIds;
    local l_onOptionSelected_0 = v28.onOptionSelected;
    local v32 = {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, -8)
        })
    };
    local v37 = v2.useCallback(function(v33) --[[ Line: 61 ]]
        -- upvalues: v9 (ref), l_selectedCategoryIds_0 (copy), l_onOptionSelected_0 (copy)
        return function(v34) --[[ Line: 62 ]]
            -- upvalues: v9 (ref), l_selectedCategoryIds_0 (ref), v33 (copy), l_onOptionSelected_0 (ref)
            local v35 = nil;
            v35 = if v34 then v9.List.join(l_selectedCategoryIds_0, {
                v33
            }) else v9.List.filter(l_selectedCategoryIds_0, function(v36) --[[ Line: 67 ]]
                -- upvalues: v33 (ref)
                return v36 ~= v33;
            end);
            l_onOptionSelected_0(v35);
        end;
    end, {
        l_selectedCategoryIds_0
    });
    for v38, v39 in ipairs(l_category_0.options) do
        v32["Checkbox" .. v38] = v2.createElement(l_Checkbox_0, {
            text = v39.label, 
            isSelected = v9.List.find(l_selectedCategoryIds_0, v39.id) ~= nil, 
            onActivated = v37(v39.id), 
            size = UDim2.new(1, 0, 0, 36), 
            layoutOrder = v38
        });
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v28.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0)
    }, v32);
end;
local function _(v41) --[[ Line: 98 ]] --[[ Name: getTextLength ]]
    if utf8.len(v41) then
        return (utf8.len(utf8.nfcnormalize(v41)));
    else
        return (string.len(v41));
    end;
end;
local v43 = v10.wrap(v11.interface({
    closeCentralOverlayThunk = v11.callback, 
    universeId = v11.string, 
    playerFeedbackMetadata = v11.strictInterface({
        rootPlaceId = v11.string, 
        canSubmitReview = v11.boolean, 
        canSubmitComment = v11.boolean, 
        categoryType = v11.string, 
        category = v11.interface({
            type = v11.string, 
            label = v11.string, 
            allows_multiple_selections = v11.boolean, 
            options = v11.array(v11.interface({
                id = v11.string, 
                label = v11.string
            }))
        }), 
        comment = v11.interface({
            label = v11.string, 
            placeholder_text = v11.string, 
            minimum_length = v11.number, 
            maximum_length = v11.number
        }), 
        metadata = v11.interface({
            disclaimer_label = v11.string, 
            submit_button_label = v11.string, 
            form_title_label = v11.string
        })
    }), 
    onSubmitted = v11.optional(v11.callback)
}));
return function(v44) --[[ Line: 134 ]] --[[ Name: GamePlayerFeedbackFormModal ]]
    -- upvalues: v43 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), l_useState_0 (copy), v2 (copy), l_useLocalization_0 (copy), v25 (copy), v23 (copy), l_SetCurrentToastMessage_0 (copy), l_SetNetworkingErrorToast_0 (copy), l_useEffect_0 (copy), l_UserInputService_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_VerticalScrollView_0 (copy), v40 (copy)
    assert(v43(v44));
    local v45 = l_useStyle_0();
    local v46 = l_useDispatch_0();
    local v47 = l_useRoactService_0(l_RoactNetworking_0);
    local v48 = l_useRoactService_0(l_AppEventIngestService_0);
    local l_Tokens_0 = v45.Tokens;
    local v51 = l_useSelector_0(function(v50) --[[ Line: 143 ]]
        return v50.ScreenSize;
    end);
    local v54 = l_useSelector_0(function(v52) --[[ Line: 146 ]]
        local l_GlobalGuiInset_0 = v52.GlobalGuiInset;
        return l_GlobalGuiInset_0 and l_GlobalGuiInset_0.bottom or 0;
    end);
    local v55, v56 = l_useState_0(false);
    local v57, v58 = l_useState_0(0);
    local v59 = v55 and -v57 + v54 or 0;
    local v60 = v55 and 0 or 48;
    local v61, v62 = l_useState_0(0);
    local v63 = v2.useRef(nil);
    local v64 = v51.Y - v57 - 48 - 48 - 36 - 48 - v60;
    local l_playerFeedbackMetadata_0 = v44.playerFeedbackMetadata;
    local l_categoryType_0 = l_playerFeedbackMetadata_0.categoryType;
    local l_category_1 = l_playerFeedbackMetadata_0.category;
    local l_metadata_0 = l_playerFeedbackMetadata_0.metadata;
    local l_comment_0 = l_playerFeedbackMetadata_0.comment;
    local l_rootPlaceId_0 = l_playerFeedbackMetadata_0.rootPlaceId;
    local v71, v72 = l_useState_0("");
    local v73, v74 = l_useState_0({});
    local v75 = l_playerFeedbackMetadata_0.canSubmitComment and #v73 > 0;
    local v76, v77 = l_useState_0(nil);
    local v78 = l_useLocalization_0({
        commentTooLongMessage = {
            "PlayerFeedbacks.VoteForm.Message.MaxLengthCharacters"; 
            count = l_comment_0.maximum_length
        }, 
        commentTooShortMessage = {
            "PlayerFeedbacks.VoteForm.Message.MinLengthCharacters"; 
            count = l_comment_0.minimum_length
        }
    });
    local v79 = false;
    if #v73 > 0 then
        v79 = v76 == nil;
    end;
    local v80 = v2.useCallback(function() --[[ Line: 188 ]]
        -- upvalues: v25 (ref), v48 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v46 (copy), v44 (copy)
        v25.DismissPlayerFeedbackFormModal(v48, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        v46(v44.closeCentralOverlayThunk());
    end, {
        v44.closeCentralOverlayThunk, 
        l_categoryType_0, 
        l_rootPlaceId_0, 
        v48
    });
    local v82 = v2.useCallback(function(v81) --[[ Line: 193 ]]
        -- upvalues: v25 (ref), v48 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v74 (copy)
        v25.TogglePlayerFeedbackFormModalReason(v48, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        v74(v81);
    end, {});
    local v86 = v2.useCallback(function() --[[ Line: 203 ]]
        -- upvalues: v25 (ref), v48 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy), v73 (copy), v71 (copy), l_comment_0 (copy), v77 (copy), v78 (copy), v46 (copy), v23 (ref), v47 (copy), l_SetCurrentToastMessage_0 (ref), v44 (copy), v80 (copy), l_SetNetworkingErrorToast_0 (ref)
        v25.ClickPlayerFeedbackFormModalSubmit(v48, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
        if #v73 == 0 then
            return;
        else
            local l_v71_0 = v71;
            if (if utf8.len(l_v71_0) then utf8.len(utf8.nfcnormalize(l_v71_0)) else string.len(l_v71_0)) > 0 then
                l_v71_0 = v71;
                if (if utf8.len(l_v71_0) then utf8.len(utf8.nfcnormalize(l_v71_0)) else string.len(l_v71_0)) < l_comment_0.minimum_length then
                    v25.SubmitPlayerFeedbackFailCommentValidation(v48, l_rootPlaceId_0, {
                        categoryType = l_categoryType_0, 
                        value = "CommentTooShort"
                    });
                    v77(v78.commentTooShortMessage);
                    return;
                end;
            end;
            l_v71_0 = v71;
            if (if utf8.len(l_v71_0) then utf8.len(utf8.nfcnormalize(l_v71_0)) else string.len(l_v71_0)) > l_comment_0.maximum_length then
                v25.SubmitPlayerFeedbackFailCommentValidation(v48, l_rootPlaceId_0, {
                    categoryType = l_categoryType_0, 
                    value = "CommentTooLong"
                });
                v77(v78.commentTooLongMessage);
                return;
            else
                v46(v23.Post(v47, l_rootPlaceId_0, l_categoryType_0, v73, v71)):andThen(function(_) --[[ Line: 233 ]]
                    -- upvalues: v46 (ref), l_SetCurrentToastMessage_0 (ref), v44 (ref), v80 (ref)
                    v46(l_SetCurrentToastMessage_0({
                        toastMessage = "PlayerFeedbacks.VoteForm.Message.SubmitSuccess"
                    }));
                    if v44.onSubmitted then
                        v44.onSubmitted();
                    end;
                    v80();
                end, function(v85) --[[ Line: 241 ]]
                    -- upvalues: v46 (ref), l_SetNetworkingErrorToast_0 (ref)
                    v46(l_SetNetworkingErrorToast_0(v85));
                end);
                return;
            end;
        end;
    end, {
        v47, 
        v48, 
        l_comment_0.maximum_length, 
        l_comment_0.minimum_length, 
        v78.commentTooShortMessage, 
        v78.commentTooLongMessage, 
        l_rootPlaceId_0, 
        l_categoryType_0, 
        v73, 
        v71, 
        v44.onSubmitted, 
        v80
    });
    l_useEffect_0(function() --[[ Line: 261 ]]
        -- upvalues: v25 (ref), v48 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy)
        v25.PlayerFeedbackFormModalMounted(v48, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
    end, {
        v48, 
        l_rootPlaceId_0, 
        l_categoryType_0
    });
    local v87 = v2.useCallback(function() --[[ Line: 265 ]]
        -- upvalues: v25 (ref), v48 (copy), l_rootPlaceId_0 (copy), l_categoryType_0 (copy)
        v25.FocusPlayerFeedbackFormModalComment(v48, l_rootPlaceId_0, {
            categoryType = l_categoryType_0
        });
    end, {
        v48, 
        l_rootPlaceId_0, 
        l_categoryType_0
    });
    local v92 = v2.useCallback(function(v88) --[[ Line: 273 ]]
        -- upvalues: v72 (copy), l_comment_0 (copy), v76 (copy), v77 (copy)
        local l_Text_0 = v88.Text;
        v72(l_Text_0);
        local v90 = if utf8.len(l_Text_0) then utf8.len(utf8.nfcnormalize(l_Text_0)) else string.len(l_Text_0);
        local v91 = true;
        if v90 ~= 0 then
            v91 = false;
            if l_comment_0.minimum_length <= v90 then
                v91 = v90 <= l_comment_0.maximum_length;
            end;
        end;
        if v76 and v91 then
            v77(nil);
        end;
    end, {
        v76, 
        l_comment_0.minimum_length, 
        l_comment_0.maximum_length
    });
    l_useEffect_0(function() --[[ Line: 285 ]]
        -- upvalues: v63 (copy), v57 (copy)
        if not v63 or not v63.current or v57 == 0 then
            return;
        else
            v63.current.CanvasPosition = Vector2.new(0, v63.current.AbsoluteCanvasSize.Y);
            return;
        end;
    end, {
        v63, 
        v57
    });
    l_useEffect_0(function() --[[ Line: 293 ]]
        -- upvalues: l_UserInputService_0 (ref), v56 (copy), v58 (copy)
        local v93 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 296 ]]
            -- upvalues: v56 (ref), l_UserInputService_0 (ref), v58 (ref)
            v56(l_UserInputService_0.OnScreenKeyboardVisible);
            v58(l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        return function() --[[ Line: 303 ]]
            -- upvalues: v93 (ref)
            if v93 then
                v93:Disconnect();
            end;
            v93 = nil;
        end;
    end, {});
    return v2.createElement(l_PartialPageModal_0, {
        title = l_metadata_0.form_title_label, 
        screenSize = v51, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v86, 
                        isDisabled = v79 == false, 
                        text = l_metadata_0.submit_button_label
                    }
                }
            }
        }, 
        onCloseClicked = v80, 
        position = v55 and UDim2.new(0.5, 0, 1, v59) or nil, 
        anchorPoint = v55 and Vector2.new(0.5, 1) or nil, 
        marginSize = 0
    }, {
        Content = v2.createElement(l_VerticalScrollView_0, {
            size = UDim2.new(1, 0, 0, (math.min(v61 + 48, v64))), 
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(), 
            elasticBehavior = Enum.ElasticBehavior.Never, 
            scrollingFrameRef = v63, 
            ref = v63
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 12), 
                [v2.Change.AbsoluteContentSize] = function(v94) --[[ Line: 344 ]]
                    -- upvalues: v62 (copy)
                    v62(v94.AbsoluteContentSize.Y);
                end
            }), 
            ContentPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            CheckboxesLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = l_category_1.label, 
                TextSize = v45.Font.BaseSize, 
                TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = l_Tokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                Font = l_Tokens_0.Semantic.Typography.Subheader.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 0
            }), 
            CategoryCheckboxes = v2.createElement(v40, {
                category = l_category_1, 
                selectedCategoryIds = v73, 
                onOptionSelected = v82, 
                layoutOrder = 1
            }), 
            CommmentLabel = v75 and v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = l_comment_0.label, 
                TextSize = v45.Font.BaseSize, 
                TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = l_Tokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                Font = l_Tokens_0.Semantic.Typography.Subheader.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 2
            }), 
            Commment = v75 and v2.createElement("Frame", {
                BorderSizePixel = 1, 
                BackgroundColor3 = l_Tokens_0.Semantic.Color.Background.Muted.Color3, 
                BackgroundTransparency = l_Tokens_0.Semantic.Color.Background.Muted.Transparency, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Tokens_0.Semantic.Radius.Small)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingBottom = UDim.new(0, 8), 
                    PaddingLeft = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 8)
                }), 
                TextBox = v2.createElement("TextBox", {
                    Text = v71, 
                    PlaceholderText = l_comment_0.placeholder_text, 
                    PlaceholderColor3 = l_Tokens_0.Semantic.Color.Text.Default.Color3, 
                    Size = UDim2.new(1, 0, 0, 100), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    ClearTextOnFocus = false, 
                    MultiLine = true, 
                    TextWrapped = true, 
                    ClipsDescendants = true, 
                    OverlayNativeInput = true, 
                    TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = l_Tokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                    BackgroundColor3 = l_Tokens_0.Semantic.Color.Background.Muted.Color3, 
                    BackgroundTransparency = l_Tokens_0.Semantic.Color.Background.Muted.Transparency, 
                    Font = l_Tokens_0.Semantic.Typography.Body.Font, 
                    TextSize = l_Tokens_0.Semantic.Typography.Body.FontSize, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BorderSizePixel = 0, 
                    [v2.Change.Text] = v92, 
                    [v2.Event.Focused] = v87
                })
            }), 
            HelperText = if v75 and v76 ~= nil then v2.createElement("TextLabel", {
                Text = v76, 
                TextTransparency = l_Tokens_0.Component.HelperText.Error.ContentColor.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextColor3 = l_Tokens_0.Component.HelperText.Error.ContentColor.Color3, 
                Font = l_Tokens_0.Component.HelperText.Base.Typography.Font, 
                TextSize = l_Tokens_0.Semantic.Typography.CaptionHeader.FontSize, 
                LineHeight = l_Tokens_0.Component.HelperText.Base.Typography.LineHeight, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 4
            }) else nil, 
            DisclaimerText = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Font = v45.Font.CaptionHeader.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Text = l_metadata_0.disclaimer_label, 
                TextSize = l_Tokens_0.Semantic.Typography.CaptionHeader.FontSize, 
                TextColor3 = l_Tokens_0.Semantic.Color.Text.Muted.Color3, 
                TextTransparency = l_Tokens_0.Semantic.Color.Text.Muted.Transparency, 
                LineHeight = l_Tokens_0.Global.LineHeight_400, 
                LayoutOrder = 5
            })
        })
    });
end;