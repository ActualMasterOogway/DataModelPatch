local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local v9 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v10 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRef_0 = v4.useRef;
local v15 = require(l_Parent_0.AppChatNetworking);
local v16 = require(l_script_FirstAncestor_0.Flags.unfilteredThreadsModalActionConfig);
local v17 = require(script.Parent.UnfilteredThreadsFtux);
local v18 = {
    dismissUpsell = function() --[[ Line: 36 ]] --[[ Name: dismissUpsell ]]

    end, 
    labelKey = "Feature.Chat.Label.New", 
    titleKey = "Feature.Chat.Heading.JoinTheParty", 
    bodyKey = "Feature.Chat.Description.PartyAccessFtux", 
    u13BodyKey = "Feature.Chat.Description.PartyAccessFtuxFriends"
};
return l_memo_0(function(v19) --[[ Line: 45 ]] --[[ Name: JoinPartyUpsellContainer ]]
    -- upvalues: v3 (copy), v18 (copy), l_useDispatch_0 (copy), v9 (copy), v10 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v15 (copy), v16 (copy), l_StatusCodes_0 (copy), l_dependencyArray_0 (copy), l_useCallback_0 (copy), l_useLocalization_0 (copy), v4 (copy), v17 (copy)
    local v20 = v3.Dictionary.join(v18, v19);
    local v21 = l_useDispatch_0();
    local v22 = v9();
    local v23 = v10();
    local v24 = l_useRef_0(false);
    l_useEffect_0(function() --[[ Line: 53 ]]
        -- upvalues: v24 (copy), v22 (copy), v21 (copy), v15 (ref), v16 (ref), l_StatusCodes_0 (ref)
        if v24.current or not v22 then
            return;
        else
            v21(v15.rodux.RecordUnfilteredThreadsModalAction.API(v16.ChatLandingFtuxSeenAction, "party_only_ftux")):andThen(function(v25) --[[ Line: 64 ]]
                -- upvalues: l_StatusCodes_0 (ref), v24 (ref)
                if v25 and v25.responseCode == l_StatusCodes_0.OK then
                    v24.current = true;
                end;
            end):catch(function(v26) --[[ Line: 69 ]]
                warn("Error in JoinPartyUpsellContainer -> RecordUnfilteredThreadsModalAction seen: " .. tostring(v26));
            end);
            return;
        end;
    end, l_dependencyArray_0(v21, v22, v24.current));
    local v28 = l_useCallback_0(function() --[[ Line: 76 ]]
        -- upvalues: v21 (copy), v15 (ref), v16 (ref), v20 (copy)
        v21(v15.rodux.RecordUnfilteredThreadsModalAction.API(v16.ChatLandingFtuxDismissAction, "party_only_ftux")):catch(function(v27) --[[ Line: 82 ]]
            warn("Error in JoinPartyUpsellContainer -> RecordUnfilteredThreadsModalAction dismissed: " .. tostring(v27));
        end);
        v20.dismissUpsell();
    end, l_dependencyArray_0(v20.dismissUpsell, v21));
    local v29 = l_useLocalization_0({
        labelText = v20.labelKey, 
        titleText = v20.titleKey, 
        bodyText = v20.bodyKey, 
        u13BodyText = v20.u13BodyKey
    });
    return v4.createElement(v17, {
        titleLabelText = v29.labelText, 
        titleText = v29.titleText, 
        bodyText = if v23 then v29.bodyText else v29.u13BodyText, 
        hideActionButton = true, 
        onDismissed = v28
    });
end);