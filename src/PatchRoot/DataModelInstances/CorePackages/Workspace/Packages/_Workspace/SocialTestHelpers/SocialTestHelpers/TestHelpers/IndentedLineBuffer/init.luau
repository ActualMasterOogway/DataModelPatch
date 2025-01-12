local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 16 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        linePrefix = "", 
        lines = {}
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.addLine = function(v2, v3) --[[ Line: 28 ]] --[[ Name: addLine ]]
    table.insert(v2.lines, v2.linePrefix .. (v3 or ""));
end;
v0.indent = function(v4) --[[ Line: 32 ]] --[[ Name: indent ]]
    v4.linePrefix = v4.linePrefix .. "   ";
end;
v0.unindent = function(v5) --[[ Line: 36 ]] --[[ Name: unindent ]]
    v5.linePrefix = v5.linePrefix:sub(1 + ("   "):len());
end;
v0.__tostring = function(v6) --[[ Line: 40 ]] --[[ Name: __tostring ]]
    return table.concat(v6.lines, "\n") .. "\n";
end;
return v0;