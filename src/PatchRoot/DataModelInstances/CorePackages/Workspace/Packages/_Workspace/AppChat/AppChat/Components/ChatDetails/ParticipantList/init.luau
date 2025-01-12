local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useState_0 = v4.useState;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v10 = require(script.Parent.Logger);
local l_presenceSortComparator_0 = v2.Utils.presenceSortComparator;
local l_SortedList_0 = v2.Components.SortedList;
local v13 = require(l_script_FirstAncestor_0.Components.Cells.UserCell);
local v14 = require(script.Parent.ParticipantEntryRightFrame);
local v16 = {
    entries = {}, 
    entryHeight = 64, 
    onEntryActivated = function(_) --[[ Line: 36 ]] --[[ Name: onEntryActivated ]]
        -- upvalues: v10 (copy)
        v10:warning("onEntryActivated was not passed to ParticipantList");
    end, 
    pendingKey = "Feature.Chat.Label.Pending", 
    sortComparator = l_presenceSortComparator_0, 
    LayoutOrder = 0
};
ParticipantList = function(v17) --[[ Line: 48 ]] --[[ Name: ParticipantList ]]
    -- upvalues: v3 (copy), v16 (copy), l_useStyle_0 (copy), l_useState_0 (copy), v4 (copy), v13 (copy), l_useLocalization_0 (copy), v14 (copy), l_SortedList_0 (copy)
    local v18 = v3.Dictionary.join(v16, v17);
    local v19 = l_useStyle_0();
    local v20, v21 = l_useState_0(v18.childWidth);
    local function v25(v22, v23) --[[ Line: 53 ]]
        -- upvalues: v18 (copy), v4 (ref), v13 (ref), v19 (copy), v20 (copy)
        local v24 = nil;
        v24 = if v22.presenceText == "Common.Presence.Label.Online" then v18.onlinePresenceText else if v22.presenceText == "Common.Presence.Label.Offline" then v18.offlinePresenceText else v22.presenceText;
        return v4.createElement(v13, {
            boldTitle = true, 
            showDivider = not v23, 
            subTitleText = v24, 
            style = v19, 
            user = v22, 
            childWidth = v20, 
            onActivated = function() --[[ Line: 71 ]] --[[ Name: onActivated ]]
                -- upvalues: v18 (ref), v22 (copy)
                v18.onEntryActivated(v22);
            end
        }, v22.children);
    end;
    local v26 = l_useLocalization_0({
        pendingLabelText = v18.pendingKey
    });
    local v27 = {};
    for _, v29 in pairs(v18.entries) do
        local v30 = {};
        local v31 = not v29.isLocalUser;
        local v32 = v29.metadata and v29.metadata.isPending;
        if v31 or v32 then
            v30.children = {
                rightFrame = v4.createElement(v14, {
                    labelText = if v32 then v26.pendingLabelText else nil, 
                    shouldShowDots = v31, 
                    [v4.Change.AbsoluteSize] = function(v33) --[[ Line: 92 ]]
                        -- upvalues: v21 (copy)
                        v21(function(v34) --[[ Line: 93 ]]
                            -- upvalues: v33 (copy)
                            return (math.max(v34, v33.AbsoluteSize.X));
                        end);
                    end
                })
            };
        end;
        table.insert(v27, v3.Dictionary.join(v30, v29));
    end;
    return v4.createElement(l_SortedList_0, {
        entries = v27, 
        entryHeight = v18.entryHeight, 
        renderEntry = v25, 
        sortComparator = v18.sortComparator, 
        LayoutOrder = v18.LayoutOrder
    });
end;
return l_memo_0(ParticipantList);