local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableCFM);
local v4 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatUsePaginatedFriends);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
return function() --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_Parent_0 (copy), l_script_FirstAncestor_0 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v2.combineReducers({
        PlaceInfos = require(l_Parent_0.PlaceInfoRodux).Reducers.PlaceInfosReducer, 
        PlaceInfosAsync = require(l_Parent_0.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer, 
        Aliases = require(script.Aliases), 
        AppLoaded = require(l_script_FirstAncestor_0.installReducer.AppLoaded), 
        ChatSettings = require(l_script_FirstAncestor_0.installReducer.ChatSettings), 
        Conversations = require(l_script_FirstAncestor_0.installReducer.Conversations), 
        ConversationsAsync = require(l_script_FirstAncestor_0.installReducer.ConversationsAsync), 
        Friends = if not not v3() or v4() then require(script.Friends) else nil, 
        ExternalNavigationRequest = require(l_script_FirstAncestor_0.installReducer.ExternalNavigationRequest), 
        LastEntryPoint = require(script.LastEntryPoint), 
        Modals = if v5() then require(script.Modals) else nil, 
        Presence = require(script.Presence), 
        ToggleChatPaused = require(l_script_FirstAncestor_0.installReducer.ToggleChatPaused), 
        networkStatus = require(l_script_FirstAncestor_0.Http.RoduxNetworking).installReducer(), 
        UnfilteredThreads = require(l_script_FirstAncestor_0.installReducer.UnfilteredThreads), 
        unreadMessageCount = require(script.UnreadMessageCount)
    });
end;