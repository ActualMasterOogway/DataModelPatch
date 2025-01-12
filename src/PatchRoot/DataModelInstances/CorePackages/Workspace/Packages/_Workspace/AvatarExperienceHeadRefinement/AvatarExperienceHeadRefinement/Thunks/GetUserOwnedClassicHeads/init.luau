local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Http);
local v4 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v5 = require(l_script_FirstAncestor_0.Enums.HeadShapePropertiesByAssetId);
local v6 = require(l_script_FirstAncestor_0.Actions.SetAvailableHeadShapes);
local v7 = require(l_script_FirstAncestor_0.Counters);
local v8 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXFixFetchOwnedHeadsPaging);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXHeadRefinementCounters);
local v10 = require(l_script_FirstAncestor_0.Requests.requestUserOwnedClassicHeads);
local function v22(v11) --[[ Line: 33 ]] --[[ Name: fetchHelper ]]
    -- upvalues: v10 (copy), v2 (copy)
    local l_networkImpl_0 = v11.networkImpl;
    local l_userId_0 = v11.userId;
    local v14 = {};
    local v15 = "";
    while true do
        if v15 ~= nil then
            local v16, v17 = v10(l_networkImpl_0, l_userId_0, v15):await();
            if not v16 then
                return v2.reject(v17);
            else
                local l_responseBody_0 = v17.responseBody;
                local v19 = l_responseBody_0.data or {};
                for _, v21 in v19 do
                    table.insert(v14, v21);
                end;
                v15 = l_responseBody_0.nextPageCursor;
            end;
        else
            return v2.resolve({
                responseBody = {
                    data = v14
                }
            });
        end;
    end;
end;
return function(v23, v24, v25) --[[ Line: 68 ]]
    -- upvalues: v3 (copy), v9 (copy), v7 (copy), v8 (copy), v22 (copy), v10 (copy), v6 (copy), v4 (copy), v2 (copy), v5 (copy)
    return v3.PerformFetch.Single("HeadRefinement_UserOwnedClassicHead_Request", function(v26) --[[ Line: 73 ]]
        -- upvalues: v9 (ref), v25 (copy), v7 (ref), v8 (ref), v22 (ref), v23 (copy), v24 (copy), v10 (ref), v6 (ref), v4 (ref), v2 (ref), v5 (ref)
        if v9() and v25 then
            v25(v7.OwnedClassicHeadsRequest.Start);
        end;
        local v27, v28 = (if v8() then v22({
            networkImpl = v23, 
            userId = v24
        }) else v10(v23, v24)):await();
        if not v27 then
            if v9() and v25 then
                v25(v7.OwnedClassicHeadsRequest.Failure);
            end;
            v26:dispatch(v6({
                v4.Default
            }));
            return v2.reject(v28);
        else
            local v29 = v28.responseBody or {
                data = {}
            };
            local v30 = {
                v4.Default
            };
            for _, v32 in v29.data do
                local v33 = v5[tostring(v32.assetId)];
                if v33 then
                    table.insert(v30, v33.name);
                end;
            end;
            if v9() and v25 then
                v25(v7.OwnedClassicHeadsRequest.Success, {
                    headShapeCount = tostring(#v30)
                });
            end;
            v26:dispatch(v6(v30));
            return v2.resolve(v30);
        end;
    end);
end;