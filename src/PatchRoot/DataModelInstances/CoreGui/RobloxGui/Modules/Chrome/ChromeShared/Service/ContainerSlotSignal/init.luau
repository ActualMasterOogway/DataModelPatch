local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v3 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v4 = require(l_script_FirstAncestor_0.Unibar.Constants);
local _ = function(v5) --[[ Line: 13 ]] --[[ Name: getConstrainedSlotWidth ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v6 = v3.viewport:get();
    local _ = nil;
    return (math.min((if v6.isMobileDevice then if v6.tinyPortrait then v4.MOBILE_TINY_PORTRAIT_SLOTS else if v6.portraitOrientation then v4.MOBILE_PORTRAIT_SLOTS else v4.MOBILE_LANDSCAPE_SLOTS else v4.NON_MOBILE_SLOTS) - v4.TOGGLE_SLOTS, v5));
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy), l_Signal_0 (copy), v9 (copy)
    local v11 = {};
    local v12 = v10 or 3;
    local v13 = v3.viewport:get();
    local _ = nil;
    v11._state = math.min((if v13.isMobileDevice then if v13.tinyPortrait then v4.MOBILE_TINY_PORTRAIT_SLOTS else if v13.portraitOrientation then v4.MOBILE_PORTRAIT_SLOTS else v4.MOBILE_LANDSCAPE_SLOTS else v4.NON_MOBILE_SLOTS) - v4.TOGGLE_SLOTS, v12);
    v11._requestedSlots = v10;
    v11._changeSignal = l_Signal_0.new();
    return (setmetatable(v11, v9));
end;
v9.connect = function(v15, v16) --[[ Line: 51 ]] --[[ Name: connect ]]
    return v15._changeSignal:connect(v16);
end;
v9.requestSlots = function(v17, v18) --[[ Line: 56 ]] --[[ Name: requestSlots ]]
    -- upvalues: v3 (copy), v4 (copy)
    v17._requestedSlots = v18;
    local v19 = v3.viewport:get();
    local _ = nil;
    local v21 = math.min((if v19.isMobileDevice then if v19.tinyPortrait then v4.MOBILE_TINY_PORTRAIT_SLOTS else if v19.portraitOrientation then v4.MOBILE_PORTRAIT_SLOTS else v4.MOBILE_LANDSCAPE_SLOTS else v4.NON_MOBILE_SLOTS) - v4.TOGGLE_SLOTS, v18);
    if v17._state ~= v21 then
        v17._state = v21;
        v17._changeSignal:fire(v21);
    end;
end;
v9.get = function(v22) --[[ Line: 66 ]] --[[ Name: get ]]
    return v22._state;
end;
v9.updateConstraints = function(v23) --[[ Line: 71 ]] --[[ Name: updateConstraints ]]
    v23:requestSlots(v23._requestedSlots);
end;
return v9;