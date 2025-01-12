local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v8 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
if require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences)() then
    v8 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local l_SelfieView_0 = l_script_FirstAncestor_0.Parent.SelfieView;
local v10 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewRedStatusDot);
local v11 = Color3.new(0.918, 0.2, 0.137);
local v12 = UDim2.new(0, 4, 0, 4);
return function(v13) --[[ Line: 25 ]]
    -- upvalues: l_useStyle_0 (copy), v7 (copy), l_Players_0 (copy), v8 (ref), v3 (copy), v12 (copy), v10 (copy), v11 (copy)
    local v14 = l_useStyle_0();
    local v15 = v7(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
    local v16 = true;
    if v15 ~= v8.VOICE_STATE.INACTIVE then
        v16 = v15 == v8.VOICE_STATE.TALKING;
    end;
    return v3.createElement("Frame", {
        Name = "RedVoiceDot", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v13.position, 
        Size = v12, 
        BackgroundColor3 = if v10() then v14.Theme.Alert.Color else v11, 
        Visible = v16
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;