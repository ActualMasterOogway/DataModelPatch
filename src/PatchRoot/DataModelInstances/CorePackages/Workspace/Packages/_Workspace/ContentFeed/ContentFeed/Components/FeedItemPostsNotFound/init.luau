local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
return function(v7) --[[ Line: 19 ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v8 = l_useStyle_0();
    local v9 = l_useLocalization_0({
        postsNotFound = "Feature.ContentFeed.Body.PostsNotFound"
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v7.screenSizeYWithInsets)
    }, {
        NotFoundMessage = v1.createElement(l_StyledTextLabel_0, {
            fluidSizing = false, 
            fontStyle = v8.Font.Header1, 
            colorStyle = v8.Theme.TextEmphasis, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 1), 
            text = v9.postsNotFound, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center
        })
    });
end;