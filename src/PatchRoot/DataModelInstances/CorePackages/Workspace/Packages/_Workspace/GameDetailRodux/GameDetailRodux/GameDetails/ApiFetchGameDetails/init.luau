local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Result);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v6 = require(script.Parent.GamesMultigetDetails);
local v7 = require(l_script_FirstAncestor_0.GameDetails.AddGameDetails);
local v8 = require(l_script_FirstAncestor_0.GameDetails.GameDetailModel);
local v9 = require(l_script_FirstAncestor_0.Logger);
local v10 = {};
local function v12(v11) --[[ Line: 18 ]]
    return "luaapp.gamesapi.games." .. v11;
end;
v10.KeyMapper = v12;
v10.GetFetchingStatus = function(v13, v14) --[[ Line: 24 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v13, "luaapp.gamesapi.games." .. v14);
end;
v10.Fetch = function(v15, v16) --[[ Line: 28 ]] --[[ Name: Fetch ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v12 (copy), v6 (copy), v8 (copy), v4 (copy), v7 (copy), v9 (copy), v2 (copy)
    v3.isType(v16, "table", "ApiFetchGameDetails: universeIds");
    return l_PerformFetch_0.Batch(v16, v12, function(v17, v18) --[[ Line: 31 ]]
        -- upvalues: v6 (ref), v15 (copy), v8 (ref), v4 (ref), v7 (ref), v9 (ref), v2 (ref)
        return v6(v15, v18):andThen(function(v19) --[[ Line: 32 ]]
            -- upvalues: v8 (ref), v4 (ref), v17 (copy), v7 (ref), v9 (ref), v2 (ref)
            local v20 = {};
            local v21 = v19 and v19.responseBody and v19.responseBody.data;
            if v21 ~= nil then
                local v22 = {};
                for _, v24 in ipairs(v21) do
                    local v25 = v8.fromJsonData(v24);
                    v22[v25.id] = v25;
                    v20["luaapp.gamesapi.games." .. v25.id] = v4.new(true, v25);
                end;
                if next(v22) then
                    v17:dispatch(v7(v22));
                end;
            else
                v9:warning("Response from GamesMultigetDetails is malformed!");
            end;
            return v2.resolve(v20);
        end, function(_) --[[ Line: 53 ]]
            -- upvalues: v2 (ref)
            return v2.resolve({});
        end);
    end);
end;
return v10;