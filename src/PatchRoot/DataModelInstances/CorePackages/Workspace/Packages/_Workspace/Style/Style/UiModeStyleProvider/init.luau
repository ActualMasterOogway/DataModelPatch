local l_script_FirstAncestor_0 = script:FindFirstAncestor("Style");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local v7 = require(script.Parent.ThemeContext);
local l_AppStyleProvider_0 = require(l_Parent_0.UIBlox).App.Style.AppStyleProvider;
local v9 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v9.FoundationProvider;
local l_Theme_0 = v9.Enums.Theme;
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
local v13 = {
    dark = l_Theme_0.Dark, 
    light = l_Theme_0.Light
};
local function v24(v14) --[[ Line: 41 ]] --[[ Name: UiModeStyleProvider ]]
    -- upvalues: l_useDeviceType_0 (copy), v4 (copy), l_UserGameSettings_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_FoundationProvider_0 (copy), v13 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_AppStyleProvider_0 (copy)
    local v15 = l_useDeviceType_0();
    local v16, v17 = v4.useState({
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
        reducedMotion = l_UserGameSettings_0.ReducedMotion, 
        preferredTextSize = l_UserGameSettings_0.PreferredTextSize
    });
    v4.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v17 (copy), l_UserGameSettings_0 (ref)
        local function v18() --[[ Line: 51 ]] --[[ Name: updateSettings ]]
            -- upvalues: v17 (ref), l_UserGameSettings_0 (ref)
            v17({
                preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion, 
                preferredTextSize = l_UserGameSettings_0.PreferredTextSize
            });
        end;
        local v19 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(v18);
        local v20 = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(v18);
        local v21 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(v18);
        return function() --[[ Line: 65 ]]
            -- upvalues: v19 (copy), v20 (copy), v21 (copy)
            v19:Disconnect();
            v20:Disconnect();
            v21:Disconnect();
        end;
    end, {});
    local l_style_0 = v14.style;
    local v23 = v4.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v3 (ref), l_style_0 (copy), v15 (copy), v16 (copy)
        return v3.Dictionary.join({
            deviceType = l_style_0.deviceType or v15
        }, l_style_0, {
            settings = v16
        });
    end, l_dependencyArray_0(l_style_0, v15, v16));
    return v4.createElement(l_FoundationProvider_0, {
        device = v23.deviceType, 
        theme = v13[v23.themeName:lower()], 
        preferences = v23.settings, 
        DONOTUSE_colorUpdate = l_GetFFlagLuaAppEnableFoundationColors_0()
    }, v4.createElement(l_AppStyleProvider_0, {
        style = v23
    }, v14.children));
end;
return function(v25) --[[ Line: 99 ]] --[[ Name: ThemeProvider ]]
    -- upvalues: v4 (copy), v3 (copy), v7 (copy), v24 (copy)
    local v26, v27 = v4.useState(v25.style.themeName);
    local v28 = table.clone(v25);
    v28.style = v3.Dictionary.join(v28.style, {
        themeName = v26
    });
    return v4.createElement(v7.Provider, {
        value = {
            theme = v26, 
            setTheme = v27
        }
    }, v4.createElement(v24, v28));
end;