local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_OpenCloudService_0 = game:GetService("OpenCloudService");
local l_RunService_0 = game:GetService("RunService");
returnInvalidArgumentError = function(v4) --[[ Line: 20 ]] --[[ Name: returnInvalidArgumentError ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        StatusCode = 400, 
        Body = l_HttpService_0:JSONEncode({
            code = "INVALID_ARGUMENT", 
            message = v4
        })
    };
end;
verifyUserNotification = function(v5) --[[ Line: 30 ]] --[[ Name: verifyUserNotification ]]
    if v5.path ~= nil then
        local v6 = verifyString(v5.path);
        if v6 ~= nil then
            return v6;
        end;
    end;
    if v5.id ~= nil then
        local v7 = verifyString(v5.id);
        if v7 ~= nil then
            return v7;
        end;
    end;
    if v5.source ~= nil then
        local v8 = verifySource(v5.source);
        if v8 ~= nil then
            return v8;
        end;
    end;
    if v5.payload ~= nil then
        local v9 = verifyPayload(v5.payload);
        if v9 ~= nil then
            return v9;
        end;
    end;
    return nil;
end;
verifySource = function(v10) --[[ Line: 62 ]] --[[ Name: verifySource ]]
    if v10.universe ~= nil then
        local v11 = verifyString(v10.universe);
        if v11 ~= nil then
            return v11;
        end;
    end;
    return nil;
end;
verifyPayload = function(v12) --[[ Line: 73 ]] --[[ Name: verifyPayload ]]
    if v12.type ~= nil then
        local v13 = verifyString(v12.type);
        if v13 ~= nil then
            return v13;
        end;
    end;
    if v12.messageId ~= nil then
        local v14 = verifyString(v12.messageId);
        if v14 ~= nil then
            return v14;
        end;
    end;
    if v12.joinExperience ~= nil then
        local v15 = verifyJoinExperience(v12.joinExperience);
        if v15 ~= nil then
            return v15;
        end;
    end;
    if v12.analyticsData ~= nil then
        local v16 = verifyAnalyticsData(v12.analyticsData);
        if v16 ~= nil then
            return v16;
        end;
    end;
    if v12.parameters ~= nil then
        local v17 = verifyParameters(v12.parameters);
        if v17 ~= nil then
            return v17;
        end;
    end;
    return nil;
end;
verifyJoinExperience = function(v18) --[[ Line: 112 ]] --[[ Name: verifyJoinExperience ]]
    if v18.launchData ~= nil then
        local v19 = verifyString(v18.launchData);
        if v19 ~= nil then
            return v19;
        end;
    end;
    return nil;
end;
verifyAnalyticsData = function(v20) --[[ Line: 123 ]] --[[ Name: verifyAnalyticsData ]]
    if v20.category ~= nil then
        local v21 = verifyString(v20.category);
        if v21 ~= nil then
            return v21;
        end;
    end;
    return nil;
end;
verifyParameters = function(v22) --[[ Line: 134 ]] --[[ Name: verifyParameters ]]
    for _, v24 in pairs(v22) do
        local v25 = 0;
        if v24.stringValue ~= nil then
            v25 = v25 + 1;
            local v26 = verifyString(v24.stringValue);
            if v26 ~= nil then
                return v26;
            end;
        end;
        if v24.int64Value ~= nil then
            v25 = v25 + 1;
            local v27 = verifyNumber(v24.int64Value);
            if v27 ~= nil then
                return v27;
            end;
        end;
        if v25 > 1 then
            return returnInvalidArgumentError("Too many parameters provided for oneOf object!");
        end;
    end;
    return nil;
end;
verifyNumber = function(v28) --[[ Line: 159 ]] --[[ Name: verifyNumber ]]
    if typeof(v28) ~= "number" then
        return returnInvalidArgumentError("Argument not a number.");
    else
        return nil;
    end;
end;
verifyString = function(v29) --[[ Line: 166 ]] --[[ Name: verifyString ]]
    if typeof(v29) ~= "string" then
        return returnInvalidArgumentError("Argument not a string.");
    else
        return nil;
    end;
end;
getUrlPrefix = function() --[[ Line: 173 ]] --[[ Name: getUrlPrefix ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsStudio() then
        return "user";
    else
        return "rcc";
    end;
end;
createUserNotificationUrl = function(v30, _) --[[ Line: 180 ]] --[[ Name: createUserNotificationUrl ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local v32 = l_ContentProvider_0.BaseUrl:lower();
    v32 = string.gsub(v32, "http:", "https:");
    local v33 = string.gsub(v32, "www", "apis");
    return (string.format("%s%s/cloud/v2/users/%d/notifications", v33, getUrlPrefix(), v30));
end;
userNotification = function(v34) --[[ Line: 189 ]] --[[ Name: userNotification ]]
    -- upvalues: l_HttpService_0 (copy), l_OpenCloudService_0 (copy)
    if v34.user ~= nil then
        local v35 = verifyNumber(v34.user);
        if v35 ~= nil then
            return v35;
        end;
    end;
    if v34.userNotification ~= nil then
        local v36 = verifyUserNotification(v34.userNotification);
        if v36 ~= nil then
            return v36;
        end;
    end;
    local v37 = l_HttpService_0:JSONEncode(v34.userNotification);
    return l_OpenCloudService_0:HttpRequestAsync({
        Url = createUserNotificationUrl(v34.user, v34.userNotification), 
        Request_Type = "POST", 
        Body = v37
    });
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "userNotification", userNotification);
l_OpenCloudService_0:RegistrationComplete();