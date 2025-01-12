local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AuthCommon);
local l_AppStorageUtilities_0 = v2.Utils.AppStorageUtilities;
local l_SignupActionRequired_0 = v2.Enums.SignupActionRequired;
local v5 = require(l_script_FirstAncestor_0.Enums.UserActivationSignupPageState);
local v6 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local _ = require(l_script_FirstAncestor_0.Enums.PayloadKey);
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
return function(v9, v10, v11) --[[ Line: 24 ]] --[[ Name: CreateActivationWorkflow ]]
    -- upvalues: l_AppStorageUtilities_0 (copy), v5 (copy), l_SignupActionRequired_0 (copy), v6 (copy)
    if v11 then
        l_AppStorageUtilities_0.setSignupActionRequired("");
        l_AppStorageUtilities_0.flush();
    end;
    local v12 = l_AppStorageUtilities_0.getSignupActionRequired();
    local l_EnterBirthday_0 = v5.EnterBirthday;
    if v12 == l_SignupActionRequired_0.MultipageCredential then
        l_EnterBirthday_0 = v5.AddAuthMethod;
    end;
    local v14 = {};
    if l_EnterBirthday_0 == v5.EnterBirthday then
        v14 = {
            v6.Close, 
            v6.Next
        };
    elseif l_EnterBirthday_0 == v5.AddAuthMethod then
        v14 = {
            v6.Next
        };
    end;
    return {
        namespace = v9, 
        state = l_EnterBirthday_0, 
        availableActions = v14, 
        payload = v10, 
        history = {
            l_EnterBirthday_0
        }
    };
end;