local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.AnalyticsContext);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;