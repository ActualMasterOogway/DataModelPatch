local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.SQUAD_URL);
local _ = require(script.Parent.Parent.networkingSquadTypes);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy)
    return (v3.roduxNetworking.POST({
        Name = "CreateExperienceInvite"
    }, function(v4, v5) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), l_HttpService_0 (ref)
        return v4(v1):path("group-up"):path("v1"):path("invite-to-experience"):body({
            membershipEntityId = v5.membershipEntityId, 
            placeId = v5.placeId, 
            requestId = l_HttpService_0:GenerateGUID(false), 
            voteIdentifier = v5.voteIdentifier
        });
    end));
end;