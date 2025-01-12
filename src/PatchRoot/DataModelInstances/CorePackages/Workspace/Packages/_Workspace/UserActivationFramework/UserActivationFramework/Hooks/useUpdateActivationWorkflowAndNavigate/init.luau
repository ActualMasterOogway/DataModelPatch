local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v4 = require(l_script_FirstAncestor_0.Thunks.UpdateActivationWorkflow);
local _ = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local v6 = require(l_script_FirstAncestor_0.Enums.UserActivationSignupPageState);
local v7 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
return function(v9) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v7 (copy)
    local v10 = v2.useContext(v3);
    local l_activationFrameworkState_0 = v10.activationFrameworkState;
    local l_dispatch_0 = v10.dispatch;
    local l_namespace_0 = l_activationFrameworkState_0.namespace;
    return v2.useCallback(function(v14) --[[ Line: 17 ]]
        -- upvalues: v4 (ref), l_namespace_0 (copy), l_activationFrameworkState_0 (copy), v6 (ref), l_dispatch_0 (copy), v7 (ref), v9 (copy)
        local v15 = v4(l_namespace_0, l_activationFrameworkState_0.currentState, l_activationFrameworkState_0.payloadTable, v14, l_activationFrameworkState_0.history);
        if v15 == nil then
            l_activationFrameworkState_0.onClose();
            return;
        elseif v15.state == v6.Complete then
            l_activationFrameworkState_0.onWorkflowComplete(l_activationFrameworkState_0.payloadTable);
            return;
        else
            l_dispatch_0({
                type = v7.SetActivationFrameworkState, 
                data = {
                    currentState = v15.state, 
                    availableActions = v15.availableActions, 
                    history = v15.history
                }
            });
            v9.navigate(v15.state);
            return;
        end;
    end, {
        v9, 
        l_activationFrameworkState_0.currentState, 
        l_activationFrameworkState_0.payloadTable, 
        l_dispatch_0
    });
end;