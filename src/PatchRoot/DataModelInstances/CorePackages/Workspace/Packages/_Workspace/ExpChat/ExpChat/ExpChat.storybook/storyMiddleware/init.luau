local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v3 (copy)
    local l_UIBloxConfig_0 = require(l_script_FirstAncestor_0:FindFirstChild("UIBloxConfig"));
    v3.init(l_UIBloxConfig_0);
end);
if not l_status_0 then
    warn("Error initializing UIBlox", l_result_0);
end;
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local l_Constants_0 = v3.App.Style.Constants;
local l_Light_0 = l_Constants_0.ThemeName.Light;
local l_Dark_0 = l_Constants_0.ThemeName.Dark;
local l_Gotham_0 = l_Constants_0.FontName.Gotham;
local v13 = {
    Light = {
        themeName = l_Light_0, 
        fontName = l_Gotham_0
    }, 
    Dark = {
        themeName = l_Dark_0, 
        fontName = l_Gotham_0
    }
};
local v14 = {};
return function(v15) --[[ Line: 37 ]]
    -- upvalues: v14 (copy), v2 (copy), l_AppStyleProvider_0 (copy), v13 (copy), l_Dictionary_0 (copy)
    if not v14[v15] then
        v14[v15] = function(v16) --[[ Line: 40 ]]
            -- upvalues: v2 (ref), l_AppStyleProvider_0 (ref), v13 (ref), v15 (copy), l_Dictionary_0 (ref)
            return v2.createElement(l_AppStyleProvider_0, {
                style = v13[v16.theme or "Dark"]
            }, {
                Child = v2.createElement(v15, l_Dictionary_0.join(v16, v16.definition and v16.definition.props))
            });
        end;
    end;
    return v14[v15];
end;