local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.UpdateChatMessages);
local v4 = require(l_Actions_0.UpdateUnreadMessagesBadge);
local v5 = require(l_Actions_0.UpdateChatVisible);
local v6 = require(l_Actions_0.SetCanChat);
local v7 = {
    canChat = false, 
    visible = true, 
    lastReadMessages = 0, 
    unreadMessages = 0
};
return (v1.createReducer(v7, {
    [v4.name] = function(v8, v9) --[[ Line: 20 ]]
        if v8.visible then
            return {
                canChat = v8.canChat, 
                visible = true, 
                lastReadMessages = 0, 
                unreadMessages = 0
            };
        else
            return {
                canChat = v8.canChat, 
                visible = false, 
                lastReadMessages = 0, 
                unreadMessages = v9.messages
            };
        end;
    end, 
    [v3.name] = function(v10, v11) --[[ Line: 38 ]]
        if v10.visible then
            return {
                canChat = v10.canChat, 
                visible = true, 
                lastReadMessages = v11.messages, 
                unreadMessages = 0
            };
        else
            return {
                canChat = v10.canChat, 
                visible = false, 
                lastReadMessages = v10.lastReadMessages, 
                unreadMessages = v11.messages - v10.lastReadMessages
            };
        end;
    end, 
    [v5.name] = function(v12, v13) --[[ Line: 56 ]]
        if v13.visible then
            return {
                canChat = v12.canChat, 
                visible = true, 
                lastReadMessages = v12.lastReadMessages + v12.unreadMessages, 
                unreadMessages = 0
            };
        else
            return {
                canChat = v12.canChat, 
                visible = false, 
                lastReadMessages = v12.lastReadMessages, 
                unreadMessages = v12.unreadMessages
            };
        end;
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 74 ]]
        return {
            canChat = v15.canChat, 
            visible = v14.visible, 
            lastReadMessages = v14.lastReadMessages, 
            unreadMessages = v14.unreadMessages
        };
    end
}));