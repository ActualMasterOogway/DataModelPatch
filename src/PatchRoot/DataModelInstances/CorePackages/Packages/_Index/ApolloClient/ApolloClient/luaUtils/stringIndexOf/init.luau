return {
    stringIndexOf = function(v0, v1) --[[ Line: 11 ]] --[[ Name: stringIndexOf ]]
        local v2, _ = string.find(v0, v1);
        if v2 == nil then
            return -1;
        else
            return v2;
        end;
    end
};