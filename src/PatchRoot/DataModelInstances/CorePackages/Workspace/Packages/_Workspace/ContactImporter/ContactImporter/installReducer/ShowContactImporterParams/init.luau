local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Actions.SetContactImporterDisplayLogic);
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
local v4 = require(l_Parent_0.Actions.SetIsPhoneVerified);
local l_UpdateIsDiscoverabilityUnset_0 = v1.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset;
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
local v8 = require(l_Parent_0.Common.Constants);
local v9 = {
    [v8.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = false, 
    [v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = false, 
    hasOSPermissions = false, 
    isPhoneVerified = false, 
    canUploadContacts = false, 
    isDiscoverabilityUnset = false
};
return l_Rodux_0.createReducer(v9, {
    [v2.name] = function(_, v11) --[[ Line: 42 ]]
        -- upvalues: v8 (copy)
        local l_hasOSPermissions_0 = v11.hasOSPermissions;
        local l_isPhoneVerified_0 = v11.isPhoneVerified;
        local l_shouldShowContactImporterUpsellAgain_0 = v11.shouldShowContactImporterUpsellAgain;
        local l_canUploadContacts_0 = v11.canUploadContacts;
        local l_phoneNumberDiscoverability_0 = v11.phoneNumberDiscoverability;
        local v17 = l_hasOSPermissions_0 and v11.isUserOptedInLocalStorage;
        local v18 = l_canUploadContacts_0 ~= false;
        return {
            [v8.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = v18, 
            [v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = not v17 and l_shouldShowContactImporterUpsellAgain_0, 
            hasOSPermissions = l_hasOSPermissions_0, 
            isPhoneVerified = l_isPhoneVerified_0, 
            canUploadContacts = l_canUploadContacts_0, 
            isDiscoverabilityUnset = l_phoneNumberDiscoverability_0 == v8.DISCOVERABILITY_UNSET
        };
    end, 
    [l_UpdateContactImporterModalLogic_0.name] = function(v19, v20) --[[ Line: 64 ]]
        -- upvalues: l_llama_0 (copy), v8 (copy)
        return (l_llama_0.Dictionary.join(v19, {
            hasOSPermissions = v20.hasOSPermissions, 
            [v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = v20[v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL]
        }));
    end, 
    [v4.name] = function(v21, v22) --[[ Line: 72 ]]
        -- upvalues: l_llama_0 (copy)
        return l_llama_0.Dictionary.join(v21, {
            isPhoneVerified = v22.isPhoneVerified
        });
    end, 
    [l_UpdateIsDiscoverabilityUnset_0.name] = function(v23, v24) --[[ Line: 77 ]]
        -- upvalues: l_llama_0 (copy)
        return l_llama_0.Dictionary.join(v23, {
            isDiscoverabilityUnset = v24.isDiscoverabilityUnset
        });
    end
});