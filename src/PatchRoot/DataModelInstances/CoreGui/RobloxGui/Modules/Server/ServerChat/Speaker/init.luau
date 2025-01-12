local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local _ = script.Parent;
local v5 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v5 = l_status_0 and l_result_0;
l_status_0 = false;
local v8;
l_result_0, v8 = pcall(function() --[[ Line: 24 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v8;
l_result_0 = function(v9) --[[ Line: 32 ]] --[[ Name: ShallowCopy ]]
    local v10 = {};
    for v11, v12 in pairs(v9) do
        v10[v11] = v12;
    end;
    return v10;
end;
v8 = {};
local v13 = {
    eDestroyed = true, 
    eSaidMessage = true, 
    eReceivedMessage = true, 
    eReceivedUnfilteredMessage = true, 
    eMessageDoneFiltering = true, 
    eReceivedSystemMessage = true, 
    eChannelJoined = true, 
    eChannelLeft = true, 
    eMuted = true, 
    eUnmuted = true, 
    eExtraDataUpdated = true, 
    eMainChannelSet = true, 
    eChannelNameColorUpdated = true
};
local v14 = {
    Destroyed = "eDestroyed", 
    SaidMessage = "eSaidMessage", 
    ReceivedMessage = "eReceivedMessage", 
    ReceivedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    RecievedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    MessageDoneFiltering = "eMessageDoneFiltering", 
    ReceivedSystemMessage = "eReceivedSystemMessage", 
    ChannelJoined = "eChannelJoined", 
    ChannelLeft = "eChannelLeft", 
    Muted = "eMuted", 
    Unmuted = "eUnmuted", 
    ExtraDataUpdated = "eExtraDataUpdated", 
    MainChannelSet = "eMainChannelSet", 
    ChannelNameColorUpdated = "eChannelNameColorUpdated"
};
v8.__index = function(v15, v16) --[[ Line: 76 ]]
    -- upvalues: v8 (copy), v13 (copy), v14 (copy)
    local v17 = rawget(v8, v16);
    if v17 then
        return v17;
    else
        if v13[v16] and not rawget(v15, v16) then
            rawset(v15, v16, Instance.new("BindableEvent"));
        end;
        local v18 = v14[v16];
        if v18 and not rawget(v15, v16) then
            if not rawget(v15, v18) then
                rawset(v15, v18, Instance.new("BindableEvent"));
            end;
            rawset(v15, v16, rawget(v15, v18).Event);
        end;
        return (rawget(v15, v16));
    end;
end;
v8.LazyFire = function(v19, v20, ...) --[[ Line: 93 ]] --[[ Name: LazyFire ]]
    local v21 = rawget(v19, v20);
    if v21 then
        v21:Fire(...);
    end;
end;
v8.SayMessage = function(v22, v23, v24, v25) --[[ Line: 100 ]] --[[ Name: SayMessage ]]
    if v22.ChatService:InternalDoProcessCommands(v22.Name, v23, v24) then
        return;
    elseif not v24 then
        return;
    else
        local v26 = v22.Channels[v24:lower()];
        if not v26 then
            return;
        else
            local v27 = v26:InternalPostMessage(v22, v23, v25);
            if v27 then
                pcall(function() --[[ Line: 115 ]]
                    -- upvalues: v22 (copy), v27 (copy), v24 (copy)
                    v22:LazyFire("eSaidMessage", v27, v24);
                end);
            end;
            return v27;
        end;
    end;
end;
v8.JoinChannel = function(v28, v29) --[[ Line: 123 ]] --[[ Name: JoinChannel ]]
    if v28.Channels[v29:lower()] then
        warn("Speaker is already in channel \"" .. v29 .. "\"");
        return;
    else
        local l_Channel_0 = v28.ChatService:GetChannel(v29);
        if not l_Channel_0 then
            error("Channel \"" .. v29 .. "\" does not exist!");
        end;
        v28.Channels[v29:lower()] = l_Channel_0;
        l_Channel_0:InternalAddSpeaker(v28);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 136 ]]
            -- upvalues: v28 (copy), l_Channel_0 (copy)
            v28.eChannelJoined:Fire(l_Channel_0.Name, l_Channel_0:GetWelcomeMessageForSpeaker(v28));
        end);
        if not l_status_1 and l_result_1 then
            print("Error joining channel: " .. l_result_1);
        end;
        return;
    end;
