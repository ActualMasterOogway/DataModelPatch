local v0 = require(script.Parent.AnalyticsService);
return (require(script.Parent.setupFireAnalytics)({
    analytics = v0, 
    infoForAllEvents = {}
}));