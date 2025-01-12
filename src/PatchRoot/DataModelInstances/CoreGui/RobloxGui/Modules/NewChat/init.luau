local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v4 = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService;
local v5 = false;
local l_ClassicChat_0 = l_Players_0.ClassicChat;
local l_BubbleChat_0 = l_Players_0.BubbleChat;
local v8 = require(l_RobloxGui_0.Modules.ChatUtil);
local l_CorePackages_0 = game:GetService("CorePackages");
local v10 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v11 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = v11.GetFFlagReenableTextChatForTenFootInterfaces;
local l_getFFlagExpChatAlwaysRunTCS_0 = v11.getFFlagExpChatAlwaysRunTCS;
local function _() --[[ Line: 30 ]] --[[ Name: shouldForceLegacyChatToBeHidden ]]
    -- upvalues: l_getFFlagExpChatAlwaysRunTCS_0 (copy), v4 (copy)
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        return v4;
    else
        return false;
    end;
end;
local v15 = {};
local v16 = {
    Visible = true, 
    MessageCount = 0, 
    TopbarEnabled = true, 
    CoreGuiEnabled = true
};
local v17 = {
    ChatWindow = nil, 
    GetCore = nil, 
    SetCore = nil
};
local v18 = {};
local v19 = {};
local function _(v20, v21, v22) --[[ Line: 55 ]] --[[ Name: FindInCollectionByKeyAndType ]]
    if v20 and v20[v21] and v20[v21]:IsA(v22) then
        return v20[v21];
    else
        return nil;
    end;
end;
local function v27(v24, ...) --[[ Line: 62 ]] --[[ Name: DispatchEvent ]]
    -- upvalues: v17 (copy)
    local l_ChatWindow_0 = v17.ChatWindow;
    local v26 = if l_ChatWindow_0 and l_ChatWindow_0[v24] and l_ChatWindow_0[v24]:IsA("BindableEvent") then l_ChatWindow_0[v24] else nil;
    if v26 then
        v26:Fire(...);
        return true;
    else
        return false;
    end;
end;
local function v31(v28, ...) --[[ Line: 71 ]] --[[ Name: AttemptInvokeFunction ]]
    -- upvalues: v17 (copy)
    local l_ChatWindow_1 = v17.ChatWindow;
    local v30 = if l_ChatWindow_1 and l_ChatWindow_1[v28] and l_ChatWindow_1[v28]:IsA("BindableFunction") then l_ChatWindow_1[v28] else nil;
    if v30 then
        return true, v30:Invoke();
    else
        return false, nil;
    end;
end;
local function _(v32) --[[ Line: 80 ]] --[[ Name: DoConnectGetCore ]]
    -- upvalues: l_StarterGui_0 (copy), v17 (copy)
    l_StarterGui_0:RegisterGetCore(v32, function(v33) --[[ Line: 81 ]]
        -- upvalues: v17 (ref), v32 (copy)
        local l_GetCore_0 = v17.GetCore;
        local l_v32_0 = v32;
        local v36 = if l_GetCore_0 and l_GetCore_0[l_v32_0] and l_GetCore_0[l_v32_0]:IsA("BindableFunction") then l_GetCore_0[l_v32_0] else nil;
        l_GetCore_0 = nil;
        if v36 then
            l_GetCore_0 = v36:Invoke(v33);
        end;
        return l_GetCore_0;
    end);
