local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v2 = require(l_Parent_0.dependencies);
local l_ImagePile_0 = v2.AppBlox.ImagePile;
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v8 = require(l_Parent_0.type);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local v11 = require(l_context_0.useNotificationCardState);
local function v13(v12) --[[ Line: 16 ]]
    -- upvalues: v8 (copy), l_UserLibConstants_0 (copy)
    if v12 == v8.SENDERThumbnailTypeEnum.Game then
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    elseif v12 == v8.SENDERThumbnailTypeEnum.User then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarHeadShot;
    elseif v12 == v8.SENDERThumbnailTypeEnum.Group then
        return l_UserLibConstants_0.RbxthumbTypes.GroupIcon;
    elseif v12 == v8.SENDERThumbnailTypeEnum.Asset then
        return l_UserLibConstants_0.RbxthumbTypes.Asset;
    elseif v12 == v8.SENDERThumbnailTypeEnum.Bundle then
        return l_UserLibConstants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    end;
end;
local function _(v14) --[[ Line: 32 ]]
    -- upvalues: v8 (copy)
    return v14.idType == v8.SENDERThumbnailTypeEnum.User;
end;
return function() --[[ Line: 36 ]]
    -- upvalues: v11 (copy), l_useStyle_0 (copy), v8 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v13 (copy), l_React_0 (copy), l_ImagePile_0 (copy), l_LoadableImage_0 (copy)
    local v16 = v11("thumbnail");
    if v16 == nil or #v16 == 0 then
        return nil;
    else
        local v17 = l_useStyle_0();
        local v18 = {};
        local v19 = false;
        for _, v21 in ipairs(v16) do
            if not (v21.idType == v8.SENDERThumbnailTypeEnum.User) then
                v19 = true;
            end;
            v18[tostring(v21.id)] = l_getRbxthumbWithTypeSizeAndOptions_0(v21.id, v13(v21.idType), 150);
        end;
        local v22 = {};
        if not v19 then
            for _, v24 in v18 do
                table.insert(v22, {
                    Image = v24, 
                    BackgroundColor3 = Color3.fromRGB(101, 102, 104)
                });
            end;
            return l_React_0.createElement(l_ImagePile_0, {
                images = v22, 
                imageBorderColor = v17.Theme.BackgroundUIDefault.Color, 
                imageBorderThickness = #v22 > 1 and 2 or 0
            });
        else
            local v25 = v16[1];
            if v25 == nil then
                return nil;
            else
                local v26 = l_getRbxthumbWithTypeSizeAndOptions_0(v25.id, v13(v25.idType), 150);
                local v27 = UDim.new(0.5, 0);
                return l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BorderSizePixel = 0
                }, {
                    Thumbnail = l_React_0.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v26, 
                        Size = UDim2.fromScale(1, 1), 
                        cornerRadius = if v25.idType == v8.SENDERThumbnailTypeEnum.User then v27 else UDim.new(0, 8), 
                        showFailedStateWhenLoadingFailed = true, 
                        useShimmerAnimationWhileLoading = true, 
                        ZIndex = 1
                    })
                });
            end;
        end;
    end;
end;