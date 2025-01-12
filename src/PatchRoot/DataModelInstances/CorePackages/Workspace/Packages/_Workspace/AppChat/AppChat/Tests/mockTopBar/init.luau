local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_script_FirstAncestor_0.TopBarContext);
local v6 = v4.Component:extend("MockTopBarProvider");
v6.init = function(v7) --[[ Line: 12 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v3 (copy)
    v7.state = {
        topBar = {}
    };
    v7.getScreenTopBar = function(v8) --[[ Line: 17 ]]
        -- upvalues: v2 (ref), v7 (copy)
        v2.isType(v8, "string", "screen");
        return v7.state.topBar[v8] or {};
    end;
    v7.setScreenTopBar = function(v9, v10) --[[ Line: 23 ]]
        -- upvalues: v2 (ref), v7 (copy), v3 (ref)
        v2.isType(v9, "string", "screen");
        v2.isType(v10, "table", "state");
        v7:setState(function(v11) --[[ Line: 27 ]]
            -- upvalues: v3 (ref), v9 (copy), v10 (copy)
            local v12 = v3.Dictionary.join(v11.topBar[v9] or {}, v10);
            return {
                topBar = v3.Dictionary.join(v11.topBar, {
                    [v9] = v12
                })
            };
        end);
    end;
end;
v6.render = function(v13) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy)
    return v4.createElement(v5.Provider, {
        value = v3.Dictionary.join(v13.state.topBar, {
            getScreenTopBar = v13.getScreenTopBar, 
            setScreenTopBar = v13.setScreenTopBar
        })
    }, {
        Element = v13.props[v4.Children]
    });
end;
return function(v14) --[[ Line: 50 ]]
    -- upvalues: v4 (copy), v6 (copy)
    return v4.createElement(v6, {}, v14);
end;