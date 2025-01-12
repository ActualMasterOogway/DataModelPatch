local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local _ = require(l_Parent_0.Types);
return function(v4, v5, v6, v7) --[[ Line: 12 ]] --[[ Name: useDetailsPageRenderItems ]]
    -- upvalues: v2 (copy)
    local v13 = v2.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy)
        local v8 = {};
        for v9, v10 in v4 do
            table.insert(v8, {
                index = v10.portraitLayoutOrder + 1, 
                renderComponent = v10.renderComponent, 
                showCornerGradient = v10.showCornerGradient, 
                useSelectionBumper = v10.useSelectionBumper, 
                key = v9
            });
        end;
        table.sort(v8, function(v11, v12) --[[ Line: 30 ]]
            if not v12.index then
                return true;
            elseif not v11.index then
                return false;
            else
                return v11.index <= v12.index;
            end;
        end);
        return v8;
    end, {
        v4
    });
    return (v2.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v13 (copy), v2 (ref), v6 (copy), v7 (copy), v5 (copy)
        local v14 = table.clone(v13);
        table.insert(v14, 1, {
            index = 1, 
            key = "Header", 
            showCornerGradient = true, 
            renderComponent = function() --[[ Line: 50 ]] --[[ Name: renderComponent ]]
                -- upvalues: v2 (ref), v6 (ref), v7 (ref), v5 (ref)
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v6.Y - v7.Y * 2), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }), 
                    HeaderContainer = v5
                });
            end
        });
        return v14;
    end, {
        v13, 
        v5, 
        v6.Y, 
        v7.Y
    }));
end;