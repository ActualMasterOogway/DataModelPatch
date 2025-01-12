local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Result);
local v3 = require(l_Parent_0.Promise);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_RetrievalStatus_0 = require(l_script_FirstAncestor_0.Enum).RetrievalStatus;
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
local l_FFlagLuaAppBatchFetchingStatus_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchFetchingStatus;
local l_FFlagLuaAppBatchSingleFetches_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBatchSingleFetches;
local v10 = {};
local v11 = {};
v10.ClearOutstandingPromiseStatus = function() --[[ Line: 41 ]] --[[ Name: ClearOutstandingPromiseStatus ]]
    -- upvalues: v11 (ref)
    v11 = {};
end;
local function v13(v12) --[[ Line: 45 ]] --[[ Name: singleFetchKeymapper ]]
    return v12;
end;
v10.GetStatus = function(v14, v15) --[[ Line: 54 ]] --[[ Name: GetStatus ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    assert(typeof(v14) == "table");
    assert(typeof(v15) == "string");
    assert(#v15 > 0);
    return v14.FetchingStatus[v15] or l_RetrievalStatus_0.NotStarted;
end;
v10.Single = function(v16, v17) --[[ Line: 85 ]] --[[ Name: Single ]]
    -- upvalues: v10 (copy), v13 (copy), v3 (copy), v2 (copy)
    assert(typeof(v16) == "string");
    assert(typeof(v17) == "function");
    assert(#v16 > 0);
    return function(v18) --[[ Line: 90 ]]
        -- upvalues: v10 (ref), v16 (copy), v13 (ref), v17 (copy), v3 (ref), v2 (ref)
        return v10.Batch({
            v16
        }, v13, function(v19, v20) --[[ Line: 92 ]]
            -- upvalues: v17 (ref), v3 (ref), v16 (ref), v2 (ref)
            assert(#v20 == 1);
            local v21 = v17(v19);
            assert(v3.is(v21));
            return v21:andThen(function(...) --[[ Line: 98 ]]
                -- upvalues: v3 (ref), v16 (ref), v2 (ref)
                assert(#{
                    ...
                } <= 1);
                return v3.resolve({
                    [v16] = v2.new(true, (...))
                });
            end, function(...) --[[ Line: 101 ]]
                -- upvalues: v3 (ref), v16 (ref), v2 (ref)
                assert(#{
                    ...
                } <= 1);
                return v3.resolve({
                    [v16] = v2.new(false, (...))
                });
            end);
        end)(v18):andThen(function(v22) --[[ Line: 105 ]]
            -- upvalues: v16 (ref), v3 (ref)
            local v23, v24 = v22[v16]:unwrap();
            if v23 then
                return v3.resolve(v24);
            else
                return v3.reject(v24);
            end;
        end);
    end;
end;
v10.Batch = function(v25, v26, v27) --[[ Line: 158 ]] --[[ Name: Batch ]]
    -- upvalues: v10 (copy), v11 (ref), l_FFlagLuaAppBatchSingleFetches_0 (copy), l_RetrievalStatus_0 (copy), v3 (copy), l_FFlagLuaAppBatchFetchingStatus_0 (copy), l_BatchUpdateFetchingStatus_0 (copy), l_UpdateFetchingStatus_0 (copy), l_PromiseUtilities_0 (copy), v2 (copy)
    assert(typeof(v25) == "table");
    assert(typeof(v26) == "function");
    assert(typeof(v27) == "function");
    return function(v28) --[[ Line: 163 ]]
        -- upvalues: v25 (copy), v26 (copy), v10 (ref), v11 (ref), l_FFlagLuaAppBatchSingleFetches_0 (ref), l_RetrievalStatus_0 (ref), v3 (ref), l_FFlagLuaAppBatchFetchingStatus_0 (ref), l_BatchUpdateFetchingStatus_0 (ref), l_UpdateFetchingStatus_0 (ref), v27 (copy), l_PromiseUtilities_0 (ref), v2 (ref)
        local v29 = {};
        local v30 = {};
        local v31 = {};
        for _, v33 in ipairs(v25) do
            local v34 = v26(v33);
            local v35 = v10.GetStatus(v28:getState(), v34);
            local v36 = v11[v34];
            if v36 then
                if not l_FFlagLuaAppBatchSingleFetches_0 then
                    assert(v35 == l_RetrievalStatus_0.Fetching);
                end;
                v31[v34] = v36;
            else
                if not l_FFlagLuaAppBatchSingleFetches_0 then
                    assert(v35 ~= l_RetrievalStatus_0.Fetching);
                end;
                table.insert(v29, v33);
                v30[v33] = v34;
            end;
        end;
        local v37 = nil;
        local v39 = v3.new(function(v38) --[[ Line: 191 ]]
            -- upvalues: v37 (ref)
            v37 = v38;
        end);
        local v40 = nil;
        if #v29 > 0 then
            if l_FFlagLuaAppBatchFetchingStatus_0 then
                local v41 = {};
                for _, v43 in pairs(v30) do
                    table.insert(v41, {
                        key = v43, 
                        status = l_RetrievalStatus_0.Fetching
                    });
                    v11[v43] = v39;
                end;
                if #v41 > 0 then
                    v28:dispatch(l_BatchUpdateFetchingStatus_0(v41));
                end;
            else
                for _, v45 in pairs(v30) do
                    v28:dispatch(l_UpdateFetchingStatus_0(v45, l_RetrievalStatus_0.Fetching));
                    v11[v45] = v39;
                end;
            end;
            v40 = v27(v28, v29);
            assert(v3.is(v40));
        else
            v40 = v3.resolve({});
        end;
        v40:andThen(function(v46) --[[ Line: 229 ]]
            -- upvalues: l_PromiseUtilities_0 (ref), v31 (copy)
            v46 = v46 or {};
            return l_PromiseUtilities_0.Batch(v31):andThen(function(v47) --[[ Line: 232 ]]
                -- upvalues: v46 (ref)
                local v48 = {};
                for v49, v50 in pairs(v47) do
                    local _, v52 = v50:unwrap();
                    v48[v49] = v52[v49];
                end;
                return v46, v48;
            end);
        end, function() --[[ Line: 242 ]]
            assert(false, "PerformFetch fetchFunctor should never reject");
        end):andThen(function(v53, v54) --[[ Line: 245 ]]
            -- upvalues: l_FFlagLuaAppBatchFetchingStatus_0 (ref), v30 (copy), v2 (ref), l_RetrievalStatus_0 (ref), v11 (ref), v28 (copy), l_BatchUpdateFetchingStatus_0 (ref), l_UpdateFetchingStatus_0 (ref)
            if l_FFlagLuaAppBatchFetchingStatus_0 then
                local v55 = {};
                for _, v57 in pairs(v30) do
                    local v58 = v53[v57];
                    if v2.is(v58) then
                        v54[v57] = v58;
                    else
                        v54[v57] = v2.error();
                    end;
                    local v59 = v54[v57]:unwrap() and l_RetrievalStatus_0.Done or l_RetrievalStatus_0.Failed;
                    table.insert(v55, {
                        key = v57, 
                        status = v59
                    });
                    v11[v57] = nil;
                end;
                if #v55 > 0 then
                    v28:dispatch(l_BatchUpdateFetchingStatus_0(v55));
                    return v54;
                end;
            else
                for _, v61 in pairs(v30) do
                    local v62 = v53[v61];
                    if v2.is(v62) then
                        v54[v61] = v62;
                    else
                        v54[v61] = v2.error();
                    end;
                    local v63 = v54[v61]:unwrap() and l_RetrievalStatus_0.Done or l_RetrievalStatus_0.Failed;
                    v28:dispatch(l_UpdateFetchingStatus_0(v61, v63));
                    v11[v61] = nil;
                end;
            end;
            return v54;
        end):andThen(function(v64) --[[ Line: 296 ]]
            -- upvalues: v37 (ref)
            v37(v64);
        end);
        return v39;
    end;
end;
return v10;