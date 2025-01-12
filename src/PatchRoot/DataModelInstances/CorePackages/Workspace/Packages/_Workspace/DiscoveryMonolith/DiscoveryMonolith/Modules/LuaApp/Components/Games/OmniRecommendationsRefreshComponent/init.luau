local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_AppOmniRecommendationsRequest_0 = require(l_Parent_0.RoactServiceTags).AppOmniRecommendationsRequest;
local v11 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v11.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v11.FetchStatusNamespace;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v15 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v16 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local l_IsPrefetchOneCopyEnabled_0 = require(l_Parent_0.SharedFlags).IsPrefetchOneCopyEnabled;
local v18 = v3.PureComponent:extend("OmniRecommendationsRefreshComponent");
v18.init = function(v19) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v15 (copy)
    v19.steppedCallback = function() --[[ Line: 31 ]]
        -- upvalues: v19 (copy), l_RetrievalStatus_0 (ref), v15 (ref)
        if v19.props.retrievalStatus[v19.props.pageType] ~= l_RetrievalStatus_0.Done then
            return;
        else
            local v20 = tick();
            if not v19.props.refreshTime then
                return;
            else
                local v21 = v19.props.refreshTime[v19.props.pageType];
                if v21 == nil or v20 < v21 then
                    return;
                else
                    v19.props.refresh(v19.props.networking, v19.props.omniRecommendationsRequest, v19.props.pageType, v15.OmniRecommendationsRequestIntent.AutoRefresh, v19.props.loggingProtocol);
                    return;
                end;
            end;
        end;
    end;
end;
v18.render = function(v22) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    return v3.createElement(l_ExternalEventConnection_0, {
        event = l_RunService_0.stepped, 
        callback = v22.steppedCallback
    });
end;
v18 = v4.connect(function(v23, _) --[[ Line: 64 ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy)
    return {
        refreshTime = v23.OmniRecommendationsRefreshTime, 
        retrievalStatus = v23.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations]
    };
end, function(v25) --[[ Line: 69 ]]
    -- upvalues: v16 (copy)
    return {
        refresh = function(v26, v27, v28, v29, v30) --[[ Line: 71 ]] --[[ Name: refresh ]]
            -- upvalues: v25 (copy), v16 (ref)
            return v25(v16(v26, v27, v28, nil, nil, v29, v30));
        end
    };
end)(v18);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    loggingProtocol = l_AppLogging_0, 
    omniRecommendationsRequest = if l_IsPrefetchOneCopyEnabled_0() then l_AppOmniRecommendationsRequest_0 else nil
})(v18);