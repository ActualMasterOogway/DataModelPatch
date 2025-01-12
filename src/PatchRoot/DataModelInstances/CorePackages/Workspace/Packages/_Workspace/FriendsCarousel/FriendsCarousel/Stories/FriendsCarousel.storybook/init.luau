local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v2.init(v3);
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local v5 = require(l_Parent_0.Roact);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v7 = require(l_script_FirstAncestor_0.TestHelpers.mockAnalytics);
local v8 = require(l_script_FirstAncestor_0.Analytics);
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
local v10 = require(l_Parent_0.RoactRodux);
local v11 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v13 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
v5.setGlobalConfig({
    elementTracing = true
});
local v15 = {
    Default = {
        themeName = "Light", 
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
local v16 = {
    language = "en-us"
};
local v17 = v7({}, {
    fn = function() --[[ Line: 46 ]] --[[ Name: fn ]]

    end
});
local v19 = v11.Store.new(function(v18) --[[ Line: 47 ]]
    return v18;
end, {}, {});
return {
    name = "FriendsCarousel", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v5, 
    mapDefinition = function(v20) --[[ Line: 55 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_llama_0 (copy), v16 (copy)
        local v21 = l_llama_0.Dictionary.join(v16, v20.controls or {});
        return l_llama_0.Dictionary.join(v20, {
            controls = v21
        });
    end, 
    mapStory = function(v22) --[[ Line: 59 ]] --[[ Name: mapStory ]]
        -- upvalues: v5 (copy), l_AppStyleProvider_0 (copy), v15 (copy), v8 (copy), v17 (copy), v13 (copy), l_mockApolloClient_0 (copy), v10 (copy), v19 (copy), l_DesignTokenProvider_0 (copy), l_mockLocale_0 (copy)
        return function(v23) --[[ Line: 60 ]]
            -- upvalues: v5 (ref), l_AppStyleProvider_0 (ref), v15 (ref), v8 (ref), v17 (ref), v13 (ref), l_mockApolloClient_0 (ref), v10 (ref), v19 (ref), l_DesignTokenProvider_0 (ref), l_mockLocale_0 (ref), v22 (copy)
            return v5.createElement(l_AppStyleProvider_0, {
                style = v23 and v15[v23.theme] or v15.Default
            }, {
                v5.createElement(v8.Context.Provider, {
                    value = v17.value
                }, {
                    apolloClient = v5.createElement(v13.ApolloProvider, {
                        client = l_mockApolloClient_0({})
                    }, {
                        storeProvider = v5.createElement(v10.StoreProvider, {
                            store = v19
                        }, {
                            designTokenProvider = v5.createElement(l_DesignTokenProvider_0, {
                                tokenMappers = {}
                            }, {
                                Child = l_mockLocale_0(v22, v23)
                            })
                        })
                    })
                })
            });
        end;
    end
};