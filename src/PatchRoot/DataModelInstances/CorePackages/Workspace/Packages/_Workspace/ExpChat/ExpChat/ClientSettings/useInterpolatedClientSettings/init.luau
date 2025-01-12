local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent);
local v3 = require(script.Parent.ClientSettingsUtility);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5 = v1.useContext(v2);
    local v6, v7 = v1.useState({
        BackgroundColor = v3.getBackgroundColor(v4, v5), 
        BackgroundTransparency = v3.getBackgroundTransparency(v4, v5)
    });
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v7 (copy), v3 (ref), v4 (copy), v5 (copy)
        v7({
            BackgroundColor3 = v3.getBackgroundColor(v4, v5), 
            BackgroundTransparency = v3.getBackgroundTransparency(v4, v5)
        });
    end, {
        v4, 
        v5
    });
    return v6;
end;