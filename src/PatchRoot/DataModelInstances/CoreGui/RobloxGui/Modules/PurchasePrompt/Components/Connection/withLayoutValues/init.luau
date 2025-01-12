local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v2 = require(script.Parent.LayoutValuesContext);
return function(v3) --[[ Line: 11 ]]
    -- upvalues: l_Roact_0 (copy), v2 (copy)
    assert(type(v3) == "function", "Expect withLayoutValues callback to be a function.");
    return l_Roact_0.createElement(v2.Consumer, {
        render = v3
    });
end;