local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_beforeAll_0 = require(l_Parent_0.Dev.JestGlobals).beforeAll;
local v3 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking);
l_beforeAll_0(function() --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    v3.setNetworkImpl(function(v4) --[[ Line: 9 ]]
        error(string.format("\240\159\148\165 Should have replaced network implementation for url: %s", (tostring(v4))));
    end);
end);