local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local function v5(v2, v3) --[[ Line: 39 ]] --[[ Name: waitForEventsTimes ]]
    for _ = 1, v3 do
        v2(function() --[[ Line: 41 ]]
            task.defer(coroutine.running());
            coroutine.yield();
        end);
    end;
end;
local function v7(v6) --[[ Line: 48 ]] --[[ Name: waitForEvents ]]
    -- upvalues: v5 (copy)
    v5(v6, 1);
end;
local function v13(v8, ...) --[[ Line: 52 ]] --[[ Name: forceUpdateGuiObject ]]
    for v9 = 1, select("#", ...) do
        local v10 = select(v9, ...);
        if v10:IsA("ScrollingFrame") then
            local _ = v10.AbsoluteCanvasSize.Y;
        else
            local _ = v10.AbsoluteSize.Y;
        end;
    end;
    v8(function() --[[ Line: 61 ]]
        task.wait();
    end);
end;
local function v15(v14) --[[ Line: 66 ]] --[[ Name: noAct ]]
    v14();
end;
local function v18(v16) --[[ Line: 70 ]] --[[ Name: createActWrapper ]]
    -- upvalues: v1 (copy), v15 (copy)
    return (setmetatable({
        act = function(...) --[[ Line: 72 ]] --[[ Name: act ]]
            -- upvalues: v16 (copy), v1 (ref)
            return v16(v1.act, ...);
        end
    }, {
        __call = function(_, ...) --[[ Line: 76 ]] --[[ Name: __call ]]
            -- upvalues: v16 (copy), v15 (ref)
            return v16(v15, ...);
        end
    }));
end;
return {
    forceUpdateGuiObject = v18(v13), 
    waitForEvents = v18(v7), 
    waitForEventsTimes = v18(v5)
};