end;
v8.LeaveChannel = function(v33, v34) --[[ Line: 144 ]] --[[ Name: LeaveChannel ]]
    if not v33.Channels[v34:lower()] then
        warn("Speaker is not in channel \"" .. v34 .. "\"");
        return;
    else
        local v35 = v33.Channels[v34:lower()];
        v33.Channels[v34:lower()] = nil;
        v35:InternalRemoveSpeaker(v33);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 154 ]]
            -- upvalues: v33 (copy), v35 (copy)
            v33:LazyFire("eChannelLeft", v35.Name);
            if v33.PlayerObj then
                v33.EventFolder.OnChannelLeft:FireClient(v33.PlayerObj, v35.Name);
            end;
        end);
        if not l_status_2 and l_result_2 then
            print("Error leaving channel: " .. l_result_2);
        end;
        return;
    end;
end;
v8.IsInChannel = function(v38, v39) --[[ Line: 165 ]] --[[ Name: IsInChannel ]]
    return v38.Channels[v39:lower()] ~= nil;
end;
v8.GetChannelList = function(v40) --[[ Line: 169 ]] --[[ Name: GetChannelList ]]
    local v41 = {};
    for _, v43 in pairs(v40.Channels) do
        table.insert(v41, v43.Name);
    end;
    return v41;
end;
v8.SendMessage = function(v44, v45, v46, v47, v48) --[[ Line: 177 ]] --[[ Name: SendMessage ]]
    -- upvalues: l_RunService_0 (copy)
    local v49 = v44.Channels[v46:lower()];
    if v49 then
        v49:SendMessageToSpeaker(v45, v44.Name, v47, v48);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", v44.Name, v46));
        end;
        return;
    end;
end;
v8.SendSystemMessage = function(v50, v51, v52, v53) --[[ Line: 188 ]] --[[ Name: SendSystemMessage ]]
    -- upvalues: l_RunService_0 (copy)
    local v54 = v50.Channels[v52:lower()];
    if v54 then
        v54:SendSystemMessageToSpeaker(v51, v50.Name, v53);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", v50.Name, v52));
        end;
        return;
    end;
end;
v8.GetPlayer = function(v55) --[[ Line: 199 ]] --[[ Name: GetPlayer ]]
    return v55.PlayerObj;
end;
v8.GetNameForDisplay = function(v56) --[[ Line: 203 ]] --[[ Name: GetNameForDisplay ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if l_ChatSettings_0.PlayerDisplayNamesEnabled then
        local l_v56_Player_0 = v56:GetPlayer();
        if l_v56_Player_0 then
            return l_v56_Player_0.DisplayName;
        else
            return v56.Name;
        end;
    else
        return v56.Name;
    end;
end;
v8.SetExtraData = function(v58, v59, v60) --[[ Line: 217 ]] --[[ Name: SetExtraData ]]
    v58.ExtraData[v59] = v60;
    v58:LazyFire("eExtraDataUpdated", v59, v60);
end;
v8.GetExtraData = function(v61, v62) --[[ Line: 222 ]] --[[ Name: GetExtraData ]]
    return v61.ExtraData[v62];
end;
v8.SetMainChannel = function(v63, v64) --[[ Line: 226 ]] --[[ Name: SetMainChannel ]]
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 227 ]]
        -- upvalues: v63 (copy), v64 (copy)
        v63:LazyFire("eMainChannelSet", v64);
        if v63.PlayerObj then
            v63.EventFolder.OnMainChannelSet:FireClient(v63.PlayerObj, v64);
        end;
    end);
    if not l_status_3 and l_result_3 then
        print("Error setting main channel: " .. l_result_3);
    end;
