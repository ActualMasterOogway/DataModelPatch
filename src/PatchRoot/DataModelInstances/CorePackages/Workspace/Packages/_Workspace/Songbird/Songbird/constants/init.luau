local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local _ = require(l_script_FirstAncestor_0.Parent.ReactOtter);
local l_Images_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).App.ImageSet.Images;
return {
    AUDIO_ANALYTICS_CONTEXT = "Audio", 
    MIN_AUDIO_REPORTING_SIZE = Vector2.new(540, 420), 
    BIG_VECTOR = Vector2.new(1e999, 1e999), 
    PROGRESS_BAR_SPRING = {
        stiffness = 15, 
        damping = 10, 
        mass = 1
    }, 
    ARTIST_NAME_HEIGHT = 14, 
    TRACK_NAME_HEIGHT = 16, 
    CLOSE_ICON = l_Images_0["icons/navigation/close"], 
    MUSIC_ICON = l_Images_0["icons/common/music"], 
    OVERFLOW_ICON = l_Images_0["icons/common/overflow"], 
    FILLED_FAVORITE_ICON = l_Images_0["icons/actions/heartOn"], 
    OUTLINED_FAVORITE_ICON = l_Images_0["icons/actions/heartOff"], 
    ICON_SIZE = UDim2.fromOffset(36, 36), 
    WINDOW_HEIGHT = 60
};