local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AppChatAccountSettingsEventReceiver);
local v3 = require(script.Parent.AppChatNotificationEventReceiver);
return function(_) --[[ Line: 10 ]] --[[ Name: AppChatPersistentEventReceivers ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v1.Fragment, nil, {
        accountSettings = v1.createElement(v2), 
        notification = v1.createElement(v3)
    });
end;