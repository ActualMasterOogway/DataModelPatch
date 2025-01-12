local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.App.ImageSet.scaleSliceToResolution);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(v5 > 0, "resolutionScale for ImageSet must be greater than 0! got " .. tostring(v5));
    return v2.forwardRef(function(v6, v7) --[[ Line: 15 ]]
        -- upvalues: v2 (ref), v5 (copy), v3 (ref), v4 (copy)
        local v8 = {
            [v2.Ref] = v7, 
            [v2.Children] = v6[v2.Children]
        };
        local v9 = nil;
        local v10 = false;
        for v11, v12 in pairs(v6) do
            if v11 == "Image" and typeof(v12) == "table" then
                v10 = true;
                v9 = v12;
            else
                v8[v11] = v12;
            end;
        end;
        if v10 then
            for v13, v14 in pairs(v9) do
                if not v8[v13] then
                    v8[v13] = v14;
                elseif v13 == "ImageRectOffset" then
                    v8[v13] = v14 + v8[v13] * v5;
                elseif v13 == "ImageRectSize" then
                    v8[v13] = v8[v13] * v5;
                end;
            end;
        end;
        if v10 then
            v8 = v3(v8, v5);
        end;
        return v2.createElement(v4, v8);
    end);
end;