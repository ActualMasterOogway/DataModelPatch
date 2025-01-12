local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    v3 = v3 or v1.ChatWindowFont;
    local v5 = v4 or v1.ChatWindowTextSize;
    v5 = string.format("<font transparency='1.0' family='%s' weight='%s' size='%s'><stroke transparency='1.0'>%s</stroke></font>", v3.Family, string.gsub(tostring(v3.Weight), "Enum.FontWeight.", ""), v5, v2);
    if v3.Style == Enum.FontStyle.Italic then
        v5 = "<i>" .. v5 .. "</i>";
    end;
    return v5;
end;