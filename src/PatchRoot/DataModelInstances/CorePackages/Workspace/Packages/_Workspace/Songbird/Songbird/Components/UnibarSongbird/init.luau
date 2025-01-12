local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_createNextOrder_0 = v2.createNextOrder;
local v9 = {
    AlbumArt = UDim2.fromOffset(32, 32), 
    Divider = UDim2.fromOffset(1, 24), 
    LikeButton = UDim2.fromOffset(32, 32)
};
local v10 = 0;
for _, v12 in pairs(v9) do
    v10 = v10 + v12.X.Offset;
end;
return function(v13) --[[ Line: 38 ]] --[[ Name: UnibarSongbird ]]
    -- upvalues: l_useStyle_0 (copy), l_createNextOrder_0 (copy), v1 (copy), v9 (copy), v10 (ref), l_StyledTextLabel_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy)
    local v14 = l_useStyle_0();
    local v15 = l_createNextOrder_0();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        AlbumArt = v1.createElement("ImageLabel", {
            LayoutOrder = v15(), 
            BackgroundTransparency = 1, 
            Image = if v13.albumArt then v13.albumArt else "", 
            Size = v9.AlbumArt, 
            [v1.Tag] = "data-testid=album-art"
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        }), 
        Stack = v1.createElement("Frame", {
            LayoutOrder = v15(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -v10, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 8), 
                PaddingLeft = UDim.new(0, 8)
            }), 
            Cluster = v1.createElement("Frame", {
                LayoutOrder = v15(), 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                AudioDetails = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    Layout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Title = v1.createElement(l_StyledTextLabel_0, {
                        text = v13.title, 
                        fontStyle = v14.Font.CaptionHeader, 
                        colorStyle = v14.Theme.TextEmphasis, 
                        lineHeight = 1, 
                        layoutOrder = v15()
                    }), 
                    Artist = v1.createElement(l_StyledTextLabel_0, {
                        text = v13.artist, 
                        fontStyle = v14.Font.CaptionBody, 
                        colorStyle = v14.Theme.TextMuted, 
                        lineHeight = 1, 
                        layoutOrder = v15()
                    })
                })
            })
        }), 
        Divider = v1.createElement("Frame", {
            LayoutOrder = v15(), 
            Size = v9.Divider, 
            BorderSizePixel = 0, 
            BackgroundTransparency = v14.Theme.Divider.Transparency, 
            BackgroundColor3 = v14.Theme.Divider.Color
        }), 
        LikeButton = v1.createElement(l_ImageSetButton_0, {
            LayoutOrder = v15(), 
            Image = if v13.isFavorited then l_Images_0["icons/actions/favoriteOn"] else l_Images_0["icons/actions/favoriteOff"], 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Size = v9.LikeButton, 
            [v1.Event.Activated] = v13.onFavorite, 
            [v1.Tag] = "data-testid=favorite-button"
        })
    });
end;