local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_ColorSystem_0 = v3.Common.Style.ColorSystem;
local l_Constants_0 = v3.App.Style.Constants;
local v6 = require(script.Parent.ChatBubbleEnum);
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v8 = {
    isIncoming = false
};
RepliedToMarker = function(v9) --[[ Line: 34 ]] --[[ Name: RepliedToMarker ]]
    -- upvalues: v2 (copy), v8 (copy), l_useSelectedTheme_0 (copy), l_Constants_0 (copy), l_ColorSystem_0 (copy), v1 (copy), v6 (copy)
    local v10 = v2.Dictionary.union(v8, v9);
    local v11 = l_useSelectedTheme_0();
    local v12 = nil;
    v12 = if v11 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[40] else l_ColorSystem_0.Gray[80];
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v6.REPLIED_TO_MARKER_WIDTH, 1, 0), 
        BackgroundColor3 = v12, 
        BorderSizePixel = 0, 
        AnchorPoint = if v10.isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0), 
        Position = if v10.isIncoming then UDim2.new(0, v6.TAIL_WIDTH, 0, 0) else UDim2.new(1, -v6.TAIL_WIDTH, 0, 0)
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
return v1.memo(RepliedToMarker);