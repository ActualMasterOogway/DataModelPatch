local l_Parent_0 = script.Parent.Parent.Parent;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
return function() --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy), l_RobloxGui_0 (copy)
    if _G.__TEST_SUITE_PACKAGE__ or _G.__TESTEZ_RUNNING_TEST__ then
        return v2.noop;
    else
        local v4 = v3.useRef(nil);
        v3.useEffect(function() --[[ Line: 20 ]]
            -- upvalues: l_RobloxGui_0 (ref), v4 (copy)
            local l_Sound_0 = Instance.new("Sound");
            l_Sound_0.Name = "ShutterSound";
            l_Sound_0.Parent = l_RobloxGui_0;
            l_Sound_0.Volume = 1;
            l_Sound_0.SoundId = "rbxassetid://10066921516";
            v4.current = l_Sound_0;
            return function() --[[ Line: 28 ]]
                -- upvalues: v4 (ref), l_Sound_0 (copy)
                v4.current = nil;
                l_Sound_0:Destroy();
            end;
        end, {});
        return (v3.useCallback(function() --[[ Line: 34 ]]
            -- upvalues: v4 (copy)
            if v4.current then
                v4.current:Play();
            end;
        end, {}));
    end;
end;