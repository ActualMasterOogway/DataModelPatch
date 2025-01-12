local l_Parent_0 = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v3 = require(l_Parent_0.Localization.LocalizationService);
local v4 = require(script.Parent.LocalizationContextConsumer);
return function(v5) --[[ Line: 11 ]] --[[ Name: NumberLocalizer ]]
    -- upvalues: l_Roact_0 (copy), v4 (copy), v3 (copy)
    local l_number_0 = v5.number;
    local l_render_0 = v5.render;
    assert(typeof(l_number_0) == "number", "prop 'number' must be provided");
    assert(typeof(l_render_0) == "function", "Render prop must be a function");
    return l_Roact_0.createElement(v4, {
        render = function(v8) --[[ Line: 19 ]] --[[ Name: render ]]
            -- upvalues: l_render_0 (copy), v3 (ref), l_number_0 (copy)
            return l_render_0(v3.formatNumber(v8, l_number_0));
        end
    });
end;