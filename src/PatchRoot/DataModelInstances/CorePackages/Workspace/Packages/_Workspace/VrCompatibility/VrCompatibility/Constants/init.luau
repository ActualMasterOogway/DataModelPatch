local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GetFFlagAdjustVRFloor_0 = v1.GetFFlagAdjustVRFloor;
local l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0 = v1.GetFIntMaquettesAppPanelDistanceMultiplierPercentage;
local v4 = l_GetFFlagAdjustVRFloor_0() and -0.2 or 4.8;
local v5 = l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0() / 100;
return {
    MainScreenResolution = Vector2.new(1600, 900), 
    MainScreenSize = Vector2.new(4.5, 2.7) * v5, 
    MainScreenCurvature = 70, 
    MainScreenPosition = Vector3.new(0, v4, -4 * v5), 
    AppSystemBarPosition = Vector3.new(-2.35 * v5, v4, -3.15 * v5), 
    AppSystemBarSize = Vector2.new(0.495, 2.7) * v5, 
    AppSystemBarResolution = Vector2.new(64, 360), 
    CentralOverlayPosition = Vector3.new(0, v4, -3.5 * v5), 
    ToastSize = Vector2.new(2.5, 1.5), 
    ToastPosition = Vector3.new(0, 3.299999952316284, -2.799999952316284, 0), 
    ToastResolution = Vector2.new(650, 382), 
    ToastCurvature = 50, 
    DefaultCameraPosition = Vector3.new(0, v4, 0), 
    FTUX = {
        UniverseId = "4510252459", 
        PlaceId = "12887241816"
    }, 
    ROUNDED_CORNER_RADIUS = 15, 
    PositionLockedPanelName = "PositionLocked"
};