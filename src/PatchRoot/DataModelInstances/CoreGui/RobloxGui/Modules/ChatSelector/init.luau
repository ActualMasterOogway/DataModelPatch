local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v8 = require(l_RobloxGui_0.Modules.ChatUtil);
local l_ClassicChat_0 = l_Players_0.ClassicChat;
local l_BubbleChat_0 = l_Players_0.BubbleChat;
local l_VRService_0 = game:GetService("VRService");
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReenableTextChatForTenFootInterfaces;
local l_getFFlagAppChatCoreUIConflictFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagAppChatCoreUIConflictFix;
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local v15 = nil;
local v16 = nil;
local v17 = if l_getFFlagAppChatCoreUIConflictFix_0() then {} else nil;
local v18 = {
    Visible = not l_VRService_0.VREnabled
};
local v33 = {
    ToggleVisibility = function(_) --[[ Line: 40 ]] --[[ Name: ToggleVisibility ]]
        -- upvalues: v15 (ref), v18 (copy)
        if v15 then
            v15:ToggleVisibility();
            return;
        else
            v18.Visible = not v18.Visible;
            return;
        end;
    end, 
    SetVisible = function(_, v21) --[[ Line: 48 ]] --[[ Name: SetVisible ]]
        -- upvalues: v15 (ref), v18 (copy)
        if v15 then
            v15:SetVisible(v21);
            return;
        else
            v18.Visible = v21;
            return;
        end;
    end, 
    FocusChatBar = function(_) --[[ Line: 56 ]] --[[ Name: FocusChatBar ]]
        -- upvalues: v15 (ref)
        if v15 then
            v15:FocusChatBar();
        end;
    end, 
    EnterWhisperState = function(_, v24) --[[ Line: 62 ]] --[[ Name: EnterWhisperState ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:EnterWhisperState(v24);
        else
            return;
        end;
    end, 
    GetVisibility = function(_) --[[ Line: 68 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v15 (ref), v18 (copy)
        if v15 then
            return v15:GetVisibility();
        else
            return v18.Visible;
        end;
    end, 
    GetMessageCount = function(_) --[[ Line: 76 ]] --[[ Name: GetMessageCount ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:GetMessageCount();
        else
            return 0;
        end;
    end, 
    TopbarEnabledChanged = function(_, ...) --[[ Line: 84 ]] --[[ Name: TopbarEnabledChanged ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:TopbarEnabledChanged(...);
        else
            return;
        end;
    end, 
    IsFocused = function(_, v29) --[[ Line: 90 ]] --[[ Name: IsFocused ]]
        -- upvalues: v15 (ref)
        if v15 then
            return v15:IsFocused(v29);
        else
            return false;
        end;
    end, 
    ClassicChatEnabled = function(_) --[[ Line: 98 ]] --[[ Name: ClassicChatEnabled ]]
        -- upvalues: v15 (ref), l_ClassicChat_0 (copy)
        if v15 then
            return v15:ClassicChatEnabled();
        else
            return l_ClassicChat_0;
        end;
    end, 
    IsBubbleChatOnly = function(_) --[[ Line: 106 ]] --[[ Name: IsBubbleChatOnly ]]
        -- upvalues: v15 (ref), l_BubbleChat_0 (copy), l_ClassicChat_0 (copy)
        if v15 then
            return v15:IsBubbleChatOnly();
        else
            return l_BubbleChat_0 and not l_ClassicChat_0;
        end;
    end, 
    IsDisabled = function(_) --[[ Line: 113 ]] --[[ Name: IsDisabled ]]
        -- upvalues: v15 (ref), l_BubbleChat_0 (copy), l_ClassicChat_0 (copy)
        if v15 then
            return v15:IsDisabled();
        else
            return not (l_BubbleChat_0 or l_ClassicChat_0);
        end;
    end
};
if l_getFFlagAppChatCoreUIConflictFix_0() then
    v33.HideTemp = function(_, v35, v36) --[[ Line: 121 ]] --[[ Name: HideTemp ]]
        -- upvalues: v17 (copy), v16 (ref), v33 (copy)
        local function _() --[[ Line: 122 ]] --[[ Name: isHideTempKeysEmpty ]]
            -- upvalues: v17 (ref)
            return next(v17) == nil;
        end;
        if next(v17) == nil then
            v16 = v33:GetVisibility();
        end;
        if v36 then
            v17[v35] = v36;
        else
            v17[v35] = nil;
        end;
        v33:SetVisible(v16 and next(v17) == nil);
    end;
end;
v33.ChatBarFocusChanged = v8.Signal();
if l_getFFlagExpChatAlwaysRunTCS_0() then
    v33.ChromeVisibilityStateChanged = v8.Signal();
end;
v33.VisibilityStateChanged = v8.Signal();
v33.MessagesChanged = v8.Signal();
v33.BubbleChatOnlySet = v8.Signal();
v33.ChatDisabled = v8.Signal();
local v38 = false;
local v39 = {};
local function v41(v40) --[[ Line: 155 ]] --[[ Name: MakeSystemMessageQueueingFunction ]]
    -- upvalues: v38 (ref), v39 (copy)
    if v38 then
        return;
    else
        table.insert(v39, v40);
        return;
    end;
end;
local function v42() --[[ Line: 160 ]] --[[ Name: NonFunc ]]

end;
l_StarterGui_0:RegisterSetCore("ChatMakeSystemMessage", v41);
l_StarterGui_0:RegisterSetCore("ChatWindowPosition", v42);
l_StarterGui_0:RegisterGetCore("ChatWindowPosition", v42);
l_StarterGui_0:RegisterSetCore("ChatWindowSize", v42);
l_StarterGui_0:RegisterGetCore("ChatWindowSize", v42);
l_StarterGui_0:RegisterSetCore("ChatBarDisabled", v42);
l_StarterGui_0:RegisterGetCore("ChatBarDisabled", v42);
l_StarterGui_0:RegisterGetCore("ChatActive", function() --[[ Line: 170 ]]
    -- upvalues: v33 (copy)
    return v33:GetVisibility();
end);
l_StarterGui_0:RegisterSetCore("ChatActive", function(v43) --[[ Line: 173 ]]
    -- upvalues: v33 (copy)
    return v33:SetVisible(v43);
end);
local function _(v44, v45, v46) --[[ Line: 178 ]] --[[ Name: ConnectSignals ]]
    if v44[v46] then
        v44[v46]:connect(function(...) --[[ Line: 181 ]]
            -- upvalues: v45 (copy), v46 (copy)
            v45[v46]:fire(...);
        end);
    end;
end;
local v48 = l_GuiService_0:IsTenFootInterface() or false;
if l_GetFFlagReenableTextChatForTenFootInterfaces_0() or not v48 then
    coroutine.wrap(function() --[[ Line: 188 ]]
        -- upvalues: v15 (ref), l_RobloxGui_0 (copy), v33 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), l_Players_0 (copy), l_StarterGui_0 (copy), v18 (copy), v38 (ref), v39 (copy)
        v15 = require(l_RobloxGui_0.Modules.NewChat);
        local l_v15_0 = v15;
        local l_v33_0 = v33;
        if l_v15_0.ChatBarFocusChanged then
            local l_ChatBarFocusChanged_0 = l_v15_0.ChatBarFocusChanged;
            local v52 = "ChatBarFocusChanged";
            local l_l_v33_0_0 = l_v33_0 --[[ copy: 1 -> 15 ]];
            local l_v52_0 = v52 --[[ copy: 5 -> 16 ]];
            l_ChatBarFocusChanged_0:connect(function(...) --[[ Line: 181 ]]
                -- upvalues: l_l_v33_0_0 (copy), l_v52_0 (copy)
                l_l_v33_0_0[l_v52_0]:fire(...);
            end);
        end;
        l_v15_0 = v15;
        l_v33_0 = v33;
        if l_v15_0.VisibilityStateChanged then
            local l_VisibilityStateChanged_0 = l_v15_0.VisibilityStateChanged;
            local v56 = "VisibilityStateChanged";
            local l_l_v33_0_1 = l_v33_0 --[[ copy: 1 -> 13 ]];
            local l_v56_0 = v56 --[[ copy: 5 -> 14 ]];
            l_VisibilityStateChanged_0:connect(function(...) --[[ Line: 181 ]]
                -- upvalues: l_l_v33_0_1 (copy), l_v56_0 (copy)
                l_l_v33_0_1[l_v56_0]:fire(...);
            end);
        end;
        if l_getFFlagExpChatAlwaysRunTCS_0() then
            l_v15_0 = v15;
            l_v33_0 = v33;
            if l_v15_0.ChromeVisibilityStateChanged then
                local l_ChromeVisibilityStateChanged_0 = l_v15_0.ChromeVisibilityStateChanged;
                local v60 = "ChromeVisibilityStateChanged";
                local l_l_v33_0_2 = l_v33_0 --[[ copy: 1 -> 11 ]];
                local l_v60_0 = v60 --[[ copy: 5 -> 12 ]];
                l_ChromeVisibilityStateChanged_0:connect(function(...) --[[ Line: 181 ]]
                    -- upvalues: l_l_v33_0_2 (copy), l_v60_0 (copy)
                    l_l_v33_0_2[l_v60_0]:fire(...);
                end);
            end;
        end;
        l_v15_0 = v15;
        l_v33_0 = v33;
        if l_v15_0.BubbleChatOnlySet then
            local l_BubbleChatOnlySet_0 = l_v15_0.BubbleChatOnlySet;
            local v64 = "BubbleChatOnlySet";
            local l_l_v33_0_3 = l_v33_0 --[[ copy: 1 -> 9 ]];
            local l_v64_0 = v64 --[[ copy: 5 -> 10 ]];
            l_BubbleChatOnlySet_0:connect(function(...) --[[ Line: 181 ]]
                -- upvalues: l_l_v33_0_3 (copy), l_v64_0 (copy)
                l_l_v33_0_3[l_v64_0]:fire(...);
            end);
        end;
        l_v15_0 = v15;
        l_v33_0 = v33;
        if l_v15_0.ChatDisabled then
            local l_ChatDisabled_0 = l_v15_0.ChatDisabled;
            local v68 = "ChatDisabled";
            local l_l_v33_0_4 = l_v33_0 --[[ copy: 1 -> 7 ]];
            local l_v68_0 = v68 --[[ copy: 5 -> 8 ]];
            l_ChatDisabled_0:connect(function(...) --[[ Line: 181 ]]
                -- upvalues: l_l_v33_0_4 (copy), l_v68_0 (copy)
                l_l_v33_0_4[l_v68_0]:fire(...);
            end);
        end;
        while l_Players_0.LocalPlayer == nil do
            l_Players_0.ChildAdded:wait();
        end;
        l_v15_0 = l_Players_0.LocalPlayer;
        l_v33_0 = v15;
        local l_v33_1 = v33;
        if l_v33_0.MessagesChanged then
            local l_MessagesChanged_0 = l_v33_0.MessagesChanged;
            local v73 = "MessagesChanged";
            l_MessagesChanged_0:connect(function(...) --[[ Line: 181 ]]
                -- upvalues: l_v33_1 (copy), v73 (copy)
                l_v33_1[v73]:fire(...);
            end);
        end;
        l_StarterGui_0:RegisterGetCore("UseNewLuaChat", function() --[[ Line: 204 ]]
            return true;
        end);
        v15:SetVisible(v18.Visible);
        l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
        v38 = true;
        for _, v75 in pairs(v39) do
            pcall(function() --[[ Line: 211 ]]
                -- upvalues: l_StarterGui_0 (ref), v75 (copy)
                l_StarterGui_0:SetCore("ChatMakeSystemMessage", v75);
            end);
        end;
    end)();
end;
return v33;