local l_Parent_0 = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local v5 = require(l_Parent_0.Localization.LocalizationService);
local v6 = require(script.Parent.LocalizationContextConsumer);
local v7 = l_t_0.strictInterface({
    locKeys = l_t_0.table, 
    render = l_t_0.callback
});
local v8 = l_t_0.strictInterface({
    key = l_t_0.string, 
    params = l_t_0.optional(l_t_0.table)
});
return function(v9) --[[ Line: 23 ]] --[[ Name: MultiTextLocalizer ]]
    -- upvalues: v7 (copy), v8 (copy), l_Roact_0 (copy), v6 (copy), v5 (copy)
    assert(v7(v9));
    for _, v11 in pairs(v9.locKeys) do
        assert(v8(v11));
    end;
    local l_render_0 = v9.render;
    return l_Roact_0.createElement(v6, {
        render = function(v13) --[[ Line: 32 ]] --[[ Name: render ]]
            -- upvalues: v9 (copy), v5 (ref), l_render_0 (copy)
            local v14 = {};
            for v15, v16 in pairs(v9.locKeys) do
                v14[v15] = v5.getString(v13, v16.key, v16.params);
            end;
            return l_render_0(v14);
        end
    });
end;