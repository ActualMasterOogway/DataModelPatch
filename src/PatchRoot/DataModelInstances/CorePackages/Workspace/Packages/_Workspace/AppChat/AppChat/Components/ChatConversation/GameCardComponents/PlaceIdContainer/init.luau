local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v2.memo;
local l_useCallback_0 = v2.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v2.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_Parent_0.Loggers).Logger:new("PlaceIdContainer");
local l_ApiFetchPlaceInfos_0 = require(l_Parent_0.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local v11 = require(script.Parent.GameCard);
local v12 = require(script.Parent.GameCardContainer);
local v13 = require(l_Parent_0.HttpRequest);
local v17 = {
    networkImpl = v13.config({
        requestFunction = function(v14, v15, v16) --[[ Line: 29 ]] --[[ Name: requestFunction ]]
            -- upvalues: v9 (copy), v13 (copy)
            v9:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v15, v14));
            return v13.requestFunctions.HttpRbxApi(v14, v15, v16);
        end
    })
};
local function _(v18, v19) --[[ Line: 46 ]] --[[ Name: getPlaceInfo ]]
    return v18.ChatAppReducer.PlaceInfos[v19] or {};
end;
PlaceIdContainer = function(v21) --[[ Line: 50 ]] --[[ Name: PlaceIdContainer ]]
    -- upvalues: v1 (copy), v17 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_ApiFetchPlaceInfos_0 (copy), l_dependencyArray_0 (copy), l_useEffect_0 (copy), l_useSelector_0 (copy), v2 (copy), v11 (copy), v12 (copy)
    local v22 = v1.Dictionary.join(v17, v21);
    local v23 = l_useDispatch_0();
    local v26 = l_useCallback_0(function(v24, v25) --[[ Line: 54 ]]
        -- upvalues: v23 (copy), l_ApiFetchPlaceInfos_0 (ref)
        return v23(l_ApiFetchPlaceInfos_0(v24, {
            v25
        }));
    end, l_dependencyArray_0(v23));
    l_useEffect_0(function() --[[ Line: 58 ]]
        -- upvalues: v22 (copy), v26 (copy)
        local l_networkImpl_0 = v22.networkImpl;
        v26(l_networkImpl_0, v22.placeId);
    end, {});
    local v30 = l_useSelector_0(function(v28) --[[ Line: 64 ]]
        -- upvalues: v22 (copy)
        local l_placeId_0 = v22.placeId;
        l_placeId_0 = (v28.ChatAppReducer.PlaceInfos[l_placeId_0] or {}).universeId;
        return l_placeId_0 and tostring(l_placeId_0) or nil;
    end);
    if not v30 then
        return v2.createElement(v11, {});
    else
        return v2.createElement(v12, v1.Dictionary.join(v22, {
            universeId = v30
        }));
    end;
end;
return l_memo_0(PlaceIdContainer);