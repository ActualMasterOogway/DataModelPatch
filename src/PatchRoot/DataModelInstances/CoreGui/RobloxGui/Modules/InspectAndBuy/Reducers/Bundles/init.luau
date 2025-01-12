local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetBundles);
local v5 = require(l_Parent_0.Models.BundleInfo);
return v2.createReducer({}, {
    [v4.name] = function(v6, v7) --[[ Line: 20 ]]
        -- upvalues: v1 (copy), v5 (copy)
        local v8 = {};
        for _, v10 in ipairs(v7.bundles) do
            assert(v10.bundleId ~= nil, "Expected a bundle id when setting a bundle's information.");
            local v11 = v6[v10.bundleId] or {};
            v8[v10.bundleId] = v1.Dictionary.join(v11, v10);
            if v8[v10.bundleId] then
                v8[v10.bundleId] = v5.getSaleDetailsForCollectibles(v8[v10.bundleId]);
            end;
        end;
        return v1.Dictionary.join(v6, v8);
    end
});