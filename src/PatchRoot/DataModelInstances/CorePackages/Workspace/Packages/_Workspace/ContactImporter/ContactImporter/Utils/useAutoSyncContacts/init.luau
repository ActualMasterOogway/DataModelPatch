local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_ContactsProtocol_0 = require(l_Parent_1.ContactsProtocol).ContactsProtocol;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useSelector_0 = v2.useSelector;
local l_useDispatch_0 = v2.useDispatch;
local l_useEffectOnce_0 = v2.useEffectOnce;
local v8 = require(l_Parent_0.Networking.AutoSyncContacts);
local v9 = require(l_Parent_0.Utils.getContactImporterParams);
local v10 = require(script.Parent.Parent.Flags.FFlagDisablePhoneVerificationForCI);
local v11 = require(script.Parent.Parent.Flags.DisablePhoneVerificationForCIIXP);
return function(v12) --[[ Line: 24 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v11 (copy), v9 (copy), v10 (copy), v8 (copy), l_ContactsProtocol_0 (copy), l_AppStorageService_0 (copy), l_useEffectOnce_0 (copy)
    local v13 = l_useDispatch_0();
    local v15 = l_useSelector_0(function(v14) --[[ Line: 26 ]]
        return v14.LocalUserId;
    end);
    local v16 = v11.useIsPVRequired({
        isExposureEnabled = true
    });
    local v17 = l_useSelector_0(v9);
    local v18 = nil;
    v18 = if not v10 or v16 then v17.canUploadContacts and v17.isPhoneVerified or false else v17.canUploadContacts or false;
    local v19 = v12 or function() --[[ Line: 43 ]]
        -- upvalues: v13 (copy), v8 (ref), v15 (copy), l_ContactsProtocol_0 (ref), l_AppStorageService_0 (ref)
        v13(v8(v15, l_ContactsProtocol_0.default, l_AppStorageService_0));
    end;
    l_useEffectOnce_0(v19, v18);
end;