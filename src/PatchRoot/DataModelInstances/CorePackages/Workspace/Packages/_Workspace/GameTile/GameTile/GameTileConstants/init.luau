local l_GameTileLayoutType_0 = require(script.Parent.GameTileTypes).GameTileLayoutType;
return {
    TileOverlay = {
        BottomRightPosition = UDim2.new(0.96, 0, 0.93, 0)
    }, 
    PlayButtonStyleValues = {
        Enabled = "Enabled", 
        Disabled = "Disabled"
    }, 
    PlayerCountStyleValues = {
        Hover = "Hover", 
        Always = "Always", 
        Footer = "Footer"
    }, 
    TileBadgeTypeValues = {
        Text = "Text"
    }, 
    TileBadgePositionValues = {
        ImageTopLeft = "ImageTopLeft"
    }, 
    TileBadgeIconTypeValues = {
        PaidAccess = "PaidAccess"
    }, 
    TileBadgeIconNamesByType = {
        PaidAccess = "icons/menu/gem_small"
    }, 
    TileTextLines = {
        [l_GameTileLayoutType_0.Narrow] = {
            titleTextLines = 2, 
            metadataTextLines = 1
        }, 
        [l_GameTileLayoutType_0.Wide] = {
            titleTextLines = 1, 
            metadataTextLines = 1
        }, 
        [l_GameTileLayoutType_0.Event] = {
            titleTextLines = 1, 
            metadataTextLines = 1
        }
    }
};