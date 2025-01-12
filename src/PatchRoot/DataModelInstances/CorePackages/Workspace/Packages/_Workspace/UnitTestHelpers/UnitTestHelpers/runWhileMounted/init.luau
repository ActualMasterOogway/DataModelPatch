local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.ReactRoblox);
local l_dumpInstanceTree_0 = require(l_Parent_0.AppDebug).dumpInstanceTree;
return function(v3, v4) --[[ Line: 16 ]] --[[ Name: runWhileMounted ]]
    -- upvalues: v1 (copy), l_dumpInstanceTree_0 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v6 = v1.createRoot(l_ScreenGui_0);
    v1.act(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v3 (copy)
        v6:render(v3);
    end);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: v4 (copy), l_ScreenGui_0 (copy), v6 (copy)
        v4(l_ScreenGui_0, v6);
        return "Success";
    end);
    local v9 = nil;
    if not l_status_0 then
        v9 = string.format("%s\n\nInstance Tree:\n\n%s", tostring(l_result_0), l_dumpInstanceTree_0(l_ScreenGui_0));
    end;
    v6:unmount();
    if not l_status_0 then
        error(v9);
    end;
end;