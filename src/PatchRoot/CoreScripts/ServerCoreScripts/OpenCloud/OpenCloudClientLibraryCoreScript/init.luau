local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_OpenCloudService_0 = game:GetService("OpenCloudService");
local l_RunService_0 = game:GetService("RunService");
InvalidArgumentError = function(v4) --[[ Line: 19 ]] --[[ Name: InvalidArgumentError ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        StatusCode = 400, 
        Body = l_HttpService_0:JSONEncode({
            code = "INVALID_ARGUMENT", 
            message = v4
        })
    };
end;
verifyTable = function(v5, v6) --[[ Line: 37 ]] --[[ Name: verifyTable ]]
    if v5 == nil then
        return nil;
    elseif typeof(v5) ~= "table" then
        return InvalidArgumentError((("Argument not a table: %*."):format(v6)));
    else
        return nil;
    end;
end;
verifyNumber = function(v7, v8) --[[ Line: 49 ]] --[[ Name: verifyNumber ]]
    if v7 == nil then
        return nil;
    elseif typeof(v7) ~= "number" then
        return InvalidArgumentError((("Argument not a number: %*."):format(v8)));
    else
        return nil;
    end;
end;
verifyString = function(v9, v10) --[[ Line: 61 ]] --[[ Name: verifyString ]]
    if v9 == nil then
        return nil;
    elseif typeof(v9) ~= "string" then
        return InvalidArgumentError((("Argument not a string: %*."):format(v10)));
    else
        return nil;
    end;
end;
verifyEnum = function(v11, v12) --[[ Line: 73 ]] --[[ Name: verifyEnum ]]
    if v11 == nil then
        return nil;
    elseif typeof(v11) ~= "number" and typeof(v11) ~= "string" then
        return InvalidArgumentError((("Argument not an enum: %*."):format(v12)));
    else
        return nil;
    end;
end;
getApisUrl = function() --[[ Line: 85 ]] --[[ Name: getApisUrl ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local v13 = l_ContentProvider_0.BaseUrl:lower();
    v13 = string.gsub(v13, "http:", "https:");
    return string.gsub(v13, "www", "apis");
end;
getUrlPrefix = function(v14) --[[ Line: 91 ]] --[[ Name: getUrlPrefix ]]
    -- upvalues: l_RunService_0 (copy)
    if v14 ~= nil and v14["x-api-key"] ~= nil then
        return "";
    elseif l_RunService_0:IsStudio() then
        return "user";
    else
        return "rcc";
    end;
end;
verifyGetUniverseRequest = function(v15, v16) --[[ Line: 101 ]] --[[ Name: verifyGetUniverseRequest ]]
    if v15 == nil then
        return nil;
    else
        local v17 = verifyTable(v15, v16);
        if v17 ~= nil then
            return v17;
        elseif v15.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v16)));
        else
            v17 = verifyString(v15.path, (("%*.path"):format(v16)));
            if v17 ~= nil then
                return v17;
            else
                return nil;
            end;
        end;
    end;
end;
getUniverseUrl = function(v18, v19) --[[ Line: 122 ]] --[[ Name: getUniverseUrl ]]
    if v18.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getUniverseRequest.path.");
    elseif string.match(v18.path, "^universes/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getUniverseRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v19), (tostring(v18.path))));
    end;
end;
getUniverse = function(v20, v21) --[[ Line: 135 ]] --[[ Name: getUniverse ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v20 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v22 = verifyGetUniverseRequest(v20, "getUniverseRequest");
        if v22 ~= nil then
            return v22;
        else
            local v23 = getUniverseUrl(v20, v21);
            if typeof(v23) ~= "string" then
                return v23;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v23, 
                    Request_Type = "GET", 
                    Headers = v21
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetUniverse", getUniverse);
verifyTranslateTextRequest = function(v24, v25) --[[ Line: 155 ]] --[[ Name: verifyTranslateTextRequest ]]
    if v24 == nil then
        return nil;
    else
        local v26 = verifyTable(v24, v25);
        if v26 ~= nil then
            return v26;
        elseif v24.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v25)));
        else
            v26 = verifyString(v24.path, (("%*.path"):format(v25)));
            if v26 ~= nil then
                return v26;
            elseif v24.text == nil then
                return InvalidArgumentError((("Required argument was not provided: %*.text."):format(v25)));
            else
                v26 = verifyString(v24.text, (("%*.text"):format(v25)));
                if v26 ~= nil then
                    return v26;
                else
                    v26 = verifyString(v24.sourceLanguageCode, (("%*.sourceLanguageCode"):format(v25)));
                    if v26 ~= nil then
                        return v26;
                    else
                        for v27, v28 in v24.targetLanguageCodes do
                            v26 = verifyString(v28, (("%*.targetLanguageCodes[%*]"):format(v25, v27)));
                            if v26 ~= nil then
                                return v26;
                            end;
                        end;
                        return nil;
                    end;
                end;
            end;
        end;
    end;
