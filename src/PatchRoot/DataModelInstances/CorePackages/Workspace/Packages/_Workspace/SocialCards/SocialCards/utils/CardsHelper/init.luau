local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCards");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
local l_SquadCard_0 = require(l_script_FirstAncestor_0.Components).SquadCard.SquadCard;
return {
    CardComponent = {
        group_up = l_createLazyComponent_0(function() --[[ Line: 11 ]]
            -- upvalues: l_SquadCard_0 (copy)
            return l_SquadCard_0;
        end)
    }
};