local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v1.Cryo;
local l_UIBlox_0 = v1.UIBlox;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_getColorFromUserId_0 = v1.SquadsCore.Common.getColorFromUserId;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v10 = require(l_Parent_0.React);
local v11 = {
    borderColor = Color3.fromRGB(0, 0, 0), 
    borderWidth = 0, 
    horizontalAlignment = Enum.HorizontalAlignment.Left, 
    facePileWidth = UDim.new(1, 0), 
    layoutOrder = 0, 
    reverse = false
};
return function(v12) --[[ Line: 63 ]]
    -- upvalues: l_Cryo_0 (copy), v11 (copy), v10 (copy), l_useStyle_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_ImageSetLabel_0 (copy), l_getColorFromUserId_0 (copy), l_dependencyArray_0 (copy)
    local v13 = l_Cryo_0.Dictionary.join(v11, v12 or {});
    local v14 = v10.useRef(nil);
    local v15, v16 = v10.useState(0);
    local v17 = l_useStyle_0();
    local l_Theme_0 = v17.Theme;
    local l_Font_0 = v17.Font;
    v10.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v16 (copy), v14 (copy)
        v16(if v14 and v14.current then v14.current.AbsoluteSize.X else 0);
    end);
    local v35 = v10.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: v13 (copy), v15 (copy), v10 (ref), l_Font_0 (copy), l_Theme_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), l_ImageSetLabel_0 (ref), l_getColorFromUserId_0 (ref), l_Cryo_0 (ref)
        local l_users_0 = v13.users;
        local l_avatarSize_0 = v13.avatarSize;
        local l_overlapOffset_0 = v13.overlapOffset;
        local l_borderWidth_0 = v13.borderWidth;
        local l_borderColor_0 = v13.borderColor;
        local v25 = if v13.faceCount then v13.faceCount else #l_users_0;
        local l_horizontalAlignment_0 = v13.horizontalAlignment;
        local l_reverse_0 = v13.reverse;
        if v15 < l_avatarSize_0 or l_avatarSize_0 < l_overlapOffset_0 or v15 <= 0 or l_avatarSize_0 <= 0 or v25 <= 0 or v25 < #l_users_0 then
            return nil;
        else
            local v28 = 0;
            v28 = if l_avatarSize_0 == l_overlapOffset_0 then v25 else math.floor((v15 - l_avatarSize_0) / (l_avatarSize_0 - l_overlapOffset_0)) + 1;
            local v29 = {};
            for v30 = 1, v25 do
                if v28 >= v30 then
                    local v31 = "AvatarCell" .. v30;
                    local v32 = UDim2.fromOffset(l_avatarSize_0 - l_borderWidth_0 * 2, l_avatarSize_0 - l_borderWidth_0 * 2);
                    local v33 = nil;
                    if v30 == v28 and v28 < v25 then
                        v33 = v10.createElement("TextLabel", {
                            Font = l_Font_0.CaptionHeader.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            Text = "+" .. math.min(v25 - v28 + 1, 99), 
                            Size = v32, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        });
                    elseif v30 <= #l_users_0 then
                        local v34 = l_getStandardSizeAvatarHeadShotRbxthumb_0(l_users_0[v30]);
                        v33 = v10.createElement(l_ImageSetLabel_0, {
                            Image = v34, 
                            Size = v32, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = l_getColorFromUserId_0((tonumber(l_users_0[v30])))
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        });
                    else
                        v33 = v10.createElement("Frame", {
                            Size = v32, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = l_Theme_0.TextSecondary
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        });
                    end;
                    v29[v31] = v10.createElement("Frame", {
                        Size = UDim2.fromOffset(l_avatarSize_0, l_avatarSize_0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_borderColor_0, 
                        LayoutOrder = v30, 
                        ZIndex = if l_reverse_0 then v25 - v30 + 1 else v30
                    }, {
                        UICorner = v10.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), 
                        UserAvatar = v33
                    });
                else
                    break;
                end;
            end;
            return l_Cryo_0.Dictionary.join(v29, {
                layout = v10.createElement("UIListLayout", {
                    HorizontalAlignment = l_horizontalAlignment_0, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, -l_overlapOffset_0)
                })
            });
        end;
    end, l_dependencyArray_0(v15, v13.users, v13.avatarSize, v13.overlapOffset, v13.borderWidth, v13.borderColor, v13.faceCount, v13.horizontalAlignment, v13.reverse));
    local v37 = v10.useCallback(function(v36) --[[ Line: 201 ]]
        -- upvalues: v16 (copy)
        v16(v36.AbsoluteSize.X);
    end, l_dependencyArray_0(v16));
    return v10.createElement("Frame", {
        ref = v14, 
        Size = UDim2.new(v13.facePileWidth.Scale, v13.facePileWidth.Offset, 0, v13.avatarSize), 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder, 
        [v10.Change.AbsoluteSize] = v37
    }, v35);
end;