end;
v8.AddMutedSpeaker = function(v67, v68) --[[ Line: 239 ]] --[[ Name: AddMutedSpeaker ]]
    v67.MutedSpeakers[v68:lower()] = true;
end;
v8.RemoveMutedSpeaker = function(v69, v70) --[[ Line: 243 ]] --[[ Name: RemoveMutedSpeaker ]]
    v69.MutedSpeakers[v70:lower()] = false;
end;
v8.IsSpeakerMuted = function(v71, v72) --[[ Line: 247 ]] --[[ Name: IsSpeakerMuted ]]
    return v71.MutedSpeakers[v72:lower()];
end;
v8.InternalDestroy = function(v73) --[[ Line: 253 ]] --[[ Name: InternalDestroy ]]
    for _, v75 in pairs(v73.Channels) do
        v75:InternalRemoveSpeaker(v73);
    end;
    v73.eDestroyed:Fire();
    v73.EventFolder = nil;
    v73.eDestroyed:Destroy();
    v73.eSaidMessage:Destroy();
    v73.eReceivedMessage:Destroy();
    v73.eReceivedUnfilteredMessage:Destroy();
    v73.eMessageDoneFiltering:Destroy();
    v73.eReceivedSystemMessage:Destroy();
    v73.eChannelJoined:Destroy();
    v73.eChannelLeft:Destroy();
    v73.eMuted:Destroy();
    v73.eUnmuted:Destroy();
    v73.eExtraDataUpdated:Destroy();
    v73.eMainChannelSet:Destroy();
    v73.eChannelNameColorUpdated:Destroy();
end;
v8.InternalAssignPlayerObject = function(v76, v77) --[[ Line: 276 ]] --[[ Name: InternalAssignPlayerObject ]]
    v76.PlayerObj = v77;
end;
v8.InternalAssignEventFolder = function(v78, v79) --[[ Line: 280 ]] --[[ Name: InternalAssignEventFolder ]]
    v78.EventFolder = v79;
end;
v8.InternalSendMessage = function(v80, v81, v82) --[[ Line: 284 ]] --[[ Name: InternalSendMessage ]]
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 285 ]]
        -- upvalues: v80 (copy), v81 (copy), v82 (copy)
        v80:LazyFire("eReceivedUnfilteredMessage", v81, v82);
        if v80.PlayerObj then
            v80.EventFolder.OnNewMessage:FireClient(v80.PlayerObj, v81, v82);
        end;
    end);
    if not l_status_4 and l_result_4 then
        print("Error sending internal message: " .. l_result_4);
    end;
end;
v8.InternalSendFilteredMessage = function(v85, v86, v87) --[[ Line: 296 ]] --[[ Name: InternalSendFilteredMessage ]]
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 297 ]]
        -- upvalues: v85 (copy), v86 (copy), v87 (copy)
        v85:LazyFire("eReceivedMessage", v86, v87);
        v85:LazyFire("eMessageDoneFiltering", v86, v87);
        if v85.PlayerObj then
            v85.EventFolder.OnMessageDoneFiltering:FireClient(v85.PlayerObj, v86, v87);
        end;
    end);
    if not l_status_5 and l_result_5 then
        print("Error sending internal filtered message: " .. l_result_5);
    end;
