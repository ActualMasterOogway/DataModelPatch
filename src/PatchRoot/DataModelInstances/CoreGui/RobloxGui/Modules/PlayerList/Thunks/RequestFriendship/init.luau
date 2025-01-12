local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v6 = require(l_RobloxGui_0.Modules.FriendingUtility);
local l_SendNotificationInfo_0 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
local v8 = require(l_RobloxGui_0.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt);
return function(v9, v10) --[[ Line: 16 ]] --[[ Name: RequestFriendship ]]
    -- upvalues: v8 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v6 (copy), l_SendNotificationInfo_0 (copy), v5 (copy)
    return function() --[[ Line: 17 ]]
        -- upvalues: v8 (ref), l_RbxAnalyticsService_0 (ref), v9 (copy), l_Players_0 (ref), l_LocalPlayer_0 (ref), v6 (ref), v10 (copy), l_SendNotificationInfo_0 (ref), v5 (ref)
        coroutine.wrap(function() --[[ Line: 18 ]]
            -- upvalues: v8 (ref), l_RbxAnalyticsService_0 (ref), v9 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v6 (ref), v10 (ref), l_SendNotificationInfo_0 (ref), v5 (ref)
            if v8 then
                l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                if v9.Parent == l_Players_0 then
                    l_LocalPlayer_0:RequestFriendship(v9);
                    return;
                end;
            else
                local l_v6_FriendCountAsync_0 = v6:GetFriendCountAsync(v9.UserId);
                local l_v6_FriendCountAsync_1 = v6:GetFriendCountAsync(l_LocalPlayer_0.UserId);
                if not l_v6_FriendCountAsync_1 or not l_v6_FriendCountAsync_0 then
                    return;
                elseif l_v6_FriendCountAsync_1 < 200 and l_v6_FriendCountAsync_0 < 200 then
                    l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                    if v9.Parent == l_Players_0 then
                        l_LocalPlayer_0:RequestFriendship(v9);
                        return;
                    end;
                elseif l_v6_FriendCountAsync_1 >= 200 then
                    local v13 = v10 and "Cannot accept friend request" or "Cannot send friend request";
                    l_SendNotificationInfo_0:Fire({
                        Title = v13, 
                        Text = "You are at the max friends limit.", 
                        Duration = 5
                    });
                    return;
                elseif l_v6_FriendCountAsync_0 >= 200 then
                    local v14 = v10 and "Cannot accept friend request" or "Cannot send friend request";
                    local v15 = v5:FormatByKey("PlayerDropDown.OtherPlayerFriendLimit", {
                        RBX_NAME = v9.Name
                    });
                    l_SendNotificationInfo_0:Fire({
                        Title = v14, 
                        Text = v15, 
                        Duration = 5
                    });
                end;
            end;
        end)();
    end;
end;