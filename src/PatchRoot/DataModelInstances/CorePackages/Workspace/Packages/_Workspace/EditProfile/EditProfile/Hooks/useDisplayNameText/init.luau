local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v3 = require(l_script_FirstAncestor_0.Flags.RealNamesInDisplayNamesIXP);
local v4 = require(script.Parent.useRealNamesInDisplayNamesEnabled);
local v5 = require(l_Parent_0.Localization);
local l_FFlagUserSearchAgedUpFriendSearchPrompt_0 = require(l_Parent_0.SharedFlags).FFlagUserSearchAgedUpFriendSearchPrompt;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v8 = {
    displayNameCaption = v2.DisplayNameCaption, 
    displayNameChangeError = v2.DisplayNameError, 
    displayNameChangeMixedCharactersError = v2.DisplayNameError, 
    displayNameModalCaption = v2.DisplayNameModalCaption, 
    displayNameCoolDownMessage = v2.DisplayNameRecently, 
    displayNameTooShortError = v2.DisplayNameTooShort, 
    displayNameUpdatedMessage = v2.DisplayNameUpdated, 
    displayNameEditMessage = v2.EditDisplayName, 
    displayNameTitle = v2.DisplayName, 
    nameTooShortError = v2.NameTooShortError, 
    nameTooLongError = v2.NameTooLongError, 
    nameUnsupportedCharsError = v2.NameUnsupportedCharsError, 
    nameInappropriateError = v2.NameInappropriateError, 
    nameHasChangedError = v2.NameHasChangedError, 
    searchForFriendsPrompt = if l_FFlagUserSearchAgedUpFriendSearchPrompt_0 then v2.SearchForFriendPrompt else nil
};
local v9 = {
    displayNameCaption = v2.AgedUpDisplayNameCaption, 
    displayNameChangeError = v2.AgedUpDisplayNameError, 
    displayNameChangeMixedCharactersError = v2.AgedUpDisplayNameMixedCharactersError, 
    displayNameModalCaption = v2.AgedUpDisplayNameModalCaption, 
    displayNameCoolDownMessage = v2.AgedUpDisplayNameRecently, 
    displayNameTooShortError = v2.AgedUpDisplayNameTooShort, 
    displayNameUpdatedMessage = v2.AgedUpDisplayNameUpdated, 
    displayNameEditMessage = v2.EditAgedUpDisplayName, 
    displayNameTitle = v2.AgedUpDisplayName, 
    nameTooShortError = v2.AgedUpNameTooShortError, 
    nameTooLongError = v2.AgedUpNameTooLongError, 
    nameUnsupportedCharsError = v2.AgedUpNameUnsupportedCharsError, 
    nameInappropriateError = v2.AgedUpNameInappropriateError, 
    nameHasChangedError = v2.AgedUpNameHasChangedError, 
    searchForFriendsPrompt = if l_FFlagUserSearchAgedUpFriendSearchPrompt_0 then v2.AgedUpSearchForFriendsPrompt else nil
};
return function() --[[ Line: 54 ]]
    -- upvalues: v4 (copy), v3 (copy), l_useLocalization_0 (copy), v9 (copy), v8 (copy)
    local v10 = v4();
    local v11 = v3.useIsExperimentEnabled({
        isExposureEnabled = true
    });
    return l_useLocalization_0(if v11 and v10 then v9 else v8);
end;