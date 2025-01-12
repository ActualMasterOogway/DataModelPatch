local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
v2.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v4.Cryo;
local l_Foundation_0 = v4.Foundation;
local l_Roact_0 = v4.Roact;
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
l_Roact_0.setGlobalConfig({
    propValidation = true, 
    elementTracing = true
});
local v9 = {
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
local v10 = {
    language = "en-us"
};
return {
    name = "Squads", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = l_Roact_0, 
    mapDefinition = function(v11) --[[ Line: 46 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_Cryo_0 (copy), v10 (copy)
        local v12 = l_Cryo_0.Dictionary.join(v10, v11.controls or {});
        return l_Cryo_0.Dictionary.join(v11, {
            controls = v12
        });
    end, 
    mapStory = function(v13) --[[ Line: 50 ]] --[[ Name: mapStory ]]
        -- upvalues: v9 (copy), l_Roact_0 (copy), l_Foundation_0 (copy), l_AppStyleProvider_0 (copy), l_mockLocale_0 (copy)
        return function(v14) --[[ Line: 51 ]]
            -- upvalues: v9 (ref), l_Roact_0 (ref), l_Foundation_0 (ref), l_AppStyleProvider_0 (ref), l_mockLocale_0 (ref), v13 (copy)
            local v15 = v14 and v9[v14.theme] or v9.Default;
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                l_Roact_0.createElement(l_Foundation_0.FoundationProvider, {
                    device = "Desktop", 
                    theme = v15.themeName
                }, {
                    l_Roact_0.createElement(l_AppStyleProvider_0, {
                        style = v15
                    }, {
                        Child = l_mockLocale_0(v13, v14)
                    })
                })
            });
        end;
    end
};