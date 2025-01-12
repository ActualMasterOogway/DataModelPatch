local l_Parent_0 = script:FindFirstAncestor("MultiPageSignup").Parent;
local v1 = require(l_Parent_0.React);
local l_NonInteractiveActivationFrameworkWrapper_0 = require(l_Parent_0.UserActivationFramework).Components.NonInteractiveActivationFrameworkWrapper;
return function(v3) --[[ Line: 16 ]]
    -- upvalues: v1 (copy), l_NonInteractiveActivationFrameworkWrapper_0 (copy)
    return v1.createElement(l_NonInteractiveActivationFrameworkWrapper_0, {
        step = {
            onNonInteractiveStepExecution = function() --[[ Line: 17 ]] --[[ Name: onNonInteractiveStepExecution ]]
                wait(1);
                return {
                    successPayloadAddendum = {}, 
                    errorOutput = nil
                };
            end
        }, 
        navigation = v3.navigation
    });
end;