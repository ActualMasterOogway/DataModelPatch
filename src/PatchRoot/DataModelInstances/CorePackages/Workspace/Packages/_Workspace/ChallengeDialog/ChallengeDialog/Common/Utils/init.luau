local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_DEFAULT_PADDING_0 = require(l_script_FirstAncestor_0.Common.Constants).DEFAULT_PADDING;
local l_MAX_WIDTH_0 = require(l_script_FirstAncestor_0.Common.Constants).MAX_WIDTH;
local function v5(v4) --[[ Line: 7 ]]
    return v4.ScreenSize;
end;
local function v9(v6) --[[ Line: 11 ]]
    -- upvalues: l_MAX_WIDTH_0 (copy), l_DEFAULT_PADDING_0 (copy)
    local function _(v7) --[[ Line: 12 ]]
        -- upvalues: l_MAX_WIDTH_0 (ref)
        return v7 < l_MAX_WIDTH_0 and v7 or l_MAX_WIDTH_0;
    end;
    return (v6 < l_MAX_WIDTH_0 and v6 or l_MAX_WIDTH_0) - 2 * l_DEFAULT_PADDING_0;
end;
local function v20(v10, v11, v12) --[[ Line: 19 ]]
    if v10 == nil then
        return v10;
    else
        local v13 = math.floor(0.85 * (v11 / (v12.Font.Body.RelativeSize * v12.Font.BaseSize * 0.6)));
        if string.len(v10) <= v13 then
            return v10;
        elseif v10:find(" ") == nil then
            return v10;
        else
            local v14 = "";
            local l_v10_0 = v10;
            for v16 = 1, 2 do
                if v13 < string.len(l_v10_0) then
                    local v17 = string.sub(l_v10_0, 1, v13);
                    local v18 = v17:reverse():find(" ");
                    if v18 ~= nil then
                        local v19 = string.len(v17) - v18;
                        l_v10_0 = string.sub(l_v10_0, v19 + 2);
                        v14 = v14 .. string.sub(v17, 0, v19);
                    else
                        v14 = v14 .. v17;
                        l_v10_0 = string.sub(l_v10_0, v13 + 1);
                    end;
                    if v16 ~= 2 then
                        v14 = v14 .. "\n";
                    end;
                else
                    return v14 .. l_v10_0;
                end;
            end;
            return v14;
        end;
    end;
end;
local function _(v21) --[[ Line: 86 ]]
    local v22 = true;
    if v21 ~= "unknown" then
        v22 = v21 == nil;
    end;
    return v22;
end;
return {
    screenSizeSelector = v5, 
    getMiddleContentWidth = v9, 
    getAdjustedTitleToScreenString = v20, 
    getFormattedDeviceType = function(v24, v25, v26) --[[ Line: 90 ]]
        local v27 = true;
        if v24 ~= "unknown" then
            v27 = v24 == nil;
        end;
        if v27 then
            return v26.unknownDeviceType;
        else
            v27 = true;
            if v25 ~= "unknown" then
                v27 = v25 == nil;
            end;
            if v27 then
                return v24;
            else
                return v24 .. " (" .. v25 .. ")";
            end;
        end;
    end, 
    getFormattedRegionalLocation = function(v28, v29, v30, v31) --[[ Line: 99 ]]
        local v32 = true;
        if v28 ~= "unknown" then
            v32 = v28 == nil;
        end;
        if v32 then
            v32 = true;
            if v29 ~= "unknown" then
                v32 = v29 == nil;
            end;
            if v32 then
                v32 = true;
                if v30 ~= "unknown" then
                    v32 = v30 == nil;
                end;
                if v32 then
                    return v31.unknownLocation;
                end;
            end;
        end;
        v32 = true;
        if v28 ~= "unknown" then
            v32 = v28 == nil;
        end;
        if v32 then
            v32 = true;
            if v29 ~= "unknown" then
                v32 = v29 == nil;
            end;
            if v32 then
                return v30;
            end;
        end;
        v32 = true;
        if v29 ~= "unknown" then
            v32 = v29 == nil;
        end;
        if v32 then
            v32 = true;
            if v30 ~= "unknown" then
                v32 = v30 == nil;
            end;
            if v32 then
                return v28;
            end;
        end;
        v32 = true;
        if v28 ~= "unknown" then
            v32 = v28 == nil;
        end;
        if v32 then
            v32 = true;
            if v30 ~= "unknown" then
                v32 = v30 == nil;
            end;
            if v32 then
                return v29;
            end;
        end;
        v32 = true;
        if v28 ~= "unknown" then
            v32 = v28 == nil;
        end;
        if v32 then
            return v31.locationWithoutCity;
        else
            v32 = true;
            if v29 ~= "unknown" then
                v32 = v29 == nil;
            end;
            if v32 then
                return v31.locationWithoutSubdivision;
            else
                v32 = true;
                if v30 ~= "unknown" then
                    v32 = v30 == nil;
                end;
                if v32 then
                    return v31.locationWithoutCountry;
                else
                    return v31.location;
                end;
            end;
        end;
    end, 
    getFormattedIPAddress = function(v33, v34) --[[ Line: 123 ]]
        local v35 = true;
        if v33 ~= "unknown" then
            v35 = v33 == nil;
        end;
        if v35 then
            return v34.unknownIPAddress;
        else
            return v33;
        end;
    end, 
    getFormattedDateTime = function(v36) --[[ Line: 129 ]]
        -- upvalues: l_LocalizationService_0 (copy)
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        return DateTime.fromUnixTimestamp(v36):FormatLocalTime("lll", l_RobloxLocaleId_0);
    end
};