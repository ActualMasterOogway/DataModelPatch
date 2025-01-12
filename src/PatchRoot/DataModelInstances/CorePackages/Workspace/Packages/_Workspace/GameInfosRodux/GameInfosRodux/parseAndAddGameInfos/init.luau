local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInfosRodux");
local v1 = require(l_script_FirstAncestor_0.GameInfosReducer);
local v2 = require(l_script_FirstAncestor_0.AddGames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.tutils);
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local _ = require(l_Parent_0.DiscoveryTypes);
return function(v7, v8, v9, v10, v11) --[[ Line: 10 ]] --[[ Name: parseAndAddGameInfos ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), l_ApiFetchGameIcons_0 (copy)
    local v12 = v8:getState().Personalization[v1.key];
    local v13 = {};
    local v14 = {};
    for _, v16 in v9 do
        v10(v16):match(function(v17) --[[ Line: 25 ]]
            -- upvalues: v4 (ref), v12 (copy), v13 (copy), v14 (copy), v11 (copy), v16 (copy)
            local l_universeId_0 = v17.universeId;
            if not v4.shallowEqual(v17, v12[l_universeId_0]) then
                v13[l_universeId_0] = v17;
                table.insert(v14, l_universeId_0);
            end;
            if v11 then
                v11(v16, v17);
            end;
        end):matchError(function(v19) --[[ Line: 38 ]]
            warn((("parseAndAddGameInfos could not parse gameInfo: %*"):format(v19)));
        end);
    end;
    if next(v13) then
        v8:dispatch(v2(v13));
    end;
    if #v14 > 0 then
        v8:dispatch(l_ApiFetchGameIcons_0(v7, v14));
    end;
end;