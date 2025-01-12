local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Reducers/" .. script.Name);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.ChatInputBarActivatedTeamMode);
local v8 = require(l_Actions_0.ChatInputBarActivatedWhisperMode);
local v9 = require(l_Actions_0.ChatInputBarResetTargetChannel);
local v10 = require(l_Actions_0.ClientAppLoaded);
local v11 = require(l_Actions_0.LocalTeamChanged);
local v12 = require(l_Actions_0.LocalTextChannelParticipantRemoved);
local v13 = require(l_Actions_0.TargetTextChannelPropertyChanged);
local v14 = require(l_Actions_0.TextChannelCreated);
local v15 = require(l_Actions_0.TextChannelRemoved);
local v16 = require(l_Actions_0.PlayerRemoved);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatWhisperModeRaceFix);
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUIFix);
local v19 = {
    allTextChannels = {}, 
    targetTextChannel = nil, 
    currentTeam = nil
};
local function _(v20, v21) --[[ Line: 36 ]] --[[ Name: getTeamTextChannelFromTeam ]]
    local v22 = "RBXTeam" .. v21.TeamColor.Name;
    for v23, v24 in pairs(v20) do
        if v23 == v22 then
            return v24;
        end;
    end;
    return nil;
end;
local function _(v26, v27) --[[ Line: 47 ]] --[[ Name: getTextChannelFromName ]]
    for v28, v29 in pairs(v26) do
        if v28 == v27 then
            return v29;
        end;
    end;
    return nil;
