local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedParentalConsentDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_createStyleProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).createStyleProvider;
local v8 = require(l_script_FirstAncestor_0.Hooks.NetworkContext);
local v9 = require(l_script_FirstAncestor_0.Hooks.ScreenSizeContext);
local function v12() --[[ Line: 15 ]] --[[ Name: createLocalization ]]
    return {
        Format = function(_, v11) --[[ Line: 17 ]] --[[ Name: Format ]]
            return v11 .. "-translated";
        end, 
        GetLocale = function() --[[ Line: 20 ]] --[[ Name: GetLocale ]]
            return "locale";
        end
    };
end;
local function v13() --[[ Line: 26 ]] --[[ Name: createStore ]]
    -- upvalues: v4 (copy)
    return v4.Store.new(v4.createReducer({}, {}));
end;
return function(v14) --[[ Line: 41 ]] --[[ Name: makeTestRoot ]]
    -- upvalues: v13 (copy), v12 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_createStyleProvider_0 (copy), v8 (copy), v2 (copy), l_DesignTokenProvider_0 (copy), v9 (copy)
    local v15 = v14.store or v13();
    local v16 = v14.network or {};
    local v17 = v14.localization or v12();
    local v18 = v14.screenSize or Vector2.new(1000, 1000);
    return function(v19) --[[ Line: 47 ]]
        -- upvalues: v3 (ref), l_LocalizationProvider_0 (ref), v17 (copy), l_createStyleProvider_0 (ref), v8 (ref), v16 (copy), v2 (ref), v15 (copy), l_DesignTokenProvider_0 (ref), v9 (ref), v18 (copy)
        return v3.createElement(l_LocalizationProvider_0, {
            localization = v17
        }, {
            StyleProvider = l_createStyleProvider_0({
                NetworkProvider = v3.createElement(v8.Provider, {
                    value = v16
                }, {
                    StoreProvider = v3.createElement(v2.StoreProvider, {
                        store = v15
                    }, {
                        DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, v3.createElement(v9.Provider, {
                            value = v18
                        }, {
                            TestSubject = v19.children
                        }))
                    })
                })
            })
        });
    end;
end;