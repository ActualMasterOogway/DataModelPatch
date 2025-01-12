local l_Parent_0 = script.Parent.Parent;
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
local l_FFlagEnableToastNotificationsForMobile_0 = require(l_Parent_0.SharedFlags).FFlagEnableToastNotificationsForMobile;
return function(v4, v5) --[[ Line: 13 ]]
    -- upvalues: l_FFlagEnableToastNotificationsForMobile_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_default_0 (copy)
    return pcall(function() --[[ Line: 14 ]]
        -- upvalues: l_FFlagEnableToastNotificationsForMobile_0 (ref), v5 (copy), l_isSubjectToDesktopPolicies_0 (ref), l_default_0 (ref), v4 (copy)
        if l_FFlagEnableToastNotificationsForMobile_0() and v5 and not l_isSubjectToDesktopPolicies_0() then
            game:Shutdown();
        end;
        l_default_0:isURLRegistered(v4):andThen(function(v6) --[[ Line: 22 ]]
            -- upvalues: l_default_0 (ref), v4 (ref), v5 (ref)
            if v6 then
                l_default_0:detectURL(v4);
                return;
            else
                if v5 then
                    game:Shutdown();
                    l_default_0:detectURL(v4);
                end;
                return;
            end;
        end);
    end);
end;