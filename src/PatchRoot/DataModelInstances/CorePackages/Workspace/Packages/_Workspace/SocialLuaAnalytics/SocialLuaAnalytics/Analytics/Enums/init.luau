local v0 = require(script.Contexts);
local v1 = require(script.Sources);
local v2 = require(script.PresenceTypes);
local v3 = require(script.SubPages);
local v4 = require(script.FriendStatuses);
local v5 = require(script.EventTypes);
local v6 = require(script.Pages);
local v7 = require(script.RecommendationContextTypes);
local v8 = require(script.ContextualInfoTypes);
local v9 = require(script.DiagEventTypes);
local v10 = require(script.PlatformSpecificity);
local v11 = require(script.LoadingStages);
local v12 = require(script.EntityTypes);
return {
    Contexts = v0, 
    Sources = v1, 
    EventTypes = v5, 
    FriendStatuses = v4, 
    PresenceTypes = v2, 
    SubPages = v3, 
    Pages = v6, 
    RecommendationContextTypes = v7, 
    ContextualInfoTypes = v8, 
    DiagEventTypes = v9, 
    PlatformSpecificity = v10, 
    LoadingStages = v11, 
    SupportedTelemetryBackends = require(script.SupportedTelemetryBackends), 
    EntityTypes = v12
};