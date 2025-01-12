local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local l_ResponseIndicator_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.ResponseIndicator;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local v8 = require(l_Parent_0.Promise);
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local v12 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v15 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v17 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v18 = require(l_script_FirstAncestor_0.Conversations.Thunks.parseCreateConversationErrors);
local v19 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainer);
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v21 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v22 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatAddParticipantErrorToast);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v26 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatFixDuplicateConversationCreation);
local v29 = {
    systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Heading.PartyWithFriends" or "Feature.Chat.Heading.ChatWithFriends", 
    topBarHeight = nil, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    conversation = v15.empty(), 
    setSystemButtonActivated = function(_) --[[ Line: 76 ]] --[[ Name: setSystemButtonActivated ]]

    end, 
    setSystemButtonEnabled = function(_) --[[ Line: 77 ]] --[[ Name: setSystemButtonEnabled ]]

    end
};
CreateNewChatContainer = function(v30) --[[ Line: 81 ]] --[[ Name: CreateNewChatContainer ]]
    -- upvalues: v4 (copy), v29 (copy), l_useRef_0 (copy), l_useState_0 (copy), v23 (copy), v12 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v21 (copy), v26 (copy), v8 (copy), v17 (copy), v24 (copy), v18 (copy), v20 (copy), v22 (copy), l_useEffect_0 (copy), v5 (copy), l_ResponseIndicator_0 (copy), v19 (copy)
    local v31 = v4.Dictionary.join(v29, v30);
    local v32 = l_useRef_0({});
    local v33 = l_useRef_0(false);
    local v34, v35 = l_useState_0(false);
    local l_maxSelections_0 = v31.maxSelections;
    local l_maxConversationSize_0 = v31.maxConversationSize;
    local v38 = false;
    if v23() and not v12() then
        l_maxSelections_0 = 1;
        l_maxConversationSize_0 = 1;
        v38 = true;
    end;
    local v39 = l_useDispatch_0();
    local v41 = l_useCallback_0(function(v40) --[[ Line: 101 ]]
        -- upvalues: v31 (copy)
        v31.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v40
                }
            }
        });
    end, l_dependencyArray_0(v31.navigateToToast));
    local function v46(v42, v43) --[[ Line: 111 ]]
        -- upvalues: v32 (copy), v4 (ref), v33 (copy), v31 (copy)
        v32.current = v4.List.map(v42, function(v44) --[[ Line: 112 ]]
            return v44.id;
        end);
        local v45 = v43 <= #v42;
        if v33.current ~= v45 then
            v33.current = v45;
            v31.setSystemButtonEnabled(v45);
        end;
    end;
    local v47 = v21();
    local function v53(v48) --[[ Line: 125 ]]
        -- upvalues: v26 (ref), v34 (copy), v32 (copy), v8 (ref), v35 (copy), v39 (copy), v17 (ref), v47 (copy), v31 (copy), v24 (ref), v18 (ref), v41 (copy), v20 (ref), v22 (ref)
        if if v26() then v34 or not v32.current else not v32.current then
            return v8.resolve();
        else
            v35(true);
            local v49 = #v32.current == 1 and "one_to_one" or "group";
            return v39(v17(v49, v32.current, v47, "userCreatedNewConversation")):andThen(function(v50) --[[ Line: 148 ]]
                -- upvalues: v31 (ref)
                v31.navigateToConversation(v50.id);
            end):catch(function(v51) --[[ Line: 152 ]]
                -- upvalues: v24 (ref), v18 (ref), v48 (copy), v41 (ref), v35 (ref), v47 (ref), v20 (ref), v22 (ref)
                if v24() then
                    local v52 = if v18(v51) == "participant_chat_disabled" then v48.invalidParticipantText else v48.networkErrorText;
                    v41(v52);
                else
                    v41(v48.networkErrorText);
                end;
                v35(false);
                if v47 then
                    v47.fireAnalyticsEvent(v20.NewConversationCreated, {
                        createConversationResult = v22.FetchConversationError
                    });
                end;
            end);
        end;
    end;
    local v54 = if v26() then l_useCallback_0(v53, {
        v39, 
        v34, 
        v35, 
        v32, 
        v31.navigateToConversation, 
        v41, 
        v47
    }) else nil;
    if v26() then
        l_useEffect_0(function() --[[ Line: 189 ]]
            -- upvalues: v31 (copy), v54 (copy)
            v31.setSystemButtonActivated(v54);
        end, {
            v31.setSystemButtonActivated, 
            v54
        });
    else
        l_useEffect_0(function() --[[ Line: 193 ]]
            -- upvalues: v31 (copy), v53 (copy)
            v31.setSystemButtonActivated(v53);
        end, {});
    end;
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        responseIndicator = v34 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v19, v4.Dictionary.join(v31, {
            selectedUsersChanged = v46, 
            maxSelections = l_maxSelections_0, 
            maxConversationSize = l_maxConversationSize_0, 
            canOnlyCreateOneToOneChat = v38
        }))
    });
end;
return l_memo_0(CreateNewChatContainer);