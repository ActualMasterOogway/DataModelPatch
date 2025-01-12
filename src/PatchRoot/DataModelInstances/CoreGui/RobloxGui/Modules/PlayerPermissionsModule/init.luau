local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = {};
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local v11 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled);
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    local v14 = setmetatable({}, v12);
    v14.player = v13;
    v14.pendingGroupData = {};
    v14.pendingCanManage = {};
    v14.pendingProfileSettings = {};
    v14.groupData = nil;
    v14.canManage = nil;
    v14.profileSettings = nil;
    return v14;
end;
v12.getGroupDataAsync = function(v15) --[[ Line: 26 ]] --[[ Name: getGroupDataAsync ]]
    if v15.groupData then
        return v15.groupData;
    else
        local v16 = coroutine.running();
        table.insert(v15.pendingGroupData, v16);
        coroutine.yield();
        return v15.groupData;
    end;
end;
v12.getCanManageAsync = function(v17) --[[ Line: 37 ]] --[[ Name: getCanManageAsync ]]
    if v17.canManage ~= nil then
        return v17.canManage;
    else
        local v18 = coroutine.running();
        table.insert(v17.pendingCanManage, v18);
        coroutine.yield();
        return v17.canManage;
    end;
end;
v12.getProfileSettingsAsync = function(v19) --[[ Line: 48 ]] --[[ Name: getProfileSettingsAsync ]]
    if v19.profileSettings ~= nil then
        return v19.profileSettings;
    else
        local v20 = coroutine.running();
        table.insert(v19.pendingProfileSettings, v20);
        coroutine.yield();
        return v19.profileSettings;
    end;
end;
v12.setGroupData = function(v21, v22) --[[ Line: 59 ]] --[[ Name: setGroupData ]]
    v21.groupData = v22;
    local l_pendingGroupData_0 = v21.pendingGroupData;
    v21.pendingGroupData = {};
    for _, v25 in pairs(l_pendingGroupData_0) do
        coroutine.resume(v25);
    end;
end;
v12.setCanManage = function(v26, v27) --[[ Line: 68 ]] --[[ Name: setCanManage ]]
    v26.canManage = v27 and true or false;
    local l_pendingCanManage_0 = v26.pendingCanManage;
    v26.pendingCanManage = {};
    for _, v30 in pairs(l_pendingCanManage_0) do
        coroutine.resume(v30);
    end;
end;
v12.setProfileSettings = function(v31, v32) --[[ Line: 78 ]] --[[ Name: setProfileSettings ]]
    v31.profileSettings = v32;
    local l_pendingProfileSettings_0 = v31.pendingProfileSettings;
    v31.pendingProfileSettings = {};
    for _, v35 in pairs(l_pendingProfileSettings_0) do
        coroutine.resume(v35);
    end;
end;
v12.destroy = function(v36) --[[ Line: 87 ]] --[[ Name: destroy ]]
    -- upvalues: v11 (copy)
    for _, v38 in pairs(v36.pendingGroupData) do
        coroutine.resume(v38);
    end;
    for _, v40 in pairs(v36.pendingCanManage) do
        coroutine.resume(v40);
    end;
    if v11 then
        for _, v42 in pairs(v36.pendingProfileSettings) do
            coroutine.resume(v42);
        end;
    end;
end;
local v43 = {};
local function _(v44) --[[ Line: 105 ]] --[[ Name: getPlayerInfo ]]
    -- upvalues: v43 (copy), v12 (copy)
    local v45 = v43[v44];
    if not v45 and v44.Parent ~= nil then
        v45 = v12.new(v44);
        v43[v44] = v45;
    end;
    return v45;
