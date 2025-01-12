local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_act_0 = v3.act;
local v5 = require(l_script_FirstAncestor_0.TestUtils.makeTestRoot);
return function(v6, v7) --[[ Line: 14 ]] --[[ Name: renderHookWithProviders ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy), l_act_0 (copy)
    local v8 = nil;
    local function v9() --[[ Line: 17 ]]
        -- upvalues: v8 (ref), v6 (copy), v7 (copy)
        v8 = v6(v7);
        return nil;
    end;
    local function v11() --[[ Line: 22 ]] --[[ Name: createRootElement ]]
        -- upvalues: v5 (ref), v2 (ref), v9 (copy)
        local v10 = v5({});
        return v2.createElement(v10, {}, v2.createElement(v9, {}));
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v13 = v3.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 30 ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13:render(v11());
    end);
    return {
        getResult = function() --[[ Line: 40 ]] --[[ Name: getResult ]]
            -- upvalues: v8 (ref)
            return v8;
        end, 
        cleanup = function() --[[ Line: 34 ]] --[[ Name: cleanup ]]
            -- upvalues: v13 (copy)
            v13:unmount();
        end
    };
end;