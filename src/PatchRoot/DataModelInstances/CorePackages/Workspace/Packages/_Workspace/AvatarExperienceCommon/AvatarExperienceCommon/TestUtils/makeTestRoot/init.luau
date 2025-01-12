local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.RoactRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_createStyleProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).createStyleProvider;
local function v9() --[[ Line: 12 ]] --[[ Name: createLocalization ]]
    return {
        Format = function(_, v8) --[[ Line: 14 ]] --[[ Name: Format ]]
            return v8 .. "-translated";
        end, 
        GetLocale = function() --[[ Line: 17 ]] --[[ Name: GetLocale ]]
            return "locale";
        end
    };
end;
local function v10() --[[ Line: 23 ]] --[[ Name: createStore ]]
    -- upvalues: v3 (copy)
    return v3.Store.new(v3.createReducer({}, {}));
end;
return function(v11) --[[ Line: 36 ]] --[[ Name: makeTestRoot ]]
    -- upvalues: v10 (copy), v9 (copy), v2 (copy), l_LocalizationProvider_0 (copy), l_createStyleProvider_0 (copy), v1 (copy), l_DesignTokenProvider_0 (copy)
    local v12 = v11.store or v10();
    local v13 = v11.localization or v9();
    return function(v14) --[[ Line: 40 ]]
        -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), v13 (copy), l_createStyleProvider_0 (ref), v1 (ref), v12 (copy), l_DesignTokenProvider_0 (ref)
        return v2.createElement(l_LocalizationProvider_0, {
            localization = v13
        }, {
            StyleProvider = l_createStyleProvider_0({
                StoreProvider = v2.createElement(v1.StoreProvider, {
                    store = v12
                }, {
                    DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = {}
                    }, {
                        TestSubject = v14.children
                    })
                })
            })
        });
    end;
end;