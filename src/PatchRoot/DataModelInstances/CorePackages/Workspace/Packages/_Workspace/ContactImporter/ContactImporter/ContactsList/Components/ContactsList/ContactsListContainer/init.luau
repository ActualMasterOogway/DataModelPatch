local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local _ = require(l_Parent_0.Common.LocalTypes);
local v5 = require(l_Parent_0.Common.Constants);
local l_Promise_0 = v1.Promise;
local v7 = require(l_Parent_0.Analytics);
local l_FieldNames_0 = v7.FieldNames;
local l_EventNames_0 = v7.EventNames;
local v10 = require(l_Parent_0.Utils.formatContacts);
local l_ContactsProtocol_0 = v1.ContactsProtocol;
local l_Dash_0 = v1.Dash;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local l_AmpApiProvider_0 = v1.AmpUpsell.AmpApiProvider;
local l_AccessResponseEnum_0 = v1.AmpUpsell.AmpEnums.AccessResponseEnum;
local v16 = require(l_Parent_0.Flags.getFFlagCIAmpUpsellEnabledForAll);
local v17 = require(l_Parent_0.Flags.getFFlagFindFriendsClickedEventEnabled);
local v18 = require(l_Parent_0.Flags.getFFlagPassNavigationIntoContactsList);
local v19 = require(script.Parent.ContactsList);
local v20 = require(script.Parent.ContactsListMapDispatchToProps);
local v21 = require(script.Parent.ContactsListMapStateToProps);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v23 = require(l_Parent_0.Flags.getFIntContactImporterUploadContactsMin);
local v24 = require(l_Parent_0.Common.IXPVariants);
local v25 = require(l_Parent_0.Flags.FFlagDisablePhoneVerificationForCI);
local v26 = require(l_Parent_0.Flags.FFlagContactImporterUIRefactor);
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.ContactsList.Components.ContactImporterContext);
local l_DiscoverabilityAnalytics_0 = v1.DiscoverabilityAnalytics;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = v1.getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local v31 = l_Roact_0.PureComponent:extend("ContactsListContainer");
v31.defaultProps = {
    contactsProtocol = l_ContactsProtocol_0.default
};
v31.init = function(v32) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), l_getDeepValue_0 (copy), l_AmpApiProvider_0 (copy), v16 (copy), l_Promise_0 (copy), l_EventNames_0 (copy), l_FieldNames_0 (copy), v10 (copy), v24 (copy), v23 (copy), v5 (copy), l_AccessResponseEnum_0 (copy), v25 (copy), l_EnumScreens_0 (copy), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (copy), l_DiscoverabilityAnalytics_0 (copy), v17 (copy), l_Dash_0 (copy)
    v32.state = {
        hasUploadError = false, 
        isFetching = true, 
        showMatchedContacts = false
    };
    v32.getPropOrParam = function(v33) --[[ Line: 87 ]]
        -- upvalues: v32 (copy), v18 (ref), l_getDeepValue_0 (ref)
        if v32.props.navigation and v18() and v32.props.navigation.getParam(v33) or v32.props.navigation then
            return v32.props.navigation.getParam(v33);
        else
            return l_getDeepValue_0(v32.props, v33);
        end;
    end;
    v32.contactsCount = nil;
    v32.numTotalNumbersOnDevice = nil;
    v32.numTotalContactsOnDevice = nil;
    v32.numContactsWithMultipleNumbers = nil;
    v32.startTime = os.clock();
    v32.ampApiProvider = if v32.props.ampApiProvider ~= nil then v32.props.ampApiProvider else l_AmpApiProvider_0;
    v32.enableAmpUpsell = v16() or v32.props.showFindFriendsBannerVariant;
    local function _(v34) --[[ Line: 110 ]] --[[ Name: makeErrorFunction ]]
        -- upvalues: l_Promise_0 (ref), v32 (copy)
        return function(v35) --[[ Line: 111 ]]
            -- upvalues: l_Promise_0 (ref), v32 (ref), v34 (copy)
            if type(v35) == "table" and v35.hasAlreadyErrored then
                return l_Promise_0.reject({
                    hasAlreadyErrored = true
                });
            else
                v32:setState({
                    hasUploadError = true, 
                    isFetching = false
                });
                v32.props.fireAnalyticsEvent(v34, {
                    failedStep = v34
                });
                v32.fireContactImportingTimeEvent({
                    isSuccessfulUpload = false, 
                    failedStep = v34
                });
                return l_Promise_0.reject({
                    hasAlreadyErrored = true
                });
            end;
        end;
    end;
    local function _(v37) --[[ Line: 133 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        local v38 = l_getDeepValue_0(v37 or {}, "responseBody.userContactsEntities");
        if v38 then
            return #v38;
        else
            return 0;
        end;
    end;
    local function _() --[[ Line: 139 ]]
        -- upvalues: v32 (copy)
        if v32.props.navigation then
            v32.props.navigation.pop();
            return;
        else
            if v32.props.onClose then
                v32.props.onClose();
            end;
            return;
        end;
    end;
    v32.requestFriendship = function(v41) --[[ Line: 147 ]]
        -- upvalues: v32 (copy), l_EventNames_0 (ref)
        local l_props_0 = v32.props;
        l_props_0.fireAnalyticsEvent(l_EventNames_0.RequestFriendship, {
            requestedId = v41
        });
        l_props_0.requestFriendship({
            currentUserId = l_props_0.localUserId, 
            contactId = v41
        }):andThen(function() --[[ Line: 159 ]]
            -- upvalues: l_props_0 (copy), v41 (copy)
            l_props_0.requestSent(v41);
        end);
    end;
    v32.fireContactImportingTimeEvent = function(v43) --[[ Line: 164 ]]
        -- upvalues: v32 (copy), l_EventNames_0 (ref), l_FieldNames_0 (ref)
        v32.props.fireAnalyticsEvent(l_EventNames_0.ContactImportingTime, {
            [l_FieldNames_0.NumTotalContactsImported] = v32.contactsCount, 
            [l_FieldNames_0.NumMatchedContacts] = v43.numMatchedContacts, 
            [l_FieldNames_0.NumTotalContactsOnDevice] = v32.numTotalContactsOnDevice, 
            [l_FieldNames_0.NumMaxContacts] = true, 
            [l_FieldNames_0.NumMinContacts] = true, 
            [l_FieldNames_0.NumTotalNumbersOnDevice] = v32.numTotalNumbersOnDevice, 
            [l_FieldNames_0.NumContactsWithMultipleNumbers] = v32.numContactsWithMultipleNumbers, 
            loadingTime = os.clock() - v32.startTime, 
            isSuccessfulUpload = v43.isSuccessfulUpload
        });
    end;
    v32.getContactsFromDevice = function() --[[ Line: 184 ]]
        -- upvalues: v32 (copy), l_Promise_0 (ref)
        local l_props_1 = v32.props;
        return l_props_1.contactsProtocol:supportsContacts():andThen(function(v45) --[[ Line: 189 ]]
            -- upvalues: l_Promise_0 (ref), l_props_1 (copy)
            if not v45 then
                return l_Promise_0.reject();
            else
                return l_props_1.contactsProtocol:getContacts();
            end;
        end):catch(function() --[[ Line: 196 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.reject();
        end);
    end;
    v32.formatContactsFromDevice = function(v46) --[[ Line: 201 ]]
        -- upvalues: v32 (copy), v10 (ref)
        local l_props_2 = v32.props;
        if #(v46.contacts or {}) == 0 then
            return {
                contacts = {}, 
                contactsCount = 0, 
                countryCode = nil
            };
        else
            l_props_2.deviceContactsReceived(v46.contacts);
            local v48 = v10(v46);
            v32.contactsCount = #v48.contacts;
            v32.numTotalContactsOnDevice = v48.contactsCount;
            local v49 = 0;
            local v50 = 0;
            for _, v52 in ipairs(v46.contacts) do
                local v53 = #v52.phonenumber;
                if v53 > 1 then
                    v50 = v50 + 1;
                end;
                v49 = v49 + v53;
            end;
            v32.numTotalNumbersOnDevice = v49;
            v32.numContactsWithMultipleNumbers = v50;
            return v48;
        end;
    end;
    v32.uploadDeviceContacts = function(v54) --[[ Line: 234 ]]
        -- upvalues: v32 (copy), v24 (ref), v23 (ref), l_Promise_0 (ref), l_EventNames_0 (ref)
        local l_props_3 = v32.props;
        if #v54.contacts == 0 or l_props_3.variant == v24.INVITES_ONLY or #v54.contacts < v23() then
            return l_Promise_0.resolve({
                shouldFindContacts = false
            });
        else
            return l_props_3.uploadContacts(v54):andThen(function() --[[ Line: 248 ]]
                -- upvalues: l_Promise_0 (ref)
                return l_Promise_0.resolve({
                    shouldFindContacts = true
                });
            end, function() --[[ Line: 250 ]]
                -- upvalues: v32 (ref), l_EventNames_0 (ref), l_Promise_0 (ref)
                v32.props.fireAnalyticsEvent(l_EventNames_0.FailedUploadContactsFromDevice, {
                    failedStep = l_EventNames_0.FailedUploadContactsFromDevice
                });
                v32.fireContactImportingTimeEvent({
                    isSuccessfulUpload = false, 
                    failedStep = l_EventNames_0.FailedUploadContactsFromDevice
                });
                return l_Promise_0.resolve({
                    shouldFindContacts = true
                });
            end);
        end;
    end;
    v32.findContacts = function(v56) --[[ Line: 263 ]]
        -- upvalues: v32 (copy), l_Promise_0 (ref)
        local l_props_4 = v32.props;
        if v56.shouldFindContacts then
            return l_props_4.findContacts();
        else
            return l_Promise_0.resolve();
        end;
    end;
    v32.getContactEntities = function(v58) --[[ Line: 272 ]]
        -- upvalues: v32 (copy), l_Promise_0 (ref)
        local l_props_5 = v32.props;
        if v58 then
            return l_props_5.getContactEntities(v58);
        else
            return l_Promise_0.resolve();
        end;
    end;
    v32.fireHasLoaded = function(v60) --[[ Line: 282 ]]
        -- upvalues: v32 (copy), l_getDeepValue_0 (ref), l_EventNames_0 (ref), l_FieldNames_0 (ref), l_Promise_0 (ref)
        local l_props_6 = v32.props;
        local v62 = l_getDeepValue_0(v60 or {}, "responseBody.userContactsEntities");
        local v63 = if v62 then #v62 else 0;
        l_props_6.fireAnalyticsEvent(l_EventNames_0.ContactsListLoaded, {
            [l_FieldNames_0.NumTotalContactsImported] = v32.contactsCount, 
            [l_FieldNames_0.NumMatchedContacts] = v63, 
            [l_FieldNames_0.NumMaxContacts] = true, 
            [l_FieldNames_0.NumMinContacts] = true, 
            [l_FieldNames_0.NumTotalContactsOnDevice] = v32.numTotalContactsOnDevice
        });
        v32:setState({
            isFetching = false
        });
        v32.fireContactImportingTimeEvent({
            isSuccessfulUpload = true, 
            nummatchedContacts = v63
        });
        return l_Promise_0.resolve();
    end;
    v32.failedToUpload = function(_) --[[ Line: 305 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            hasUploadError = true, 
            isFetching = false
        });
        v32.fireContactImportingTimeEvent({
            isSuccessfulUpload = false
        });
    end;
    v32.getContacts = function() --[[ Line: 314 ]]
        -- upvalues: v32 (copy), v5 (ref), l_AccessResponseEnum_0 (ref), v25 (ref), l_EventNames_0 (ref), l_Promise_0 (ref)
        local v65 = nil;
        if v32.enableAmpUpsell then
            v32:setState({
                isFetching = true
            });
            local v66 = v32.ampApiProvider.getFeatureAccess({
                v5.SHOW_MATCHED_CONTACTS
            });
            v65 = (if #v66.featureAccessList > 0 then v66.featureAccessList[1].access else l_AccessResponseEnum_0.Actionable) == l_AccessResponseEnum_0.Granted;
            v32:setState({
                showMatchedContacts = v65
            });
        else
            v65 = v32.getPropOrParam(v5.IS_PHONE_VERIFIED);
        end;
        if v25 then
            if v32.props.isPVRequired and not v65 then
                local v67 = v32.getContactsFromDevice();
                local l_formatContactsFromDevice_0 = v32.formatContactsFromDevice;
                local l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedGetContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_0_0 = l_FailedGetContactsFromDevice_0 --[[ copy: 5 -> 15 ]];
                v67 = v67:andThen(l_formatContactsFromDevice_0, function(v71) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_0_0 (copy)
                    if type(v71) == "table" and v71.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_0_0, {
                            failedStep = l_l_FailedGetContactsFromDevice_0_0
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_0_0
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_0 = v32.fireHasLoaded;
                l_FailedGetContactsFromDevice_0 = l_EventNames_0.FailedFormatContactsFromDevice;
                v67:andThen(l_formatContactsFromDevice_0, function(v72) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_FailedGetContactsFromDevice_0 (copy)
                    if type(v72) == "table" and v72.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_0, {
                            failedStep = l_FailedGetContactsFromDevice_0
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_FailedGetContactsFromDevice_0
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end):catch(v32.failedToUpload);
                return;
            else
                local v73 = v32.getContactsFromDevice();
                local l_formatContactsFromDevice_1 = v32.formatContactsFromDevice;
                local l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedGetContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_1_0 = l_FailedGetContactsFromDevice_1 --[[ copy: 5 -> 11 ]];
                v73 = v73:andThen(l_formatContactsFromDevice_1, function(v77) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_1_0 (copy)
                    if type(v77) == "table" and v77.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_0, {
                            failedStep = l_l_FailedGetContactsFromDevice_1_0
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_1_0
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_1 = v32.uploadDeviceContacts;
                l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedFormatContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_1_1 = l_FailedGetContactsFromDevice_1 --[[ copy: 5 -> 12 ]];
                v73 = v73:andThen(l_formatContactsFromDevice_1, function(v79) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_1_1 (copy)
                    if type(v79) == "table" and v79.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_1, {
                            failedStep = l_l_FailedGetContactsFromDevice_1_1
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_1_1
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_1 = v32.findContacts;
                l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedUploadContactsFromDevice;
                local l_l_FailedGetContactsFromDevice_1_2 = l_FailedGetContactsFromDevice_1 --[[ copy: 5 -> 13 ]];
                v73 = v73:andThen(l_formatContactsFromDevice_1, function(v81) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_1_2 (copy)
                    if type(v81) == "table" and v81.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_2, {
                            failedStep = l_l_FailedGetContactsFromDevice_1_2
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_1_2
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_1 = v32.getContactEntities;
                l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedFindContacts;
                local l_l_FailedGetContactsFromDevice_1_3 = l_FailedGetContactsFromDevice_1 --[[ copy: 5 -> 14 ]];
                v73 = v73:andThen(l_formatContactsFromDevice_1, function(v83) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_1_3 (copy)
                    if type(v83) == "table" and v83.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_1_3, {
                            failedStep = l_l_FailedGetContactsFromDevice_1_3
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_l_FailedGetContactsFromDevice_1_3
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end);
                l_formatContactsFromDevice_1 = v32.fireHasLoaded;
                l_FailedGetContactsFromDevice_1 = l_EventNames_0.FailedGetContactEntities;
                v73:andThen(l_formatContactsFromDevice_1, function(v84) --[[ Line: 111 ]]
                    -- upvalues: l_Promise_0 (ref), v32 (ref), l_FailedGetContactsFromDevice_1 (copy)
                    if type(v84) == "table" and v84.hasAlreadyErrored then
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    else
                        v32:setState({
                            hasUploadError = true, 
                            isFetching = false
                        });
                        v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_1, {
                            failedStep = l_FailedGetContactsFromDevice_1
                        });
                        v32.fireContactImportingTimeEvent({
                            isSuccessfulUpload = false, 
                            failedStep = l_FailedGetContactsFromDevice_1
                        });
                        return l_Promise_0.reject({
                            hasAlreadyErrored = true
                        });
                    end;
                end):catch(v32.failedToUpload);
                return;
            end;
        elseif not v65 then
            local v85 = v32.getContactsFromDevice();
            local l_formatContactsFromDevice_2 = v32.formatContactsFromDevice;
            local l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedGetContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_2_0 = l_FailedGetContactsFromDevice_2 --[[ copy: 5 -> 10 ]];
            v85 = v85:andThen(l_formatContactsFromDevice_2, function(v89) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_2_0 (copy)
                if type(v89) == "table" and v89.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_2_0, {
                        failedStep = l_l_FailedGetContactsFromDevice_2_0
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_2_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_2 = v32.fireHasLoaded;
            l_FailedGetContactsFromDevice_2 = l_EventNames_0.FailedFormatContactsFromDevice;
            v85:andThen(l_formatContactsFromDevice_2, function(v90) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_FailedGetContactsFromDevice_2 (copy)
                if type(v90) == "table" and v90.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_2, {
                        failedStep = l_FailedGetContactsFromDevice_2
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_FailedGetContactsFromDevice_2
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end):catch(v32.failedToUpload);
            return;
        else
            local v91 = v32.getContactsFromDevice();
            local l_formatContactsFromDevice_3 = v32.formatContactsFromDevice;
            local l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedGetContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_3_0 = l_FailedGetContactsFromDevice_3 --[[ copy: 5 -> 6 ]];
            v91 = v91:andThen(l_formatContactsFromDevice_3, function(v95) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_3_0 (copy)
                if type(v95) == "table" and v95.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_3_0, {
                        failedStep = l_l_FailedGetContactsFromDevice_3_0
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_3_0
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_3 = v32.uploadDeviceContacts;
            l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedFormatContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_3_1 = l_FailedGetContactsFromDevice_3 --[[ copy: 5 -> 7 ]];
            v91 = v91:andThen(l_formatContactsFromDevice_3, function(v97) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_3_1 (copy)
                if type(v97) == "table" and v97.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_3_1, {
                        failedStep = l_l_FailedGetContactsFromDevice_3_1
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_3_1
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_3 = v32.findContacts;
            l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedUploadContactsFromDevice;
            local l_l_FailedGetContactsFromDevice_3_2 = l_FailedGetContactsFromDevice_3 --[[ copy: 5 -> 8 ]];
            v91 = v91:andThen(l_formatContactsFromDevice_3, function(v99) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_3_2 (copy)
                if type(v99) == "table" and v99.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_3_2, {
                        failedStep = l_l_FailedGetContactsFromDevice_3_2
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_3_2
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_3 = v32.getContactEntities;
            l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedFindContacts;
            local l_l_FailedGetContactsFromDevice_3_3 = l_FailedGetContactsFromDevice_3 --[[ copy: 5 -> 9 ]];
            v91 = v91:andThen(l_formatContactsFromDevice_3, function(v101) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_l_FailedGetContactsFromDevice_3_3 (copy)
                if type(v101) == "table" and v101.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_l_FailedGetContactsFromDevice_3_3, {
                        failedStep = l_l_FailedGetContactsFromDevice_3_3
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_l_FailedGetContactsFromDevice_3_3
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end);
            l_formatContactsFromDevice_3 = v32.fireHasLoaded;
            l_FailedGetContactsFromDevice_3 = l_EventNames_0.FailedGetContactEntities;
            v91:andThen(l_formatContactsFromDevice_3, function(v102) --[[ Line: 111 ]]
                -- upvalues: l_Promise_0 (ref), v32 (ref), l_FailedGetContactsFromDevice_3 (copy)
                if type(v102) == "table" and v102.hasAlreadyErrored then
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                else
                    v32:setState({
                        hasUploadError = true, 
                        isFetching = false
                    });
                    v32.props.fireAnalyticsEvent(l_FailedGetContactsFromDevice_3, {
                        failedStep = l_FailedGetContactsFromDevice_3
                    });
                    v32.fireContactImportingTimeEvent({
                        isSuccessfulUpload = false, 
                        failedStep = l_FailedGetContactsFromDevice_3
                    });
                    return l_Promise_0.reject({
                        hasAlreadyErrored = true
                    });
                end;
            end):catch(v32.failedToUpload);
            return;
        end;
    end;
    v32.closeModal = function(v103) --[[ Line: 365 ]]
        -- upvalues: v32 (copy), v24 (ref)
        local l_props_7 = v32.props;
        local l_state_0 = v32.state;
        l_props_7.fireAnalyticsEvent(v103, {
            isLoading = v32.isFetching(l_props_7.variant, v24), 
            loadingTime = if l_state_0.isFetching then os.clock() - v32.startTime else nil
        });
        if v32.props.navigation then
            v32.props.navigation.pop();
            return;
        else
            if v32.props.onClose then
                v32.props.onClose();
            end;
            return;
        end;
    end;
    v32.onAddFriendsActivated = function() --[[ Line: 375 ]]
        -- upvalues: v32 (copy), l_EnumScreens_0 (ref)
        v32.props.navigation.replace(l_EnumScreens_0.AddFriendsPage);
    end;
    v32.isFetching = function(v106, v107) --[[ Line: 382 ]]
        -- upvalues: v32 (copy)
        local l_state_1 = v32.state;
        if v106 == v107.BLENDED then
            return l_state_1.isFetching;
        else
            return false;
        end;
    end;
    if v32.enableAmpUpsell then
        v32.openDiscoverabilityModal = function() --[[ Line: 388 ]]
            -- upvalues: v32 (copy), v5 (ref), l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 (ref), l_EnumScreens_0 (ref), l_DiscoverabilityAnalytics_0 (ref)
            local l_navigation_0 = v32.props.navigation;
            local v110 = v32.getPropOrParam(v5.OPEN_LEARN_MORE_LINK);
            if l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then
                l_navigation_0.navigate(l_EnumScreens_0.DiscoverabilityOverlay, {
                    showToast = v32.getPropOrParam(v5.SHOW_TOAST), 
                    openLearnMoreLink = v110, 
                    isStandaloneDiscoverabilityModal = true, 
                    entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.ContactsList, 
                    navigateOnActivated = function() --[[ Line: 398 ]] --[[ Name: navigateOnActivated ]]
                        -- upvalues: l_navigation_0 (copy), l_EnumScreens_0 (ref), v5 (ref), v32 (ref), v110 (copy)
                        l_navigation_0.navigate(l_EnumScreens_0.ContactsList, {
                            [v5.SHOULD_UPDATE_USER_SETTINGS] = true, 
                            [v5.IS_PHONE_VERIFIED] = v32.getPropOrParam(v5.IS_PHONE_VERIFIED), 
                            [v5.OPEN_LEARN_MORE_LINK] = v110, 
                            openAmpUpsell = v32.getPropOrParam(v5.OPEN_AMP_UPSELL)
                        });
                    end
                });
                return;
            else
                l_navigation_0.push(l_EnumScreens_0.DiscoverabilityOverlay, {
                    showToast = false, 
                    openLearnMoreLink = v110, 
                    isStandaloneDiscoverabilityModal = true, 
                    entryPoint = l_DiscoverabilityAnalytics_0.EntryPoints.ContactsList
                });
                return;
            end;
        end;
        local v111 = v32.getPropOrParam(v5.OPEN_AMP_UPSELL);
        v32.openAmpUpsell = v111 and function() --[[ Line: 421 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref), v32 (copy), v17 (ref), l_EventNames_0 (ref), v111 (copy), v5 (ref)
            local function v114(v112, _) --[[ Line: 422 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v32 (ref)
                if v112 == l_AccessResponseEnum_0.Granted then
                    v32.getContacts();
                    v32.openDiscoverabilityModal();
                end;
            end;
            if v17() then
                v32.props.fireAnalyticsEvent(l_EventNames_0.FindFriendsButtonClicked);
            end;
            v111(v5.SHOW_MATCHED_CONTACTS, v114);
        end or l_Dash_0.noop;
    end;
end;
v31.didMount = function(v115) --[[ Line: 438 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    local l_props_8 = v115.props;
    if v115.getPropOrParam(v5.SHOULD_UPDATE_USER_SETTINGS) then
        l_props_8.updateUserSettings():andThen(v115.getContacts):catch(function() --[[ Line: 443 ]]
            -- upvalues: v115 (copy)
            v115.failedToUpload();
        end);
        return;
    else
        v115.getContacts();
        return;
    end;
end;
v31.render = function(v117) --[[ Line: 451 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_Roact_0 (copy), v19 (copy), v24 (copy), v7 (copy), v26 (copy)
    local l_props_9 = v117.props;
    local v119 = v117.getPropOrParam(v5.IS_PHONE_VERIFIED);
    local l_variant_0 = l_props_9.variant;
    return l_Roact_0.createElement(v19, {
        deviceContacts = l_props_9.deviceContacts, 
        matchedContacts = l_props_9.matchedContacts, 
        isFetching = v117.isFetching(l_variant_0, v24), 
        requestFriendship = v117.requestFriendship, 
        screenSize = l_props_9.screenSize, 
        hasUploadError = v117.state.hasUploadError, 
        onAddFriendsActivated = v117.onAddFriendsActivated, 
        closeModal = v117.closeModal, 
        showAddFriendsButton = l_props_9.entryPoint == v7.EntryPoints.HomePage, 
        variant = l_props_9.variant, 
        showFindFriendsBannerVariant = l_props_9.showFindFriendsBannerVariant, 
        openProfilePeekView = v117.props.openProfilePeekView, 
        showMatchedContacts = if v117.enableAmpUpsell then v117.state.showMatchedContacts else v119, 
        openAmpUpsell = v117.openAmpUpsell, 
        showNewUI = if v26 then l_props_9.showNewUI else nil
    });
end;
return l_compose_0(v7.connect(function(v121) --[[ Line: 476 ]]
    return {
        fireAnalyticsEvent = v121.fireAnalyticsEvent, 
        entryPoint = v121.entryPoint, 
        openProfilePeekView = v121.openProfilePeekView
    };
end), l_RoactRodux_0.connect(v21, v20))(v31);