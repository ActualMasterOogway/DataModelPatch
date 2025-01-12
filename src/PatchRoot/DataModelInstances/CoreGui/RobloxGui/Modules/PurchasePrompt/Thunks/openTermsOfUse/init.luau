local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.UpsellFlow);
local v2 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v3 = require(l_Parent_0.Services.ExternalSettings);
local v4 = require(l_Parent_0.Services.PlatformInterface);
local v5 = require(l_Parent_0.Thunk);
local v6 = {
    v3, 
    v4
};
return function() --[[ Line: 15 ]] --[[ Name: openTermsOfUse ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v4 (copy), v2 (copy), v1 (copy)
    return v5.new(script.Name, v6, function(_, v8) --[[ Line: 16 ]]
        -- upvalues: v3 (ref), v4 (ref), v2 (ref), v1 (ref)
        local v9 = v8[v3];
        local v10 = v8[v4];
        if v2(v9.getPlatform()) == v1.Web then
            v10.openTermsOfUse();
        end;
    end);
end;