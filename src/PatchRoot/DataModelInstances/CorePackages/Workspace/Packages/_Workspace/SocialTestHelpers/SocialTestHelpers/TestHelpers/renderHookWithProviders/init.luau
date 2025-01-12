local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTestHelpers");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_ReactRoblox_0 = v1.ReactRoblox;
local l_act_0 = l_ReactRoblox_0.act;
local l_Dash_0 = v1.Dash;
local v5 = require(script.Parent.createTreeWithProviders);
return function(v6, v7) --[[ Line: 48 ]] --[[ Name: renderHookWithProviders ]]
    -- upvalues: l_Dash_0 (copy), v5 (copy), l_ReactRoblox_0 (copy), l_act_0 (copy)
    local v8 = nil;
    local function v10(v9) --[[ Line: 51 ]]
        -- upvalues: v8 (ref), v6 (copy)
        v8 = {
            v6(v9)
        };
        return nil;
    end;
    local function v14(v11, v12) --[[ Line: 56 ]] --[[ Name: createRootElement ]]
        -- upvalues: l_Dash_0 (ref), v7 (copy), v5 (ref), v10 (copy)
        local v13 = l_Dash_0.join(v7 or {}, v12 or {});
        v13.props = l_Dash_0.join(v13.props or {}, v11 or {});
        return (v5(v10, v13));
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v16 = l_ReactRoblox_0.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 68 ]]
        -- upvalues: v16 (copy), v14 (copy)
        v16:render((v14({})));
    end);
    local function v19(v17, v18) --[[ Line: 72 ]] --[[ Name: rerender ]]
        -- upvalues: l_act_0 (ref), v16 (copy), v14 (copy)
        l_act_0(function() --[[ Line: 73 ]]
            -- upvalues: v16 (ref), v14 (ref), v17 (copy), v18 (copy)
            v16:render((v14(v17, v18)));
        end);
    end;
    return {
        result = if v8 then v8[1] else nil, 
        getResult = function() --[[ Line: 85 ]] --[[ Name: getResult ]]
            -- upvalues: v8 (ref)
            if v8 then
                return v8[1];
            else
                return nil;
            end;
        end, 
        getResults = function() --[[ Line: 88 ]] --[[ Name: getResults ]]
            -- upvalues: v8 (ref)
            return unpack(v8);
        end, 
        rerender = v19, 
        cleanup = function() --[[ Line: 78 ]] --[[ Name: cleanup ]]
            -- upvalues: v16 (copy)
            v16:unmount();
        end
    };
end;