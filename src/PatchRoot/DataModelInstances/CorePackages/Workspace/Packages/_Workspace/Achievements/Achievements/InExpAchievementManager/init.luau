local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signal);
local v3 = require(l_script_FirstAncestor_0.Achievement.Achievement);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_Parent_0.HttpRequest);
local v6 = require(l_script_FirstAncestor_0.Requests.GetUserRecentExperiences);
local v7 = require(l_Parent_0.Dash);
local v8 = require(l_script_FirstAncestor_0.AchievementDataRefresher.TimeRefresher);
local v9 = require(l_script_FirstAncestor_0.AchievementDataRefresher.FriendCountRefresher);
local v13 = v5.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 18 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy)
        return v5.requestFunctions.HttpRbxApi(v10, v11, v12);
    end
});
local v14 = nil;
pcall(function() --[[ Line: 25 ]]
    -- upvalues: v14 (ref)
    v14 = game:GetService("PlatformFriendsService");
end);
local v15 = nil;
pcall(function() --[[ Line: 30 ]]
    -- upvalues: v15 (ref)
    v15 = game:GetService("PlatformCloudStorageService");
end);
local v16 = nil;
pcall(function() --[[ Line: 35 ]]
    -- upvalues: v16 (ref)
    v16 = game:GetService("AchievementService");
end);
local l_Players_0 = game:GetService("Players");
local v18 = nil;
pcall(function() --[[ Line: 43 ]]
    -- upvalues: v18 (ref)
    v18 = game:GetService("PlatformService");
end);
local v38 = {
    startUp = function(v19) --[[ Line: 52 ]] --[[ Name: startUp ]]
        -- upvalues: v2 (copy), v8 (copy), v9 (copy), v3 (copy)
        local v20, v21 = v2.createReadableSignal(0);
        local v22, v23 = v2.createReadableSignal(0);
        local v24, v25 = v2.createReadableSignal(0);
        local v26, v27 = v2.createReadableSignal(0);
        v8:init(v21, 3600);
        v9:init(v27, v19.playersService);
        v19.achievementMarathon = v3.newWithRefresher(v3.NAMES.ACHIEVEMENT_MARATHON, v20, v8, v19.achievementService);
        v19.achievementFoursCompany = v3.newWithRefresher(v3.NAMES.ACHIEVEMENT_FOURS_COMPANY, v26, v9, v19.achievementService);
        v19.achievementScout = v3.new(v3.NAMES.ACHIEVEMENT_SCOUT, v22, v19.achievementService);
        v19.achievementExplorer = v3.new(v3.NAMES.ACHIEVEMENT_EXPLORER, v22, v19.achievementService);
        v19.achievementTrailblazer = v3.new(v3.NAMES.ACHIEVEMENT_TRAILBLAZER, v22, v19.achievementService);
        v19.achievementStrengthInNumbers = v3.new(v3.NAMES.ACHIEVEMENT_STRENGTH_IN_NUMBERS, v24, v19.achievementService);
        v19:_checkStrengthInNumbers(v25);
        v19:_checkJoinExperienceAchievements(v23);
    end, 
    _checkJoinExperienceAchievements = function(v28, v29) --[[ Line: 88 ]] --[[ Name: _checkJoinExperienceAchievements ]]
        -- upvalues: v7 (copy), v6 (copy), v4 (copy)
        if v28.achievementScout.hasAchieved == false or v28.achievementExplorer.hasAchieved == false or v28.achievementTrailblazer.hasAchieved == false then
            if v28.platformCloudStorageService and v28.platformCloudStorageService:IsUserDataAvailable() then
                local v30 = v28.platformCloudStorageService:GetUserDataAsync("ExperiencesPlayed").data or {};
                if #v30 < 15 and not v7.includes(v30, game.GameId) then
                    table.insert(v30, game.GameId);
                    v28.platformCloudStorageService:SetUserDataAsync("ExperiencesPlayed", {
                        data = v30
                    });
                end;
                v29(#v30);
                return;
            else
                v6(v28.requestImpl):andThen(function(v31) --[[ Line: 106 ]]
                    -- upvalues: v29 (copy)
                    v29(v31);
                end):catch(function(v32) --[[ Line: 108 ]]
                    -- upvalues: v4 (ref)
                    v4:warning(v32);
                end);
            end;
        end;
    end, 
    _checkStrengthInNumbers = function(v33, v34) --[[ Line: 115 ]] --[[ Name: _checkStrengthInNumbers ]]
        if v33.achievementStrengthInNumbers.hasAchieved == false then
            local v35 = if v33.platformService then v33.platformService:GetPlatformPartyMembers() else {};
            if v35 then
                v34(#v35);
            end;
            if game:GetEngineFeature("PlatformFriendsService") and v33.platformFriendsService and game:GetEngineFeature("PlatformFriendsServiceGetPartyMembers") then
                local v36 = nil;
                do
                    local l_v36_0 = v36;
                    pcall(function() --[[ Line: 134 ]]
                        -- upvalues: l_v36_0 (ref), v33 (copy)
                        l_v36_0 = v33.platformFriendsService:GetPartyMembers();
                    end);
                    if l_v36_0 then
                        v34(#l_v36_0);
                    end;
                end;
            end;
        end;
    end
};
v38.new = function(v39, v40, v41, v42, v43, v44) --[[ Line: 144 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v14 (ref), v15 (ref), v16 (ref), l_Players_0 (copy), v18 (ref), v38 (copy)
    return (setmetatable({
        requestImpl = v39 or v13, 
        platformFriendsService = v40 or v14, 
        platformCloudStorageService = v41 or v15, 
        achievementService = v42 or v16, 
        playersService = v43 or l_Players_0, 
        platformService = v44 or v18
    }, {
        __index = v38
    }));
end;
return v38;