local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
return function(v7) --[[ Line: 24 ]] --[[ Name: MockProviders ]]
    -- upvalues: l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v1 (copy), l_ProviderContainer_0 (copy)
    local v8 = {};
    table.insert(v8, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v8, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v10) --[[ Line: 38 ]] --[[ Name: Format ]]
                    return v10;
                end
            }
        }
    });
    table.insert(v8, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    table.insert(v8, {
        class = l_FoundationProvider_0, 
        props = {
            theme = "Dark"
        }
    });
    return v1.createElement(l_ProviderContainer_0, {
        providers = v8
    }, v7.children);
end;