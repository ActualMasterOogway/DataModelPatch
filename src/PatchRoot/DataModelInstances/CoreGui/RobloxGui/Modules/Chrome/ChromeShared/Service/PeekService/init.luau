local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v5 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local l_AnalyticActions_0 = v5.AnalyticActions;
local l_sendAnalytics_0 = v5.sendAnalytics;
local l_GetFIntChromeDefaultPeekDuration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntChromeDefaultPeekDuration;
local l_GetFIntChromePeekCooldownSeconds_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntChromePeekCooldownSeconds;
local l_Signal_0 = v2.Signal;
local v11 = {
    duration = l_GetFIntChromeDefaultPeekDuration_0()
};
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: l_GetFIntChromePeekCooldownSeconds_0 (copy), l_Signal_0 (copy), v12 (copy)
    return (setmetatable({
        PEEK_COOLDOWN_SEC = l_GetFIntChromePeekCooldownSeconds_0(), 
        _peekConfigs = {}, 
        _isCurrentPeekLocked = false, 
        _isOnCooldown = false, 
        onPeekQueued = l_Signal_0.new(), 
        onPeekShown = l_Signal_0.new(), 
        onPeekDismissed = l_Signal_0.new(), 
        onPeekHidden = l_Signal_0.new(), 
        onPeekChanged = l_Signal_0.new()
    }, v12));
end;
v12.configurePeek = function(v13, v14, v15) --[[ Line: 84 ]] --[[ Name: configurePeek ]]
    v13._peekConfigs[v14] = v15;
end;
v12._getLifetimeConfig = function(v16, v17) --[[ Line: 88 ]] --[[ Name: _getLifetimeConfig ]]
    -- upvalues: v3 (copy), v11 (copy)
    local v18 = v16._peekConfigs[v17];
    if v18 then
        return v3.Dictionary.join(v11, if v18.lifetime then v18.lifetime else {});
    else
        return v11;
    end;
end;
v12._hideCurrentPeek = function(v19) --[[ Line: 97 ]] --[[ Name: _hideCurrentPeek ]]
    local l__currentPeek_0 = v19._currentPeek;
    if l__currentPeek_0 then
        v19._currentPeek = nil;
        v19.onPeekHidden:fire(l__currentPeek_0);
        v19.onPeekChanged:fire(l__currentPeek_0);
        v19._isCurrentPeekLocked = false;
        v19._isOnCooldown = true;
        v19._thread = task.delay(v19.PEEK_COOLDOWN_SEC, function() --[[ Line: 107 ]]
            -- upvalues: v19 (copy)
            v19._isOnCooldown = false;
        end);
    end;
end;
v12._showPeek = function(v21, v22) --[[ Line: 113 ]] --[[ Name: _showPeek ]]
    v21._currentPeek = v22;
    v21.onPeekShown:fire(v22);
    v21.onPeekChanged:fire(v22);
end;
v12.getCurrentPeek = function(v23) --[[ Line: 119 ]] --[[ Name: getCurrentPeek ]]
    return v23._currentPeek;
end;
v12.getPeekConfig = function(v24, v25) --[[ Line: 123 ]] --[[ Name: getPeekConfig ]]
    return v24._peekConfigs[v25];
end;
v12.tryShowPeek = function(v26, v27) --[[ Line: 127 ]] --[[ Name: tryShowPeek ]]
    -- upvalues: l_sendAnalytics_0 (copy), l_AnalyticActions_0 (copy)
    if v26._currentPeek or v26._isOnCooldown then
        return false;
    else
        v26:_showPeek(v27);
        l_sendAnalytics_0({
            action = l_AnalyticActions_0.Appear
        });
        local v28 = v26:_getLifetimeConfig(v27);
        v26._thread = task.delay(v28.duration, function() --[[ Line: 140 ]]
            -- upvalues: v26 (copy), v27 (copy), l_sendAnalytics_0 (ref), l_AnalyticActions_0 (ref)
            while v26._isCurrentPeekLocked do
                task.wait();
            end;
            if v26._currentPeek == v27 then
                v26:_hideCurrentPeek();
                l_sendAnalytics_0({
                    action = l_AnalyticActions_0.SelfDismiss
                });
            end;
        end);
        return true;
    end;
end;
v12.lockCurrentPeek = function(v29) --[[ Line: 160 ]] --[[ Name: lockCurrentPeek ]]
    if v29._currentPeek then
        v29._isCurrentPeekLocked = true;
    end;
end;
v12.unlockCurrentPeek = function(v30) --[[ Line: 166 ]] --[[ Name: unlockCurrentPeek ]]
    v30._isCurrentPeekLocked = false;
end;
v12.dismissPeek = function(v31, v32) --[[ Line: 170 ]] --[[ Name: dismissPeek ]]
    if v31._currentPeek == v32 then
        v31.onPeekDismissed:fire(v32);
        v31:_hideCurrentPeek();
    end;
end;
v12.destroy = function(v33) --[[ Line: 177 ]] --[[ Name: destroy ]]
    v33._currentPeek = nil;
    if v33._thread then
        task.cancel(v33._thread);
    end;
end;
return v12;