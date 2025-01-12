local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Modules_0 = l_RobloxGui_0.Modules;
local v7 = require(l_Modules_0.PromptCreator);
local v8 = require(l_Modules_0.SocialUtil);
local v9 = require(l_Modules_0.BlockingUtility);
local l_Size150x150_0 = Enum.ThumbnailSize.Size150x150;
local l_Size352x352_0 = Enum.ThumbnailSize.Size352x352;
local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
createFetchImageFunction = function(...) --[[ Line: 31 ]] --[[ Name: createFetchImageFunction ]]
    -- upvalues: v8 (copy)
    local v14 = {
        ...
    };
    return function(v15) --[[ Line: 33 ]]
        -- upvalues: v8 (ref), v14 (copy)
        spawn(function() --[[ Line: 34 ]]
            -- upvalues: v8 (ref), v14 (ref), v15 (copy)
            local v16 = v8.GetPlayerImage(unpack(v14));
            if v15 and v15.Parent then
                v15.Image = v16;
            end;
        end);
    end;
end;
DoPromptBlockPlayer = function(v17) --[[ Line: 43 ]] --[[ Name: DoPromptBlockPlayer ]]
    -- upvalues: v9 (copy), v7 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy)
    if v9:IsPlayerBlockedByUserId(v17.UserId) then
        return;
    else
        local function v19(v18) --[[ Line: 51 ]] --[[ Name: promptCompletedCallback ]]
            -- upvalues: v9 (ref), v17 (copy), v7 (ref), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
            if v18 and not v9:BlockPlayerAsync(v17) then
                while v7:IsCurrentlyPrompting() do
                    wait();
                end;
                v7:CreatePrompt({
                    WindowTitle = "Error Blocking User", 
                    MainText = string.format("An error occurred while blocking %s. Please try again later.", v17.Name), 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v17.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v17.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
            end;
        end;
        v7:CreatePrompt({
            WindowTitle = "Confirm Block", 
            MainText = string.format("Are you sure you want to block %s?", v17.Name), 
            ConfirmationText = "Block", 
            CancelText = "Cancel", 
            CancelActive = true, 
            Image = "", 
            ImageConsoleVR = "", 
            FetchImageFunction = createFetchImageFunction(v17.UserId, l_Size150x150_0, l_HeadShot_0), 
            FetchImageFunctionConsoleVR = createFetchImageFunction(v17.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
            PromptCompletedCallback = v19
        });
        return;
    end;
end;
PromptBlockPlayer = function(v20) --[[ Line: 87 ]] --[[ Name: PromptBlockPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptBlockPlayer can not be called for guests!");
    end;
    if typeof(v20) == "Instance" and v20:IsA("Player") then
        if v20.UserId < 0 then
            error("PromptBlockPlayer can not be called on guests!");
        end;
        if v20 == l_LocalPlayer_0 then
            error("PromptBlockPlayer: A user can not block themselves!");
        end;
        DoPromptBlockPlayer(v20);
        return;
    else
        error("Invalid argument to PromptBlockPlayer");
        return;
    end;
end;
DoPromptUnblockPlayer = function(v21) --[[ Line: 104 ]] --[[ Name: DoPromptUnblockPlayer ]]
    -- upvalues: v9 (copy), v7 (copy), l_Size150x150_0 (copy), l_HeadShot_0 (copy), l_Size352x352_0 (copy), l_AvatarThumbnail_0 (copy)
    local v22 = not v9:IsPlayerBlockedByUserId(v21.UserId);
    v22 = function(v23) --[[ Line: 112 ]] --[[ Name: promptCompletedCallback ]]
        -- upvalues: v9 (ref), v21 (copy), v7 (ref), l_Size150x150_0 (ref), l_HeadShot_0 (ref), l_Size352x352_0 (ref), l_AvatarThumbnail_0 (ref)
        if v23 and not v9:UnblockPlayerAsync(v21) then
            while v7:IsCurrentlyPrompting() do
                wait();
            end;
            v7:CreatePrompt({
                WindowTitle = "Error Unblocking User", 
                MainText = string.format("An error occurred while unblocking %s. Please try again later.", v21.Name), 
                ConfirmationText = "Okay", 
                Image = "", 
                ImageConsoleVR = "", 
                FetchImageFunction = createFetchImageFunction(v21.UserId, l_Size150x150_0, l_HeadShot_0), 
                FetchImageFunctionConsoleVR = createFetchImageFunction(v21.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                StripeColor = Color3.fromRGB(183, 34, 54)
            });
        end;
    end;
    v7:CreatePrompt({
        WindowTitle = "Confirm Unblock", 
        MainText = string.format("Would you like to unblock %s?", v21.Name), 
        ConfirmationText = "Unblock", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v21.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v21.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = v22
    });
end;
PromptUnblockPlayer = function(v24) --[[ Line: 147 ]] --[[ Name: PromptUnblockPlayer ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnblockPlayer can not be called for guests!");
    end;
    if typeof(v24) == "Instance" and v24:IsA("Player") then
        if v24.UserId < 0 then
            error("PromptUnblockPlayer can not be called on guests!");
        end;
        if v24 == l_LocalPlayer_0 then
            error("PromptUnblockPlayer: A user can not block themselves!");
        end;
        DoPromptUnblockPlayer(v24);
        return;
    else
        error("Invalid argument to PromptUnblockPlayer");
        return;
    end;
end;
GetBlockedUserIds = function() --[[ Line: 164 ]] --[[ Name: GetBlockedUserIds ]]
    -- upvalues: l_LocalPlayer_0 (ref), v9 (copy)
    if l_LocalPlayer_0.UserId < 0 then
        error("GetBlockedUserIds can not be called for guests!");
    end;
    return v9:GetBlockedUserIdsAsync();
end;
l_StarterGui_0:RegisterSetCore("PromptBlockPlayer", PromptBlockPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnblockPlayer", PromptUnblockPlayer);
l_StarterGui_0:RegisterGetCore("GetBlockedUserIds", GetBlockedUserIds);