local l_Chat_0 = game:GetService("Chat");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagEnableForkedChatAnalytics);
local v4 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
local v5 = nil;
if v3 then
    v5 = require(l_RobloxGui_0.Modules.Server.SendChatAnalytics);
end;
local function v10(v6, v7) --[[ Line: 15 ]] --[[ Name: LoadScript ]]
    -- upvalues: v4 (copy)
    local v8 = script.Parent:WaitForChild(v6);
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = v6;
    if v4.getFFlagServerCoreScriptSourceCode() then
        l_Script_0.Source = v4.getSourceForServerScript(v8);
    else
        l_Script_0.Source = v8.Source;
    end;
    l_Script_0.Parent = v7;
    return l_Script_0;
end;
local function _(v11, v12, v13) --[[ Line: 28 ]] --[[ Name: LoadModule ]]
    -- upvalues: v4 (copy)
    local v14 = v11:WaitForChild(v12);
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Name = v12;
    if v4.getFFlagServerCoreScriptSourceCode() then
        l_ModuleScript_0.Source = v4.getSourceForServerScript(v14);
    else
        l_ModuleScript_0.Source = v14.Source;
    end;
    l_ModuleScript_0.Parent = v13;
    return l_ModuleScript_0;
end;
local function _(v17, v18, v19) --[[ Line: 41 ]] --[[ Name: GetBoolValue ]]
    local l_v17_FirstChild_0 = v17:FindFirstChild(v18);
    if l_v17_FirstChild_0 and l_v17_FirstChild_0:IsA("BoolValue") then
        return l_v17_FirstChild_0.Value;
    else
        return v19;
    end;
end;
local function v24(v22) --[[ Line: 51 ]] --[[ Name: makeDefaultLocalizationTable ]]
    local l_LocalizationTable_0 = Instance.new("LocalizationTable");
    l_LocalizationTable_0.Name = "ChatLocalization";
    l_LocalizationTable_0.Archivable = false;
    l_LocalizationTable_0.SourceLocaleId = "en-us";
    l_LocalizationTable_0:SetEntries(require(script.Parent:WaitForChild("DefaultChatLocalization")));
    l_LocalizationTable_0:SetIsExemptFromUGCAnalytics(true);
    l_LocalizationTable_0.Parent = v22;
