local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Regulations.ScreenTime.HttpRequests);
local v7 = require(l_CorePackages_0.Regulations.ScreenTime.Constants);
local v8 = require(l_CorePackages_0.Regulations.ScreenTime.GetFFlagScreenTimeSignalR);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v10 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local v11 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local function _() --[[ Line: 16 ]] --[[ Name: leaveGame ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v13 = {
    Warning = 1, 
    Lockout = 2, 
    OpenWebView = 3
};
local v14 = v6:new(l_HttpService_0);
local v15 = nil;
local function _() --[[ Line: 32 ]] --[[ Name: disconnectAndLeaveGame ]]
    -- upvalues: v15 (ref), l_GuiService_0 (copy)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v25 = {
    pendingResolveMessage = {}, 
    displaying = nil, 
    resolvedMessage = {}, 
    displayMessageCallback = nil, 
    update = function(v17, v18) --[[ Line: 53 ]] --[[ Name: update ]]
        for _, v20 in pairs(v18) do
            local v21 = {
                id = v20.serialId, 
                instructionName = v20.instructionName, 
                message = v20.message, 
                type = v20.type
            };
            table.insert(v17.pendingResolveMessage, v21);
        end;
        v17:processNext();
    end, 
    processNext = function(v22) --[[ Line: 66 ]] --[[ Name: processNext ]]
        if v22.displaying then
            return;
        else
            local v23 = table.remove(v22.pendingResolveMessage, 1);
            if not v23 then
                return;
            elseif v22.resolvedMessage[v23.id] then
                v22:processNext();
                return;
            else
                v22.displaying = v23;
                if v22.displayMessageCallback then
                    v22.displayMessageCallback(v23.message);
                end;
                return;
            end;
        end;
    end, 
    resolve = function(v24) --[[ Line: 88 ]] --[[ Name: resolve ]]
        -- upvalues: v14 (copy)
        v24.resolvedMessage[v24.displaying.id] = v24.displaying.message;
        v14:reportExecution(v24.displaying.instructionName, v24.displaying.id);
        v24.displaying = nil;
        v24:processNext();
    end
};
local v26 = {
    MessageTextScaled = true, 
    HideErrorCode = true, 
    MenuIsOpenKey = "ScreenTimePrompt"
};
local v27 = v10.new("Default", v26);
v27:setParent(l_RobloxGui_0);
local function v29(v28) --[[ Line: 108 ]] --[[ Name: displayMessage ]]
    -- upvalues: v27 (copy)
    v27:_open(v28);
end;
local v30 = {
    {
        Text = "OK", 
        LocalizationKey = "InGame.CommonUI.Button.Ok", 
        LayoutOrder = 1, 
        Callback = function() --[[ Line: 112 ]] --[[ Name: resolveMessage ]]
            -- upvalues: v27 (copy), v25 (copy)
            v27:_close();
            v25:resolve();
        end, 
        Primary = true
    }
};
v25.displayMessageCallback = v29;
v27:updateButtons(v30);
v27:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning");
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local v32 = nil;
if v11() then
    v32 = l_RobloxGui_0.AbsoluteSize.Y;
end;
local function v35() --[[ Line: 138 ]] --[[ Name: onScreenSizeChanged ]]
    -- upvalues: v27 (copy), l_RobloxGui_0 (copy), v11 (copy), l_X_0 (ref), v32 (ref)
    if not v27 then
        return;
    else
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        if v11() then
            local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
            if l_X_0 ~= l_X_1 or v32 ~= l_Y_0 then
                l_X_0 = l_X_1;
                v32 = l_Y_0;
                v27:resizeWidthAndHeight(l_X_0, v32);
                return;
            end;
        elseif l_X_0 ~= l_X_1 then
            l_X_0 = l_X_1;
            v27:resizeWidth(l_X_0);
        end;
        return;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v35);
v35();
local function v40(v36) --[[ Line: 161 ]] --[[ Name: screenTimeStatesUpdated ]]
    -- upvalues: v13 (copy), v15 (ref), l_GuiService_0 (copy), v25 (copy)
    local v37 = {};
    for _, v39 in ipairs(v36) do
        if v39.type == v13.Warning then
            table.insert(v37, v39);
        elseif v39.type == v13.Lockout then
            if v15 then
                v15:Disconnect();
                v15 = nil;
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
            return;
        elseif v39.type == v13.OpenWebView then

        end;
    end;
    v25:update(v37);
end;
local function _() --[[ Line: 180 ]] --[[ Name: requestInstructions ]]
    -- upvalues: v14 (copy), v40 (copy), l_Logging_0 (copy)
    v14:getInstructions(function(v41, v42, v43) --[[ Line: 181 ]]
        -- upvalues: v40 (ref), l_Logging_0 (ref)
        if v41 then
            v40(v43);
            return;
        elseif v42 then
            l_Logging_0.warn("ScreenTimeInGame" .. " requestInstructions failed: unauthorized");
            return;
        else
            l_Logging_0.warn("ScreenTimeInGame" .. " requestInstructions failed: error");
            return;
        end;
    end);
end;
v15 = l_NotificationService_0.RobloxEventReceived:Connect(function(v45) --[[ Line: 193 ]]
    -- upvalues: v8 (copy), v7 (copy), v14 (copy), v40 (copy), l_Logging_0 (copy), v15 (ref), l_GuiService_0 (copy), l_HttpService_0 (copy)
    if v8() then
        if v45.namespace == v7.SIGNALR_NAMESPACE and v45.detailType == v7.SIGNALR_TYPE_NEW_INSTRUCTION then
            v14:getInstructions(function(v46, v47, v48) --[[ Line: 181 ]]
                -- upvalues: v40 (ref), l_Logging_0 (ref)
                if v46 then
                    v40(v48);
                    return;
                elseif v47 then
                    l_Logging_0.warn("ScreenTimeInGame" .. " requestInstructions failed: unauthorized");
                    return;
                else
                    l_Logging_0.warn("ScreenTimeInGame" .. " requestInstructions failed: error");
                    return;
                end;
            end);
            return;
        end;
    elseif v45.namespace == v7.HEARTBEAT_NOTIFICATIONS_NAMESPACE then
        if v45.detailType == v7.HEARTBEAT_CONSECUTIVE_FAILURE then
            if v15 then
                v15:Disconnect();
                v15 = nil;
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 208 ]]
                -- upvalues: l_HttpService_0 (ref), v45 (copy)
                return l_HttpService_0:JSONDecode(v45.detail);
            end);
            if not l_status_0 then
                l_Logging_0.warn("ScreenTimeInGame" .. " json decoding failed");
                return;
            elseif l_result_0.notifications == nil then
                l_Logging_0.warn("ScreenTimeInGame" .. " empty heartbeat notifications");
                return;
            else
                for _, v52 in ipairs(l_result_0.notifications) do
                    if v52.type == v7.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
                        v14:getInstructions(function(v53, v54, v55) --[[ Line: 181 ]]
                            -- upvalues: v40 (ref), l_Logging_0 (ref)
                            if v53 then
                                v40(v55);
                                return;
                            elseif v54 then
                                l_Logging_0.warn("ScreenTimeInGame" .. " requestInstructions failed: unauthorized");
                                return;
                            else
                                l_Logging_0.warn("ScreenTimeInGame" .. " requestInstructions failed: error");
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
    end;
end);