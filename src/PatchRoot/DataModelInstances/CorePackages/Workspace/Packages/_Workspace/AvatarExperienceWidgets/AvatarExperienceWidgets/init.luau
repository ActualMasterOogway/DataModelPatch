local v0 = require(script.Components.WidgetHeader);
local v1 = require(script.Components.WidgetLayout);
local v2 = require(script.Components.WidgetListItem);
return {
    Components = {
        WidgetHeader = v0, 
        WidgetLayout = v1, 
        WidgetListItem = v2
    }, 
    ["jest.config"] = script["jest.config"]
};