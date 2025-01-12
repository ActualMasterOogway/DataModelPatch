local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = {
    addListener = function() --[[ Line: 7 ]] --[[ Name: addListener ]]

    end, 
    dispatch = function() --[[ Line: 8 ]] --[[ Name: dispatch ]]

    end, 
    getParam = function() --[[ Line: 9 ]] --[[ Name: getParam ]]

    end, 
    goBack = function() --[[ Line: 10 ]] --[[ Name: goBack ]]

    end, 
    isFocused = function() --[[ Line: 11 ]] --[[ Name: isFocused ]]

    end, 
    setParams = function() --[[ Line: 12 ]] --[[ Name: setParams ]]

    end, 
    state = {
        key = "id-1234567", 
        name = "ContentFeed", 
        params = {
            extraProps = {
                postId = "asdf", 
                userId = "1234"
            }
        }
    }
};
return function(v3) --[[ Line: 20 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.joinDeep(v2, v3 or {});
    v4.getParam = function(v5, v6) --[[ Line: 22 ]]
        -- upvalues: v4 (copy)
        return v4.state.params[v5] or v6;
    end;
    return v4;
end;