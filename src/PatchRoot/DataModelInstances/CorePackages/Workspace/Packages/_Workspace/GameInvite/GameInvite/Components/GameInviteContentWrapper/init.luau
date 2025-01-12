local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Context_0.GameInviteContextProvider);
local v6 = require(l_Components_0.GameInviteContent);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
return function(v8) --[[ Line: 20 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy)
    return v4.createElement(v5, {
        options = v8.options, 
        serverType = v8.serverType, 
        gameDetails = v8.gameDetails, 
        isLoadingCustomParams = v8.isLoading, 
        isCoreScript = v8.isCoreScript
    }, {
        GameInviteContent = v4.createElement(v6, {
            isLoadingCustomParams = v8.isLoading
        })
    });
end;