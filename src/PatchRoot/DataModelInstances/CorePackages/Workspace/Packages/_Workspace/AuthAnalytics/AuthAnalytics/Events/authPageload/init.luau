local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Logging_0 = require(l_Parent_1.AppCommonLib).Logging;
local v3 = require(l_Parent_0.Utils.checkAndSendEvent);
return function(v4, v5, v6) --[[ Line: 6 ]]
    -- upvalues: l_Logging_0 (copy), v3 (copy)
    local v7 = {};
    if v5 then
        if type(v5) ~= "string" then
            l_Logging_0.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(v5));
            return;
        else
            v7.state = v5;
        end;
    end;
    if v6 ~= nil then
        if type(v6) ~= "boolean" then
            l_Logging_0.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(v6));
            return;
        else
            v7.is_alt_attempt = v6;
        end;
    end;
    v3(v4, "authPageload", v7);
end;