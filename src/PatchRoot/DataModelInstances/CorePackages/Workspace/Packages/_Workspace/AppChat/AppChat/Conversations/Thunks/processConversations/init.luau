local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_AddUsers_0 = require(l_Parent_0.UserLib).Actions.AddUsers;
local function v20(v6, v7) --[[ Line: 9 ]] --[[ Name: extractConversationsAndUsers ]]
    -- upvalues: l_UserModel_0 (copy), l_llama_0 (copy)
    local v8 = {};
    local v9 = {};
    for _, v11 in v6 do
        table.insert(v8, v11.id);
        if v11.participant_user_ids then
            for _, v13 in v11.participant_user_ids do
                v13 = tostring(v13);
                if not v9[v13] then
                    local l_user_data_0 = v11.user_data;
                    if l_user_data_0 then
                        local v15 = l_user_data_0[v13];
                        if v15 then
                            local v16 = v7[v13] or l_UserModel_0.fromDataTable({
                                id = v15.id, 
                                name = v15.name, 
                                displayName = v15.display_name, 
                                isFriend = false
                            });
                            v9[v16.id] = v16;
                        end;
                    end;
                end;
            end;
        else
            for _, v18 in ipairs(v11.participants) do
                if not v9[tostring(v18.targetId)] then
                    local v19 = v7[tostring(v18.targetId)] or l_UserModel_0.fromDataTable({
                        id = v18.targetId, 
                        name = v18.name, 
                        displayName = v18.displayName, 
                        isFriend = false
                    });
                    v9[v19.id] = v19;
                end;
            end;
        end;
    end;
    return v8, v9, (l_llama_0.Dictionary.keys(v9));
end;
return function(v21) --[[ Line: 63 ]]
    -- upvalues: v20 (copy), l_AddUsers_0 (copy), v2 (copy)
    return function(v22) --[[ Line: 64 ]]
        -- upvalues: v21 (copy), v20 (ref), l_AddUsers_0 (ref), v2 (ref)
        if not v21 then
            return;
        else
            local v23 = v22:getState();
            local _, v25, v26 = v20(v21, v23.Users or {});
            v22:dispatch(l_AddUsers_0(v25));
            v22:dispatch(v2.GetPresencesFromUserIds.API(v26)):catch(function(v27) --[[ Line: 73 ]]
                warn("NetworkingPresence failure in processConversations, Status: " .. tostring(v27));
            end);
            return;
        end;
    end;
end;