end;
spawn(function() --[[ Line: 114 ]]
    -- upvalues: l_Players_0 (copy), v43 (copy), v12 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", 1e999).OnClientEvent:Connect(function(...) --[[ Line: 118 ]]
        -- upvalues: l_Players_0 (ref), v43 (ref), v12 (ref)
        local v47 = {
            ...
        };
        if #v47 == 1 then
            local v48 = v47[1];
            for v49, v50 in pairs(v48) do
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v49)));
                if l_l_Players_0_PlayerByUserId_0 then
                    local v52 = v43[l_l_Players_0_PlayerByUserId_0];
                    if not v52 and l_l_Players_0_PlayerByUserId_0.Parent ~= nil then
                        v52 = v12.new(l_l_Players_0_PlayerByUserId_0);
                        v43[l_l_Players_0_PlayerByUserId_0] = v52;
                    end;
                    local l_v52_0 = v52;
                    if l_v52_0 then
                        l_v52_0:setGroupData(v50);
                    end;
                end;
            end;
            return;
        else
            local v54 = v47[1];
            local v55 = v47[2];
            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId((tonumber(v54)));
            if l_l_Players_0_PlayerByUserId_1 then
                local v57 = v43[l_l_Players_0_PlayerByUserId_1];
                if not v57 and l_l_Players_0_PlayerByUserId_1.Parent ~= nil then
                    v57 = v12.new(l_l_Players_0_PlayerByUserId_1);
                    v43[l_l_Players_0_PlayerByUserId_1] = v57;
                end;
                local l_v57_0 = v57;
                if l_v57_0 then
                    l_v57_0:setGroupData(v55);
                end;
            end;
            return;
        end;
    end);
end);
coroutine.wrap(function() --[[ Line: 149 ]]
    -- upvalues: l_Players_0 (copy), v43 (copy), v12 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", 1e999).OnClientEvent:Connect(function(v59, v60) --[[ Line: 155 ]]
        -- upvalues: l_Players_0 (ref), v43 (ref), v12 (ref)
        local l_l_Players_0_PlayerByUserId_2 = l_Players_0:GetPlayerByUserId((tonumber(v59)));
        if l_l_Players_0_PlayerByUserId_2 then
            local v62 = v43[l_l_Players_0_PlayerByUserId_2];
            if not v62 and l_l_Players_0_PlayerByUserId_2.Parent ~= nil then
                v62 = v12.new(l_l_Players_0_PlayerByUserId_2);
                v43[l_l_Players_0_PlayerByUserId_2] = v62;
            end;
            local l_v62_0 = v62;
            if l_v62_0 then
                l_v62_0:setCanManage(v60);
            end;
        end;
    end);
end)();
if v11 then
    coroutine.wrap(function() --[[ Line: 167 ]]
        -- upvalues: l_Players_0 (copy), v43 (copy), v12 (copy)
        game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(v64, v65) --[[ Line: 173 ]]
            -- upvalues: l_Players_0 (ref), v43 (ref), v12 (ref)
            local l_l_Players_0_PlayerByUserId_3 = l_Players_0:GetPlayerByUserId((tonumber(v64)));
            if l_l_Players_0_PlayerByUserId_3 then
                local v67 = v43[l_l_Players_0_PlayerByUserId_3];
                if not v67 and l_l_Players_0_PlayerByUserId_3.Parent ~= nil then
                    v67 = v12.new(l_l_Players_0_PlayerByUserId_3);
                    v43[l_l_Players_0_PlayerByUserId_3] = v67;
                end;
                local l_v67_0 = v67;
                if l_v67_0 then
                    l_v67_0:setProfileSettings(v65);
                end;
            end;
        end);
    end)();
end;
l_Players_0.PlayerRemoving:Connect(function(v69) --[[ Line: 185 ]]
    -- upvalues: v43 (copy)
    if v43[v69] then
        local v70 = v43[v69];
        v43[v69] = nil;
        v70:destroy();
    end;
end);
local function _(v71) --[[ Line: 193 ]] --[[ Name: NewInGroupFunctionFactory ]]
    -- upvalues: v43 (copy), v12 (copy)
    return function(v72) --[[ Line: 194 ]]
        -- upvalues: v43 (ref), v12 (ref), v71 (copy)
        local v73 = v43[v72];
        if not v73 and v72.Parent ~= nil then
            v73 = v12.new(v72);
            v43[v72] = v73;
        end;
        local l_v73_0 = v73;
        if l_v73_0 then
            v73 = l_v73_0:getGroupDataAsync();
            if v73 and v73[v71] then
                return true;
            end;
        end;
        return false;
    end;
