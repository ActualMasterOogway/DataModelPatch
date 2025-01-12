local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_UIManager_0 = l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("UIManager");
local v6 = require(l_UIManager_0.Constants);
local l_PanelType_0 = v6.PanelType;
local v8 = require(l_UIManager_0.UIManager);
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagConsolidateBubbleChat);
if not game:IsLoaded() then
    local _ = game.Loaded:Wait();
end;
if not v9() and l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.TextChatService then
    return;
else
    local v11 = require(l_RobloxGui_0.Modules.RobloxTranslator);
    local v12 = require(l_RobloxGui_0.Modules.GameTranslator);
    local v13 = require(l_RobloxGui_0.Modules.ApolloClient);
    local v14 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
    local v15 = game:DefineFastFlag("FFlagEnableSetCoreGuiEnabledExpChat", false);
    local v16 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
    local v17 = require(l_RobloxGui_0.Modules.Flags.getFFlagAddApolloClientToExperienceChat);
    local v18 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
    local v19 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
    local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
    local v21 = require(l_RobloxGui_0.Modules.Flags.getFFlagRenderVoiceBubbleAfterAsyncInit);
    local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
    local v23 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
    local v24 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableSpatialRobloxGui);
    local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS;
    local v26 = require(l_RobloxGui_0.Modules.VoiceChat.Components.getIconVoiceIndicator);
    local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Components.onClickedVoiceIndicator);
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if v16 then
        v28 = require(l_RobloxGui_0.Modules.VoiceChat.Components.onClickedCameraIndicator);
        v29 = require(l_RobloxGui_0.Modules.VoiceChat.Components.getPermissions);
        v30 = require(l_RobloxGui_0.Modules.VoiceChat.Components.selfViewListenerChanged);
        if v18() then
            v31 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
            if v20() then
                v31 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
            end;
            v32 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
        end;
        if v19() then
            v33 = require(l_RobloxGui_0.Modules.Settings.isCameraOnlyUser);
        end;
        if v21() then
            v34 = require(l_RobloxGui_0.Modules.VoiceChat.Components.isVoiceServiceInitialized);
        end;
    end;
    if l_GetFFlagShowLikelySpeakingBubbles_0() then
        v35 = require(l_RobloxGui_0.Modules.VoiceChat.Components.onClickedLikelySpeakingBubble);
    end;
    if v23 then
        v29 = require(l_RobloxGui_0.Modules.VoiceChat.Components.getPermissions);
    end;
    local v36 = nil;
    local v37 = nil;
    if v24 then
        local v38 = v8:createUI({
            panelType = l_PanelType_0.Chat, 
            screenGuiProps = {
                Name = "ExperienceChat", 
                ResetOnSpawn = false, 
                DisplayOrder = -1, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        });
        v36 = v38.panelObject;
        v37 = v38;
    else
        v36 = Instance.new("ScreenGui");
        v36.Name = "ExperienceChat";
        v36.ResetOnSpawn = false;
        v36.DisplayOrder = -1;
        v36.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        v36.Parent = l_CoreGui_0;
    end;
    local function v41(v39) --[[ Line: 110 ]] --[[ Name: findTextChannel ]]
        -- upvalues: l_TextChatService_0 (copy)
        local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v39, true);
        while not l_l_TextChatService_0_FirstChild_0 do
            wait();
            l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v39, true);
        end;
        return l_l_TextChatService_0_FirstChild_0;
    end;
    if v15 then
        l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v42, v43) --[[ Line: 121 ]]
            -- upvalues: v14 (copy)
            if v42 == Enum.CoreGuiType.All or v42 == Enum.CoreGuiType.Chat then
                v14.Events.SetCoreGuiEnabledChanged(v43);
            end;
        end);
    end;
    local v44 = nil;
    local v45 = nil;
    if v9() then
        if l_getFFlagExpChatAlwaysRunTCS_0() then
            v44 = l_TextChatService_0.CreateDefaultTextChannels;
        else
            local v46 = false;
            if l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService then
                v46 = l_TextChatService_0.CreateDefaultTextChannels;
            end;
            v44 = v46;
        end;
        v45 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Types).IChatSettings;
    else
        v44 = l_TextChatService_0.CreateDefaultTextChannels;
    end;
    v14.mountClientApp({
        apolloClient = if v17() then v13 else nil, 
        getIconVoiceIndicator = v26 or nil, 
        onClickedVoiceIndicator = v27 or nil, 
        onClickedCameraIndicator = v28 or nil, 
        displayCameraDeniedToast = v31 or nil, 
        isCamEnabledForUserAndPlace = v32 or nil, 
        isCameraOnlyUser = v33 or nil, 
        getPermissions = v29 or nil, 
        selfViewListenerChanged = v30 or nil, 
        defaultTargetTextChannel = if v44 then v41("RBXGeneral") else nil, 
        defaultSystemTextChannel = if v44 then v41("RBXSystem") else nil, 
        validateLegacyBubbleChatSettings = v45 or nil, 
        isVoiceServiceInitialized = v34 or nil, 
        onClickedLikelySpeakingBubble = v35 or nil, 
        translator = v11, 
        gameTranslator = v12, 
        parent = v36, 
        isSpatialUIEnabled = v37 and v37.type == v6.SpatialUIType.SpatialUI
    });
    return;
end;