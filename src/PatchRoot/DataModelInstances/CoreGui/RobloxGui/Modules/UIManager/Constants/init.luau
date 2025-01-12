local v0 = {
    ScreenUI = "ScreenUI", 
    SpatialUI = "SpatialUI", 
    SpatialUIPartOnly = "SpatialUIPartOnly", 
    SpatialUIRoact = "SpatialUIRoact"
};
local v1 = {
    Chat = "Chat", 
    RobloxGui = "RobloxGui", 
    BottomBar = "BottomBar", 
    MoreMenu = "MoreMenu"
};
local v2 = {
    MainUIGroup = "MainUIGroup", 
    WristUIGroup = "WristUIGroup"
};
local v3 = workspace.CurrentCamera.HeadScale / 0.3;
local v4 = Vector2.new(0.1365, 0.1995) * v3;
local v5 = Vector2.new(0.532, 0.3395) * v3;
local v6 = CFrame.new(v5.X * 0.5 + v4.X * 0.5 + 0.02 * v3, 0, 0);
local v7 = {
    [v1.Chat] = {
        type = v0.SpatialUI, 
        spatialPanelProps = {
            name = "ExperienceChat", 
            faceCamera = true, 
            lerp = true, 
            partSize = v4, 
            virtualScreenSize = v4 * 800
        }
    }, 
    [v1.RobloxGui] = {
        type = v0.SpatialUIPartOnly, 
        spatialPanelProps = {
            name = "RobloxGuiPanel-PartOnly", 
            faceCamera = true, 
            lerp = true, 
            partSize = v5
        }
    }
};
local v8 = {
    [v1.Chat] = {
        uiGroup = v2.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = v6
        }
    }, 
    [v1.RobloxGui] = {
        uiGroup = v2.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = CFrame.new(0, 0, 0)
        }
    }
};
local v9 = CFrame.new(0, -v5.Y * 0.5 - 0.075 - 0.01 * v3, 0) * CFrame.Angles(0, 3.141592653589793, 0);
local v10 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0);
local v11 = {
    [v1.BottomBar] = v2.MainUIGroup, 
    [v1.MoreMenu] = v2.MainUIGroup
};
local v12 = {
    [v1.BottomBar] = v9, 
    [v1.MoreMenu] = v10
};
return {
    SpatialUIType = v0, 
    SpatialUIGroupType = v2, 
    PanelType = v1, 
    DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10), 
    VR_PANEL_RESOLUTION_MULTIPLIER = 800, 
    CHAT_PANEL_RESOLUTION_MULTIPLIER = 800, 
    BOTTOM_BAR_BASE_PART_SIZE = 0.15, 
    COMPAT_PANEL_PROPS_MAP = v7, 
    SPATIAL_PANEL_POSITION_PROPS_MAP = v8, 
    ROACT_PANEL_UIGROUP_MAP = v11, 
    ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = v12
};