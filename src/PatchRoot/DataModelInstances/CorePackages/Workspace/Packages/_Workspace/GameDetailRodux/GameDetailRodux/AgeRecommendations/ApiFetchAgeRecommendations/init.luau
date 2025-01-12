local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.AgeRecommendations.AgeRecommendationDetails);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v7 = require(l_script_FirstAncestor_0.AgeRecommendations.SetAgeRecommendation);
local v8 = require(l_script_FirstAncestor_0.AgeRecommendations.SetAgeRecommendationHeaders);
local v9 = require(l_script_FirstAncestor_0.AgeRecommendations.GetAgeRecommendation);
local l_FFlagLuaAppContentMaturityFromEgs_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppContentMaturityFromEgs;
local v11 = {};
local function _(v12) --[[ Line: 19 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.experience_guidelines.get-age-guidelines" .. v12;
end;
v11.Fetch = function(v14, v15) --[[ Line: 23 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v9 (copy), v4 (copy), l_Logging_0 (copy), v3 (copy), v7 (copy), l_FFlagLuaAppContentMaturityFromEgs_0 (copy), v8 (copy), l_SetNetworkingErrorToast_0 (copy)
    return l_PerformFetch_0.Single("luaapp.experience_guidelines.get-age-guidelines" .. v15, function(v16) --[[ Line: 24 ]]
        -- upvalues: v9 (ref), v14 (copy), v15 (copy), v4 (ref), l_Logging_0 (ref), v3 (ref), v7 (ref), l_FFlagLuaAppContentMaturityFromEgs_0 (ref), v8 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v9(v14, v15):andThen(function(v17) --[[ Line: 25 ]]
            -- upvalues: v4 (ref), l_Logging_0 (ref), v15 (ref), v3 (ref), v16 (copy), v7 (ref), l_FFlagLuaAppContentMaturityFromEgs_0 (ref), v8 (ref)
            local l_responseBody_0 = v17.responseBody;
            if l_responseBody_0 ~= nil then
                local v19, v20 = v4.fromJsonData(l_responseBody_0.ageRecommendationDetails):unwrap();
                if v19 == false then
                    l_Logging_0.warn("Failed to parse AgeRecommendationDetails for `" .. v15 .. "`");
                    return v3.reject(v17);
                else
                    v16:dispatch(v7(v15, v20));
                    if l_FFlagLuaAppContentMaturityFromEgs_0 then
                        local l_headerDisplayName_0 = l_responseBody_0.headerDisplayName;
                        local l_headerDisplayNameShort_0 = l_responseBody_0.headerDisplayNameShort;
                        v16:dispatch(v8(l_headerDisplayName_0, l_headerDisplayNameShort_0));
                    end;
                    return v3.resolve(v17);
                end;
            else
                l_Logging_0.warn("Response from GetAgeRecommendation is malformed!");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v23) --[[ Line: 50 ]]
            -- upvalues: v16 (copy), l_SetNetworkingErrorToast_0 (ref), v3 (ref)
            v16:dispatch(l_SetNetworkingErrorToast_0(v23));
            return v3.reject(v23);
        end);
    end);
end;
v11.GetFetchingStatus = function(v24, v25) --[[ Line: 57 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v24, "luaapp.experience_guidelines.get-age-guidelines" .. v25);
end;
return v11;