local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.AuthLocalStorageKeys);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GetFFlagEnableMultiPageSignup_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableMultiPageSignup;
local l_FFlagPasskeySignupDeferLaunchApp_0 = require(l_Parent_0.SharedFlags).FFlagPasskeySignupDeferLaunchApp;
local v7 = {
    passkeySignupName = "PasskeySignupName"
};
local v14 = {
    setRobloxLocaleId = function(v8) --[[ Line: 17 ]] --[[ Name: setRobloxLocaleId ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.RobloxLocaleId, v8);
    end, 
    setGameLocaleId = function(v9) --[[ Line: 22 ]] --[[ Name: setGameLocaleId ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.GameLocaleId, v9);
    end, 
    getAuthenticatedTheme = function() --[[ Line: 26 ]] --[[ Name: getAuthenticatedTheme ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        return l_AppStorageService_0:GetItem(v2.AuthenticatedTheme);
    end, 
    setAuthenticatedTheme = function(v10) --[[ Line: 30 ]] --[[ Name: setAuthenticatedTheme ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.AuthenticatedTheme, v10);
    end, 
    getAccountBlob = function() --[[ Line: 34 ]] --[[ Name: getAccountBlob ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
            return l_AppStorageService_0:GetItem(v2.AccountBlob) or "";
        else
            return "";
        end;
    end, 
    setAccountBlob = function(v11) --[[ Line: 41 ]] --[[ Name: setAccountBlob ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
            l_AppStorageService_0:SetItem(v2.AccountBlob, v11 or "");
        end;
    end, 
    getDefaultUsername = function() --[[ Line: 47 ]] --[[ Name: getDefaultUsername ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        return l_AppStorageService_0:GetItem(v2.CredentialValue);
    end, 
    getSignupActionRequired = function() --[[ Line: 51 ]] --[[ Name: getSignupActionRequired ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        return l_AppStorageService_0:GetItem(v2.SignupActionRequired);
    end, 
    setSignupActionRequired = function(v12) --[[ Line: 55 ]] --[[ Name: setSignupActionRequired ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        l_AppStorageService_0:SetItem(v2.SignupActionRequired, v12);
    end, 
    getAccountSwitcherMetadataMap = function() --[[ Line: 59 ]] --[[ Name: getAccountSwitcherMetadataMap ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
            return l_AppStorageService_0:GetItem(v2.AccountSwitcherMetadataMap) or "";
        else
            return "";
        end;
    end, 
    setAccountSwitcherMetadataMap = function(v13) --[[ Line: 66 ]] --[[ Name: setAccountSwitcherMetadataMap ]]
        -- upvalues: l_AppStorageService_0 (copy), v2 (copy)
        if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
            l_AppStorageService_0:SetItem(v2.AccountSwitcherMetadataMap, v13 or "");
        end;
    end
};
v14.getAccountSwitchTargetUsername = function() --[[ Line: 72 ]] --[[ Name: getAccountSwitchTargetUsername ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v15 = v14.getAccountSwitcherMetadataMap();
        if v15 == nil or v15 == "" then
            return "";
        else
            local v16 = l_HttpService_0:JSONDecode(v15);
            if v16 == nil or v16 == "" or next(v16) == nil or next(v16) == "" or v16.AccountSwitchTargetUsername == nil then
                return "";
            else
                return v16.AccountSwitchTargetUsername;
            end;
        end;
    else
        return "";
    end;
end;
v14.setAccountSwitchTargetUsername = function(v17) --[[ Line: 93 ]] --[[ Name: setAccountSwitchTargetUsername ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v18 = v14.getAccountSwitcherMetadataMap();
        local v19 = nil;
        if v18 == nil or v18 == "" then
            v19 = {
                AccountSwitchTargetUsername = v17
            };
        else
            v19 = l_HttpService_0:JSONDecode(v18);
            v19.AccountSwitchTargetUsername = v17;
        end;
        v14.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v19));
    end;
end;
v14.getAccountSwitchStatus = function() --[[ Line: 109 ]] --[[ Name: getAccountSwitchStatus ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v20 = v14.getAccountSwitcherMetadataMap();
        if v20 == nil or v20 == "" then
            return "";
        else
            local v21 = l_HttpService_0:JSONDecode(v20);
            if v21 == nil or v21 == "" or next(v21) == nil or next(v21) == "" or v21.AccountSwitchStatus == nil then
                return "";
            else
                return v21.AccountSwitchStatus;
            end;
        end;
    else
        return "";
    end;
end;
v14.setAccountSwitchStatus = function(v22) --[[ Line: 131 ]] --[[ Name: setAccountSwitchStatus ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v23 = v14.getAccountSwitcherMetadataMap();
        local v24 = nil;
        if v23 == nil or v23 == "" then
            v24 = {
                AccountSwitchStatus = v22
            };
        else
            v24 = l_HttpService_0:JSONDecode(v23);
            v24.AccountSwitchStatus = v22;
        end;
        v14.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v24));
    end;
end;
v14.getMultipageSignupMetadataMap = function() --[[ Line: 147 ]] --[[ Name: getMultipageSignupMetadataMap ]]
    -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (copy), l_FFlagPasskeySignupDeferLaunchApp_0 (copy), l_AppStorageService_0 (copy), v2 (copy)
    if l_GetFFlagEnableMultiPageSignup_0() or l_FFlagPasskeySignupDeferLaunchApp_0 then
        return l_AppStorageService_0:GetItem(v2.MultipageSignupMetadataMap) or "";
    else
        return "";
    end;
end;
v14.setMultipageSignupMetadataMap = function(v25) --[[ Line: 154 ]] --[[ Name: setMultipageSignupMetadataMap ]]
    -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (copy), l_FFlagPasskeySignupDeferLaunchApp_0 (copy), l_AppStorageService_0 (copy), v2 (copy)
    if l_GetFFlagEnableMultiPageSignup_0() or l_FFlagPasskeySignupDeferLaunchApp_0 then
        l_AppStorageService_0:SetItem(v2.MultipageSignupMetadataMap, v25 or "");
    end;
end;
v14.getIncompleteSignupUserId = function() --[[ Line: 160 ]] --[[ Name: getIncompleteSignupUserId ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    local v26 = v14.getMultipageSignupMetadataMap();
    if v26 == nil or v26 == "" then
        return "";
    else
        local v27 = l_HttpService_0:JSONDecode(v26);
        if v27 == nil or v27 == "" or next(v27) == nil or next(v27) == "" or v27.IncompleteSignupUserId == nil then
            return "";
        else
            return v27.IncompleteSignupUserId;
        end;
    end;
end;
v14.setIncompleteSignupUserId = function(v28) --[[ Line: 178 ]] --[[ Name: setIncompleteSignupUserId ]]
    -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (copy), v14 (copy), l_HttpService_0 (copy)
    if l_GetFFlagEnableMultiPageSignup_0() then
        local v29 = v14.getMultipageSignupMetadataMap();
        local v30 = nil;
        if v29 == nil or v29 == "" then
            v30 = {
                IncompleteSignupUserId = v28
            };
        else
            v30 = l_HttpService_0:JSONDecode(v29);
            v30.IncompleteSignupUserId = v28;
        end;
        v14.setMultipageSignupMetadataMap(l_HttpService_0:JSONEncode(v30));
    end;
end;
v14.getIncompleteSignupUsername = function() --[[ Line: 194 ]] --[[ Name: getIncompleteSignupUsername ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    local v31 = v14.getMultipageSignupMetadataMap();
    if v31 == nil or v31 == "" then
        return "";
    else
        local v32 = l_HttpService_0:JSONDecode(v31);
        if v32 == nil or v32 == "" or next(v32) == nil or next(v32) == "" or v32.IncompleteSignupUsername == nil then
            return "";
        else
            return v32.IncompleteSignupUsername;
        end;
    end;
end;
v14.setIncompleteSignupUsername = function(v33) --[[ Line: 212 ]] --[[ Name: setIncompleteSignupUsername ]]
    -- upvalues: l_GetFFlagEnableMultiPageSignup_0 (copy), v14 (copy), l_HttpService_0 (copy)
    if l_GetFFlagEnableMultiPageSignup_0() then
        local v34 = v14.getMultipageSignupMetadataMap();
        local v35 = nil;
        if v34 == nil or v34 == "" then
            v35 = {
                IncompleteSignupUsername = v33
            };
        else
            v35 = l_HttpService_0:JSONDecode(v34);
            v35.IncompleteSignupUsername = v33;
        end;
        v14.setMultipageSignupMetadataMap(l_HttpService_0:JSONEncode(v35));
    end;
end;
getMultiPageSignupKey = function(v36) --[[ Line: 228 ]] --[[ Name: getMultiPageSignupKey ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    local v37 = v14.getMultipageSignupMetadataMap();
    if v37 == nil or v37 == "" then
        return "";
    else
        local v38 = l_HttpService_0:JSONDecode(v37);
        if v38 == nil or v38 == "" or next(v38) == nil or next(v38) == "" or v38[v36] == nil then
            return "";
        else
            return v38[v36];
        end;
    end;
end;
setMultiPageSignupKey = function(v39, v40) --[[ Line: 240 ]] --[[ Name: setMultiPageSignupKey ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy)
    if game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable") then
        local v41 = v14.getMultipageSignupMetadataMap();
        local v42 = nil;
        if v41 == nil or v41 == "" then
            v42 = {
                [v39] = v40
            };
        else
            v42 = l_HttpService_0:JSONDecode(v41);
            v42[v39] = v40;
        end;
        v14.setMultipageSignupMetadataMap(l_HttpService_0:JSONEncode(v42));
    end;
end;
v14.getPasskeySignupUsername = function() --[[ Line: 256 ]] --[[ Name: getPasskeySignupUsername ]]
    -- upvalues: v7 (copy)
    return getMultiPageSignupKey(v7.passkeySignupName);
end;
v14.setPasskeySignupUsername = function(v43) --[[ Line: 260 ]] --[[ Name: setPasskeySignupUsername ]]
    -- upvalues: v7 (copy)
    setMultiPageSignupKey(v7.passkeySignupName, v43);
end;
v14.flush = function() --[[ Line: 264 ]] --[[ Name: flush ]]
    -- upvalues: l_AppStorageService_0 (copy)
    l_AppStorageService_0:flush();
end;
return v14;