end;
translateTextUrl = function(v29) --[[ Line: 196 ]] --[[ Name: translateTextUrl ]]
    if v29.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: translateTextRequest.path.");
    elseif string.match(v29.path, "^universes/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: translateTextRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s:translateText", getApisUrl(), getUrlPrefix(), (tostring(v29.path))));
    end;
end;
translateText = function(v30) --[[ Line: 209 ]] --[[ Name: translateText ]]
    -- upvalues: l_HttpService_0 (copy), l_OpenCloudService_0 (copy)
    if v30 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v31 = verifyTranslateTextRequest(v30, "translateTextRequest");
        if v31 ~= nil then
            return v31;
        else
            local v32 = translateTextUrl(v30);
            if typeof(v32) ~= "string" then
                return v32;
            else
                local v33 = l_HttpService_0:JSONEncode(v30);
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v32, 
                    Request_Type = "POST", 
                    Body = v33
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "TranslateText", translateText);
verifyGetPlaceRequest = function(v34, v35) --[[ Line: 231 ]] --[[ Name: verifyGetPlaceRequest ]]
    if v34 == nil then
        return nil;
    else
        local v36 = verifyTable(v34, v35);
        if v36 ~= nil then
            return v36;
        elseif v34.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v35)));
        else
            v36 = verifyString(v34.path, (("%*.path"):format(v35)));
            if v36 ~= nil then
                return v36;
            else
                return nil;
            end;
        end;
    end;
end;
getPlaceUrl = function(v37, v38) --[[ Line: 252 ]] --[[ Name: getPlaceUrl ]]
    if v37.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getPlaceRequest.path.");
    elseif string.match(v37.path, "^universes/([^/]+)/places/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getPlaceRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v38), (tostring(v37.path))));
    end;
end;
getPlace = function(v39, v40) --[[ Line: 265 ]] --[[ Name: getPlace ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v39 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v41 = verifyGetPlaceRequest(v39, "getPlaceRequest");
        if v41 ~= nil then
            return v41;
        else
            local v42 = getPlaceUrl(v39, v40);
            if typeof(v42) ~= "string" then
                return v42;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v42, 
                    Request_Type = "GET", 
                    Headers = v40
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetPlace", getPlace);
verifyGetGroupRequest = function(v43, v44) --[[ Line: 285 ]] --[[ Name: verifyGetGroupRequest ]]
    if v43 == nil then
        return nil;
    else
        local v45 = verifyTable(v43, v44);
        if v45 ~= nil then
            return v45;
        elseif v43.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v44)));
        else
            v45 = verifyString(v43.path, (("%*.path"):format(v44)));
            if v45 ~= nil then
                return v45;
            else
                return nil;
            end;
        end;
    end;
