local l_Parent_0 = script:FindFirstAncestor("UserBlockingRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = v1.makeActionCreator("BLOCK_USER_BY_ID_SUCCEEDED_ACTION", function() --[[ Line: 6 ]]
    return {
        responseBody = {}
    };
end);
local v3 = v1.makeActionCreator("UNBLOCK_USER_BY_ID_SUCCEEDED_ACTION", function() --[[ Line: 13 ]]
    return {
        responseBody = {}
    };
end);
local v4 = v1.makeActionCreator("UPLOAD_CONTACTS", function() --[[ Line: 20 ]]
    return {
        responseBody = true
    };
end);
return {
    mockBlockUserById = "BLOCK_USER_BY_ID_SUCCEEDED_ACTION", 
    mockUnblockUserById = "UNBLOCK_USER_BY_ID_SUCCEEDED_ACTION", 
    mockIsBlockedById = "UPLOAD_CONTACTS", 
    mockBlockUserByIdAction = v2, 
    mockUnblockUserByIdAction = v3, 
    mockIsBlockedByIdAction = v4
};