local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v7 = require(l_Actions_0.ChatInputBarSettingsChanged);
local v8 = {
    BackgroundTransparency = v4.ChatInputBarBackgroundTransparency, 
    BackgroundColor3 = v4.ChatInputBarBackgroundColor, 
    TextSize = v4.ChatInputBarTextSize, 
    TextColor3 = v4.ChatInputBarTextColor3, 
    SpatialPanelTextSize = v4.ChatInputBarSpatialPanelTextSize, 
    TextStrokeColor3 = v4.ChatInputBarTextStrokeColor, 
    TextStrokeTransparency = v4.ChatInputBarTextStrokeTransparency, 
    FontFace = v4.ChatInputBarFontFace, 
    PlaceholderColor3 = v4.ChatInputBarPlaceholderColor, 
    KeyboardKeyCode = v4.ChatInputBarDefaultFocusKeyCode, 
    AutocompleteEnabled = v4.ChatInputBarDefaultAutocompleteEnabled
};
return v2.createReducer(v8, {
    [v6.name] = function(v9, v10) --[[ Line: 27 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v9, v10.chatInputBarSettings);
    end, 
    [v7.name] = function(v11, v12) --[[ Line: 31 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v11[v12.property] == nil then
            return v11;
        else
            return l_Dictionary_0.join(v11, {
                [v12.property] = v12.value
            });
        end;
    end
});