end;
v8.InternalSendFilteredMessageWithTranslatedFilterResult = function(v90, v91, v92, v93) --[[ Line: 312 ]] --[[ Name: InternalSendFilteredMessageWithTranslatedFilterResult ]]
    -- upvalues: v5 (ref)
    local v94 = {};
    for v95, v96 in pairs(v91) do
        v94[v95] = v96;
    end;
    local l_v94_0 = v94;
    v94 = l_v94_0.FilterResult;
    local l_v90_Player_0 = v90:GetPlayer();
    local v99 = if l_v90_Player_0 ~= nil then v93:GetTranslationForLocale(l_v90_Player_0.LocaleId) else nil;
    local v100 = "";
    local v101 = nil;
    pcall(function() --[[ Line: 322 ]]
        -- upvalues: l_v94_0 (copy), l_v90_Player_0 (copy), v100 (ref), v94 (copy), v99 (copy), v101 (ref)
        if l_v94_0.IsFilterResult then
            if l_v90_Player_0 then
                v100 = v94:GetChatForUserAsync(l_v90_Player_0.UserId);
                if v99 then
                    v101 = v99:GetChatForUserAsync(l_v90_Player_0.UserId);
                    return;
                end;
            else
                v100 = v94:GetNonChatStringForBroadcastAsync();
                if v99 then
                    v101 = v99:GetNonChatStringForBroadcastAsync();
                    return;
                end;
            end;
        else
            v100 = v94;
        end;
    end);
    if v5 then
        l_v94_0.Message = v100;
        if v101 then
            l_v94_0.TranslatedMessage = v101;
        end;
        l_v94_0.FilterResult = nil;
        v90:InternalSendFilteredMessage(l_v94_0, v92);
    elseif #v100 > 0 then
        l_v94_0.Message = v100;
        if v101 then
            l_v94_0.TranslatedMessage = v101;
        end;
        l_v94_0.FilterResult = nil;
        v90:InternalSendFilteredMessage(l_v94_0, v92);
    end;
end;
v8.InternalSendFilteredMessageWithFilterResult = function(v102, v103, v104) --[[ Line: 358 ]] --[[ Name: InternalSendFilteredMessageWithFilterResult ]]
    -- upvalues: v5 (ref)
    local v105 = {};
    for v106, v107 in pairs(v103) do
        v105[v106] = v107;
    end;
    local l_v105_0 = v105;
    v105 = l_v105_0.FilterResult;
    local l_v102_Player_0 = v102:GetPlayer();
    local v110 = "";
    pcall(function() --[[ Line: 365 ]]
        -- upvalues: l_v105_0 (copy), l_v102_Player_0 (copy), v110 (ref), v105 (copy)
        if l_v105_0.IsFilterResult then
            if l_v102_Player_0 then
                v110 = v105:GetChatForUserAsync(l_v102_Player_0.UserId);
                return;
            else
                v110 = v105:GetNonChatStringForBroadcastAsync();
                return;
            end;
        else
            v110 = v105;
            return;
        end;
    end);
    if v5 then
        l_v105_0.Message = v110;
        l_v105_0.FilterResult = nil;
        v102:InternalSendFilteredMessage(l_v105_0, v104);
    elseif #v110 > 0 then
        l_v105_0.Message = v110;
        l_v105_0.FilterResult = nil;
        v102:InternalSendFilteredMessage(l_v105_0, v104);
    end;
end;
v8.InternalSendSystemMessage = function(v111, v112, v113) --[[ Line: 394 ]] --[[ Name: InternalSendSystemMessage ]]
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 395 ]]
        -- upvalues: v111 (copy), v112 (copy), v113 (copy)
        v111:LazyFire("eReceivedSystemMessage", v112, v113);
        if v111.PlayerObj then
            v111.EventFolder.OnNewSystemMessage:FireClient(v111.PlayerObj, v112, v113);
        end;
    end);
    if not l_status_6 and l_result_6 then
        print("Error sending internal system message: " .. l_result_6);
    end;
end;
v8.UpdateChannelNameColor = function(v116, v117, v118) --[[ Line: 406 ]] --[[ Name: UpdateChannelNameColor ]]
    v116:LazyFire("eChannelNameColorUpdated", v117, v118);
    if v116.PlayerObj then
        v116.EventFolder.ChannelNameColorUpdated:FireClient(v116.PlayerObj, v117, v118);
    end;
end;
v0.new = function(v119, v120) --[[ Line: 416 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v121 = setmetatable({}, v8);
    v121.ChatService = v119;
    v121.PlayerObj = nil;
    v121.Name = v120;
    v121.ExtraData = {};
    v121.Channels = {};
    v121.MutedSpeakers = {};
    v121.EventFolder = nil;
    return v121;
end;
return v0;