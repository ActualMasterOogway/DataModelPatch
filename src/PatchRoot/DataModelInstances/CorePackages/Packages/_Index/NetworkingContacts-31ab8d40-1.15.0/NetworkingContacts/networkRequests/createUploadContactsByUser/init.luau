local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
game:DefineFastString("ContactImporterUploadUrl", "contacts");
local l_game_FastString_0 = game:GetFastString("ContactImporterUploadUrl");
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), l_game_FastString_0 (copy)
    return v4.roduxNetworking.POST({
        Name = "UploadContactsByUser"
    }, function(v5, v6) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), l_game_FastString_0 (ref)
        return v5(v1):path("contacts-api"):path("v1"):path(l_game_FastString_0):body({
            countryCode = v6.countryCode, 
            contacts = v6.contacts
        });
    end);
end;