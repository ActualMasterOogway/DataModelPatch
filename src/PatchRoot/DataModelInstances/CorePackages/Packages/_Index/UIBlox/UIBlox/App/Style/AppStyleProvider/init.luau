local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Utility.getTextSizeOffset);
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.Roact);
local v6 = l_Parent_1:FindFirstAncestor("Packages") or l_Parent_1:FindFirstAncestor("CorePackages");
local v7 = if v6 and v6:FindFirstChild("Dev") and v6.Dev:FindFirstChild("JestGlobals") then pcall(require, v6.Dev.JestGlobals) else false;
local v8 = require(l_Parent_2.Foundation);
local l_FoundationProvider_0 = v8.FoundationProvider;
local l_useTokens_0 = v8.Hooks.useTokens;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v12 = require(l_Parent_0.Themes.getThemeFromName);
local v13 = require(l_Parent_0.Fonts.getFontFromName);
local v14 = require(l_Parent_0.Constants);
local _ = require(script.Parent.StyleTypes);
local v16 = require(script.Parent.Tokens);
local v17 = require(l_Parent_1.Core.Style.StyleContext);
local v18 = require(l_Parent_1.UIBloxConfig);
local v19 = require(l_Parent_1.Logger);
local l_getTokens_0 = v16.getTokens;
local l_validateTokens_0 = v16.validateTokens;
local l_getFoundationTokens_0 = v16.getFoundationTokens;
local l_Mappers_0 = v16.Mappers;
local v24 = {
    dark = v8.Enums.Theme.Dark, 
    light = v8.Enums.Theme.Light
};
local v25 = {
    themeName = v14.DefaultThemeName, 
    fontName = v14.DefaultFontName, 
    deviceType = v14.DefaultDeviceType, 
    settings = v14.DefaultSettings
};
return function(v26) --[[ Line: 81 ]] --[[ Name: AppStyleProvider ]]
    -- upvalues: l_Object_0 (copy), v25 (copy), v4 (copy), l_getTokens_0 (copy), v12 (copy), v18 (copy), l_useTokens_0 (copy), l_getFoundationTokens_0 (copy), l_Mappers_0 (copy), l_validateTokens_0 (copy), v13 (copy), v14 (copy), v2 (copy), v17 (copy), v5 (copy), v7 (copy), v19 (copy), l_FoundationProvider_0 (copy), v24 (copy)
    local v27 = l_Object_0.assign({}, v25, v26.style);
    local v28, v29 = v4.useState(v27.themeName);
    local v30 = l_getTokens_0(v27.deviceType, v28);
    local v31, v32 = v4.useState(0);
    local v33 = v12(v28);
    local v34 = if v18.useFoundationProvider then l_useTokens_0().Config ~= nil else false;
    if v18.useFoundationColors then
        local v35 = l_getFoundationTokens_0(v27.deviceType, v28);
        v30 = l_Mappers_0.mapColorTokensToFoundation(v30, v35);
        v33 = l_Mappers_0.mapThemeToFoundation(v33, v35);
    end;
    assert(l_validateTokens_0(v30), "Invalid tokens!");
    local v36 = {
        Font = v13(v27.fontName, v30), 
        Theme = v33, 
        Tokens = v30, 
        Settings = if v27.settings then {
            PreferredTransparency = v27.settings.preferredTransparency, 
            ReducedMotion = v27.settings.reducedMotion, 
            PreferredTextSize = v27.settings.preferredTextSize
        } else v14.DefaultSettings
    };
    local v37 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v37 (copy), v29 (copy), v27 (copy)
        v37.current = true;
        v29(v27.themeName);
        return function() --[[ Line: 114 ]]
            -- upvalues: v37 (ref)
            v37.current = false;
        end;
    end, {
        v37, 
        v27.themeName, 
        v29
    });
    v4.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: v2 (ref), v30 (ref), v32 (copy)
        local v38, v39 = v2(v30.Semantic.Typography.Body.Font);
        if v38 then
            v32(v39);
        end;
    end, {
        v27.settings.preferredTextSize
    });
    local v42 = v4.useCallback(function(_, v41) --[[ Line: 126 ]]
        -- upvalues: v37 (copy), v29 (copy)
        if v37.current then
            v29(v41);
        end;
    end, {
        v37, 
        v29
    });
    local v43 = if v18.enableUseStyleMetadata then v4.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v28 (copy), v14 (ref)
        if v28:lower() == v14.ThemeName.Dark:lower() then
            return v14.ThemeName.Dark;
        elseif v28:lower() == v14.ThemeName.Light:lower() then
            return v14.ThemeName.Light;
        else
            return v14.DefaultThemeName;
        end;
    end, {
        v28
    }) else nil;
    local v44 = v4.createElement(v17.Provider, {
        value = {
            style = v36, 
            updateTheme = v42, 
            derivedValues = {
                textSizeOffset = v31
            }, 
            styleMetadata = if v18.enableUseStyleMetadata then {
                ThemeName = v43
            } else nil
        }
    }, v5.oneChild(v26.children));
    if not v34 and v18.useFoundationProvider then
        if not v7 then
            v19:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."));
        end;
        return v4.createElement(l_FoundationProvider_0, {
            theme = v24[v28:lower()], 
            device = v27.deviceType, 
            preferences = v27.settings, 
            DONOTUSE_colorUpdate = v18.useFoundationColors
        }, v44);
    else
        return v44;
    end;
end;