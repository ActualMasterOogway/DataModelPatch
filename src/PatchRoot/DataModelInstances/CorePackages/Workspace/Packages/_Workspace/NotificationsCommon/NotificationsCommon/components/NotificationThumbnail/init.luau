local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local v7 = require(l_Parent_0.type);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local v10 = require(l_Parent_0.constants);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v13 = l_Images_0["icons/graphic/logomark-gradient_xlarge"];
local v14 = l_Images_0["icons/common/safety"];
local v15 = require(l_context_0.useNotificationCardState);
local function v17(v16) --[[ Line: 20 ]]
    -- upvalues: v7 (copy), l_UserLibConstants_0 (copy)
    if v16 == v7.SENDERThumbnailTypeEnum.Game then
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    elseif v16 == v7.SENDERThumbnailTypeEnum.User then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarHeadShot;
    elseif v16 == v7.SENDERThumbnailTypeEnum.Group then
        return l_UserLibConstants_0.RbxthumbTypes.GroupIcon;
    elseif v16 == v7.SENDERThumbnailTypeEnum.Asset then
        return l_UserLibConstants_0.RbxthumbTypes.Asset;
    elseif v16 == v7.SENDERThumbnailTypeEnum.Bundle then
        return l_UserLibConstants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    end;
end;
local function _(v18) --[[ Line: 36 ]]
    -- upvalues: v7 (copy)
    return v18.idType == v7.SENDERThumbnailTypeEnum.User;
end;
return function() --[[ Line: 40 ]]
    -- upvalues: v15 (copy), l_useStyle_0 (copy), v7 (copy), v10 (copy), l_React_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy), v13 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v17 (copy), l_LoadableImage_0 (copy)
    local v20 = v15("thumbnail");
    if v20 == nil or #v20 == 0 then
        return nil;
    else
        local v21 = v20[1];
        if v21 == nil then
            return nil;
        else
            local v22 = l_useStyle_0();
            if v21.idType == v7.SENDERThumbnailTypeEnum.Icon then
                if v21.id == v10.SafetyThumbnailId then
                    return l_React_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 1), 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BorderSizePixel = 0
                    }, {
                        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(1, 1), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            LayoutOrder = 1, 
                            Image = v14, 
                            BackgroundTransparency = 1, 
                            ImageColor3 = v22.Theme.IconDefault.Color
                        })
                    });
                else
                    return l_React_0.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.fromScale(1, 1), 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BackgroundColor3 = v22.Tokens.Global.Color.Black.Color3, 
                        BorderSizePixel = 0
                    }, {
                        UICorner = l_React_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(0.8, 0.8), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            LayoutOrder = 1, 
                            Image = v13, 
                            BackgroundTransparency = 1
                        })
                    });
                end;
            else
                local v23 = l_getRbxthumbWithTypeSizeAndOptions_0(v21.id, v17(v21.idType), 150);
                return l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BorderSizePixel = 0
                }, {
                    Thumbnail = l_React_0.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
                        Image = v23, 
                        Size = UDim2.fromScale(1, 1), 
                        cornerRadius = if v21.idType == v7.SENDERThumbnailTypeEnum.User then UDim.new(0.5, 0) else UDim.new(0, 8), 
                        showFailedStateWhenLoadingFailed = true, 
                        useShimmerAnimationWhileLoading = true, 
                        ZIndex = 1
                    })
                });
            end;
        end;
    end;
end;