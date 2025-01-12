local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceWidgets");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
v2.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.Dev.AppLocales).Localization;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v9 = require(l_Parent_0.Dev.Rodux);
local v10 = require(l_Parent_0.Dev.RoactRodux);
local l_AppStyleProvider_1 = v2.App.Style.AppStyleProvider;
local v12 = {
    Default = {
        themeName = "Dark", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
local function v13() --[[ Line: 33 ]] --[[ Name: createStore ]]
    -- upvalues: v9 (copy)
    return v9.Store.new(v9.createReducer({}, {}));
end;
return {
    name = "AvatarExperienceWidgets", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v3, 
    reactRoblox = v4, 
    mapStory = function(v14) --[[ Line: 42 ]] --[[ Name: mapStory ]]
        -- upvalues: v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_AppStyleProvider_1 (copy), v12 (copy), l_AppStyleProvider_0 (copy), v10 (copy), v13 (copy), l_DesignTokenProvider_0 (copy)
        return function(v15) --[[ Line: 43 ]]
            -- upvalues: v3 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_AppStyleProvider_1 (ref), v12 (ref), l_AppStyleProvider_0 (ref), v10 (ref), v13 (ref), l_DesignTokenProvider_0 (ref), v14 (copy)
            return v3.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new("en-us")
            }, {
                AppStyleProvider = v3.createElement(l_AppStyleProvider_1, {
                    style = v15 and v12[v15.theme] or v12.Default
                }, {
                    StyleProvider = v3.createElement(l_AppStyleProvider_0, {
                        style = v15 and v12[v15.theme] or v12.Default
                    }, {
                        StoreProvider = v3.createElement(v10.StoreProvider, {
                            store = v13()
                        }, {
                            DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
                                tokenMappers = {}
                            }, {
                                Child = v3.createElement(v14, v15)
                            })
                        })
                    })
                })
            });
        end;
    end
};