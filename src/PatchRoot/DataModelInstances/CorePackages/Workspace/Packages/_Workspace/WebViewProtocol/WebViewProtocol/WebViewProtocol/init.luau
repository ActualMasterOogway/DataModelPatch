local l_Parent_0 = script.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v5 = require(l_Parent_0.t);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_AsyncQueue_0 = require(l_Parent_0.AppCommonLib).AsyncQueue;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local _ = require(script.Parent.WebViewProtocolTypes);
game:DefineFastFlag("EnableWebViewProtocolForTestingOnly", false);
local function v11(v10) --[[ Line: 65 ]] --[[ Name: createConfigCommand ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode({
        command = "config", 
        visible = v10.isVisible == true
    });
end;
local v12 = {
    OPEN_WINDOW_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "openWindow"), 
        validateParams = v5.strictInterface({
            url = v5.string, 
            title = v5.optional(v5.string), 
            isVisible = v5.optional(v5.boolean), 
            searchParams = v5.optional(v5.strictInterface({
                searchType = v5.string
            })), 
            transitionAnimation = v5.optional(v5.string), 
            windowType = if l_GetFFlagEnableUnifiedWebViews_0() then v5.optional(v5.string) else v5.string, 
            visible = if l_GetFFlagEnableUnifiedWebViews_0() then v5.optional(v5.boolean) else nil
        })
    }, 
    MUTATE_WINDOW_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "mutateWindow"), 
        validateParams = v5.strictInterface({
            url = v5.optional(v5.string), 
            title = v5.optional(v5.string), 
            isVisible = v5.optional(v5.boolean), 
            searchParams = v5.optional(v5.strictInterface({
                searchType = v5.string
            })), 
            transitionAnimation = v5.optional(v5.string), 
            windowType = v5.optional(v5.string)
        })
    }, 
    CLOSE_WINDOW_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "closeWindow"), 
        validateParams = v5.table
    }, 
    HANDLE_WINDOW_CLOSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "handleWindowClose"), 
        validateParams = v5.table
    }
};
v12.__index = v12;
v12.new = function(v13, v14) --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), l_BrowserService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_AsyncQueue_0 (copy), v12 (copy)
    local v15 = v13 or l_MessageBus_0;
    local v16 = v14 or l_BrowserService_0;
    local v17 = {
        messageBus = v15, 
        browserService = if l_GetFFlagEnableUnifiedWebViews_0() then v16 else nil, 
        subscriber = v15.Subscriber.new(), 
        queue = if l_GetFFlagEnableUnifiedWebViews_0() then l_AsyncQueue_0.new() else nil
    };
    setmetatable(v17, v12);
    return v17;
end;
v12.openWindow = function(v18, v19) --[[ Line: 130 ]] --[[ Name: openWindow ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy)
    assert(v18.isEnabled());
    if l_GetFFlagEnableUnifiedWebViews_0() then
        if v18.shouldForceVisibleOnOpen() then
            v19.isVisible = true;
        end;
        if v18.shouldRenameIsVisibleParam() then
            v19.visible = v19.isVisible;
        end;
    end;
    v18.messageBus.publish(v18.OPEN_WINDOW_DESCRIPTOR, v19);
end;
v12.mutateWindow = function(v20, v21) --[[ Line: 148 ]] --[[ Name: mutateWindow ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), v11 (copy)
    assert(v20.isEnabled());
    local v22 = true;
    if l_GetFFlagEnableUnifiedWebViews_0() and v20.shouldForceBrowserServiceOnMutate() then
        v22 = false;
    end;
    if v22 then
        v20.messageBus.publish(v20.MUTATE_WINDOW_DESCRIPTOR, v21);
        return;
    else
        v20.browserService:SendCommand(v11(v21));
        return;
    end;
end;
v12.closeWindow = function(v23) --[[ Line: 167 ]] --[[ Name: closeWindow ]]
    assert(v23.isEnabled());
    v23.messageBus.publish(v23.CLOSE_WINDOW_DESCRIPTOR, {});
end;
v12.listenForWindowClose = function(v24, v25) --[[ Line: 172 ]] --[[ Name: listenForWindowClose ]]
    assert(v24.isEnabled());
    v24.subscriber:subscribe(v24.HANDLE_WINDOW_CLOSE_DESCRIPTOR, function() --[[ Line: 174 ]]
        -- upvalues: v25 (copy)
        v25();
    end, false);
end;
v12.stopListeningForWindowClose = function(v26) --[[ Line: 179 ]] --[[ Name: stopListeningForWindowClose ]]
    assert(v26.isEnabled());
    v26.subscriber:unsubscribe(v26.HANDLE_WINDOW_CLOSE_DESCRIPTOR);
end;
v12.listenForJavaScript = function(v27, v28) --[[ Line: 184 ]] --[[ Name: listenForJavaScript ]]
    v27.javaScriptConnection = v27.browserService.JavaScriptCallback:Connect(v28);
end;
v12.stopListeningForJavaScript = function(v29) --[[ Line: 188 ]] --[[ Name: stopListeningForJavaScript ]]
    if v29.javaScriptConnection ~= nil then
        v29.javaScriptConnection:Disconnect();
        v29.javaScriptConnection = nil;
    end;
end;
v12.stopListening = function(v30) --[[ Line: 195 ]] --[[ Name: stopListening ]]
    assert(v30.isEnabled());
    v30.subscriber:unsubscribeFromAllMessages();
end;
v12.request = function(v31, v32) --[[ Line: 200 ]] --[[ Name: request ]]
    return v31.queue:request(v32);
end;
v12.isEnabled = function() --[[ Line: 204 ]] --[[ Name: isEnabled ]]
    return game:GetEngineFeature("WebViewProtocol") or game:GetFastFlag("EnableWebViewProtocolForTestingOnly");
end;
v12.shouldForceVisibleOnOpen = function() --[[ Line: 209 ]] --[[ Name: shouldForceVisibleOnOpen ]]
    -- upvalues: l_l_UserInputService_0_Platform_0 (copy)
    local v33 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
        v33 = l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX;
    end;
    return v33;
end;
v12.shouldRenameIsVisibleParam = function() --[[ Line: 213 ]] --[[ Name: shouldRenameIsVisibleParam ]]
    -- upvalues: l_l_UserInputService_0_Platform_0 (copy)
    return l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
end;
v12.shouldForceBrowserServiceOnMutate = function() --[[ Line: 217 ]] --[[ Name: shouldForceBrowserServiceOnMutate ]]
    -- upvalues: l_l_UserInputService_0_Platform_0 (copy)
    return l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
end;
v12.default = v12.new();
return v12;