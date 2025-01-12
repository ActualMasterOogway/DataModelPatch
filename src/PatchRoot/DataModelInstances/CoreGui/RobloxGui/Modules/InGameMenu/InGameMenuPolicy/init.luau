local l_CorePackages_0 = game:GetService("CorePackages");
local l_PolicyProvider_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).PolicyProvider;
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = require(l_SharedFlags_0).GetFFlagUseVoiceExitBetaLanguage;
local l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateEducationalPopupVisibilityViaGUAC;
local v5 = l_PolicyProvider_0.GetPolicyImplementations.MemStorageService("app-policy");
local v6 = l_PolicyProvider_0.withGetPolicyImplementation(v5);
local v7 = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v9 = game:DefineFastFlag("UseGUACforDUARPolicy", false);
v6.Mapper = function(v10) --[[ Line: 18 ]]
    -- upvalues: v9 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 (copy), v7 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy)
    return {
        enableInGameHomeIcon = function() --[[ Line: 20 ]] --[[ Name: enableInGameHomeIcon ]]
            -- upvalues: v9 (ref), v10 (copy), l_isSubjectToDesktopPolicies_0 (ref)
            if v9 then
                return v10.EnableInGameHomeIcon or false;
            else
                return l_isSubjectToDesktopPolicies_0();
            end;
        end, 
        enableEducationalPopup = function() --[[ Line: 28 ]] --[[ Name: enableEducationalPopup ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 (ref), v10 (copy)
            local l_game_EngineFeature_0 = game:GetEngineFeature("NativeCloseIntercept");
            if l_isSubjectToDesktopPolicies_0() and l_game_EngineFeature_0 then
                if l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0() then
                    if v10.InExperienceCanViewEducationalPopup == nil then
                        return true;
                    else
                        return v10.InExperienceCanViewEducationalPopup;
                    end;
                else
                    return true;
                end;
            else
                return false;
            end;
        end, 
        educationalPopupMaxDisplayCount = function() --[[ Line: 41 ]] --[[ Name: educationalPopupMaxDisplayCount ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v7 (ref)
            return l_isSubjectToDesktopPolicies_0() and v7() or 0;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 45 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v10 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v10.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        enableFullscreenTitleBar = function() --[[ Line: 52 ]] --[[ Name: enableFullscreenTitleBar ]]
            -- upvalues: v10 (copy)
            return v10.FullscreenTitleBarEnabled or false;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 56 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: v10 (copy)
            if v10.DisplayCheckboxInVoiceConsent == nil then
                return true;
            else
                return v10.DisplayCheckboxInVoiceConsent;
            end;
        end
    };
end;
return v6;