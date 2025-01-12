local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v3 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v5 = v3.PureComponent:extend("EmptyConversationPage");
v5.defaultProps = {
    topBarHeight = 0
};
v5.render = function(_) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v2 (copy)
    return l_withStyle_0(function(v7) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), v2 (ref)
        return v3.createElement("Frame", {
            BackgroundColor3 = v7.Theme.BackgroundDefault.Color, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            Transparency = if v2() then v7.Tokens.Global.Color.None.Transparency else v7.Theme.BackgroundDefault.Transparency
        }, {
            EmptyChatFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ChatIcon = v3.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Image = "rbxasset://textures/ui/LuaChat/icons/ic-chat-large.png", 
                    Size = UDim2.new(0, 150, 0, 150)
                })
            })
        });
    end);
end;
return v5;