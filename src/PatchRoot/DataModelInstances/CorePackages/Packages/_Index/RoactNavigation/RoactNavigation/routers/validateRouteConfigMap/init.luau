local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.utils.invariant);
local v2 = require(l_Parent_0.utils.isValidScreenComponent);
local function _(v3) --[[ Line: 6 ]] --[[ Name: getScreenComponent ]]
    if not v3 then
        return nil;
    elseif type(v3) == "table" and v3.screen then
        return v3.screen;
    else
        return v3;
    end;
end;
return function(v5) --[[ Line: 36 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1(next(v5) ~= nil, "Please specify at least one route when configuring a navigator.");
    for v6, v7 in v5 do
        local v8 = if not v7 then nil else if type(v7) == "table" and v7.screen then v7.screen else v7;
        local v9 = type(v7) == "table";
        v1(v2(v8) or v9 and type(v7.getScreen) == "function", "The component for route '%s' must be a Roact component or table with 'getScreen'." .. " For example:\n\nlocal MyScreen = require(script.Parent.MyScreen)\n...\n%s = MyScreen,\n}\n\nYou can also use a navigator:\n\nlocal MyNavigator = require(script.Parent.MyNavigator)\n...\n%s = MyNavigator,\n}", v6, v6, v6);
        if v9 then
            local l_v1_0 = v1;
            local v11 = true;
            if v7.screen ~= nil then
                v11 = v7.getScreen == nil;
            end;
            l_v1_0(v11, "Route '%s' should declare a screen or a getScreen, not both.", v6);
        end;
    end;
    return v5;
end;