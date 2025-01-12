local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayabilityRodux");
local v1 = require(l_script_FirstAncestor_0.Enums.PlayabilityStatusEnum);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Result);
local v4 = {
    new = function() --[[ Line: 24 ]] --[[ Name: new ]]
        return {};
    end
};
v4.mock = function() --[[ Line: 30 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v5 = v4.new();
    v5.universeId = "149757";
    v5.isPlayable = true;
    v5.playabilityStatus = v1.Playable;
    return v5;
end;
v4.fromJsonData = function(v6) --[[ Line: 39 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v3 (copy), v4 (copy)
    if type(v6.universeId) ~= "number" and type(v6.universeId) ~= "string" then
        return v3.error("PlayabilityStatus.fromJsonData expects universeId to be a number or a string");
    elseif type(v6.isPlayable) ~= "boolean" then
        return v3.error("PlayabilityStatus.fromJsonData expects isPlayable to be a boolean");
    elseif type(v6.playabilityStatus) ~= "string" then
        return v3.error("PlayabilityStatus.fromJsonData expects playabilityStatus to be a string");
    else
        local v7 = v4.new();
        v7.universeId = tostring(v6.universeId);
        v7.isPlayable = v6.isPlayable;
        v7.playabilityStatus = v6.playabilityStatus;
        return v3.success(v7);
    end;
end;
return v4;