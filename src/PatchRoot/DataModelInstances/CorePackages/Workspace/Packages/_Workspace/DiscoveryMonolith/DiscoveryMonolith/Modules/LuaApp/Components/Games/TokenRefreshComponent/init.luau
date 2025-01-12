local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v9 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v9.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v9.FetchStatusNamespace;
local v12 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_NextDataExpirationTimeReducer_0 = v12.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v12.ExpirationTimeNamespace;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v16 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v17 = v3.PureComponent:extend("TokenRefreshComponent");
v17.init = function(v18) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    v18.steppedCallback = function() --[[ Line: 29 ]]
        -- upvalues: v18 (copy), l_RetrievalStatus_0 (ref)
        local l_sortToRefresh_0 = v18.props.sortToRefresh;
        local l_nextGameSortRefreshTime_0 = v18.props.nextGameSortRefreshTime;
        if v18.props.GameSortTokenFetchingStatus[l_sortToRefresh_0] ~= l_RetrievalStatus_0.Done then
            return;
        else
            if l_nextGameSortRefreshTime_0 < tick() then
                v18.props.refresh(v18.props.networking, l_sortToRefresh_0):catch(function() --[[ Line: 43 ]]

                end);
            end;
            return;
        end;
    end;
end;
v17.render = function(v21) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    return v3.createElement(l_ExternalEventConnection_0, {
        event = l_RunService_0.stepped, 
        callback = v21.steppedCallback
    });
end;
v17 = v4.connect(function(v22, v23) --[[ Line: 57 ]]
    -- upvalues: l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy)
    local v24 = nil;
    local v25 = v22.Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameSortGroup];
    if v25 then
        v24 = v25[v23.sortToRefresh];
    end;
    return {
        nextGameSortRefreshTime = v24, 
        GameSortTokenFetchingStatus = v22.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSortToken]
    };
end, function(v26) --[[ Line: 69 ]]
    -- upvalues: v16 (copy)
    return {
        refresh = function(v27, v28) --[[ Line: 71 ]] --[[ Name: refresh ]]
            -- upvalues: v26 (copy), v16 (ref)
            return v26(v16(v27, v28, nil));
        end
    };
end)(v17);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v17);