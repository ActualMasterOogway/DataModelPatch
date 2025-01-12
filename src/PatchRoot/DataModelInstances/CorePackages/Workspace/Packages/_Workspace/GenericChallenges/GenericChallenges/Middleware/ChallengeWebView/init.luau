local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(script.Parent.ChallengeHeaders);
local v2 = require(script.Parent.BuildChallengeWebViewUrl);
local _ = require(script.Parent.BuildHybridCallback);
local _ = require(l_script_FirstAncestor_0.Types.ChallengeParameters);
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: l_BrowserService_0 (copy), v1 (copy), v2 (copy), v7 (copy)
    local v9 = {
        browserService = v8.browserService or l_BrowserService_0
    };
    local v10 = nil;
    if v8.rawResponseHeaders ~= nil then
        v10 = v1.new(v8.rawResponseHeaders);
    end;
    v9.challengeUrl = v2(v10, v8.challengeType, v8.challengeParameters);
    v9.title = v8.title;
    if v8.hybridCallback ~= nil then
        v9.hybridCallback = v8.hybridCallback;
    end;
    if v8.closeCallback ~= nil then
        v9.closeCallback = v8.closeCallback;
    end;
    if v8.openCallback ~= nil then
        v9.openCallback = v8.openCallback;
    end;
    v9.hybridCallbackConnection = nil;
    v9.modal = false;
    if v8.modal ~= nil then
        v9.modal = v8.modal;
    end;
    return (setmetatable(v9, v7));
end;
v7.setCloseCallback = function(v11, v12) --[[ Line: 97 ]] --[[ Name: setCloseCallback ]]
    v11.closeCallback = v12;
end;
v7.setOpenCallback = function(v13, v14) --[[ Line: 102 ]] --[[ Name: setOpenCallback ]]
    v13.openCallback = v14;
end;
v7.setHybridCallback = function(v15, v16) --[[ Line: 107 ]] --[[ Name: setHybridCallback ]]
    v15.hybridCallback = v16;
end;
v7.open = function(v17) --[[ Line: 112 ]] --[[ Name: open ]]
    -- upvalues: l_HttpService_0 (copy)
    assert(v17.hybridCallback ~= nil, "hybrid callback has not been initialized");
    if v17.openCallback ~= nil then
        v17.openCallback();
    end;
    v17.hybridCallbackConnection = v17.browserService.JavaScriptCallback:Connect(v17.hybridCallback);
    if v17.closeCallback ~= nil then
        v17.closeCallbackConnection = v17.browserService.BrowserWindowClosed:Connect(v17.closeCallback);
    end;
    assert(string.len(v17.challengeUrl) > 0, "challenge url must have been constructed");
    assert(v17.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized");
    local v18 = l_HttpService_0:JSONEncode({
        command = "open", 
        url = v17.challengeUrl, 
        title = v17.title, 
        visible = true, 
        modal = v17.modal, 
        isGenericWebview = true, 
        enableOverlayReplacement = true
    });
    v17.browserService:SendCommand(v18);
end;
v7.close = function(v19) --[[ Line: 137 ]] --[[ Name: close ]]
    if v19.hybridCallbackConnection ~= nil then
        v19.hybridCallbackConnection:Disconnect();
    end;
    v19.browserService:CloseBrowserWindow();
    if v19.closeCallbackConnection ~= nil then
        v19.closeCallbackConnection:Disconnect();
    end;
end;
return v7;