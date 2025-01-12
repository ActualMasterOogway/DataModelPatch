local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = {
    state = {
        params = {}, 
        routeName = "", 
        key = ""
    }, 
    dispatch = function() --[[ Line: 12 ]] --[[ Name: dispatch ]]

    end, 
    goBack = function() --[[ Line: 13 ]] --[[ Name: goBack ]]

    end, 
    addListener = function() --[[ Line: 14 ]] --[[ Name: addListener ]]
        return {
            remove = function() --[[ Line: 16 ]] --[[ Name: remove ]]

            end
        };
    end, 
    isFocused = function() --[[ Line: 19 ]] --[[ Name: isFocused ]]

    end, 
    setParams = function() --[[ Line: 20 ]] --[[ Name: setParams ]]

    end, 
    getParam = function() --[[ Line: 21 ]] --[[ Name: getParam ]]

    end, 
    replace = function() --[[ Line: 22 ]] --[[ Name: replace ]]

    end, 
    push = function() --[[ Line: 23 ]] --[[ Name: push ]]

    end
};
return function(v4) --[[ Line: 26 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2.Provider, {
        value = v3
    }, {
        Element = v4
    });
end;