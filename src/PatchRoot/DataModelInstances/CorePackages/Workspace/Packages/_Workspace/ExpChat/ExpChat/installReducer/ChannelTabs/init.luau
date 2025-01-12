local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_Parent_0.ExpChatShared);
local v5 = v4.Logger:new("ExpChat/Reducers/" .. script.Name);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.LocalTextChannelParticipantAdded);
local l_LocalTextChannelParticipantRemoved_0 = v4.Actions.LocalTextChannelParticipantRemoved;
local l_TextChannelRemoved_0 = v4.Actions.TextChannelRemoved;
local l_TargetTextChannelPropertyChanged_0 = v4.Actions.TargetTextChannelPropertyChanged;
local v11 = require(l_Actions_0.IncomingMessageReceived);
local l_getFFlagExpChatEnableChannelTabsUIFix_0 = v4.Flags.getFFlagExpChatEnableChannelTabsUIFix;
local v13 = {
    allChannelTabs = {}, 
    selectedTabName = nil
};
local function v20(v14, v15) --[[ Line: 32 ]] --[[ Name: insertTabAndReorder ]]
    -- upvalues: l_Dictionary_0 (copy)
    local v16 = {
        [v15.Name] = v15
    };
    for v17, v18 in v14 do
        local v19 = v18.TabIndex < v15.TabIndex and v18.TabIndex or v18.TabIndex + 1;
        v16 = l_Dictionary_0.join(v16, {
            [v17] = l_Dictionary_0.set(v14[v17], "TabIndex", v19)
        });
    end;
    return v16;
end;
local function v27(v21, v22) --[[ Line: 50 ]] --[[ Name: removeTabAndReorder ]]
    -- upvalues: l_Dictionary_0 (copy)
    if v22 == nil then
        return v21;
    else
        local v23 = {};
        for v24, v25 in v21 do
            if v24 ~= v22.Name then
                local v26 = v25.TabIndex < v22.TabIndex and v25.TabIndex or v25.TabIndex - 1;
                v23 = l_Dictionary_0.join(v23, {
                    [v24] = l_Dictionary_0.set(v21[v24], "TabIndex", v26)
                });
            end;
        end;
        return v23;
    end;
end;
local function v33(v28, v29) --[[ Line: 74 ]] --[[ Name: onChannelRemoved ]]
    -- upvalues: v27 (copy), l_Dictionary_0 (copy)
    local v30 = v28.allChannelTabs[v29.Name];
    if v30 == nil then
        return v28;
    else
        local v31 = v27(v28.allChannelTabs, v30);
        local v32 = if v30.Name == v28.selectedTabName then v31.RBXGeneral and "RBXGeneral" or nil else v28.selectedTabName;
        return {
            allChannelTabs = if v32 then l_Dictionary_0.join(v31, {
                [v32] = l_Dictionary_0.join(v31[v32], {
                    HasUnreadMessages = false
                })
            }) else v31, 
            selectedTabName = v32
        };
    end;
end;
return v2.createReducer(v13, {
    [v7.name] = function(v34, v35) --[[ Line: 98 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), v20 (copy)
        local l_Name_0 = v35.textChannel.Name;
        v5:trace("LocalTextChannelParticipantAdded dispatched: {}", l_Name_0);
        if v34.allChannelTabs[l_Name_0] ~= nil or l_Name_0 == "RBXSystem" then
            return v34;
        else
            local v37 = {
                Name = l_Name_0, 
                HasUnreadMessages = false, 
                TabIndex = v34.allChannelTabs.RBXGeneral ~= nil and l_Name_0 ~= "RBXGeneral" and 2 or 1
            };
            return l_Dictionary_0.join(v34, {
                allChannelTabs = v20(v34.allChannelTabs, v37)
            });
        end;
    end, 
    [l_LocalTextChannelParticipantRemoved_0.name] = function(v38, v39) --[[ Line: 118 ]]
        -- upvalues: v5 (copy), l_getFFlagExpChatEnableChannelTabsUIFix_0 (copy), v33 (copy)
        v5:trace("LocalTextChannelParticipantRemoved dispatched: {}", v39.textChannel.Name);
        if l_getFFlagExpChatEnableChannelTabsUIFix_0() then
            return (v33(v38, v39.textChannel));
        else
            return v38;
        end;
    end, 
    [l_TextChannelRemoved_0.name] = function(v40, v41) --[[ Line: 131 ]]
        -- upvalues: v5 (copy), l_getFFlagExpChatEnableChannelTabsUIFix_0 (copy), v33 (copy), l_Dictionary_0 (copy), v27 (copy)
        v5:trace("TextChannelRemoved dispatched: {}", v41.textChannel.Name);
        if l_getFFlagExpChatEnableChannelTabsUIFix_0() then
            return (v33(v40, v41.textChannel));
        else
            local v42 = v40.allChannelTabs[v41.textChannel.Name];
            if v42 == nil then
                return v40;
            else
                return l_Dictionary_0.join(v40, {
                    allChannelTabs = v27(v40.allChannelTabs, v42)
                });
            end;
        end;
    end, 
    [l_TargetTextChannelPropertyChanged_0.name] = function(v43, v44) --[[ Line: 148 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), v20 (copy), v27 (copy)
        v5:trace("TargetTextChannelPropertyChanged dispatched");
        if v44.textChannel and v43.allChannelTabs[v44.textChannel.Name] then
            local v45 = v43.allChannelTabs[v44.textChannel.Name];
            local l_TabIndex_0 = v45.TabIndex;
            if v44.shouldReorderTabs then
                l_TabIndex_0 = v43.allChannelTabs.RBXGeneral ~= nil and v45.Name ~= "RBXGeneral" and 2 or 1;
            end;
            local v47 = l_Dictionary_0.join(v45, {
                HasUnreadMessages = false, 
                TabIndex = l_TabIndex_0
            });
            return l_Dictionary_0.join(v43, {
                allChannelTabs = v20(v27(v43.allChannelTabs, v45), v47), 
                selectedTabName = v45.Name
            });
        else
            return l_Dictionary_0.join(v43, {
                selectedTabName = if v44.textChannel then v44.textChannel.Name else nil
            });
        end;
    end, 
    [v11.name] = function(v48, v49) --[[ Line: 181 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy)
        v5:trace("IncomingMessageReceived dispatched");
        local v50 = nil;
        if v49.textChatMessage.TextChannel then
            v50 = v49.textChatMessage.TextChannel.Name;
            if v49.textChatMessage.TextChannel.Name == "RBXSystem" then
                v50 = "RBXGeneral";
            end;
        end;
        local v51 = v48.allChannelTabs[v50];
        if v51 == nil then
            return v48;
        elseif v49.isSenderLocalPlayer or v51.Name == v48.selectedTabName then
            return v48;
        else
            return l_Dictionary_0.join(v48, {
                allChannelTabs = l_Dictionary_0.join(v48.allChannelTabs, {
                    [v51.Name] = l_Dictionary_0.join(v51, {
                        HasUnreadMessages = true
                    })
                })
            });
        end;
    end
});