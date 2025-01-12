return {
    isNonNullObject = function(v0) --[[ Line: 3 ]] --[[ Name: isNonNullObject ]]
        local v1 = false;
        if v0 ~= nil then
            v1 = type(v0) == "table";
        end;
        return v1;
    end
};