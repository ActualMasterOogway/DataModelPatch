local v0 = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod);
local v1 = require(script.Parent.UIBlox.GetFFlagUIBloxGetTextHeightOptionalMaxHeight);
local v2 = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride);
game:DefineFastFlag("EnablePushNotificationsUpsellModal6", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v0 (copy), v2 (copy)
    return v1() and v0() and game:GetFastFlag("EnablePushNotificationsUpsellModal6") or v2();
end;