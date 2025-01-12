local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationIncreasePadding);
local v2 = v1() and 20 or 8;
local v3 = v1() and 28 or 36;
return {
    AVATAR_PADDING = v2, 
    CHAT_MESSAGE_MAX_SPACE = 10, 
    CHAT_MESSAGE_MIN_SPACE = 2, 
    MESSAGE_RIGHT_PADDING = 8, 
    THUMBNAIL_SIZE = v3, 
    NOTICE_HORIZONTAL_PADDING = 10, 
    DATETIME_MAX_WIDTH = 1000, 
    SHIMMER_WIDTH = 150, 
    SHIMMER_HEIGHT = 20, 
    ALERT_ICON_IMAGE = "rbxasset://textures/ui/LuaChat/icons/ic-alert.png", 
    ALERT_ICON_SIZE = 18, 
    TAIL_WIDTH = 6, 
    REPLIED_DISPLAY_NAME_BOTTOM_PADDING = 7, 
    INPUT_BEGAN_DELAY_MILLISEC = 175, 
    LONG_PRESS_DELAY_MILLISEC = 175, 
    PEEK_VIEW_ANIMATION_MILLISEC = 75
};