local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v5 = {
    {
        contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png", 
        filePath = "c://some/path/to/2231221_1818_1234598400000.png", 
        type = v3.Screenshot
    }, 
    {
        contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png", 
        filePath = "c://some/path/to/2231221_14375697_1653030000000.png", 
        type = v3.Screenshot
    }
};
return function(v6) --[[ Line: 30 ]]
    -- upvalues: v2 (copy), v5 (copy)
    local v7 = {};
    for v8 = 1, v6 do
        local v9 = v2.joinDeep(v5[v8 % #v5 + 1], {});
        local v10 = string.sub(v9.contentId, 21);
        v9.contentId = "rbxasset://textures/" .. ("/./"):rep((math.floor(v8 / #v5))) .. v10;
        table.insert(v7, v9);
    end;
    return v7;
end;