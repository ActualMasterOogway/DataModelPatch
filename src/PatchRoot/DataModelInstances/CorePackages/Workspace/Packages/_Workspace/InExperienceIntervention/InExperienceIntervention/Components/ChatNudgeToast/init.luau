local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_Images_0 = v3.App.ImageSet.Images;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = v4.Hooks.useTokens;
local v9 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_Toast_0 = v3.App.Dialog.Toast;
local v11 = game:DefineFastInt("ChatNudgeToastDuration", 5);
ChatNudgeToast = function(v12) --[[ Line: 20 ]] --[[ Name: ChatNudgeToast ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v2 (copy), l_useTokens_0 (copy), v9 (copy), l_Toast_0 (copy), l_Images_0 (copy), v11 (copy)
    local v13 = l_useLocalization_0(v5.localizationKeys);
    local v14 = v2.useRef(DateTime.now().UnixTimestampMillis);
    local v15 = l_useTokens_0();
    local function v16() --[[ Line: 25 ]]
        -- upvalues: v14 (copy), v9 (ref), v12 (copy)
        v14.current = DateTime.now().UnixTimestampMillis;
        v9.sendAnalyticsEvent(v9.Constants.EventTypes.ToastAppeared, v9.Constants.InterventionTypes.Nudge, v14.current, v12.eventId, v12.violatingChatLine, nil);
    end;
    local function v17() --[[ Line: 37 ]]
        -- upvalues: v9 (ref), v14 (copy), v12 (copy)
        v9.sendAnalyticsEvent(v9.Constants.EventTypes.ToastDismissed, v9.Constants.InterventionTypes.Nudge, v14.current, v12.eventId, v12.violatingChatLine, nil);
    end;
    return v2.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        DisplayOrder = 7
    }, {
        Toast = v2.createElement(l_Toast_0, {
            toastContent = {
                toastTitle = v13.ChatBreaksRulesText, 
                iconColorStyle = {
                    Color = v15.Color.System.Warning.Color3, 
                    Transparency = 0
                }, 
                iconImage = l_Images_0["icons/status/error_large"], 
                iconSize = Vector2.new(36, 36), 
                onAppeared = v16, 
                toastSubtitle = v13.TextChatMayBeSuspendedText, 
                sequenceNumber = DateTime.now().UnixTimestamp, 
                onTouchSwipeUp = v17
            }, 
            duration = v11
        })
    });
end;
return ChatNudgeToast;