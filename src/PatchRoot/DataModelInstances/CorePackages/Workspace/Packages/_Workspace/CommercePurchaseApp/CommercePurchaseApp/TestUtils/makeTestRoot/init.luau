local l_Parent_0 = script:FindFirstAncestor("CommercePurchaseApp").Parent;
local v1 = require(l_Parent_0.RoactRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_NetworkContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).NetworkContext;
local l_ScreenSizeContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).ScreenSizeContext;
local l_createStyleProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).createStyleProvider;
local function v11() --[[ Line: 14 ]] --[[ Name: createLocalization ]]
    return {
        Format = function(_, v10) --[[ Line: 16 ]] --[[ Name: Format ]]
            return v10 .. "-translated";
        end, 
        GetLocale = function() --[[ Line: 19 ]] --[[ Name: GetLocale ]]
            return "locale";
        end
    };
end;
local function v12() --[[ Line: 25 ]] --[[ Name: createStore ]]
    -- upvalues: v3 (copy)
    return v3.Store.new(v3.createReducer({}, {}));
end;
return function(v13) --[[ Line: 40 ]] --[[ Name: makeTestRoot ]]
    -- upvalues: v12 (copy), v11 (copy), v2 (copy), l_LocalizationProvider_0 (copy), l_createStyleProvider_0 (copy), l_NetworkContext_0 (copy), v1 (copy), l_DesignTokenProvider_0 (copy), l_ScreenSizeContext_0 (copy)
    local v14 = v13.store or v12();
    local v15 = v13.network or {};
    local v16 = v13.localization or v11();
    local v17 = v13.screenSize or Vector2.new(1000, 1000);
    return function(v18) --[[ Line: 46 ]]
        -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), v16 (copy), l_createStyleProvider_0 (ref), l_NetworkContext_0 (ref), v15 (copy), v1 (ref), v14 (copy), l_DesignTokenProvider_0 (ref), l_ScreenSizeContext_0 (ref), v17 (copy)
        return v2.createElement(l_LocalizationProvider_0, {
            localization = v16
        }, {
            StyleProvider = l_createStyleProvider_0({
                NetworkProvider = v2.createElement(l_NetworkContext_0.Provider, {
                    value = v15
                }, {
                    StoreProvider = v2.createElement(v1.StoreProvider, {
                        store = v14
                    }, {
                        DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, v2.createElement(l_ScreenSizeContext_0.Provider, {
                            value = v17
                        }, {
                            TestSubject = v18.children
                        }))
                    })
                })
            })
        });
    end;
end;