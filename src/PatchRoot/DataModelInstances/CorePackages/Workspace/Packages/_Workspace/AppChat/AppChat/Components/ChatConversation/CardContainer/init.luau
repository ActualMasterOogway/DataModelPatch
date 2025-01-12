local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SocialCards);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_Cards_0 = v5.Cards;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v10) --[[ Line: 23 ]] --[[ Name: CardContainer ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useTokens_0 (copy), l_useChatPlacementContext_0 (copy), v4 (copy), v2 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Cards_0 (copy)
    local v11 = tostring((l_useLocalUserId_0())) == v10.senderTargetId;
    local v12 = l_useTokens_0();
    local v13 = l_useChatPlacementContext_0();
    local v14 = v4.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v12 (copy)
        return Vector2.new(v12.Size.Size_700, v12.Size.Size_700);
    end, {
        v12
    });
    local v15 = v4.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v12 (copy)
        return v12.Padding.Small;
    end, {
        v12
    });
    local v16 = nil;
    v16 = if not v10.senderTargetId then Enum.HorizontalAlignment.Center else if v11 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left;
    return v4.createElement(v2.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v16, 
            Padding = UDim.new(0, v15), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }, 
        padding = {
            bottom = UDim.new(0, v12.Padding.XXSmall), 
            left = UDim.new(0, v12.Padding.XLarge), 
            right = UDim.new(0, v12.Padding.XLarge), 
            top = UDim.new(0, v12.Padding.XXSmall)
        }
    }, {
        Avatar = if v10.senderTargetId then v4.createElement(v2.Image, {
            Size = UDim2.fromOffset(v14.X, v14.Y), 
            backgroundStyle = v12.Color.Shift.Shift_200, 
            cornerRadius = UDim.new(0, v12.Radius.Circle), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v10.senderTargetId), 
            LayoutOrder = v11 and 2 or 1
        }) else nil, 
        Cards = if v10.cards then v4.createElement(v2.View, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, if v10.senderTargetId then -(v14.X + v15) else 0, 0, 0), 
            LayoutOrder = v11 and 1 or 2
        }, v4.createElement(l_Cards_0, {
            analyticsInfo = {
                moduleLocation = v13.chatPlacement
            }, 
            anchorPoint = if v11 then Vector2.new(1, 0) else Vector2.new(0, 0), 
            position = if v11 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0), 
            cards = v10.cards
        })) else nil
    });
end;