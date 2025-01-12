local _ = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_1 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_1:WaitForChild("RobloxGui").Modules;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_SocialContextToastContainer_0 = require(l_CorePackages_0.Workspace.Packages.SocialContextToasts).SocialContextToastContainer;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSocialContextToastEventStream;
local v8 = require(l_CorePackages_0.Packages.HttpRequest);
local v12 = v8.config({
    requestFunction = function(v9, v10, v11) --[[ Line: 14 ]] --[[ Name: requestFunction ]]
        -- upvalues: v8 (copy)
        return v8.requestFunctions.HttpRbxApi(v9, v10, v11);
    end
});
local v13 = require(l_CoreGui_1.RobloxGui.Modules.ApolloClient);
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v16 = require(l_Modules_0.Common.IXPServiceWrapper);
l_SocialContextToastContainer_0({
    networking = v12, 
    playersService = l_Players_0, 
    apolloClient = v13, 
    analytics = l_Analytics_0.new(), 
    ixpService = v16, 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0)
}, if l_GetFFlagSocialContextToastEventStream_0() then tostring(game.GameId) else game.GameId, if l_GetFFlagSocialContextToastEventStream_0() then tostring(game.PlaceId) else game.PlaceId);