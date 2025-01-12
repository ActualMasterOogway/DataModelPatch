local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.t);
local _ = require(script.Parent.ExternalContentSharingProtocolTypes);
local _ = require(l_Parent_0.MessageBus);
local v5 = v2.strictInterface({
    text = v2.string, 
    context = v2.optional(v2.string)
});
local v6 = v2.strictInterface({
    url = v2.string, 
    context = v2.optional(v2.string)
});
local v7 = v2.strictInterface({
    context = v2.optional(v2.string), 
    image = v2.string, 
    shareSheetTitle = v2.optional(v2.string), 
    url = v2.optional(v2.string)
});
local v8 = v2.strictInterface({
    context = v2.optional(v2.string), 
    shareSheetTitle = v2.optional(v2.string), 
    url = v2.optional(v2.string), 
    video = v2.string
});
local v9 = {
    EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareText"), 
        validateParams = v5
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareUrl"), 
        validateParams = v6
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareImage"), 
        validateParams = v7
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareVideo"), 
        validateParams = v8
    }
};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 71 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v9 (copy)
    return (setmetatable({
        messageBus = v10 or l_MessageBus_0
    }, v9));
end;
v9.shareText = function(v11, v12) --[[ Line: 79 ]] --[[ Name: shareText ]]
    v11.messageBus.publish(v11.EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR, v12);
end;
v9.shareUrl = function(v13, v14) --[[ Line: 83 ]] --[[ Name: shareUrl ]]
    v13.messageBus.publish(v13.EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR, v14);
end;
v9.shareImage = function(v15, v16) --[[ Line: 90 ]] --[[ Name: shareImage ]]
    v15.messageBus.publish(v15.EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR, v16);
end;
v9.shareVideo = function(v17, v18) --[[ Line: 94 ]] --[[ Name: shareVideo ]]
    v17.messageBus.publish(v17.EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR, v18);
end;
v9.default = v9.new();
return v9;