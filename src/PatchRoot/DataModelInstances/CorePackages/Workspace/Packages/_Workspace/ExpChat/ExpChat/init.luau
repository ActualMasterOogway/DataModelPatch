local l_Parent_0 = script.Parent;
local l_ActionBindableEvent_0 = require(l_Parent_0.ExpChatShared).ActionBindableEvent;
return {
    Events = require(script.Events), 
    mountClientApp = require(script.mountClientApp), 
    listenToDispatch = require(script.listenToDispatch)(l_ActionBindableEvent_0), 
    GlobalFlags = require(script.GlobalFlags), 
    getExperienceChatVisualConfig = require(script.getExperienceChatVisualConfig)
};