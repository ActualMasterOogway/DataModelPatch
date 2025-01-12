local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local l_useState_0 = v1.useState;
local v5 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v6 = require(l_script_FirstAncestor_0.Analytics.sendAnalytics);
local v7 = require(l_script_FirstAncestor_0.Hooks.useLocalUserId);
local v8 = require(l_script_FirstAncestor_0.Hooks.useFirstSongForComponentLifetime);
local v9 = require(l_script_FirstAncestor_0.Requests.GetFavoriteForAsset);
local v10 = require(l_script_FirstAncestor_0.Requests.PostFavoriteForAsset);
local v11 = require(l_script_FirstAncestor_0.Requests.DeleteFavoriteForAsset);
local v12 = require(l_script_FirstAncestor_0.Components.LikeButton);
local l_StatusCodes_0 = require(l_script_FirstAncestor_0.Parent.Http).StatusCodes;
local v14 = require(l_script_FirstAncestor_0.Parent.HttpRequest);
local v15 = v14.config({
    requestFunction = v14.requestFunctions.RequestInternal
});
local v16 = require(l_script_FirstAncestor_0.logger);
return function() --[[ Line: 27 ]] --[[ Name: LikeButtonWrapper ]]
    -- upvalues: l_useState_0 (copy), v7 (copy), v8 (copy), l_useMemo_0 (copy), v11 (copy), v15 (copy), l_StatusCodes_0 (copy), v6 (copy), v5 (copy), v16 (copy), v10 (copy), l_useEffect_0 (copy), v9 (copy), v1 (copy), v12 (copy)
    local v17, v18 = l_useState_0(false);
    local v19 = v7();
    local v20 = v8();
    local v21 = l_useMemo_0(function() --[[ Line: 33 ]]
        -- upvalues: v20 (copy)
        if v20 and v20.metadata then
            return (tonumber(v20.metadata.AssetId));
        else
            return nil;
        end;
    end, {
        v20
    });
    local function v26() --[[ Line: 37 ]] --[[ Name: onFavoriteActivated ]]
        -- upvalues: v21 (copy), v19 (copy), v17 (copy), v11 (ref), v15 (ref), l_StatusCodes_0 (ref), v18 (copy), v6 (ref), v5 (ref), v16 (ref), v10 (ref)
        if v21 and v21 > 0 and v19 > 0 then
            if v17 then
                v11(v15, tostring(v19), (tostring(v21))):andThen(function(v22) --[[ Line: 40 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v18 (ref), v6 (ref), v19 (ref), v21 (ref), v5 (ref)
                    if v22.responseCode == l_StatusCodes_0.OK then
                        v18(false);
                        v6({
                            userId = v19, 
                            assetId = v21, 
                            action = v5.Unlike
                        });
                    end;
                end):catch(function(v23) --[[ Line: 51 ]]
                    -- upvalues: v16 (ref)
                    v16:warning(v23.StatusMessage);
                end);
                return;
            else
                v10(v15, tostring(v19), (tostring(v21))):andThen(function(v24) --[[ Line: 55 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v18 (ref), v6 (ref), v19 (ref), v21 (ref), v5 (ref)
                    if v24.responseCode == l_StatusCodes_0.OK then
                        v18(true);
                        v6({
                            userId = v19, 
                            assetId = v21, 
                            action = v5.Like
                        });
                    end;
                end):catch(function(v25) --[[ Line: 66 ]]
                    -- upvalues: v16 (ref)
                    v16:warning(v25.StatusMessage);
                end);
            end;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 73 ]]
        -- upvalues: v21 (copy), v19 (copy), v9 (ref), v15 (ref), l_StatusCodes_0 (ref), v18 (copy), v16 (ref)
        if v21 and v21 > 0 and v19 > -1 then
            v9(v15, tostring(v19), (tostring(v21))):andThen(function(v27) --[[ Line: 75 ]]
                -- upvalues: l_StatusCodes_0 (ref), v18 (ref)
                if v27.responseCode == l_StatusCodes_0.OK and v27.responseBody then
                    v18(true);
                end;
            end):catch(function(v28) --[[ Line: 81 ]]
                -- upvalues: v16 (ref)
                v16:warning(v28.StatusMessage);
            end);
        end;
    end, {
        v21, 
        v19
    });
    return v1.createElement(v12, {
        isFavorited = v17, 
        onFavorite = v26
    });
end;