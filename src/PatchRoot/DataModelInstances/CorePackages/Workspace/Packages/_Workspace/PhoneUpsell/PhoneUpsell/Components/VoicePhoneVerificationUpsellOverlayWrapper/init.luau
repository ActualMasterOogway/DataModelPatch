local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_Parent_0.LuauPolyfill);
local l_PostUserOptIn_0 = require(l_Parent_0.VoiceChat).PostUserOptIn;
local _ = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellOverlay);
local v7 = require(l_script_FirstAncestor_0.Components.UpsellContainer);
local v8 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v9 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v13 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v14 = require(l_Parent_0.UIBlox);
local l_Images_0 = v14.App.ImageSet.Images;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagFixUpsellVerificationToNavigateToOverlays);
local v19 = {
    onSuccess = function() --[[ Line: 39 ]] --[[ Name: onSuccess ]]

    end, 
    closeUpsell = function() --[[ Line: 40 ]] --[[ Name: closeUpsell ]]

    end, 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhoneVoice", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.AddPhoneBodyVoice"
};
return function(v20) --[[ Line: 47 ]] --[[ Name: VoicePhoneVerificationUpsellOverlayWrapper ]]
    -- upvalues: v13 (copy), v19 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v2 (copy), l_useAppPolicy_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_PostUserOptIn_0 (copy), v18 (copy), l_Logging_0 (copy), l_useLocalization_0 (copy), v7 (copy), v9 (copy), v8 (copy)
    local v21 = v13(v19, v20);
    local v22 = l_useRoactService_0(l_RoactNetworking_0);
    local v23, v24 = v2.useState(false);
    local v25, v26 = v2.useState(false);
    local v28 = l_useAppPolicy_0(function(v27) --[[ Line: 54 ]]
        return v27.RequireExplicitVoiceConsent();
    end);
    local v29 = v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(40, 40), 
        Image = l_Images_0["icons/status/success_large"], 
        BackgroundTransparency = 1
    });
    local function v31() --[[ Line: 64 ]]
        -- upvalues: l_PostUserOptIn_0 (ref), v22 (copy), v24 (copy), v18 (ref), v21 (copy), v26 (copy), l_Logging_0 (ref)
        l_PostUserOptIn_0(v22, true, false):andThen(function(v30) --[[ Line: 66 ]]
            -- upvalues: v24 (ref), v18 (ref), v21 (ref), v26 (ref), l_Logging_0 (ref)
            if v30 then
                v24(true);
                task.delay(3, function() --[[ Line: 69 ]]
                    -- upvalues: v18 (ref), v21 (ref)
                    if v18 then
                        v21.closeUpsell();
                        v21.onSuccess();
                        return;
                    else
                        v21.onSuccess();
                        v21.closeUpsell();
                        return;
                    end;
                end);
                return;
            else
                v26(true);
                task.delay(5, function() --[[ Line: 80 ]]
                    -- upvalues: v18 (ref), v21 (ref)
                    if v18 then
                        v21.closeUpsell();
                        v21.onSuccess();
                        return;
                    else
                        v21.onSuccess();
                        v21.closeUpsell();
                        return;
                    end;
                end);
                l_Logging_0.warn("Error getting UserOptIn. " .. tostring(v30));
                return;
            end;
        end):catch(function() --[[ Line: 92 ]]
            -- upvalues: v26 (ref), v18 (ref), v21 (ref), l_Logging_0 (ref)
            v26(true);
            task.delay(5, function() --[[ Line: 94 ]]
                -- upvalues: v18 (ref), v21 (ref)
                if v18 then
                    v21.closeUpsell();
                    v21.onSuccess();
                    return;
                else
                    v21.onSuccess();
                    v21.closeUpsell();
                    return;
                end;
            end);
            l_Logging_0.warn("Exception posting PostUserOptIn");
        end);
    end;
    local v32 = l_useLocalization_0({
        verifySuccessKey = "Feature.VerificationUpsell.Heading.VoiceChatEnabledMobile", 
        voiceErrorKey = "Feature.VerificationUpsell.Heading.VoiceChatError"
    });
    return v2.createElement(v2.Fragment, nil, {
        PhoneVerificationUpsellOverlay = v2.createElement(v7, v9.Dictionary.join(v21, {
            onSuccess = v31, 
            addPhoneTitleKey = v21.addPhoneTitleKey, 
            addPhoneDescriptionKey = v21.addPhoneDescriptionKey, 
            addPhoneButtonKey = "Feature.VerificationUpsell.Action.EnableVoice", 
            addPhoneLegalTextKey = v28 and "Feature.VerificationUpsell.Description.VoiceLegalConsent" or "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer", 
            alwaysShowAddPhoneLegalText = true, 
            requireAddPhoneLegalTextCheckbox = v28
        })), 
        SuccessOverlay = v23 and v2.createElement(v8, {
            image = v29, 
            text = v32.verifySuccessKey
        }), 
        ErrorOverlay = v25 and v2.createElement(v8, {
            image = v29, 
            text = v32.voiceErrorKey
        })
    });
end;