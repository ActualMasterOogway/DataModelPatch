local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v6 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v7 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled);
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v10 = {
    Admin = l_Images_0["icons/status/player/admin"], 
    Intern = l_Images_0["icons/status/player/intern"], 
    Star = l_Images_0["icons/status/player/videostar"]
};
local v11 = require(l_Parent_0.Actions.SetPlayerSpecialGroupIcon);
local v12 = require(l_Parent_0.Actions.SetPlayerIsCreator);
local v13 = require(l_Parent_0.Actions.SetPlayerAvatarIcon);
local v14 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
local v15 = require(l_Parent_0.Actions.SetPlayerFriendStatus);
local function v23(v16, v17, v18) --[[ Line: 36 ]] --[[ Name: dispatchIfPlayerExists ]]
    local l_players_0 = v16:getState().players;
    local v20 = false;
    for _, v22 in ipairs(l_players_0) do
        if v17 == v22 then
            v20 = true;
            break;
        end;
    end;
    if v20 then
        v16:dispatch(v18);
    end;
end;
local function _(v24) --[[ Line: 50 ]] --[[ Name: isInExperienceNameEnabled ]]
    -- upvalues: v7 (copy), v4 (copy)
    if v7 and v4.IsPlayerInExperienceNameEnabledAsync(v24) then
        return true;
    else
        return false;
    end;
end;
local function v28(v26, v27) --[[ Line: 59 ]] --[[ Name: getGroupsPermissionsInfo ]]
    -- upvalues: v4 (copy), v7 (copy), v23 (copy), v11 (copy), v10 (copy)
    if v4.IsPlayerAdminAsync(v27) then
        if not (v7 and v4.IsPlayerInExperienceNameEnabledAsync(v27) and true or false) then
            v23(v26, v27, v11(v27, v10.Admin));
            return;
        end;
    elseif v4.IsPlayerStarAsync(v27) then
        if not (v7 and v4.IsPlayerInExperienceNameEnabledAsync(v27) and true or false) then
            v23(v26, v27, v11(v27, v10.Star));
            return;
        end;
    elseif v4.IsPlayerInternAsync(v27) and not (v7 and v4.IsPlayerInExperienceNameEnabledAsync(v27) and true or false) then
        v23(v26, v27, v11(v27, v10.Intern));
    end;
end;
local function v31(v29, v30) --[[ Line: 75 ]] --[[ Name: getGameCreator ]]
    -- upvalues: v4 (copy), v7 (copy), v23 (copy), v12 (copy)
    if game.CreatorType ~= Enum.CreatorType.Group then
        return;
    else
        if v4.CanPlayerManagePlaceAsync(v30) and not (v7 and v4.IsPlayerInExperienceNameEnabledAsync(v30) and true or false) then
            v23(v29, v30, v12(v30, true));
        end;
        return;
    end;
end;
local function v35(v32, v33) --[[ Line: 87 ]] --[[ Name: getPlayerAvatarIcon ]]
    -- upvalues: v5 (copy), v23 (copy), v13 (copy)
    if not v5:IsEnabled() then
        return;
    else
        local v34 = "rbxthumb://type=Avatar&id=" .. v33.UserId .. "&w=100&h=100";
        v23(v32, v33, v13(v33, v34));
        return;
    end;
end;
local function v38(v36, v37) --[[ Line: 96 ]] --[[ Name: getPlayerIsBlocked ]]
    -- upvalues: v6 (copy), v23 (copy), v14 (copy)
    if v6:IsPlayerBlockedByUserId(v37.UserId) then
        v23(v36, v37, v14(v37, true));
    end;
end;
local function v41(v39, v40) --[[ Line: 102 ]] --[[ Name: getPlayerFriendStatus ]]
    -- upvalues: l_Players_0 (copy), v23 (copy), v15 (copy)
    if v40 ~= l_Players_0.LocalPlayer and v40.Parent == l_Players_0 and l_Players_0.LocalPlayer.Parent == l_Players_0 then
        v23(v39, v40, v15(v40, l_Players_0.LocalPlayer:GetFriendStatus(v40)));
    end;
end;
return function(v42) --[[ Line: 112 ]] --[[ Name: MakePlayerInfoRequests ]]
    -- upvalues: v28 (copy), v31 (copy), v35 (copy), v38 (copy), v41 (copy)
    return function(v43) --[[ Line: 113 ]]
        -- upvalues: v28 (ref), v42 (copy), v31 (ref), v35 (ref), v38 (ref), v41 (ref)
        coroutine.wrap(v28)(v43, v42);
        coroutine.wrap(v31)(v43, v42);
        coroutine.wrap(v35)(v43, v42);
        coroutine.wrap(v38)(v43, v42);
        coroutine.wrap(v41)(v43, v42);
    end;
end;