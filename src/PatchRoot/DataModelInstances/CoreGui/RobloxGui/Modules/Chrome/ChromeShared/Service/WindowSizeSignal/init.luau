local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v3 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v4 = require(l_script_FirstAncestor_0.Unibar.Constants);
local function v12(v5, v6) --[[ Line: 11 ]] --[[ Name: getConstrainedWindowSize ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v7 = v3.mobileDevice:get();
    local v8 = v3.screenSize:get();
    local v9 = v8.Y > v8.X;
    local l_v5_0 = v5;
    local l_v6_0 = v6;
    if v7 then
        if v9 then
            l_v6_0 = math.min(v6, v4.MAX_HEIGHT_PORTRAIT);
            l_v5_0 = math.min(v5, v4.MAX_WIDTH_PORTRAIT);
        elseif not v9 then
            l_v6_0 = math.min(v6, v4.MAX_HEIGHT_LANDSCAPE);
            l_v5_0 = math.min(v5, v4.MAX_WIDTH_LANDSCAPE);
        end;
    end;
    return UDim2.new(0, l_v5_0, 0, l_v6_0);
end;
local v13 = {};
v13.__index = v13;
v13.new = function(v14, v15, v16) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v4 (copy), l_Signal_0 (copy), v13 (copy)
    return (setmetatable({
        _state = v12(v14 or v4.DEFAULT_WIDTH, v15 or v4.DEFAULT_HEIGHT), 
        _isLarge = v16 or false, 
        _changeSignal = l_Signal_0.new()
    }, v13));
end;
v13.connect = function(v17, v18) --[[ Line: 58 ]] --[[ Name: connect ]]
    return v17._changeSignal:connect(v18);
end;
v13.requestSize = function(v19, v20, v21) --[[ Line: 63 ]] --[[ Name: requestSize ]]
    -- upvalues: v12 (copy)
    local v22 = v12(v20, v21);
    if v19._state ~= v22 then
        v19._state = v22;
        v19._changeSignal:fire(v22);
    end;
end;
v13.toggleIsLarge = function(v23) --[[ Line: 72 ]] --[[ Name: toggleIsLarge ]]
    local v24 = not v23._isLarge;
    v23._isLarge = v24;
    v23._changeSignal:fire(v24);
end;
v13.get = function(v25) --[[ Line: 78 ]] --[[ Name: get ]]
    return v25._state;
end;
v13.getIsLarge = function(v26) --[[ Line: 82 ]] --[[ Name: getIsLarge ]]
    return v26._isLarge;
end;
v13.updateConstraints = function(v27) --[[ Line: 87 ]] --[[ Name: updateConstraints ]]
    v27:requestSize(v27._state.Width.Offset, v27._state.Height.Offset);
end;
return v13;