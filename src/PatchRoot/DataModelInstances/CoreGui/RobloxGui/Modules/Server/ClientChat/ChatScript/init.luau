local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Chat_0 = game:GetService("Chat");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local function v49() --[[ Line: 16 ]] --[[ Name: DoEverything ]]
    -- upvalues: l_ChatSettings_0 (copy)
    local l_ChatMain_0 = require(script:WaitForChild("ChatMain"));
    local v7 = {
        ChatWindow = {}, 
        SetCore = {}, 
        GetCore = {}
    };
    v7.ChatWindow.ChatTypes = {};
    v7.ChatWindow.ChatTypes.BubbleChatEnabled = l_ChatSettings_0.BubbleChatEnabled;
    v7.ChatWindow.ChatTypes.ClassicChatEnabled = l_ChatSettings_0.ClassicChatEnabled;
    local function _(v8) --[[ Line: 29 ]] --[[ Name: ConnectEvent ]]
        -- upvalues: v7 (copy), l_ChatMain_0 (copy)
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = v8;
        v7.ChatWindow[v8] = l_BindableEvent_0;
        l_BindableEvent_0.Event:connect(function(...) --[[ Line: 34 ]]
            -- upvalues: l_ChatMain_0 (ref), v8 (copy)
            l_ChatMain_0[v8](l_ChatMain_0, ...);
        end);
    end;
    local function _(v11) --[[ Line: 37 ]] --[[ Name: ConnectFunction ]]
        -- upvalues: v7 (copy), l_ChatMain_0 (copy)
        local l_BindableFunction_0 = Instance.new("BindableFunction");
        l_BindableFunction_0.Name = v11;
        v7.ChatWindow[v11] = l_BindableFunction_0;
        l_BindableFunction_0.OnInvoke = function(...) --[[ Line: 42 ]]
            -- upvalues: l_ChatMain_0 (ref), v11 (copy)
            return l_ChatMain_0[v11](l_ChatMain_0, ...);
        end;
    end;
    local function _(v14) --[[ Line: 45 ]] --[[ Name: ReverseConnectEvent ]]
        -- upvalues: v7 (copy), l_ChatMain_0 (copy)
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        l_BindableEvent_1.Name = v14;
        v7.ChatWindow[v14] = l_BindableEvent_1;
        l_ChatMain_0[v14]:connect(function(...) --[[ Line: 50 ]]
            -- upvalues: l_BindableEvent_1 (copy)
            l_BindableEvent_1:Fire(...);
        end);
    end;
    local function _(v17) --[[ Line: 53 ]] --[[ Name: ConnectSignal ]]
        -- upvalues: v7 (copy), l_ChatMain_0 (copy)
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        l_BindableEvent_2.Name = v17;
        v7.ChatWindow[v17] = l_BindableEvent_2;
        l_BindableEvent_2.Event:connect(function(...) --[[ Line: 58 ]]
            -- upvalues: l_ChatMain_0 (ref), v17 (copy)
            l_ChatMain_0[v17]:fire(...);
        end);
    end;
    local function _(v20) --[[ Line: 61 ]] --[[ Name: ConnectSetCore ]]
        -- upvalues: v7 (copy), l_ChatMain_0 (copy)
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_BindableEvent_3.Name = v20;
        v7.SetCore[v20] = l_BindableEvent_3;
        l_BindableEvent_3.Event:connect(function(...) --[[ Line: 66 ]]
            -- upvalues: l_ChatMain_0 (ref), v20 (copy)
            l_ChatMain_0[v20 .. "Event"]:fire(...);
        end);
    end;
    local function _(v23) --[[ Line: 69 ]] --[[ Name: ConnectGetCore ]]
        -- upvalues: v7 (copy), l_ChatMain_0 (copy)
        local l_BindableFunction_1 = Instance.new("BindableFunction");
        l_BindableFunction_1.Name = v23;
        v7.GetCore[v23] = l_BindableFunction_1;
        l_BindableFunction_1.OnInvoke = function(...) --[[ Line: 74 ]]
            -- upvalues: l_ChatMain_0 (ref), v23 (copy)
            return l_ChatMain_0["f" .. v23](...);
        end;
    end;
    local l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ToggleVisibility";
    v7.ChatWindow.ToggleVisibility = l_BindableEvent_4;
    local l_Event_0 = l_BindableEvent_4.Event;
    local v28 = "ToggleVisibility";
    local l_v28_0 = v28 --[[ copy: 12 -> 13 ]];
    l_Event_0:connect(function(...) --[[ Line: 34 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_0 (copy)
        l_ChatMain_0[l_v28_0](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "SetVisible";
    v7.ChatWindow.SetVisible = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "SetVisible";
    local l_v28_1 = v28 --[[ copy: 12 -> 14 ]];
    l_Event_0:connect(function(...) --[[ Line: 34 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_1 (copy)
        l_ChatMain_0[l_v28_1](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "FocusChatBar";
    v7.ChatWindow.FocusChatBar = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "FocusChatBar";
    local l_v28_2 = v28 --[[ copy: 12 -> 15 ]];
    l_Event_0:connect(function(...) --[[ Line: 34 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_2 (copy)
        l_ChatMain_0[l_v28_2](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "EnterWhisperState";
    v7.ChatWindow.EnterWhisperState = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "EnterWhisperState";
    local l_v28_3 = v28 --[[ copy: 12 -> 16 ]];
    l_Event_0:connect(function(...) --[[ Line: 34 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_3 (copy)
        l_ChatMain_0[l_v28_3](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "GetVisibility";
    v7.ChatWindow.GetVisibility = l_BindableEvent_4;
    local v33 = "GetVisibility";
    local l_v33_0 = v33 --[[ copy: 10 -> 17 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 42 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v33_0 (copy)
        return l_ChatMain_0[l_v33_0](l_ChatMain_0, ...);
    end;
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "GetMessageCount";
    v7.ChatWindow.GetMessageCount = l_BindableEvent_4;
    v33 = "GetMessageCount";
    local l_v33_1 = v33 --[[ copy: 10 -> 18 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 42 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v33_1 (copy)
        return l_ChatMain_0[l_v33_1](l_ChatMain_0, ...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "TopbarEnabledChanged";
    v7.ChatWindow.TopbarEnabledChanged = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "TopbarEnabledChanged";
    local l_v28_4 = v28 --[[ copy: 12 -> 19 ]];
    l_Event_0:connect(function(...) --[[ Line: 34 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_4 (copy)
        l_ChatMain_0[l_v28_4](l_ChatMain_0, ...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "IsFocused";
    v7.ChatWindow.IsFocused = l_BindableEvent_4;
    v33 = "IsFocused";
    local l_v33_2 = v33 --[[ copy: 10 -> 20 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 42 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v33_2 (copy)
        return l_ChatMain_0[l_v33_2](l_ChatMain_0, ...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatBarFocusChanged";
    v7.ChatWindow.ChatBarFocusChanged = l_BindableEvent_4;
    local l_l_BindableEvent_4_0 = l_BindableEvent_4 --[[ copy: 8 -> 21 ]];
    l_ChatMain_0.ChatBarFocusChanged:connect(function(...) --[[ Line: 50 ]]
        -- upvalues: l_l_BindableEvent_4_0 (copy)
        l_l_BindableEvent_4_0:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "VisibilityStateChanged";
    v7.ChatWindow.VisibilityStateChanged = l_BindableEvent_4;
    local l_l_BindableEvent_4_1 = l_BindableEvent_4 --[[ copy: 8 -> 22 ]];
    l_ChatMain_0.VisibilityStateChanged:connect(function(...) --[[ Line: 50 ]]
        -- upvalues: l_l_BindableEvent_4_1 (copy)
        l_l_BindableEvent_4_1:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "MessagesChanged";
    v7.ChatWindow.MessagesChanged = l_BindableEvent_4;
    local l_l_BindableEvent_4_2 = l_BindableEvent_4 --[[ copy: 8 -> 23 ]];
    l_ChatMain_0.MessagesChanged:connect(function(...) --[[ Line: 50 ]]
        -- upvalues: l_l_BindableEvent_4_2 (copy)
        l_l_BindableEvent_4_2:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "MessagePosted";
    v7.ChatWindow.MessagePosted = l_BindableEvent_4;
    local l_l_BindableEvent_4_3 = l_BindableEvent_4 --[[ copy: 8 -> 24 ]];
    l_ChatMain_0.MessagePosted:connect(function(...) --[[ Line: 50 ]]
        -- upvalues: l_l_BindableEvent_4_3 (copy)
        l_l_BindableEvent_4_3:Fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "CoreGuiEnabled";
    v7.ChatWindow.CoreGuiEnabled = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "CoreGuiEnabled";
    local l_v28_5 = v28 --[[ copy: 12 -> 25 ]];
    l_Event_0:connect(function(...) --[[ Line: 58 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_5 (copy)
        l_ChatMain_0[l_v28_5]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatMakeSystemMessage";
    v7.SetCore.ChatMakeSystemMessage = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "ChatMakeSystemMessage";
    local l_v28_6 = v28 --[[ copy: 12 -> 26 ]];
    l_Event_0:connect(function(...) --[[ Line: 66 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_6 (copy)
        l_ChatMain_0[l_v28_6 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatWindowPosition";
    v7.SetCore.ChatWindowPosition = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "ChatWindowPosition";
    local l_v28_7 = v28 --[[ copy: 12 -> 27 ]];
    l_Event_0:connect(function(...) --[[ Line: 66 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_7 (copy)
        l_ChatMain_0[l_v28_7 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatWindowSize";
    v7.SetCore.ChatWindowSize = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "ChatWindowSize";
    local l_v28_8 = v28 --[[ copy: 12 -> 28 ]];
    l_Event_0:connect(function(...) --[[ Line: 66 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_8 (copy)
        l_ChatMain_0[l_v28_8 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "ChatWindowPosition";
    v7.GetCore.ChatWindowPosition = l_BindableEvent_4;
    v33 = "ChatWindowPosition";
    local l_v33_3 = v33 --[[ copy: 10 -> 29 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 74 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v33_3 (copy)
        return l_ChatMain_0["f" .. l_v33_3](...);
    end;
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "ChatWindowSize";
    v7.GetCore.ChatWindowSize = l_BindableEvent_4;
    v33 = "ChatWindowSize";
    local l_v33_4 = v33 --[[ copy: 10 -> 30 ]];
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 74 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v33_4 (copy)
        return l_ChatMain_0["f" .. l_v33_4](...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "ChatBarDisabled";
    v7.SetCore.ChatBarDisabled = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "ChatBarDisabled";
    local l_v28_9 = v28 --[[ copy: 12 -> 31 ]];
    l_Event_0:connect(function(...) --[[ Line: 66 ]]
        -- upvalues: l_ChatMain_0 (copy), l_v28_9 (copy)
        l_ChatMain_0[l_v28_9 .. "Event"]:fire(...);
    end);
    l_BindableEvent_4 = Instance.new("BindableFunction");
    l_BindableEvent_4.Name = "ChatBarDisabled";
    v7.GetCore.ChatBarDisabled = l_BindableEvent_4;
    v33 = "ChatBarDisabled";
    l_BindableEvent_4.OnInvoke = function(...) --[[ Line: 74 ]]
        -- upvalues: l_ChatMain_0 (copy), v33 (copy)
        return l_ChatMain_0["f" .. v33](...);
    end;
    l_BindableEvent_4 = Instance.new("BindableEvent");
    l_BindableEvent_4.Name = "SpecialKeyPressed";
    v7.ChatWindow.SpecialKeyPressed = l_BindableEvent_4;
    l_Event_0 = l_BindableEvent_4.Event;
    v28 = "SpecialKeyPressed";
    l_Event_0:connect(function(...) --[[ Line: 34 ]]
        -- upvalues: l_ChatMain_0 (copy), v28 (copy)
        l_ChatMain_0[v28](l_ChatMain_0, ...);
    end);
    SetCoreGuiChatConnections(v7);
end;
SetCoreGuiChatConnections = function(v50) --[[ Line: 107 ]] --[[ Name: SetCoreGuiChatConnections ]]
    -- upvalues: l_StarterGui_0 (copy)
    local v51 = 0;
    while v51 < 10 do
        v51 = v51 + 1;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 111 ]]
            -- upvalues: l_StarterGui_0 (ref), v50 (copy)
            l_StarterGui_0:SetCore("CoreGuiChatConnections", v50);
        end);
        if not l_status_0 then
            if not l_status_0 and v51 == 10 then
                error("Error calling SetCore CoreGuiChatConnections: " .. l_result_0);
            end;
            wait();
        else
            break;
        end;
    end;
end;
checkBothChatTypesDisabled = function() --[[ Line: 122 ]] --[[ Name: checkBothChatTypesDisabled ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if l_ChatSettings_0.BubbleChatEnabled ~= nil and l_ChatSettings_0.ClassicChatEnabled ~= nil then
        return not (l_ChatSettings_0.BubbleChatEnabled or l_ChatSettings_0.ClassicChatEnabled);
    else
        return false;
    end;
end;
if not l_GuiService_0:IsTenFootInterface() then
    if not checkBothChatTypesDisabled() then
        v49();
        return;
    else
        local v54 = {
            ChatWindow = {}
        };
        v54.ChatWindow.ChatTypes = {};
        v54.ChatWindow.ChatTypes.BubbleChatEnabled = false;
        v54.ChatWindow.ChatTypes.ClassicChatEnabled = false;
        SetCoreGuiChatConnections(v54);
        return;
    end;
else
    l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer();
    return;
end;