local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.AuthCommon);
local l_PostPasswordValid_0 = v1.Http.Requests.PostPasswordValid;
local v3 = require(l_Parent_0.Promise);
local l_PasswordIssue_0 = v1.Enums.PasswordIssue;
local l_IssueCondition_0 = v1.Enums.IssueCondition;
local v6 = {
    [l_PasswordIssue_0.Length] = "Authentication.SignUp.Label.PasswordError1", 
    [l_PasswordIssue_0.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2", 
    [l_PasswordIssue_0.Simple] = "Authentication.SignUp.Label.PasswordError3"
};
local function v7() --[[ Line: 16 ]] --[[ Name: getIssueMessageList ]]
    -- upvalues: v6 (copy)
    return v6;
end;
local function v10() --[[ Line: 20 ]] --[[ Name: getDefaultIssues ]]
    -- upvalues: v6 (copy), l_IssueCondition_0 (copy)
    local v8 = {};
    for v9 in pairs(v6) do
        v8[v9] = l_IssueCondition_0.Problematic;
    end;
    return v8;
end;
local _ = function(v11, v12, v13, v14) --[[ Line: 30 ]] --[[ Name: validateFunction ]]
    -- upvalues: l_PasswordIssue_0 (copy), l_IssueCondition_0 (copy), v3 (copy), l_PostPasswordValid_0 (copy)
    return function(_) --[[ Line: 31 ]]
        -- upvalues: l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v14 (copy), v12 (copy), v13 (copy), v3 (ref), l_PostPasswordValid_0 (ref), v11 (copy)
        local v16 = {
            [l_PasswordIssue_0.Length] = l_IssueCondition_0.Resolved, 
            [l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Resolved, 
            [l_PasswordIssue_0.Simple] = v14[l_PasswordIssue_0.Simple] ~= l_IssueCondition_0.Hidden and l_IssueCondition_0.Resolved or l_IssueCondition_0.Hidden
        };
        if v12 == nil or v13 == nil or v12 == "" or v13 == "" or string.match(v13, "%S") == nil then
            for v17 in pairs(v16) do
                if v16[v17] == l_IssueCondition_0.Resolved then
                    v16[v17] = l_IssueCondition_0.Problematic;
                end;
            end;
            return v3.resolve({
                Input = v13, 
                InputValid = false, 
                IssueCondition = v16
            });
        else
            return l_PostPasswordValid_0(v11, v12, v13):andThen(function(v18) --[[ Line: 60 ]]
                -- upvalues: v16 (copy), l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v13 (ref), v3 (ref)
                local v19 = {};
                local v20 = v18 and v18.responseBody and v18.responseBody.code;
                if type(v20) == "number" then
                    if v20 == 2 then
                        v16[l_PasswordIssue_0.Length] = l_IssueCondition_0.Problematic;
                    elseif v20 == 3 then
                        v16[l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Problematic;
                    elseif v20 == 4 or v20 == 5 then
                        v16[l_PasswordIssue_0.Simple] = l_IssueCondition_0.Problematic;
                    end;
                else
                    warn("JSON failure");
                end;
                v19.Input = v13;
                v19.InputValid = v20 == 0;
                v19.IssueCondition = v16;
                return v3.resolve(v19);
            end, function(_) --[[ Line: 82 ]]
                -- upvalues: v3 (ref), v13 (ref), v16 (copy)
                return v3.resolve({
                    Input = v13, 
                    InputValid = true, 
                    IssueCondition = v16
                });
            end);
        end;
    end;
end;
return {
    validateFunction = function(v23, v24, v25, v26) --[[ Line: 93 ]] --[[ Name: validateFunctionRefactor ]]
        -- upvalues: l_PasswordIssue_0 (copy), l_IssueCondition_0 (copy), v3 (copy), l_PostPasswordValid_0 (copy)
        local l_username_0 = (v26 or {}).username;
        return function(_) --[[ Line: 31 ]]
            -- upvalues: l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v25 (copy), l_username_0 (copy), v24 (copy), v3 (ref), l_PostPasswordValid_0 (ref), v23 (copy)
            local v29 = {
                [l_PasswordIssue_0.Length] = l_IssueCondition_0.Resolved, 
                [l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Resolved, 
                [l_PasswordIssue_0.Simple] = v25[l_PasswordIssue_0.Simple] ~= l_IssueCondition_0.Hidden and l_IssueCondition_0.Resolved or l_IssueCondition_0.Hidden
            };
            if l_username_0 == nil or v24 == nil or l_username_0 == "" or v24 == "" or string.match(v24, "%S") == nil then
                for v30 in pairs(v29) do
                    if v29[v30] == l_IssueCondition_0.Resolved then
                        v29[v30] = l_IssueCondition_0.Problematic;
                    end;
                end;
                return v3.resolve({
                    Input = v24, 
                    InputValid = false, 
                    IssueCondition = v29
                });
            else
                return l_PostPasswordValid_0(v23, l_username_0, v24):andThen(function(v31) --[[ Line: 60 ]]
                    -- upvalues: v29 (copy), l_PasswordIssue_0 (ref), l_IssueCondition_0 (ref), v24 (ref), v3 (ref)
                    local v32 = {};
                    local v33 = v31 and v31.responseBody and v31.responseBody.code;
                    if type(v33) == "number" then
                        if v33 == 2 then
                            v29[l_PasswordIssue_0.Length] = l_IssueCondition_0.Problematic;
                        elseif v33 == 3 then
                            v29[l_PasswordIssue_0.UsernameMatch] = l_IssueCondition_0.Problematic;
                        elseif v33 == 4 or v33 == 5 then
                            v29[l_PasswordIssue_0.Simple] = l_IssueCondition_0.Problematic;
                        end;
                    else
                        warn("JSON failure");
                    end;
                    v32.Input = v24;
                    v32.InputValid = v33 == 0;
                    v32.IssueCondition = v29;
                    return v3.resolve(v32);
                end, function(_) --[[ Line: 82 ]]
                    -- upvalues: v3 (ref), v24 (ref), v29 (copy)
                    return v3.resolve({
                        Input = v24, 
                        InputValid = true, 
                        IssueCondition = v29
                    });
                end);
            end;
        end;
    end, 
    getIssueMessageList = v7, 
    getDefaultIssues = v10
};