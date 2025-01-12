local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.SelectedUsersContext);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
return function(v6) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v4 (copy), l_dependencyArray_0 (copy), v2 (copy)
    local v7 = v3.useRef(0);
    local v8, v9 = v3.useState({});
    local v10, v11 = v3.useState(0);
    local v14 = v3.useCallback(function(v12, v13) --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v10 (copy), v9 (copy), v4 (ref), v8 (copy), v7 (copy), v11 (copy)
        if v6.selectionLimit == nil or v10 < v6.selectionLimit then
            v9(v4.Dictionary.join(v8, {
                [v12] = {
                    displayName = v13, 
                    layoutOrder = v7.current
                }
            }));
            v7.current = v7.current + 1;
            v11(v10 + 1);
        end;
    end, l_dependencyArray_0(v8));
    local v16 = v3.useCallback(function(v15) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v4 (ref), v8 (copy), v11 (copy), v10 (copy)
        v9(v4.Dictionary.join(v8, {
            [v15] = v4.None
        }));
        v11(v10 - 1);
    end, l_dependencyArray_0(v8));
    local v18 = v3.useCallback(function(v17) --[[ Line: 40 ]]
        -- upvalues: v8 (copy)
        return v8[v17] ~= nil;
    end, l_dependencyArray_0(v8));
    return v3.createElement(v2.Provider, {
        value = v3.useMemo(function() --[[ Line: 45 ]]
            -- upvalues: v10 (copy), v8 (copy), v14 (copy), v16 (copy), v18 (copy)
            return {
                selectedFriendsSize = v10, 
                selectedFriends = v8, 
                addFriend = v14, 
                removeFriend = v16, 
                isFriendSelected = v18
            };
        end, l_dependencyArray_0(v8, v14, v16, v18))
    }, v6.children);
end;