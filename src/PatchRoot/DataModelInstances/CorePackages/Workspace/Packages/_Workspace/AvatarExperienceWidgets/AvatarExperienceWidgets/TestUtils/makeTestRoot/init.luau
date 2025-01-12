local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceWidgets").Parent;
local v1 = require(l_Parent_0.Dev.RoactRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dev.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = require(script.Parent.Constants);
local l_createStyleProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).createStyleProvider;
local function v10() --[[ Line: 13 ]] --[[ Name: createLocalization ]]
    -- upvalues: v6 (copy)
    return {
        Format = function(_, v9) --[[ Line: 15 ]] --[[ Name: Format ]]
            -- upvalues: v6 (ref)
            return v9 .. v6.TRANSLATION_TOKEN;
        end, 
        GetLocale = function() --[[ Line: 18 ]] --[[ Name: GetLocale ]]
            return "locale";
        end
    };
end;
local function v11() --[[ Line: 24 ]] --[[ Name: createStore ]]
    -- upvalues: v3 (copy)
    return v3.Store.new(v3.createReducer({}, {}));
end;
return function(v12) --[[ Line: 39 ]] --[[ Name: makeTestRoot ]]
    -- upvalues: v11 (copy), v10 (copy), v2 (copy), l_LocalizationProvider_0 (copy), l_createStyleProvider_0 (copy), v1 (copy), l_DesignTokenProvider_0 (copy)
    local v13 = if v12 and v12.store then v12.store else v11();
    local v14 = if v12 and v12.localization then v12.localization else v10();
    return function(v15) --[[ Line: 45 ]]
        -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), v14 (copy), l_createStyleProvider_0 (ref), v1 (ref), v13 (copy), l_DesignTokenProvider_0 (ref)
        return v2.createElement(l_LocalizationProvider_0, {
            localization = v14
        }, {
            StyleProvider = l_createStyleProvider_0({
                StoreProvider = v2.createElement(v1.StoreProvider, {
                    store = v13
                }, {
                    DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = {}
                    }, {
                        TestSubject = v15.children
                    })
                })
            })
        });
    end;
end;