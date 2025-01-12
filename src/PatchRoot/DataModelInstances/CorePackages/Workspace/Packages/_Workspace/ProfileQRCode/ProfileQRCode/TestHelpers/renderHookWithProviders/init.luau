local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.Dev.ReactRoblox);
local l_act_0 = v1.act;
local v3 = require(script.Parent.createTreeWithProviders);
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: renderHookWithProviders ]]
    -- upvalues: v3 (copy), v1 (copy), l_act_0 (copy)
    local v6 = nil;
    local function v8(v7) --[[ Line: 11 ]]
        -- upvalues: v6 (ref), v4 (copy)
        v6 = v4(v7);
        return nil;
    end;
    local _ = function(_) --[[ Line: 16 ]] --[[ Name: createRootElement ]]
        -- upvalues: v3 (ref), v8 (copy), v5 (copy)
        return (v3(v8, v5 or {}));
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v12 = v1.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 25 ]]
        -- upvalues: v12 (copy), v3 (ref), v8 (copy), v5 (copy)
        local l_v12_0 = v12;
        local _ = {};
        l_v12_0:render((v3(v8, v5 or {})));
    end);
    local function v18(v15) --[[ Line: 29 ]] --[[ Name: rerender ]]
        -- upvalues: l_act_0 (ref), v12 (copy), v3 (ref), v8 (copy), v5 (copy)
        l_act_0(function() --[[ Line: 30 ]]
            -- upvalues: v12 (ref), v15 (copy), v3 (ref), v8 (ref), v5 (ref)
            local l_v12_1 = v12;
            local _ = v15;
            l_v12_1:render((v3(v8, v5 or {})));
        end);
    end;
    return {
        result = v6, 
        rerender = v18, 
        cleanup = function() --[[ Line: 35 ]] --[[ Name: cleanup ]]
            -- upvalues: v12 (copy)
            v12:unmount();
        end
    };
end;