end;
local v76 = {};
local v77 = "SpanishLocalizationExpert";
local l_v77_0 = v77 --[[ copy: 12 -> 17 ]];
local function v82(v79) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v77_0 (copy)
    local v80 = v43[v79];
    if not v80 and v79.Parent ~= nil then
        v80 = v12.new(v79);
        v43[v79] = v80;
    end;
    local l_v80_0 = v80;
    if l_v80_0 then
        v80 = l_v80_0:getGroupDataAsync();
        if v80 and v80[l_v77_0] then
            return true;
        end;
    end;
    return false;
end;
local v83 = "BrazilianLocalizationExpert";
local l_v83_0 = v83 --[[ copy: 13 -> 18 ]];
v77 = function(v85) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v83_0 (copy)
    local v86 = v43[v85];
    if not v86 and v85.Parent ~= nil then
        v86 = v12.new(v85);
        v43[v85] = v86;
    end;
    local l_v86_0 = v86;
    if l_v86_0 then
        v86 = l_v86_0:getGroupDataAsync();
        if v86 and v86[l_v83_0] then
            return true;
        end;
    end;
    return false;
end;
local v88 = "FrenchLocalizationExpert";
local l_v88_0 = v88 --[[ copy: 14 -> 19 ]];
v83 = function(v90) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v88_0 (copy)
    local v91 = v43[v90];
    if not v91 and v90.Parent ~= nil then
        v91 = v12.new(v90);
        v43[v90] = v91;
    end;
    local l_v91_0 = v91;
    if l_v91_0 then
        v91 = l_v91_0:getGroupDataAsync();
        if v91 and v91[l_v88_0] then
            return true;
        end;
    end;
    return false;
end;
local v93 = "GermanLocalizationExpert";
local l_v93_0 = v93 --[[ copy: 15 -> 20 ]];
v88 = function(v95) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v93_0 (copy)
    local v96 = v43[v95];
    if not v96 and v95.Parent ~= nil then
        v96 = v12.new(v95);
        v43[v95] = v96;
    end;
    local l_v96_0 = v96;
    if l_v96_0 then
        v96 = l_v96_0:getGroupDataAsync();
        if v96 and v96[l_v93_0] then
            return true;
        end;
    end;
    return false;
end;
v6(v76, 1, v82, v77, v83, v88);
v82 = function() --[[ Line: 213 ]] --[[ Name: NewIsLocalizationExpertFunctionFactory ]]
    -- upvalues: v76 (copy)
    return function(v98) --[[ Line: 214 ]]
        -- upvalues: v76 (ref)
        for v99 = 1, #v76 do
            if v76[v99](v98) then
                return true;
            end;
        end;
        return false;
    end;
end;
v77 = function() --[[ Line: 224 ]] --[[ Name: IsPlaceOwnerFunctionFactory ]]
    -- upvalues: v43 (copy), v12 (copy)
    if game.CreatorType == Enum.CreatorType.Group then
        local v100 = "PlaceCreator";
        return function(v101) --[[ Line: 194 ]]
            -- upvalues: v43 (ref), v12 (ref), v100 (copy)
            local v102 = v43[v101];
            if not v102 and v101.Parent ~= nil then
                v102 = v12.new(v101);
                v43[v101] = v102;
            end;
            local l_v102_0 = v102;
            if l_v102_0 then
                v102 = l_v102_0:getGroupDataAsync();
                if v102 and v102[v100] then
                    return true;
                end;
            end;
            return false;
        end;
    else
        return function(v104) --[[ Line: 228 ]]
            return v104.UserId == game.CreatorId;
        end;
    end;