end;
getGroupUrl = function(v46, v47) --[[ Line: 306 ]] --[[ Name: getGroupUrl ]]
    if v46.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getGroupRequest.path.");
    elseif string.match(v46.path, "^groups/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getGroupRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v47), (tostring(v46.path))));
    end;
end;
getGroup = function(v48, v49) --[[ Line: 319 ]] --[[ Name: getGroup ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v48 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v50 = verifyGetGroupRequest(v48, "getGroupRequest");
        if v50 ~= nil then
            return v50;
        else
            local v51 = getGroupUrl(v48, v49);
            if typeof(v51) ~= "string" then
                return v51;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v51, 
                    Request_Type = "GET", 
                    Headers = v49
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetGroup", getGroup);
verifyListInventoryItemsRequest = function(v52, v53) --[[ Line: 339 ]] --[[ Name: verifyListInventoryItemsRequest ]]
    if v52 == nil then
        return nil;
    else
        local v54 = verifyTable(v52, v53);
        if v54 ~= nil then
            return v54;
        elseif v52.parent == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.parent."):format(v53)));
        else
            v54 = verifyString(v52.parent, (("%*.parent"):format(v53)));
            if v54 ~= nil then
                return v54;
            else
                v54 = verifyNumber(v52.maxPageSize, (("%*.maxPageSize"):format(v53)));
                if v54 ~= nil then
                    return v54;
                else
                    v54 = verifyString(v52.pageToken, (("%*.pageToken"):format(v53)));
                    if v54 ~= nil then
                        return v54;
                    else
                        v54 = verifyString(v52.filter, (("%*.filter"):format(v53)));
                        if v54 ~= nil then
                            return v54;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
listInventoryItemsUrl = function(v55, v56) --[[ Line: 375 ]] --[[ Name: listInventoryItemsUrl ]]
    if v55.parent == nil then
        return InvalidArgumentError("URL parameter provided was nil: listInventoryItemsRequest.parent.");
    elseif string.match(v55.parent, "^users/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: listInventoryItemsRequest.parent.");
    else
        local v57 = string.format("%s%s/cloud/v2/%s/inventory-items", getApisUrl(), getUrlPrefix(v56), (tostring(v55.parent)));
        if v55.maxPageSize == nil and v55.pageToken == nil and v55.filter == nil then
            return v57;
        else
            local v58 = {};
            if v55.maxPageSize ~= nil then
                table.insert(v58, string.format("maxPageSize=%s", (tostring(v55.maxPageSize))));
            end;
            if v55.pageToken ~= nil then
                table.insert(v58, string.format("pageToken=%s", (tostring(v55.pageToken))));
            end;
            if v55.filter ~= nil then
                table.insert(v58, string.format("filter=%s", (tostring(v55.filter))));
            end;
            return (string.format("%s?%s", v57, table.concat(v58, "&")));
        end;
    end;
end;
listInventoryItems = function(v59, v60) --[[ Line: 405 ]] --[[ Name: listInventoryItems ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v59 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v61 = verifyListInventoryItemsRequest(v59, "listInventoryItemsRequest");
        if v61 ~= nil then
            return v61;
        else
            local v62 = listInventoryItemsUrl(v59, v60);
            if typeof(v62) ~= "string" then
                return v62;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v62, 
                    Request_Type = "GET", 
                    Headers = v60
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "ListInventoryItems", listInventoryItems);
verifyListGroupMembershipsRequest = function(v63, v64) --[[ Line: 425 ]] --[[ Name: verifyListGroupMembershipsRequest ]]
    if v63 == nil then
        return nil;
    else
        local v65 = verifyTable(v63, v64);
        if v65 ~= nil then
            return v65;
        elseif v63.parent == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.parent."):format(v64)));
        else
            v65 = verifyString(v63.parent, (("%*.parent"):format(v64)));
            if v65 ~= nil then
                return v65;
            else
                v65 = verifyNumber(v63.maxPageSize, (("%*.maxPageSize"):format(v64)));
                if v65 ~= nil then
                    return v65;
                else
                    v65 = verifyString(v63.pageToken, (("%*.pageToken"):format(v64)));
                    if v65 ~= nil then
                        return v65;
                    else
                        v65 = verifyString(v63.filter, (("%*.filter"):format(v64)));
                        if v65 ~= nil then
                            return v65;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
listGroupMembershipsUrl = function(v66, v67) --[[ Line: 461 ]] --[[ Name: listGroupMembershipsUrl ]]
    if v66.parent == nil then
        return InvalidArgumentError("URL parameter provided was nil: listGroupMembershipsRequest.parent.");
    elseif string.match(v66.parent, "^groups/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: listGroupMembershipsRequest.parent.");
    else
        local v68 = string.format("%s%s/cloud/v2/%s/memberships", getApisUrl(), getUrlPrefix(v67), (tostring(v66.parent)));
        if v66.maxPageSize == nil and v66.pageToken == nil and v66.filter == nil then
            return v68;
        else
            local v69 = {};
            if v66.maxPageSize ~= nil then
                table.insert(v69, string.format("maxPageSize=%s", (tostring(v66.maxPageSize))));
            end;
            if v66.pageToken ~= nil then
                table.insert(v69, string.format("pageToken=%s", (tostring(v66.pageToken))));
            end;
            if v66.filter ~= nil then
                table.insert(v69, string.format("filter=%s", (tostring(v66.filter))));
            end;
            return (string.format("%s?%s", v68, table.concat(v69, "&")));
        end;
    end;
end;
listGroupMemberships = function(v70, v71) --[[ Line: 491 ]] --[[ Name: listGroupMemberships ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v70 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v72 = verifyListGroupMembershipsRequest(v70, "listGroupMembershipsRequest");
        if v72 ~= nil then
            return v72;
        else
            local v73 = listGroupMembershipsUrl(v70, v71);
            if typeof(v73) ~= "string" then
                return v73;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v73, 
                    Request_Type = "GET", 
                    Headers = v71
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "ListGroupMemberships", listGroupMemberships);
verifyGetOperationRequest = function(v74, v75) --[[ Line: 511 ]] --[[ Name: verifyGetOperationRequest ]]
    if v74 == nil then
        return nil;
    else
        local v76 = verifyTable(v74, v75);
        if v76 ~= nil then
            return v76;
        elseif v74.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v75)));
        else
            v76 = verifyString(v74.path, (("%*.path"):format(v75)));
            if v76 ~= nil then
                return v76;
            else
                return nil;
            end;
        end;
    end;
end;
getOperationUrl = function(v77, v78) --[[ Line: 532 ]] --[[ Name: getOperationUrl ]]
    if v77.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: getOperationRequest.path.");
    elseif string.match(v77.path, "^users/([^/]+)/operations/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: getOperationRequest.path.");
    else
        return (string.format("%s%s/cloud/v2/%s", getApisUrl(), getUrlPrefix(v78), (tostring(v77.path))));
    end;
end;
getOperation = function(v79, v80) --[[ Line: 545 ]] --[[ Name: getOperation ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v79 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v81 = verifyGetOperationRequest(v79, "getOperationRequest");
        if v81 ~= nil then
            return v81;
        else
            local v82 = getOperationUrl(v79, v80);
            if typeof(v82) ~= "string" then
                return v82;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v82, 
                    Request_Type = "GET", 
                    Headers = v80
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GetOperation", getOperation);
verifyGenerateUserThumbnailRequest = function(v83, v84) --[[ Line: 565 ]] --[[ Name: verifyGenerateUserThumbnailRequest ]]
    if v83 == nil then
        return nil;
    else
        local v85 = verifyTable(v83, v84);
        if v85 ~= nil then
            return v85;
        elseif v83.path == nil then
            return InvalidArgumentError((("Required argument was not provided: %*.path."):format(v84)));
        else
            v85 = verifyString(v83.path, (("%*.path"):format(v84)));
            if v85 ~= nil then
                return v85;
            else
                v85 = verifyNumber(v83.size, (("%*.size"):format(v84)));
                if v85 ~= nil then
                    return v85;
                else
                    v85 = verifyEnum(v83.format, (("%*.format"):format(v84)));
                    if v85 ~= nil then
                        return v85;
                    else
                        v85 = verifyEnum(v83.shape, (("%*.shape"):format(v84)));
                        if v85 ~= nil then
                            return v85;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
generateUserThumbnailUrl = function(v86, v87) --[[ Line: 601 ]] --[[ Name: generateUserThumbnailUrl ]]
    if v86.path == nil then
        return InvalidArgumentError("URL parameter provided was nil: generateUserThumbnailRequest.path.");
    elseif string.match(v86.path, "^users/([^/]+)$") == nil then
        return InvalidArgumentError("URL parameter was not formatted correctly: generateUserThumbnailRequest.path.");
    else
        local v88 = string.format("%s%s/cloud/v2/%s:generateThumbnail", getApisUrl(), getUrlPrefix(v87), (tostring(v86.path)));
        if v86.size == nil and v86.format == nil and v86.shape == nil then
            return v88;
        else
            local v89 = {};
            if v86.size ~= nil then
                table.insert(v89, string.format("size=%s", (tostring(v86.size))));
            end;
            if v86.format ~= nil then
                table.insert(v89, string.format("format=%s", (tostring(v86.format))));
            end;
            if v86.shape ~= nil then
                table.insert(v89, string.format("shape=%s", (tostring(v86.shape))));
            end;
            return (string.format("%s?%s", v88, table.concat(v89, "&")));
        end;
    end;
end;
generateUserThumbnail = function(v90, v91) --[[ Line: 631 ]] --[[ Name: generateUserThumbnail ]]
    -- upvalues: l_OpenCloudService_0 (copy)
    if v90 == nil then
        return InvalidArgumentError("Request provided was nil.");
    else
        local v92 = verifyGenerateUserThumbnailRequest(v90, "generateUserThumbnailRequest");
        if v92 ~= nil then
            return v92;
        else
            local v93 = generateUserThumbnailUrl(v90, v91);
            if typeof(v93) ~= "string" then
                return v93;
            else
                return l_OpenCloudService_0:HttpRequestAsync({
                    Url = v93, 
                    Request_Type = "GET", 
                    Headers = v91
                });
            end;
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "GenerateUserThumbnail", generateUserThumbnail);
l_OpenCloudService_0:RegistrationComplete();