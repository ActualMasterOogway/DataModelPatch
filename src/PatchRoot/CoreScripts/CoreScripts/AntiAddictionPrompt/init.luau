local _ = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v8 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local v9 = require(l_RobloxGui_0.Modules.Common.Url);
local v10 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local function _() --[[ Line: 20 ]] --[[ Name: leaveGame ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v12 = {
    Warning = 1, 
    Lockout = 2
};
local function _(v13) --[[ Line: 30 ]] --[[ Name: parseResponse ]]
    local l_type_0 = v13.response.state.type;
    local l_messages_0 = v13.response.state.messages;
    return {
        State = l_type_0, 
        Messages = l_messages_0
    };
end;
local _ = function(v17) --[[ Line: 39 ]] --[[ Name: markRead ]]
    -- upvalues: v9 (copy), l_HttpRbxApiService_0 (copy)
    local v18 = "mesasgeId=" .. v17;
    local v19 = v9.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. v18;
    local _, _ = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v19);
end;
local v35 = {
    pendingResolveMessage = {}, 
    displaying = nil, 
    resolvedMessage = {}, 
    displayMessageCallback = nil, 
    update = function(v23, v24) --[[ Line: 59 ]] --[[ Name: update ]]
        for _, v26 in pairs(v24) do
            local v27 = {
                id = v26.id, 
                message = v26.text
            };
            table.insert(v23.pendingResolveMessage, v27);
        end;
        v23:processNext();
    end, 
    processNext = function(v28) --[[ Line: 70 ]] --[[ Name: processNext ]]
        -- upvalues: v9 (copy), l_HttpRbxApiService_0 (copy)
        if v28.displaying then
            return;
        else
            local v29 = table.remove(v28.pendingResolveMessage, 1);
            if not v29 then
                return;
            elseif v28.resolvedMessage[v29.id] then
                v28:processNext();
                return;
            else
                v28.displaying = v29;
                if v28.displayMessageCallback then
                    v28.displayMessageCallback(v29.message);
                end;
                spawn(function() --[[ Line: 90 ]]
                    -- upvalues: v29 (copy), v9 (ref), l_HttpRbxApiService_0 (ref)
                    local v30 = "mesasgeId=" .. v29.id;
                    local v31 = v9.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. v30;
                    local _, _ = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v31);
                end);
                return;
            end;
        end;
    end, 
    resolve = function(v34) --[[ Line: 96 ]] --[[ Name: resolve ]]
        v34.resolvedMessage[v34.displaying.id] = v34.displaying.message;
        v34.displaying = nil;
        v34:processNext();
    end
};
local v36 = {
    MessageTextScaled = true, 
    HideErrorCode = true, 
    MenuIsOpenKey = "AnitAddictionPrompt"
};
local v37 = v8.new("Default", v36);
v37:setParent(l_RobloxGui_0);
local function v39(v38) --[[ Line: 112 ]] --[[ Name: displayMessage ]]
    -- upvalues: v37 (copy)
    v37:_open(v38);
end;
local v40 = {
    {
        Text = "OK", 
        LocalizationKey = "InGame.CommonUI.Button.Ok", 
        LayoutOrder = 1, 
        Callback = function() --[[ Line: 116 ]] --[[ Name: resolveMessage ]]
            -- upvalues: v37 (copy), v35 (copy)
            v37:_close();
            v35:resolve();
        end, 
        Primary = true
    }
};
v35.displayMessageCallback = v39;
v37:updateButtons(v40);
v37:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning");
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local v42 = nil;
if v10() then
    v42 = l_RobloxGui_0.AbsoluteSize.Y;
end;
local function v45() --[[ Line: 141 ]] --[[ Name: onScreenSizeChanged ]]
    -- upvalues: v37 (copy), l_RobloxGui_0 (copy), v10 (copy), l_X_0 (ref), v42 (ref)
    if not v37 then
        return;
    else
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        if v10() then
            local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
            if l_X_0 ~= l_X_1 or v42 ~= l_Y_0 then
                l_X_0 = l_X_1;
                v42 = l_Y_0;
                v37:resizeWidthAndHeight(l_X_0, v42);
                return;
            end;
        elseif l_X_0 ~= l_X_1 then
            l_X_0 = l_X_1;
            v37:resizeWidth(l_X_0);
        end;
        return;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v45);
v45();
local v46 = nil;
local function _(v47) --[[ Line: 166 ]] --[[ Name: antiAddictionStatesUpdated ]]
    -- upvalues: v12 (copy), v46 (ref), l_GuiService_0 (copy), v35 (copy)
    local l_type_1 = v47.response.state.type;
    local l_messages_1 = v47.response.state.messages;
    local v50 = {
        State = l_type_1, 
        Messages = l_messages_1
    };
    if v50.State == v12.Lockout then
        if v46 then
            v46:Disconnect();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        game:Shutdown();
    end;
    v35:update(v50.Messages);
end;
v46 = l_NotificationService_0.RobloxEventReceived:Connect(function(v52) --[[ Line: 180 ]]
    -- upvalues: l_HttpService_0 (copy), v12 (copy), v46 (ref), l_GuiService_0 (copy), v35 (copy)
    if v52.namespace == "AntiAddictionNotifications" then
        local v53 = l_HttpService_0:JSONDecode(v52.detail);
        local l_type_2 = v53.response.state.type;
        local l_messages_2 = v53.response.state.messages;
        local v56 = {
            State = l_type_2, 
            Messages = l_messages_2
        };
        if v56.State == v12.Lockout then
            if v46 then
                v46:Disconnect();
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
        end;
        v35:update(v56.Messages);
    end;
end);