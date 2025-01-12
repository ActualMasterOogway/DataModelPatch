local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_ApiFetchPlayabilityStatus_0 = require(l_Parent_0.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_FetchGamesProductInfo_0 = require(l_Parent_0.GameProductInfoRodux).FetchGamesProductInfo;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
return {
    KeyMapper = function(v7) --[[ Line: 11 ]] --[[ Name: keyMapper ]]
        return "luaapp.playability-and-productinfo." .. v7;
    end, 
    Fetch = function(v8, v9) --[[ Line: 19 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), l_ApiFetchPlayabilityStatus_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), l_FetchGamesProductInfo_0 (copy), v1 (copy)
        assert(type(v9) == "string", "FetchPlayabilityAndProductInfo thunk expects universeId to be a string");
        return l_PerformFetch_0.Single("luaapp.playability-and-productinfo." .. v9, function(v10) --[[ Line: 22 ]]
            -- upvalues: l_ApiFetchPlayabilityStatus_0 (ref), v8 (copy), v9 (copy), l_PlayabilityStatusEnum_0 (ref), l_FFlagLuaAppFiatPaidAccess_0 (ref), l_FetchGamesProductInfo_0 (ref), v1 (ref)
            return v10:dispatch(l_ApiFetchPlayabilityStatus_0.Fetch(v8, {
                v9
            })):andThen(function(v11) --[[ Line: 25 ]]
                -- upvalues: l_ApiFetchPlayabilityStatus_0 (ref), v9 (ref), v10 (copy), l_PlayabilityStatusEnum_0 (ref), l_FFlagLuaAppFiatPaidAccess_0 (ref), l_FetchGamesProductInfo_0 (ref), v8 (ref), v1 (ref)
                local v12, _ = v11[l_ApiFetchPlayabilityStatus_0.KeyMapper(v9)]:unwrap();
                if v12 then
                    local v14 = v10:getState().PlayabilityStatus[v9];
                    if v14.isPlayable == false and (v14.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired or l_FFlagLuaAppFiatPaidAccess_0 and v14.playabilityStatus == l_PlayabilityStatusEnum_0.FiatPurchaseRequired) then
                        return v10:dispatch(l_FetchGamesProductInfo_0.Fetch(v8, {
                            v9
                        })):andThen(function(v15) --[[ Line: 45 ]]
                            -- upvalues: l_FetchGamesProductInfo_0 (ref), v9 (ref), v1 (ref), v14 (copy)
                            local v16, _ = v15[l_FetchGamesProductInfo_0.KeyMapper(v9)]:unwrap();
                            if v16 then
                                return v1.resolve(v14.playabilityStatus);
                            else
                                return v1.reject();
                            end;
                        end);
                    else
                        return v1.resolve(v14.playabilityStatus);
                    end;
                else
                    return v1.reject();
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v18, v19) --[[ Line: 65 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v18, "luaapp.playability-and-productinfo." .. v19);
    end
};