end;
return v2.createReducer(v19, {
    [v10.name] = function(v31, v32) --[[ Line: 58 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        return l_Dictionary_0.join(v31, {
            currentTeam = if v32.team == nil then l_None_0 else v32.team
        });
    end, 
    [v14.name] = function(v33, v34) --[[ Line: 64 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy)
        v5:trace("TextChannelCreated: {}", v34.textChannel.Name);
        return l_Dictionary_0.join(v33, {
            allTextChannels = l_Dictionary_0.join(v33.allTextChannels, {
                [v34.textChannel.Name] = v34.textChannel
            })
        });
    end, 
    [v15.name] = function(v35, v36) --[[ Line: 73 ]]
        -- upvalues: v18 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        if v18() then
            local v37 = l_Dictionary_0.removeKey(v35.allTextChannels, v36.textChannel.Name);
            local v38 = if v36.textChannel == v35.targetTextChannel then v37.RBXGeneral or l_None_0 else v35.targetTextChannel;
            return l_Dictionary_0.join(v35, {
                allTextChannels = v37, 
                targetTextChannel = v38
            });
        else
            return l_Dictionary_0.join(v35, {
                allTextChannels = l_Dictionary_0.removeKey(v35.allTextChannels, v36.textChannel.Name)
            });
        end;
    end, 
    [v12.name] = function(v39, v40) --[[ Line: 91 ]]
        -- upvalues: v18 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        if v18() then
            return l_Dictionary_0.join(v39, {
                targetTextChannel = if v40.textChannel == v39.targetTextChannel then if v40.textChannel == v39.allTextChannels.RBXGeneral then l_None_0 else v39.allTextChannels.RBXGeneral or l_None_0 else v39.targetTextChannel
            });
        else
            return v39;
        end;
    end, 
    [v13.name] = function(v41, v42) --[[ Line: 108 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        v5:trace("TargetTextChannelPropertyChanged dispatched");
        return l_Dictionary_0.join(v41, {
            targetTextChannel = if v42.textChannel == nil then l_None_0 else v42.textChannel
        });
    end, 
    [v11.name] = function(v43, v44) --[[ Line: 116 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        local v45 = false;
        if v44.team then
            v5:trace("LocalTeamChanged dispatched with team: {}", v44.team.Name);
            if v43.targetTextChannel and string.find(v43.targetTextChannel.Name, "^RBXTeam") then
                local l_allTextChannels_0 = v43.allTextChannels;
                local v47 = "RBXTeam" .. v44.team.TeamColor.Name;
                local v48;
                for v49, v50 in pairs(l_allTextChannels_0) do
                    if v49 == v47 then
                        v48 = v50;
                        v45 = true;
                    end;
                    if v45 then
                        break;
                    end;
                end;
                if not v45 then
                    v48 = nil;
                end;
                v45 = false;
                return l_Dictionary_0.join(v43, {
                    currentTeam = v44.team, 
                    targetTextChannel = if v48 == nil then v43.allTextChannels.RBXGeneral else v48
                });
            else
                return l_Dictionary_0.join(v43, {
                    currentTeam = v44.team
                });
            end;
        else
            v5:trace("LocalTeamChanged dispatched with no team");
            return l_Dictionary_0.join(v43, {
                currentTeam = l_None_0, 
                targetTextChannel = v43.allTextChannels.RBXGeneral or l_None_0
            });
        end;
    end, 
    [v7.name] = function(v51, _) --[[ Line: 142 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        local v53 = false;
        if v51.currentTeam == nil then
            v5:trace("ChatInputBarActivatedTeamMode but not on a team");
            return v51;
        else
            assert(v51.currentTeam, "This should be unreachable");
            local l_allTextChannels_1 = v51.allTextChannels;
            local v55 = "RBXTeam" .. v51.currentTeam.TeamColor.Name;
            local v56;
            for v57, v58 in pairs(l_allTextChannels_1) do
                if v57 == v55 then
                    v56 = v58;
                    v53 = true;
                end;
                if v53 then
                    break;
                end;
            end;
            if not v53 then
                v56 = nil;
            end;
            v53 = false;
            v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", v56 and v56.Name or "nil");
            return l_Dictionary_0.join(v51, {
                targetTextChannel = if v56 == nil then l_None_0 else v56
            });
        end;
    end, 
    [v9.name] = function(v59, _) --[[ Line: 161 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        return l_Dictionary_0.join(v59, {
            targetTextChannel = v59.allTextChannels.RBXGeneral or l_None_0
        });
    end, 
    [v8.name] = function(v61, v62) --[[ Line: 167 ]]
        -- upvalues: v17 (copy), v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        local v63 = false;
        if v17() then
            v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", v62.textChannel and v62.textChannel.Name or "nil");
            if v62.textChannel == nil then
                return v61;
            else
                return l_Dictionary_0.join(v61, {
                    allTextChannels = l_Dictionary_0.join(v61.allTextChannels, {
                        [v62.textChannel.Name] = v62.textChannel
                    }), 
                    targetTextChannel = v62.textChannel
                });
            end;
        else
            local l_allTextChannels_2 = v61.allTextChannels;
            local l_channelName_0 = v62.channelName;
            local v66;
            for v67, v68 in pairs(l_allTextChannels_2) do
                if v67 == l_channelName_0 then
                    v66 = v68;
                    v63 = true;
                end;
                if v63 then
                    break;
                end;
            end;
            if not v63 then
                v66 = nil;
            end;
            v63 = false;
            v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", v66 and v66.Name or "nil");
            return l_Dictionary_0.join(v61, {
                targetTextChannel = if v66 == nil then l_None_0 else v66
            });
        end;
    end, 
    [v16.name] = function(v69, v70) --[[ Line: 196 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local function _(v71) --[[ Line: 197 ]] --[[ Name: isRemovedPlayerInWhisperChannel ]]
            -- upvalues: v70 (copy)
            return string.find(v71, "RBXWhisper:") and string.find(v71, v70.userId);
        end;
        local l_targetTextChannel_0 = v69.targetTextChannel;
        if l_targetTextChannel_0 then
            local l_Name_0 = l_targetTextChannel_0.Name;
            if string.find(l_Name_0, "RBXWhisper:") and string.find(l_Name_0, v70.userId) then
                l_targetTextChannel_0 = v69.allTextChannels.RBXGeneral;
            end;
        end;
        local v77 = l_Dictionary_0.filter(v69.allTextChannels, function(_, v76) --[[ Line: 206 ]]
            -- upvalues: v70 (copy)
            return not (string.find(v76, "RBXWhisper:") and string.find(v76, v70.userId));
        end);
        return l_Dictionary_0.join(v69, {
            targetTextChannel = l_targetTextChannel_0, 
            allTextChannels = v77
        });
    end
});