local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local _ = function(v3) --[[ Line: 6 ]] --[[ Name: getConnect ]]
    -- upvalues: l_Dictionary_0 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: l_Dictionary_0 (ref), v1 (ref), v3 (copy)
        local function v13(v5, v6) --[[ Line: 8 ]] --[[ Name: transformedMapper ]]
            -- upvalues: l_Dictionary_0 (ref), v4 (copy)
            return l_Dictionary_0.map(v4(v6), function(v7, _) --[[ Line: 9 ]]
                -- upvalues: v5 (copy)
                if type(v7) == "table" then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
                        -- upvalues: v5 (ref), v7 (copy)
                        return v5:FormatByKey(v7[1], v7[2]);
                    end);
                    if l_status_0 then
                        return l_result_0;
                    else
                        return "";
                    end;
                elseif type(v7) == "string" then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 21 ]]
                        -- upvalues: v5 (ref), v7 (copy)
                        return v5:FormatByKey(v7);
                    end);
                    if l_status_1 then
                        return l_result_1;
                    else
                        return "";
                    end;
                else
                    return "";
                end;
            end);
        end;
        return function(v14) --[[ Line: 36 ]]
            -- upvalues: v1 (ref), v3 (ref), l_Dictionary_0 (ref), v13 (copy)
            local v15 = v1.Component:extend("Connected-" .. tostring(v14));
            v15.render = function(v16) --[[ Line: 39 ]] --[[ Name: render ]]
                -- upvalues: v1 (ref), v3 (ref), v14 (copy), l_Dictionary_0 (ref), v13 (ref)
                return v1.createElement(v3.Consumer, {
                    render = function(v17) --[[ Line: 41 ]] --[[ Name: render ]]
                        -- upvalues: v1 (ref), v14 (ref), l_Dictionary_0 (ref), v16 (copy), v13 (ref)
                        return v1.createElement(v14, l_Dictionary_0.join(v16.props, v13(v17, v16.props)));
                    end
                });
            end;
            return v15;
        end;
    end;
end;
return function(v19) --[[ Line: 55 ]]
    -- upvalues: v1 (copy), l_Dictionary_0 (copy)
    local v20 = v1.createContext(v19);
    return {
        Consumer = v20.Consumer, 
        Provider = v20.Provider, 
        connect = function(v21) --[[ Line: 7 ]]
            -- upvalues: l_Dictionary_0 (ref), v1 (ref), v20 (copy)
            local function v30(v22, v23) --[[ Line: 8 ]] --[[ Name: transformedMapper ]]
                -- upvalues: l_Dictionary_0 (ref), v21 (copy)
                return l_Dictionary_0.map(v21(v23), function(v24, _) --[[ Line: 9 ]]
                    -- upvalues: v22 (copy)
                    if type(v24) == "table" then
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 11 ]]
                            -- upvalues: v22 (ref), v24 (copy)
                            return v22:FormatByKey(v24[1], v24[2]);
                        end);
                        if l_status_2 then
                            return l_result_2;
                        else
                            return "";
                        end;
                    elseif type(v24) == "string" then
                        local l_status_3, l_result_3 = pcall(function() --[[ Line: 21 ]]
                            -- upvalues: v22 (ref), v24 (copy)
                            return v22:FormatByKey(v24);
                        end);
                        if l_status_3 then
                            return l_result_3;
                        else
                            return "";
                        end;
                    else
                        return "";
                    end;
                end);
            end;
            return function(v31) --[[ Line: 36 ]]
                -- upvalues: v1 (ref), v20 (ref), l_Dictionary_0 (ref), v30 (copy)
                local v32 = v1.Component:extend("Connected-" .. tostring(v31));
                v32.render = function(v33) --[[ Line: 39 ]] --[[ Name: render ]]
                    -- upvalues: v1 (ref), v20 (ref), v31 (copy), l_Dictionary_0 (ref), v30 (ref)
                    return v1.createElement(v20.Consumer, {
                        render = function(v34) --[[ Line: 41 ]] --[[ Name: render ]]
                            -- upvalues: v1 (ref), v31 (ref), l_Dictionary_0 (ref), v33 (copy), v30 (ref)
                            return v1.createElement(v31, l_Dictionary_0.join(v33.props, v30(v34, v33.props)));
                        end
                    });
                end;
                return v32;
            end;
        end
    };
end;