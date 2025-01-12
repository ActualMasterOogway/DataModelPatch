local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.ContactsListContainer);
local v3 = require(l_Parent_0.Flags.OffPlatformFriendRequestsIXP);
local v4 = require(l_Parent_0.Flags.getFFlagCIAmpUpsellExperimentEnabled);
local v5 = require(l_Parent_0.Flags.getFFlagPassNavigationIntoContactsList);
local v6 = require(l_Parent_0.Flags.FFlagDisablePhoneVerificationForCI);
local v7 = require(l_Parent_0.Flags.DisablePhoneVerificationForCIIXP);
local v8 = require(l_Parent_0.Flags.FFlagContactImporterUIRefactor);
local v9 = require(l_Parent_0.Flags.ContactImporterUIImprovementsIXP);
local l_Dash_0 = v1.Dash;
local l_Roact_0 = v1.Roact;
local l_useNavigation_0 = v1.useNavigation;
ContactsList = function(v13) --[[ Line: 19 ]] --[[ Name: ContactsList ]]
    -- upvalues: v5 (copy), l_useNavigation_0 (copy), v3 (copy), v4 (copy), v7 (copy), v9 (copy), l_Roact_0 (copy), v2 (copy), l_Dash_0 (copy), v6 (copy), v8 (copy)
    local v14 = if v5() then l_useNavigation_0() else nil;
    local v15 = v3.useOffPlatformFriendRequestsVariant();
    local v16 = if v4() then v3.useFindFriendsBannerVariant() else false;
    local v17 = v7.useIsPVRequired({
        isExposureEnabled = true
    });
    local v18 = v9.useShouldDisplayUIImprovements();
    if v15 == v3.IXPVariants.BLENDED or v15 == v3.IXPVariants.INVITES_ONLY then
        return l_Roact_0.createElement(v2, l_Dash_0.join({
            variant = v15, 
            showFindFriendsBannerVariant = v16, 
            navigation = v14, 
            isPVRequired = if v6 then v17 else nil, 
            showNewUI = if v8 then v18 else nil
        }, v13 or {}));
    else
        return nil;
    end;
end;
return ContactsList;