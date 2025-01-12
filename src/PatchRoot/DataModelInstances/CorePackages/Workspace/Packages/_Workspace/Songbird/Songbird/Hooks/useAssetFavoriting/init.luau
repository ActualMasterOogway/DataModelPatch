local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local l_StatusCodes_0 = require(l_script_FirstAncestor_0.Parent.Http).StatusCodes;
local v4 = require(l_script_FirstAncestor_0.Parent.HttpRequest);
local v5 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v6 = require(l_script_FirstAncestor_0.Analytics.sendAnalytics);
local v7 = require(l_script_FirstAncestor_0.Hooks.useLocalUserId);
local v8 = require(l_script_FirstAncestor_0.Requests.GetFavoriteForAsset);
local v9 = require(l_script_FirstAncestor_0.Requests.PostFavoriteForAsset);
local v10 = require(l_script_FirstAncestor_0.Requests.DeleteFavoriteForAsset);
local v11 = require(l_script_FirstAncestor_0.logger);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagFixSongbirdLoadingState);
local l_usePrevious_0 = v2.usePrevious;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local v18 = v4.config({
    requestFunction = v4.requestFunctions.RequestInternal
});
return function(v19) --[[ Line: 28 ]] --[[ Name: useAssetFavoriting ]]
    -- upvalues: v7 (copy), l_useState_0 (copy), l_usePrevious_0 (copy), v12 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v11 (copy), v8 (copy), v18 (copy), l_StatusCodes_0 (copy), v10 (copy), v6 (copy), v5 (copy), v9 (copy), l_useEffect_0 (copy)
    local v20 = v7();
    local v21, v22 = l_useState_0(true);
    local v23, v24 = l_useState_0(false);
    local v25 = l_usePrevious_0(v19);
    local v26 = if v12() then l_useRef_0(nil) else nil;
    local v27 = l_useCallback_0(function() --[[ Line: 35 ]]
        -- upvalues: v12 (ref), v19 (copy), v11 (ref), v20 (copy)
        if v12() then
            if not v19 then
                return false;
            elseif v19 <= 0 then
                v11:warning((("validation failed (assetId must be a positive int, got %*)"):format(v19)));
                return false;
            elseif not v20 or v20 <= 0 then
                v11:warning((("validation failed (userId must be a positive int, got %*)"):format(v20)));
                return false;
            end;
        elseif v19 and v19 <= 0 then
            v11:warning((("failed to favorite asset (assetId must be a positive int, got %*)"):format(v19)));
            return false;
        elseif v20 <= 0 then
            v11:warning((("failed to favorite asset (userId must be a positive int, got %*)"):format(v19)));
            return false;
        end;
        return true;
    end, {
        v19, 
        v20
    });
    local v30 = if v12() then nil else l_useCallback_0(function() --[[ Line: 69 ]]
        -- upvalues: v22 (copy), v27 (copy), v8 (ref), v18 (ref), v20 (copy), v19 (copy), l_StatusCodes_0 (ref), v24 (copy), v11 (ref)
        v22(true);
        if v27() then
            v8(v18, tostring(v20), (tostring(v19))):andThen(function(v28) --[[ Line: 74 ]]
                -- upvalues: l_StatusCodes_0 (ref), v24 (ref)
                if v28.responseCode == l_StatusCodes_0.OK and v28.responseBody then
                    v24(true);
                    return;
                else
                    v24(false);
                    return;
                end;
            end):andThen(function() --[[ Line: 85 ]]
                -- upvalues: v22 (ref)
                v22(false);
            end):catch(function(v29) --[[ Line: 88 ]]
                -- upvalues: v11 (ref)
                v11:warning(v29.StatusMessage);
            end);
        end;
    end, {
        v20, 
        v19, 
        v27
    });
    local v35 = l_useCallback_0(function() --[[ Line: 94 ]]
        -- upvalues: v27 (copy), v23 (copy), v24 (copy), v10 (ref), v18 (ref), v20 (copy), v19 (copy), l_StatusCodes_0 (ref), v6 (ref), v5 (ref), v11 (ref), v9 (ref)
        if v27() then
            if v23 then
                v24(false);
                v10(v18, tostring(v20), (tostring(v19))):andThen(function(v31) --[[ Line: 99 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v6 (ref), v20 (ref), v19 (ref), v5 (ref)
                    if v31.responseCode == l_StatusCodes_0.OK then
                        v6({
                            userId = v20, 
                            assetId = v19, 
                            action = v5.Unlike
                        });
                    end;
                end):catch(function(v32) --[[ Line: 103 ]]
                    -- upvalues: v24 (ref), v23 (ref), v11 (ref)
                    v24(v23);
                    v11:warning(v32.StatusMessage);
                end);
                return;
            else
                v24(true);
                v9(v18, tostring(v20), (tostring(v19))):andThen(function(v33) --[[ Line: 110 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v6 (ref), v20 (ref), v19 (ref), v5 (ref)
                    if v33.responseCode == l_StatusCodes_0.OK then
                        v6({
                            userId = v20, 
                            assetId = v19, 
                            action = v5.Like
                        });
                    end;
                end):catch(function(v34) --[[ Line: 114 ]]
                    -- upvalues: v24 (ref), v23 (ref), v11 (ref)
                    v24(v23);
                    v11:warning(v34.StatusMessage);
                end);
            end;
        end;
    end, {
        v20, 
        v19, 
        v23, 
        v27
    });
    if v12() then
        l_useEffect_0(function() --[[ Line: 123 ]]
            -- upvalues: v27 (copy), v19 (copy), v25 (copy), v22 (copy), v24 (copy), v26 (copy), v8 (ref), v18 (ref), v20 (copy), l_StatusCodes_0 (ref), v11 (ref)
            if v27() and v19 ~= v25 then
                v22(true);
                v24(false);
                if v26.current then
                    v26.current:cancel();
                end;
                v26.current = v8(v18, tostring(v20), (tostring(v19))):andThen(function(v36) --[[ Line: 133 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v24 (ref)
                    if v36.responseCode == l_StatusCodes_0.OK and v36.responseBody then
                        v24(true);
                        return;
                    else
                        v24(false);
                        return;
                    end;
                end):catch(function(v37) --[[ Line: 144 ]]
                    -- upvalues: v11 (ref)
                    v11:warning(v37.StatusMessage);
                end):finally(function() --[[ Line: 147 ]]
                    -- upvalues: v22 (ref), v26 (ref)
                    v22(false);
                    v26.current = nil;
                end);
            end;
        end, {
            v27, 
            v19, 
            v25
        });
    else
        l_useEffect_0(function() --[[ Line: 154 ]]
            -- upvalues: v27 (copy), v8 (ref), v18 (ref), v20 (copy), v19 (copy), l_StatusCodes_0 (ref), v24 (copy), v22 (copy), v11 (ref)
            if v27() then
                v8(v18, tostring(v20), (tostring(v19))):andThen(function(v38) --[[ Line: 157 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v24 (ref)
                    if v38.responseCode == l_StatusCodes_0.OK and v38.responseBody then
                        v24(true);
                    end;
                end):andThen(function() --[[ Line: 166 ]]
                    -- upvalues: v22 (ref)
                    v22(false);
                end):catch(function(v39) --[[ Line: 169 ]]
                    -- upvalues: v11 (ref)
                    v11:warning(v39.StatusMessage);
                end);
            end;
        end, {
            v20, 
            v19, 
            v27
        });
        l_useEffect_0(function() --[[ Line: 175 ]]
            -- upvalues: v19 (copy), v25 (copy), v30 (copy)
            if v19 ~= v25 then
                v30();
            end;
        end, {
            v19, 
            v25, 
            v30
        });
    end;
    return {
        isLoading = v21, 
        toggleFavorite = v35, 
        isFavorited = v23
    };
end;