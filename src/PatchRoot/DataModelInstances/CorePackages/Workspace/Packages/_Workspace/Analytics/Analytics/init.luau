return {
    Analytics = require(script.Analytics), 
    AnalyticsReporters = require(script.AnalyticsReporters), 
    getPlatformTarget = require(script.getPlatformTarget), 
    ReportToDiagByCountryCode = require(script.ReportToDiagByCountryCode), 
    RequestTimeDiag = require(script.RequestTimeDiag), 
    Events = {
        pageHeartbeat = require(script.Events.pageHeartbeat), 
        userInteractions = require(script.Events.userInteractions)
    }
};