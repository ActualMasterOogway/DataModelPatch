local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = require(l_Parent_0.UIBlox);
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = v1.PureComponent:extend("LoadingAvatar");
local v8 = game:DefineFastFlag("AppChatLoadingIndicatorTransparency", false);
v7.defaultProps = {
    avatarImage = l_Images_0["component_assets/circle_49_mask"], 
    cellHeight = 64, 
    avatarSize = 36, 
    LayoutOrder = 0
};
v7.render = function(v9) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_ShimmerPanel_0 (copy), v8 (copy), l_ImageSetLabel_0 (copy)
    local v10 = v9.props.cellHeight / 2 - v9.props.avatarSize / 2;
    return l_withStyle_0(function(v11) --[[ Line: 25 ]]
        -- upvalues: v1 (ref), v9 (copy), l_ShimmerPanel_0 (ref), v10 (copy), v8 (ref), l_ImageSetLabel_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(0, v9.props.cellHeight, 0, v9.props.cellHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v9.props.LayoutOrder, 
            BorderSizePixel = 0
        }, {
            avatarShimmer = v1.createElement(l_ShimmerPanel_0, {
                Size = UDim2.fromOffset(v9.props.avatarSize, v9.props.avatarSize), 
                Position = UDim2.fromOffset(v10, v10), 
                cornerRadius = UDim.new(0, v9.props.cellHeight)
            }), 
            avatarMask = if v8 then nil else v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(v9.props.avatarSize, v9.props.avatarSize), 
                Position = UDim2.fromOffset(v10, v10), 
                Image = v9.props.avatarImage, 
                BackgroundTransparency = 1, 
                ImageColor3 = v11.Theme.BackgroundDefault.Color
            })
        });
    end);
end;
return v7;