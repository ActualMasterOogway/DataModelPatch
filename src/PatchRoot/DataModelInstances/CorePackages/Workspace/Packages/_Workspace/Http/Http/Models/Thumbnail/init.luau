local v0 = {
    new = function() --[[ Line: 12 ]] --[[ Name: new ]]
        return {};
    end
};
v0.fromThumbnailData = function(v1, v2) --[[ Line: 18 ]] --[[ Name: fromThumbnailData ]]
    -- upvalues: v0 (copy)
    local v3 = v0.new();
    v3.universeId = tostring(v1.targetId);
    v3.state = v1.state;
    v3.url = v1.imageUrl;
    v3.size = v2;
    return v3;
end;
v0.isCompleteThumbnailData = function(v4) --[[ Line: 29 ]] --[[ Name: isCompleteThumbnailData ]]
    local v5 = false;
    if type(v4) == "table" then
        v5 = false;
        if type(v4.targetId) == "number" then
            v5 = false;
            if type(v4.state) == "string" then
                v5 = true;
                if type(v4.imageUrl) ~= "string" then
                    v5 = v4.imageUrl == nil;
                end;
            end;
        end;
    end;
    return v5;
end;
v0.checkStateIsFinal = function(v6) --[[ Line: 36 ]] --[[ Name: checkStateIsFinal ]]
    return v6 ~= "Pending";
end;
return v0;