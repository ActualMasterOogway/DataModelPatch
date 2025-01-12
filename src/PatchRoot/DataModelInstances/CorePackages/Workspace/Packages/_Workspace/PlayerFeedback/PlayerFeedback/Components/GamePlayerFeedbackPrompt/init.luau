local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InlinePrompt_0 = require(l_Parent_0.AppBlox).InlinePrompt;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.RobloxAppHooks);
local v7 = require(l_Parent_0.RoactServiceTags);
local l_useRoactService_0 = v6.useRoactService;
local l_AppEventIngestService_0 = v7.AppEventIngestService;
local v10 = require(l_script_FirstAncestor_0.Analytics.Events.PlayerFeedbackEvents);
local l_Images_0 = v3.App.ImageSet.Images;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v14) --[[ Line: 25 ]] --[[ Name: GamePlayerFeedbackPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v2 (copy), v10 (copy), l_InlinePrompt_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v15 = l_useLocalization_0({
        buttonLabelKey = "PlayerFeedbacks.VoteForm.PromptBanner.GiveFeedbackButton", 
        messageKey = "PlayerFeedbacks.VoteForm.PromptBanner.Message", 
        titleKey = "PlayerFeedbacks.VoteForm.PromptBanner.Title"
    });
    local v16 = l_useRoactService_0(l_AppEventIngestService_0);
    local v17 = v2.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v10 (ref), v16 (copy), v14 (copy)
        v10.ClickPlayerFeedbackPromptCta(v16, v14.placeId);
        v14.onButtonClick();
    end, {
        v16, 
        v14.placeId, 
        v14.onButtonClick
    });
    local v18 = v2.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v10 (ref), v16 (copy), v14 (copy)
        v10.DismissPlayerFeedbackPrompt(v16, v14.placeId);
        v14.onDimiss();
    end, {
        v16, 
        v14.placeId, 
        v14.onDimiss
    });
    v2.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v10 (ref), v16 (copy), v14 (copy)
        v10.PlayerFeedbackPromptMounted(v16, v14.placeId);
    end, {
        v16, 
        v14.placeId
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = if v14.width then UDim2.new(0, v14.width, 0, 0) else UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v14.LayoutOrder
    }, {
        InlinePrompt = v2.createElement(l_InlinePrompt_0, {
            iconImage = l_Images_0["icons/menu/platformChatOff"], 
            titleMessage = v15.titleKey, 
            sublineMessage = v15.messageKey, 
            buttonProps = {
                text = v15.buttonLabelKey, 
                buttonType = l_ButtonType_0.Secondary, 
                standardSize = l_StandardButtonSize_0.XSmall, 
                onActivated = v17
            }, 
            showDismiss = true, 
            onDismiss = v18, 
            backgroundTransparency = v14.backgroundTransparency, 
            backgroundColor3 = v14.backgroundColor3
        })
    });
end;