end;
return function() --[[ Line: 61 ]] --[[ Name: Install ]]
    -- upvalues: l_Chat_0 (copy), v24 (copy), v10 (copy), v4 (copy), v3 (copy), l_ServerScriptService_0 (copy), v5 (ref)
    local v25 = {};
    local l_ChatLocalization_0 = l_Chat_0:FindFirstChild("ChatLocalization");
    if l_ChatLocalization_0 then
        if l_ChatLocalization_0:IsA("LocalizationTable") then
            l_ChatLocalization_0:SetIsExemptFromUGCAnalytics(true);
        end;
    else
        v24(l_Chat_0);
    end;
    local v27 = true;
    local l_ChatServiceRunner_0 = l_Chat_0:FindFirstChild("ChatServiceRunner");
    if not l_ChatServiceRunner_0 then
        v27 = false;
        l_ChatServiceRunner_0 = v10("ChatServiceRunner", l_Chat_0);
        local l_Parent_0 = script.Parent;
        local l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        local l_ChatService_0 = l_Parent_0:WaitForChild("ChatService");
        local l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "ChatService";
        if v4.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v4.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
        l_Parent_0 = script.Parent;
        l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        l_ChatService_0 = l_Parent_0:WaitForChild("ChatChannel");
        l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "ChatChannel";
        if v4.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v4.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
        l_Parent_0 = script.Parent;
        l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        l_ChatService_0 = l_Parent_0:WaitForChild("Speaker");
        l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "Speaker";
        if v4.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v4.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
        l_Parent_0 = script.Parent;
        l_l_ChatServiceRunner_0_0 = l_ChatServiceRunner_0;
        l_ChatService_0 = l_Parent_0:WaitForChild("Util");
        l_ModuleScript_1 = Instance.new("ModuleScript");
        l_ModuleScript_1.Name = "Util";
        if v4.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_1.Source = v4.getSourceForServerScript(l_ChatService_0);
        else
            l_ModuleScript_1.Source = l_ChatService_0.Source;
        end;
        l_ModuleScript_1.Parent = l_l_ChatServiceRunner_0_0;
    elseif v3 then
        v25.ChatServiceRunner = "True";
    end;
    local l_ChatModules_0 = l_Chat_0:FindFirstChild("ChatModules");
    if not l_ChatModules_0 then
        l_ChatModules_0 = Instance.new("Folder");
        l_ChatModules_0.Name = "ChatModules";
        l_ChatModules_0.Archivable = false;
        local l_BoolValue_0 = Instance.new("BoolValue");
        l_BoolValue_0.Name = "InsertDefaultModules";
        l_BoolValue_0.Value = true;
        l_BoolValue_0.Parent = l_ChatModules_0;
        l_ChatModules_0.Parent = l_Chat_0;
    end;
    assert(l_ChatModules_0, "");
    local l_InsertDefaultModules_0 = l_ChatModules_0:FindFirstChild("InsertDefaultModules");
    if if l_InsertDefaultModules_0 and l_InsertDefaultModules_0:IsA("BoolValue") then l_InsertDefaultModules_0.Value else false then
        if not l_ChatModules_0:FindFirstChild("Utility") then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "Utility";
            l_Folder_0.Parent = l_ChatModules_0;
        end;
        local l_Children_0 = script.Parent.DefaultChatModules:GetChildren();
        for v38 = 1, #l_Children_0 do
            if l_Children_0.className ~= "Folder" and not l_ChatModules_0:FindFirstChild(l_Children_0[v38].Name) then
                local l_DefaultChatModules_0 = script.Parent.DefaultChatModules;
                local l_Name_0 = l_Children_0[v38].Name;
                local l_l_ChatModules_0_0 = l_ChatModules_0;
                local v42 = l_DefaultChatModules_0:WaitForChild(l_Name_0);
                local l_ModuleScript_2 = Instance.new("ModuleScript");
                l_ModuleScript_2.Name = l_Name_0;
                if v4.getFFlagServerCoreScriptSourceCode() then
                    l_ModuleScript_2.Source = v4.getSourceForServerScript(v42);
                else
                    l_ModuleScript_2.Source = v42.Source;
                end;
                l_ModuleScript_2.Parent = l_l_ChatModules_0_0;
            elseif v3 and l_Children_0.className ~= "Folder" then
                v25[l_Children_0[v38].Name] = "True";
            end;
        end;
        for _, v45 in pairs(script.Parent.DefaultChatModules.Utility:GetChildren()) do
            if not l_ChatModules_0.Utility:FindFirstChild(v45.Name) then
                local l_Utility_0 = script.Parent.DefaultChatModules.Utility;
                local l_Name_1 = v45.Name;
                local l_Utility_1 = l_ChatModules_0.Utility;
                local v49 = l_Utility_0:WaitForChild(l_Name_1);
                local l_ModuleScript_3 = Instance.new("ModuleScript");
                l_ModuleScript_3.Name = l_Name_1;
                if v4.getFFlagServerCoreScriptSourceCode() then
                    l_ModuleScript_3.Source = v4.getSourceForServerScript(v49);
                else
                    l_ModuleScript_3.Source = v49.Source;
                end;
                l_ModuleScript_3.Parent = l_Utility_1;
            elseif v3 then
                v25[v45.Name] = "True";
            end;
        end;
    end;
    if not l_ServerScriptService_0:FindFirstChild("ChatServiceRunner") then
        local v51 = l_ChatServiceRunner_0:Clone();
        v51.Archivable = false;
        v51.Parent = l_ServerScriptService_0;
    end;
    l_ChatServiceRunner_0.Archivable = v27;
    if v3 then
        v5("LoadServerDefaultChatForkedModules", v25);
    end;
end;