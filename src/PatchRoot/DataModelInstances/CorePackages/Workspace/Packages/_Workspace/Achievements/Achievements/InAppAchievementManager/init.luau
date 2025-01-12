local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Signal);
local v4 = require(l_script_FirstAncestor_0.Achievement.Achievement);
local v5 = require(l_script_FirstAncestor_0.Logger);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v7 = require(l_Parent_0.HttpRequest);
local v8 = require(l_script_FirstAncestor_0.Requests.GetXboxLoginConsecutiveDays);
local v9 = require(l_script_FirstAncestor_0.AchievementDataRefresher.VoteCountRefresher);
local v13 = v7.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 15 ]] --[[ Name: requestFunction ]]
        -- upvalues: v7 (copy)
        return v7.requestFunctions.HttpRbxApi(v10, v11, v12);
    end
});
local v14 = nil;
pcall(function() --[[ Line: 21 ]]
    -- upvalues: v14 (ref)
    v14 = game:GetService("PlatformCloudStorageService");
end);
local v15 = nil;
pcall(function() --[[ Line: 28 ]]
    -- upvalues: v15 (ref)
    v15 = game:GetService("AchievementService");
end);
local v32 = {
    startUp = function(v16) --[[ Line: 34 ]] --[[ Name: startUp ]]
        task.spawn(function() --[[ Line: 35 ]]
            -- upvalues: v16 (copy)
            v16:initAchievements();
        end);
    end, 
    initAchievements = function(v17) --[[ Line: 40 ]] --[[ Name: initAchievements ]]
        -- upvalues: v3 (copy), v9 (copy), v4 (copy)
        local v18, v19 = v3.createReadableSignal(0);
        local v20, v21 = v3.createReadableSignal(0);
        local v22, v23 = v3.createReadableSignal(false);
        v9:init(v19, v17.store, v17.requestImpl, v17.platformCloudStorageService);
        v17.achievementPollster = v4.newWithRefresher(v4.NAMES.ACHIEVEMENT_POLLSTER, v18, v9, v17.achievementService);
        v17.achievement3DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_3_DAY_ROLL, v20, v17.achievementService);
        v17.achievement10DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_10_DAY_ROLL, v20, v17.achievementService);
        v17.achievement20DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_20_DAY_ROLL, v20, v17.achievementService);
        v17.achievementOneNameManyFaces = v4.new(v4.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, v22, v17.achievementService);
        v17:setupAchievements(v21, v23);
    end, 
    setupAchievements = function(v24, v25, v26) --[[ Line: 72 ]] --[[ Name: setupAchievements ]]
        -- upvalues: v8 (copy), v5 (copy)
        if v24.achievement3DayRoll.hasAchieved == false or v24.achievement10DayRoll.hasAchieved == false or v24.achievement20DayRoll.hasAchieved == false then
            v8(v24.requestImpl):andThen(function(v27) --[[ Line: 78 ]]
                -- upvalues: v5 (ref), v25 (copy)
                if v27.responseBody == nil then
                    v5:warning("Response body is empty.");
                    return;
                else
                    local l_count_0 = v27.responseBody.count;
                    if l_count_0 == nil then
                        v5:warning("Day count is missing.");
                        return;
                    else
                        v25(l_count_0);
                        return;
                    end;
                end;
            end):catch(function(v29) --[[ Line: 91 ]]
                -- upvalues: v5 (ref)
                v5:warning(v29);
            end);
        end;
        if v24.achievementOneNameManyFaces.hasAchieved == false then
            v24.saveAvatarCompletedConnection = v24.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(v30) --[[ Line: 98 ]]
                -- upvalues: v26 (copy), v24 (copy)
                if v30 == Enum.AvatarPromptResult.Success then
                    v26(true);
                    v24.saveAvatarCompletedConnection:Disconnect();
                    v24.saveAvatarCompletedConnection = nil;
                end;
            end);
        end;
    end, 
    shutDown = function(v31) --[[ Line: 109 ]] --[[ Name: shutDown ]]
        -- upvalues: v9 (copy)
        v31.achievementPollster = nil;
        v31.achievement3DayRoll = nil;
        v31.achievement10DayRoll = nil;
        v31.achievement20DayRoll = nil;
        v9:stop();
        if v31.saveAvatarCompletedConnection and v31.saveAvatarCompletedConnection.Connected then
            v31.saveAvatarCompletedConnection:Disconnect();
            v31.saveAvatarCompletedConnection = nil;
        end;
    end
};
v32.new = function(v33, v34, v35, v36, v37) --[[ Line: 122 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), l_AvatarEditorService_0 (copy), v14 (ref), v15 (ref), v32 (copy), l_LoginStatus_0 (copy)
    local v38 = setmetatable({
        store = v33, 
        requestImpl = v34 or v13, 
        avatarEditorService = v35 or l_AvatarEditorService_0, 
        platformCloudStorageService = v36 or v14, 
        achievementService = v37 or v15
    }, {
        __index = v32
    });
    v33.changed:connect(function(v39, v40) --[[ Line: 137 ]]
        -- upvalues: l_LoginStatus_0 (ref), v38 (copy)
        local v41 = if v39.AuthenticationStatus then v39.AuthenticationStatus.status else l_LoginStatus_0.UNKNOWN;
        if v41 ~= if v40.AuthenticationStatus then v40.AuthenticationStatus.status else l_LoginStatus_0.UNKNOWN then
            if v41 == l_LoginStatus_0.LOGGED_IN then
                v38:startUp();
                return;
            elseif v41 == l_LoginStatus_0.LOGGED_OUT then
                v38:shutDown();
            end;
        end;
    end);
    return v38;
end;
return v32;