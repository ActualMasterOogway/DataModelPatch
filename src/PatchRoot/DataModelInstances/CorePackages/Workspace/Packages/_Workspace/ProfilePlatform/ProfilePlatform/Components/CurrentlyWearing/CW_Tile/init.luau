local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UserLib);
local l_Constants_0 = v2.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_ItemTile_0 = require(l_Parent_0.UIBlox).Tile.ItemTile;
return function(v6) --[[ Line: 22 ]] --[[ Name: CW_Tile ]]
    -- upvalues: l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v1 (copy), l_ItemTile_0 (copy)
    local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
    local v8 = l_getRbxthumbWithTypeSizeAndOptions_0(v6.assetId, l_Asset_0, 150);
    return v1.createElement(l_ItemTile_0, {
        name = v6.name, 
        thumbnail = v8, 
        onActivated = v6.onActivated, 
        useMaxTitleHeight = true
    });
end;