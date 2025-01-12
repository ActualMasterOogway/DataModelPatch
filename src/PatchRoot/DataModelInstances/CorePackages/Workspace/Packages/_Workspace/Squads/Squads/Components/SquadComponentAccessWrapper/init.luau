local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_SquadExternalContractContext_0 = v1.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
return function(v4) --[[ Line: 13 ]]
    -- upvalues: l_React_0 (copy), l_SquadExternalContractContext_0 (copy)
    if l_React_0.useContext(l_SquadExternalContractContext_0).useParentChannelHasSquadAccess(v4.parentChannelId) then
        return v4.children;
    else
        return nil;
    end;
end;