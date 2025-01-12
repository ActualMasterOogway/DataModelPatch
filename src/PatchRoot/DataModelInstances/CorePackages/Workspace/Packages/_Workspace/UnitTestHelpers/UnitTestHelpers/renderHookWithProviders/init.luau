local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.ReactRoblox);
local l_act_0 = v1.act;
local v3 = require(script.Parent.createTreeWithProviders);
return function(v4, v5) --[[ Line: 12 ]] --[[ Name: renderHookWithProviders ]]
    -- upvalues: v3 (copy), v1 (copy), l_act_0 (copy)
    local v6 = nil;
    local v7 = nil;
    local function v9(v8) --[[ Line: 16 ]]
        -- upvalues: v6 (ref), v4 (copy)
        v6 = v4(v8);
        return nil;
    end;
    local function _(v10) --[[ Line: 21 ]] --[[ Name: createRootElement ]]
        -- upvalues: v3 (ref), v9 (copy)
        return (v3(v9, v10));
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v13 = v1.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 30 ]]
        -- upvalues: v13 (copy), v5 (copy), v3 (ref), v9 (copy)
        v13:render((v3(v9, v5)));
    end);
    local function v17(v14) --[[ Line: 34 ]] --[[ Name: rerender ]]
        -- upvalues: l_act_0 (ref), v13 (copy), v5 (copy), v3 (ref), v9 (copy), v7 (ref)
        l_act_0(function() --[[ Line: 35 ]]
            -- upvalues: v13 (ref), v14 (copy), v5 (ref), v3 (ref), v9 (ref)
            local l_v13_0 = v13;
            local v16 = v14 or v5;
            l_v13_0:render((v3(v9, v16)));
        end);
        return v7();
    end;
    local function v18() --[[ Line: 42 ]] --[[ Name: cleanup ]]
        -- upvalues: v13 (copy)
        v13:unmount();
    end;
    v7 = function() --[[ Line: 46 ]]
        -- upvalues: v6 (ref), v17 (copy), v18 (copy)
        return {
            result = v6, 
            rerender = v17, 
            cleanup = v18
        };
    end;
    return v7();
end;