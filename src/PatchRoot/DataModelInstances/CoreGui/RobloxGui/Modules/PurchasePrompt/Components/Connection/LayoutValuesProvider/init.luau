local l_Parent_0 = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v3 = require(l_Parent_0.Services.LayoutValues);
local v4 = require(script.Parent.LayoutValuesContext);
return function(v5) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), l_Roact_0 (copy), v4 (copy)
    local v6 = v3.new(v5.isTenFootInterface);
    return l_Roact_0.createElement(v4.Provider, {
        value = v6.layout
    }, l_Roact_0.oneChild(v5[l_Roact_0.Children]));
end;