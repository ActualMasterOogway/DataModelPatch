local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
return function(v4) --[[ Line: 6 ]]
    -- upvalues: l_NetworkingUserSettings_0 (copy), l_UpdateContactImporterModalLogic_0 (copy)
    return {
        updateUserSettings = function() --[[ Line: 8 ]] --[[ Name: updateUserSettings ]]
            -- upvalues: v4 (copy), l_NetworkingUserSettings_0 (ref)
            return v4(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                canUploadContacts = true
            }));
        end, 
        hideContactImporterModal = function() --[[ Line: 11 ]] --[[ Name: hideContactImporterModal ]]
            -- upvalues: v4 (copy), l_UpdateContactImporterModalLogic_0 (ref)
            return v4(l_UpdateContactImporterModalLogic_0({
                hasOSPermissions = true, 
                shouldShowContactImporterUpsellModal = false
            }));
        end, 
        getUserSettingsMetadata = function() --[[ Line: 17 ]] --[[ Name: getUserSettingsMetadata ]]
            -- upvalues: v4 (copy), l_NetworkingUserSettings_0 (ref)
            return v4(l_NetworkingUserSettings_0.GetUserSettingsMetadata.API());
        end
    };
end;