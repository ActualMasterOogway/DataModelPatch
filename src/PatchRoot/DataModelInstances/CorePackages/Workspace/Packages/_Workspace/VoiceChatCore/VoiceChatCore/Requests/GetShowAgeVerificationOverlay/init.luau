local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChatCore");
local v1 = require(l_script_FirstAncestor_0.Constants);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagUseMicPermForEnrollment_0 = require(l_Parent_0.SharedFlags).GetFFlagUseMicPermForEnrollment;
local function v9(v4) --[[ Line: 11 ]] --[[ Name: createQueryParams ]]
    local v5 = "";
    local v6 = 0;
    for v7, v8 in v4 do
        v5 = v5 .. (v6 > 0 and "&" or "") .. v7 .. "=" .. v8;
        v6 = v6 + 1;
    end;
    if v6 == 0 then
        return "";
    else
        return "?" .. v5;
    end;
end;
return function(v10, v11, v12, v13) --[[ Line: 21 ]]
    -- upvalues: l_GetFFlagUseMicPermForEnrollment_0 (copy), v1 (copy), v9 (copy)
    assert(type(v12) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string");
    assert(type(v11) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string");
    local v14 = true;
    if type(v13) ~= "boolean" then
        v14 = type(v13) == "nil";
    end;
    assert(v14, "GetShowAgeVerificationOverlay request expects hasMicPermissions to be a boolean or nil");
    local v15 = {};
    if l_GetFFlagUseMicPermForEnrollment_0() then
        if v13 ~= nil then
            v15.userHasDisabledMicDevicePermissions = tostring(not v13);
        end;
        if v12 ~= "" and v12 ~= nil then
            v15.placeId = v12;
        end;
    end;
    return v10(if l_GetFFlagUseMicPermForEnrollment_0() then string.format("%s/v1/settings/verify/show-age-verification-overlay/%s%s", v1.VOICE_URL, v11, (v9(v15))) else string.format("%s/v1/settings/verify/show-age-verification-overlay/%s", v1.VOICE_URL, if v12 ~= "" and v12 ~= nil then v11 .. "?placeId=" .. v12 else v11), "GET");
end;