end;
v83 = function(v105) --[[ Line: 233 ]] --[[ Name: CanPlayerManagePlace ]]
    -- upvalues: v43 (copy), v12 (copy)
    local v106 = v43[v105];
    if not v106 and v105.Parent ~= nil then
        v106 = v12.new(v105);
        v43[v105] = v106;
    end;
    local l_v106_0 = v106;
    if l_v106_0 then
        return l_v106_0:getCanManageAsync() or false;
    else
        return false;
    end;
end;
v88 = function(v108) --[[ Line: 242 ]] --[[ Name: IsPlayerInExperienceNameEnabled ]]
    -- upvalues: v43 (copy), v12 (copy)
    local v109 = v43[v108];
    if not v109 and v108.Parent ~= nil then
        v109 = v12.new(v108);
        v43[v108] = v109;
    end;
    local l_v109_0 = v109;
    if l_v109_0 then
        v109 = l_v109_0:getProfileSettingsAsync();
        if v109 then
            return v109.isInExperienceNameEnabled;
        end;
    end;
    return false;
end;
local v111 = "Admin";
local l_v111_0 = v111 --[[ copy: 16 -> 21 ]];
v7.IsPlayerAdminAsync = function(v113) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v111_0 (copy)
    local v114 = v43[v113];
    if not v114 and v113.Parent ~= nil then
        v114 = v12.new(v113);
        v43[v113] = v114;
    end;
    local l_v114_0 = v114;
    if l_v114_0 then
        v114 = l_v114_0:getGroupDataAsync();
        if v114 and v114[l_v111_0] then
            return true;
        end;
    end;
    return false;
end;
v111 = "Intern";
local l_v111_1 = v111 --[[ copy: 16 -> 22 ]];
v7.IsPlayerInternAsync = function(v117) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v111_1 (copy)
    local v118 = v43[v117];
    if not v118 and v117.Parent ~= nil then
        v118 = v12.new(v117);
        v43[v117] = v118;
    end;
    local l_v118_0 = v118;
    if l_v118_0 then
        v118 = l_v118_0:getGroupDataAsync();
        if v118 and v118[l_v111_1] then
            return true;
        end;
    end;
    return false;
end;
v111 = "Star";
local l_v111_2 = v111 --[[ copy: 16 -> 23 ]];
v7.IsPlayerStarAsync = function(v121) --[[ Line: 194 ]]
    -- upvalues: v43 (copy), v12 (copy), l_v111_2 (copy)
    local v122 = v43[v121];
    if not v122 and v121.Parent ~= nil then
        v122 = v12.new(v121);
        v43[v121] = v122;
    end;
    local l_v122_0 = v122;
    if l_v122_0 then
        v122 = l_v122_0:getGroupDataAsync();
        if v122 and v122[l_v111_2] then
            return true;
        end;
    end;
    return false;
end;
v7.IsPlayerLocalizationExpertAsync = function(v124) --[[ Line: 214 ]]
    -- upvalues: v76 (copy)
    for v125 = 1, #v76 do
        if v76[v125](v124) then
            return true;
        end;
    end;
    return false;
end;
if game.CreatorType == Enum.CreatorType.Group then
    v111 = "PlaceCreator";
    v93 = function(v126) --[[ Line: 194 ]]
        -- upvalues: v43 (copy), v12 (copy), v111 (copy)
        local v127 = v43[v126];
        if not v127 and v126.Parent ~= nil then
            v127 = v12.new(v126);
            v43[v126] = v127;
        end;
        local l_v127_0 = v127;
        if l_v127_0 then
            v127 = l_v127_0:getGroupDataAsync();
            if v127 and v127[v111] then
                return true;
            end;
        end;
        return false;
    end;
else
    v93 = function(v129) --[[ Line: 228 ]]
        return v129.UserId == game.CreatorId;
    end;
end;
v7.IsPlayerPlaceOwnerAsync = v93;
v7.CanPlayerManagePlaceAsync = v83;
if v11 then
    v7.IsPlayerInExperienceNameEnabledAsync = v88;
end;
return v7;