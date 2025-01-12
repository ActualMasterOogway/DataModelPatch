local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v3 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v3.FoundationProvider;
local v5 = require(script.Parent.TreeReport);
return function(_) --[[ Line: 13 ]] --[[ Name: AREntrypoint ]]
    -- upvalues: v1 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v3 (copy), v5 (copy)
    return v1.createElement(l_LayerCollectorProvider_0, {}, {
        v1.createElement(l_FoundationProvider_0, {
            theme = v3.Enums.Theme.Dark
        }, {
            TreeReport = v1.createElement(v5, {})
        })
    });
end;