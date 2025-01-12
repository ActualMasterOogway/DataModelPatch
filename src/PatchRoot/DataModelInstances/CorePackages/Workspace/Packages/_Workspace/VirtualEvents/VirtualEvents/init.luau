local v0 = require(script.enums);
local _ = require(script.types);
local v2 = require(script.Components.EventNotificationsModal);
return {
    AnalyticsEvent = v0.AnalyticsEvent, 
    requests = require(script.requests), 
    EventDetailsPageLoader = require(script.Components.EventDetailsPageLoader), 
    ShareEventModal = require(script.Components.ShareEventModal), 
    EventNotificationsModal = v2, 
    EventsList = require(script.Components.EventsList), 
    EventsListCarousel = require(script.Components.EventsListCarousel.EventsListCarousel), 
    installReducer = require(script.installReducer), 
    fireEventDetailsPageVisit = require(script.Analytics.fireEventDetailsPageVisit), 
    fireShareVirtualEventIconClicked = require(script.Analytics.fireShareVirtualEventIconClicked), 
    fireVirtualEventJoined = require(script.Analytics.fireVirtualEventJoined), 
    fireVirtualEventLinkCopied = require(script.Analytics.fireVirtualEventLinkCopied), 
    fireVirtualEventRSVP = require(script.Analytics.fireVirtualEventRSVP), 
    fireEventNotificationEnabled = require(script.Analytics.fireEventNotificationEnabled), 
    fireVirtualEventImpression = require(script.Analytics.fireVirtualEventImpression), 
    ["jest.config"] = script["jest.config"]
};