end;
v15.ToggleVisibility = function(_) --[[ Line: 92 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v16 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v4 (copy), v27 (copy), v15 (copy), v10 (copy)
    v16.Visible = not v16.Visible;
    if not (if l_getFFlagExpChatAlwaysRunTCS_0() then v4 else false) and not v27("ToggleVisibility") then
        v15.VisibilityStateChanged:fire(v16.Visible);
    end;
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        v15.ChromeVisibilityStateChanged:fire(v16.Visible);
    end;
    v10.Events.ChatTopBarButtonActivated(v16.Visible);
end;
v15.SetVisible = function(_, v40) --[[ Line: 108 ]] --[[ Name: SetVisible ]]
    -- upvalues: v16 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v15 (copy), v10 (copy), v4 (copy), v27 (copy)
    v16.Visible = v40;
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        v15.ChromeVisibilityStateChanged:fire(v16.Visible);
    end;
    v10.Events.ChatTopBarButtonActivated(v16.Visible);
    if if l_getFFlagExpChatAlwaysRunTCS_0() then v4 else false then
        v27("SetVisible", false);
        return;
    else
        if not v27("SetVisible", v16.Visible) then
            v15.VisibilityStateChanged:fire(v16.Visible);
        end;
        return;
    end;
end;
v15.FocusChatBar = function(_) --[[ Line: 126 ]] --[[ Name: FocusChatBar ]]
    -- upvalues: v27 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), v10 (copy)
    v27("FocusChatBar");
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        v10.Events.ChatTopBarFocusActivated();
    end;
end;
v15.EnterWhisperState = function(_, v43) --[[ Line: 134 ]] --[[ Name: EnterWhisperState ]]
    -- upvalues: v27 (copy)
    return v27("EnterWhisperState", v43);
end;
v15.GetVisibility = function(_) --[[ Line: 138 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v31 (copy), v16 (copy)
    local v45, v46 = v31("GetVisibility");
    if v45 then
        return v46;
    else
        return v16.Visible;
    end;
end;
v15.GetMessageCount = function(_) --[[ Line: 147 ]] --[[ Name: GetMessageCount ]]
    -- upvalues: v31 (copy), v16 (copy)
    local v48, v49 = v31("GetMessageCount");
    if v48 then
        return v49;
    else
        return v16.MessageCount;
    end;
end;
v15.TopbarEnabledChanged = function(_, v51) --[[ Line: 156 ]] --[[ Name: TopbarEnabledChanged ]]
    -- upvalues: v16 (copy), v27 (copy)
    v16.TopbarEnabled = v51;
    v27("TopbarEnabledChanged", v16.TopbarEnabled);
end;
v15.IsFocused = function(_, v53) --[[ Line: 161 ]] --[[ Name: IsFocused ]]
    -- upvalues: v31 (copy)
    local v54, v55 = v31("IsFocused", v53);
    if v54 then
        return v55;
    else
        return false;
    end;
end;
v15.ClassicChatEnabled = function(_) --[[ Line: 170 ]] --[[ Name: ClassicChatEnabled ]]
    -- upvalues: l_ClassicChat_0 (ref)
    return l_ClassicChat_0;
end;
v15.IsBubbleChatOnly = function(_) --[[ Line: 174 ]] --[[ Name: IsBubbleChatOnly ]]
    -- upvalues: l_BubbleChat_0 (ref), l_ClassicChat_0 (ref)
    return l_BubbleChat_0 and not l_ClassicChat_0;
end;
v15.IsDisabled = function(_) --[[ Line: 178 ]] --[[ Name: IsDisabled ]]
    -- upvalues: l_BubbleChat_0 (ref), l_ClassicChat_0 (ref)
    return not (l_BubbleChat_0 or l_ClassicChat_0);
end;
SetInitialChatTypes = function(v59) --[[ Line: 182 ]] --[[ Name: SetInitialChatTypes ]]
    -- upvalues: v5 (ref), l_BubbleChat_0 (ref), l_ClassicChat_0 (ref), v15 (copy)
    if v5 then
        return;
    else
        v5 = true;
        local l_BubbleChatEnabled_0 = v59.BubbleChatEnabled;
        local l_ClassicChatEnabled_0 = v59.ClassicChatEnabled;
        if type(l_BubbleChatEnabled_0) == "boolean" then
            l_BubbleChat_0 = l_BubbleChatEnabled_0;
        end;
        if type(l_ClassicChatEnabled_0) == "boolean" then
            l_ClassicChat_0 = l_ClassicChatEnabled_0;
        end;
        if not l_ClassicChat_0 and not l_BubbleChat_0 then
            v15.ChatDisabled:fire();
        end;
        if l_BubbleChat_0 and not l_ClassicChat_0 then
            v15.BubbleChatOnlySet:fire();
        end;
        return;
    end;
end;
v15.ChatBarFocusChanged = v8.Signal();
v15.VisibilityStateChanged = v8.Signal();
if l_getFFlagExpChatAlwaysRunTCS_0() then
    v15.ChromeVisibilityStateChanged = v8.Signal();
end;
v15.MessagesChanged = v8.Signal();
v15.BubbleChatOnlySet = v8.Signal();
v15.ChatDisabled = v8.Signal();
l_StarterGui_0.CoreGuiChangedSignal:connect(function(v62, v63) --[[ Line: 216 ]]
    -- upvalues: v16 (copy), v27 (copy)
    if v62 == Enum.CoreGuiType.All or v62 == Enum.CoreGuiType.Chat then
        v16.CoreGuiEnabled = v63;
        v27("CoreGuiEnabled", v16.CoreGuiEnabled);
    end;
end);
l_GuiService_0:AddSpecialKey(Enum.SpecialKey.ChatHotkey);
l_GuiService_0.SpecialKeyPressed:connect(function(v64, v65) --[[ Line: 224 ]]
    -- upvalues: l_GuiService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v4 (copy), v27 (copy)
    if l_GuiService_0.MenuIsOpen then
        return;
    else
        if not if l_getFFlagExpChatAlwaysRunTCS_0() then v4 else false then
            v27("SpecialKeyPressed", v64, v65);
        end;
        return;
    end;
end);
DoConnectSetCore = function(v66) --[[ Line: 234 ]] --[[ Name: DoConnectSetCore ]]
    -- upvalues: l_StarterGui_0 (copy), v17 (copy), v19 (copy)
    l_StarterGui_0:RegisterSetCore(v66, function(v67) --[[ Line: 235 ]]
        -- upvalues: v17 (ref), v66 (copy), v19 (ref)
        local l_SetCore_0 = v17.SetCore;
        local l_v66_0 = v66;
        local v70 = if l_SetCore_0 and l_SetCore_0[l_v66_0] and l_SetCore_0[l_v66_0]:IsA("BindableEvent") then l_SetCore_0[l_v66_0] else nil;
        if v70 then
            v70:Fire(v67);
            return;
        else
            if v19[v66] == nil then
                v19[v66] = {};
            end;
            table.insert(v19[v66], v67);
            return;
        end;
    end);
end;
DoConnectSetCore("ChatMakeSystemMessage");
DoConnectSetCore("ChatWindowPosition");
DoConnectSetCore("ChatWindowSize");
DoConnectSetCore("ChatBarDisabled");
local v71 = "ChatWindowPosition";
local v72 = "ChatWindowPosition";
local l_v72_0 = v72 --[[ copy: 30 -> 31 ]];
l_StarterGui_0:RegisterGetCore(v71, function(v74) --[[ Line: 81 ]]
    -- upvalues: v17 (copy), l_v72_0 (copy)
    local l_GetCore_1 = v17.GetCore;
    local l_l_v72_0_0 = l_v72_0;
    local v77 = if l_GetCore_1 and l_GetCore_1[l_l_v72_0_0] and l_GetCore_1[l_l_v72_0_0]:IsA("BindableFunction") then l_GetCore_1[l_l_v72_0_0] else nil;
    l_GetCore_1 = nil;
    if v77 then
        l_GetCore_1 = v77:Invoke(v74);
    end;
    return l_GetCore_1;
end);
v71 = "ChatWindowSize";
v72 = "ChatWindowSize";
local l_v72_1 = v72 --[[ copy: 30 -> 32 ]];
l_StarterGui_0:RegisterGetCore(v71, function(v79) --[[ Line: 81 ]]
    -- upvalues: v17 (copy), l_v72_1 (copy)
    local l_GetCore_2 = v17.GetCore;
    local l_l_v72_1_0 = l_v72_1;
    local v82 = if l_GetCore_2 and l_GetCore_2[l_l_v72_1_0] and l_GetCore_2[l_l_v72_1_0]:IsA("BindableFunction") then l_GetCore_2[l_l_v72_1_0] else nil;
    l_GetCore_2 = nil;
    if v82 then
        l_GetCore_2 = v82:Invoke(v79);
    end;
    return l_GetCore_2;
end);
v71 = "ChatBarDisabled";
v72 = "ChatBarDisabled";
l_StarterGui_0:RegisterGetCore(v71, function(v83) --[[ Line: 81 ]]
    -- upvalues: v17 (copy), v72 (copy)
    local l_GetCore_3 = v17.GetCore;
    local l_v72_2 = v72;
    local v86 = if l_GetCore_3 and l_GetCore_3[l_v72_2] and l_GetCore_3[l_v72_2]:IsA("BindableFunction") then l_GetCore_3[l_v72_2] else nil;
    l_GetCore_3 = nil;
    if v86 then
        l_GetCore_3 = v86:Invoke(v83);
    end;
    return l_GetCore_3;
end);
do
    local l_v18_0 = v18;
    local function v107(v88) --[[ Line: 257 ]] --[[ Name: RegisterCoreGuiConnections ]]
        -- upvalues: l_v18_0 (ref), v17 (copy), v15 (copy), v16 (copy), v19 (copy)
        if type(v88) == "table" then
            local l_ChatWindow_2 = v88.ChatWindow;
            local l_SetCore_1 = v88.SetCore;
            local l_GetCore_4 = v88.GetCore;
            if type(l_ChatWindow_2) == "table" then
                for _, v93 in pairs(l_v18_0) do
                    v93:disconnect();
                end;
                if type(l_ChatWindow_2.ChatTypes) == "table" then
                    SetInitialChatTypes(l_ChatWindow_2.ChatTypes);
                end;
                l_v18_0 = {};
                v17.ChatWindow = {};
                v17.ChatWindow.ToggleVisibility = if l_ChatWindow_2 and l_ChatWindow_2.ToggleVisibility and l_ChatWindow_2.ToggleVisibility:IsA("BindableEvent") then l_ChatWindow_2.ToggleVisibility else nil;
                v17.ChatWindow.SetVisible = if l_ChatWindow_2 and l_ChatWindow_2.SetVisible and l_ChatWindow_2.SetVisible:IsA("BindableEvent") then l_ChatWindow_2.SetVisible else nil;
                v17.ChatWindow.FocusChatBar = if l_ChatWindow_2 and l_ChatWindow_2.FocusChatBar and l_ChatWindow_2.FocusChatBar:IsA("BindableEvent") then l_ChatWindow_2.FocusChatBar else nil;
                v17.ChatWindow.EnterWhisperState = if l_ChatWindow_2 and l_ChatWindow_2.EnterWhisperState and l_ChatWindow_2.EnterWhisperState:IsA("BindableEvent") then l_ChatWindow_2.EnterWhisperState else nil;
                v17.ChatWindow.TopbarEnabledChanged = if l_ChatWindow_2 and l_ChatWindow_2.TopbarEnabledChanged and l_ChatWindow_2.TopbarEnabledChanged:IsA("BindableEvent") then l_ChatWindow_2.TopbarEnabledChanged else nil;
                v17.ChatWindow.IsFocused = if l_ChatWindow_2 and l_ChatWindow_2.IsFocused and l_ChatWindow_2.IsFocused:IsA("BindableFunction") then l_ChatWindow_2.IsFocused else nil;
                v17.ChatWindow.SpecialKeyPressed = if l_ChatWindow_2 and l_ChatWindow_2.SpecialKeyPressed and l_ChatWindow_2.SpecialKeyPressed:IsA("BindableEvent") then l_ChatWindow_2.SpecialKeyPressed else nil;
                local function v97(v94) --[[ Line: 290 ]] --[[ Name: DoConnect ]]
                    -- upvalues: v17 (ref), l_ChatWindow_2 (copy), v15 (ref), l_v18_0 (ref)
                    local l_ChatWindow_3 = v17.ChatWindow;
                    local l_l_ChatWindow_2_0 = l_ChatWindow_2;
                    l_ChatWindow_3[v94] = if l_l_ChatWindow_2_0 and l_l_ChatWindow_2_0[v94] and l_l_ChatWindow_2_0[v94]:IsA("BindableEvent") then l_l_ChatWindow_2_0[v94] else nil;
                    if v17.ChatWindow[v94] then
                        l_ChatWindow_3 = v17.ChatWindow[v94].Event:connect(function(...) --[[ Line: 294 ]]
                            -- upvalues: v15 (ref), v94 (copy)
                            v15[v94]:fire(...);
                        end);
                        table.insert(l_v18_0, l_ChatWindow_3);
                    end;
                end;
                v97("ChatBarFocusChanged");
                v97("VisibilityStateChanged");
                v97("MessagesChanged");
                v17.ChatWindow.MessagePosted = if l_ChatWindow_2 and l_ChatWindow_2.MessagePosted and l_ChatWindow_2.MessagePosted:IsA("BindableEvent") then l_ChatWindow_2.MessagePosted else nil;
                if v17.ChatWindow.MessagePosted then
                    local v99 = v17.ChatWindow.MessagePosted.Event:connect(function(v98) --[[ Line: 309 ]]
                        game:GetService("Players"):Chat(v98);
                    end);
                    table.insert(l_v18_0, v99);
                end;
                v15:SetVisible(v16.Visible);
                v15:TopbarEnabledChanged(v16.TopbarEnabled);
                local v100 = if l_ChatWindow_2 and l_ChatWindow_2.CoreGuiEnabled and l_ChatWindow_2.CoreGuiEnabled:IsA("BindableEvent") then l_ChatWindow_2.CoreGuiEnabled else nil;
                if v100 then
                    v17.ChatWindow.CoreGuiEnabled = v100;
                    v100:Fire(v16.CoreGuiEnabled);
                end;
            else
                error("Table 'ChatWindow' must be provided!");
            end;
            if type(l_SetCore_1) == "table" and type(l_GetCore_4) == "table" then
                v17.SetCore = {};
                v17.GetCore = {};
                local function v106(v101) --[[ Line: 331 ]] --[[ Name: addSetCore ]]
                    -- upvalues: l_SetCore_1 (copy), v17 (ref), v19 (ref)
                    local l_l_SetCore_1_0 = l_SetCore_1;
                    local v103 = if l_l_SetCore_1_0 and l_l_SetCore_1_0[v101] and l_l_SetCore_1_0[v101]:IsA("BindableEvent") then l_l_SetCore_1_0[v101] else nil;
                    if v103 then
                        v17.SetCore[v101] = v103;
                        if v19[v101] then
                            for _, v105 in pairs(v19[v101]) do
                                v103:Fire(v105);
                            end;
                            v19[v101] = nil;
                        end;
                    end;
                end;
                v106("ChatMakeSystemMessage");
                v106("ChatWindowPosition");
                v106("ChatWindowSize");
                v106("ChatBarDisabled");
                v17.GetCore.ChatWindowPosition = if l_GetCore_4 and l_GetCore_4.ChatWindowPosition and l_GetCore_4.ChatWindowPosition:IsA("BindableFunction") then l_GetCore_4.ChatWindowPosition else nil;
                v17.GetCore.ChatWindowSize = if l_GetCore_4 and l_GetCore_4.ChatWindowSize and l_GetCore_4.ChatWindowSize:IsA("BindableFunction") then l_GetCore_4.ChatWindowSize else nil;
                v17.GetCore.ChatBarDisabled = if l_GetCore_4 and l_GetCore_4.ChatBarDisabled and l_GetCore_4.ChatBarDisabled:IsA("BindableFunction") then l_GetCore_4.ChatBarDisabled else nil;
                return;
            elseif type(l_SetCore_1) ~= "nil" or type(l_GetCore_4) ~= "nil" then
                error("Both 'SetCore' and 'GetCore' must be tables if provided!");
            end;
        end;
    end;
    v10.listenToDispatch(function(v108) --[[ Line: 361 ]]
        -- upvalues: v15 (copy)
        if v108.type == "FocusChatHotKeyActivated" then
            v15:SetVisible(true);
        end;
    end);
    l_StarterGui_0:RegisterSetCore("CoreGuiChatConnections", v107);
end;
return v15;