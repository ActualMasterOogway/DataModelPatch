local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.devDependencies);
local l_ReactRoblox_0 = require(l_script_FirstAncestor_0.dependencies).ReactRoblox;
local l_act_0 = l_ReactRoblox_0.act;
local l_createTreeWithProviders_0 = v1.createTreeWithProviders;
return function(v5, v6) --[[ Line: 13 ]] --[[ Name: renderHookWithProviders ]]
    -- upvalues: l_createTreeWithProviders_0 (copy), l_ReactRoblox_0 (copy), l_act_0 (copy)
    local v7 = nil;
    local function v9(v8) --[[ Line: 16 ]]
        -- upvalues: v7 (ref), v5 (copy)
        v7 = v5(v8);
        return nil;
    end;
    local _ = function(_) --[[ Line: 21 ]] --[[ Name: createRootElement ]]
        -- upvalues: l_createTreeWithProviders_0 (ref), v9 (copy), v6 (copy)
        return (l_createTreeWithProviders_0(v9, v6 or {}));
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v13 = l_ReactRoblox_0.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 30 ]]
        -- upvalues: v13 (copy), l_createTreeWithProviders_0 (ref), v9 (copy), v6 (copy)
        local l_v13_0 = v13;
        local _ = {};
        l_v13_0:render((l_createTreeWithProviders_0(v9, v6 or {})));
    end);
    local function v19(v16) --[[ Line: 34 ]] --[[ Name: rerender ]]
        -- upvalues: l_act_0 (ref), v13 (copy), l_createTreeWithProviders_0 (ref), v9 (copy), v6 (copy)
        l_act_0(function() --[[ Line: 35 ]]
            -- upvalues: v13 (ref), v16 (copy), l_createTreeWithProviders_0 (ref), v9 (ref), v6 (ref)
            local l_v13_1 = v13;
            local _ = v16;
            l_v13_1:render((l_createTreeWithProviders_0(v9, v6 or {})));
        end);
    end;
    return {
        result = v7, 
        rerender = v19, 
        cleanup = function() --[[ Line: 40 ]] --[[ Name: cleanup ]]
            -- upvalues: v13 (copy)
            v13:unmount();
        end
    };
end;