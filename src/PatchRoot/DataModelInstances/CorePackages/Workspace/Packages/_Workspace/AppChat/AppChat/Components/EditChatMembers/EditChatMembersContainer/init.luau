local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.SocialLibraries);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Promise);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local l_useRef_0 = v5.useRef;
local v15 = require(l_Parent_0.AppChatNetworking);
local v16 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v17 = require(l_script_FirstAncestor_0.Conversations.Thunks.parseCreateConversationErrors);
local v18 = require(l_script_FirstAncestor_0.Conversations.Thunks.expandToGroupConversation);
local v19 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_ResponseIndicator_0 = v3.Components.ResponseIndicator;
local v21 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.SelectChatMembersContainer);
local v22 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatExpandToGroupConversation);
local v25 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatAddParticipantErrorToast);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatFixDuplicateConversationCreation);
local v30 = {
    systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
    pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Heading.PartyWithFriends" or "Feature.Chat.Heading.ChatWithFriends", 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    topBarHeight = nil, 
    conversation = nil, 
    setSystemButtonActivated = function(_) --[[ Line: 76 ]] --[[ Name: setSystemButtonActivated ]]

    end, 
    setSystemButtonEnabled = function(_) --[[ Line: 77 ]] --[[ Name: setSystemButtonEnabled ]]

    end
};
return l_memo_0(function(v31) --[[ Line: 81 ]] --[[ Name: EditChatMembersContainer ]]
    -- upvalues: v4 (copy), v30 (copy), l_useRef_0 (copy), l_useState_0 (copy), v19 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), l_useDispatch_0 (copy), v15 (copy), l_dependencyArray_0 (copy), v16 (copy), v27 (copy), v6 (copy), v25 (copy), v17 (copy), v22 (copy), v24 (copy), v18 (copy), l_useEffect_0 (copy), v5 (copy), l_ResponseIndicator_0 (copy), v21 (copy)
    local v32 = v4.Dictionary.join(v30, v31);
    local v33 = l_useRef_0({});
    local v34 = l_useRef_0(false);
    local v35, v36 = l_useState_0(false);
    local v37 = v19();
    local v39 = l_useSelector_0(l_useCallback_0(function(v38) --[[ Line: 88 ]]
        return v38.LocalUserId;
    end, {}));
    local v40 = l_useDispatch_0();
    local v43 = l_useCallback_0(function(v41, v42) --[[ Line: 94 ]]
        -- upvalues: v40 (copy), v15 (ref)
        return v40(v15.rodux.AddUserToConversation.API(v42, v41));
    end, l_dependencyArray_0(v40));
    local v45 = l_useCallback_0(function(v44) --[[ Line: 98 ]]
        -- upvalues: v40 (copy), v16 (ref), v37 (copy)
        return v40(v16("group", v44, v37, "userAddedParticipantToOneToOne"));
    end, l_dependencyArray_0(v40));
    local v47 = l_useCallback_0(function(v46) --[[ Line: 104 ]]
        -- upvalues: v32 (copy)
        v32.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v46
                }
            }
        });
    end, l_dependencyArray_0(v32.navigateToToast));
    local function v52(v48, v49) --[[ Line: 114 ]]
        -- upvalues: v33 (copy), v4 (ref), v34 (copy), v32 (copy)
        v33.current = v4.List.map(v48, function(v50) --[[ Line: 115 ]]
            return v50.id;
        end);
        local v51 = v49 <= #v48;
        if v34.current ~= v51 then
            v34.current = v51;
            v32.setSystemButtonEnabled(v51);
        end;
    end;
    local function v65(v53) --[[ Line: 126 ]]
        -- upvalues: v27 (ref), v35 (copy), v6 (ref), v32 (copy), v25 (ref), v17 (ref), v47 (copy), v36 (copy), v22 (ref), v43 (copy), v33 (copy), v4 (ref), v39 (copy), v24 (ref), v40 (copy), v18 (ref), v37 (copy), v45 (copy)
        if v27() and v35 then
            return v6.resolve();
        else
            local l_id_0 = v32.conversation.id;
            local l_conversationType_0 = v32.conversation.conversationType;
            local function v58(v56) --[[ Line: 132 ]]
                -- upvalues: v25 (ref), v17 (ref), v53 (copy), v47 (ref), v36 (ref)
                if v25() then
                    local v57 = if v17(v56) == "participant_chat_disabled" then v53.invalidParticipantText else v53.networkErrorText;
                    v47(v57);
                else
                    v47(v53.networkErrorText);
                end;
                v36(false);
            end;
            v36(true);
            if l_conversationType_0 == v22.Type.MULTI_USER_CONVERSATION then
                return v43(v33.current, l_id_0):andThen(function() --[[ Line: 148 ]]
                    -- upvalues: v32 (ref), l_id_0 (copy)
                    v32.navigateToConversation(l_id_0);
                end, v58);
            elseif l_conversationType_0 == v22.Type.ONE_TO_ONE_CONVERSATION then
                local v60 = v4.List.filter(v4.List.join(v33.current, v32.conversation.participants), function(v59) --[[ Line: 154 ]]
                    -- upvalues: v39 (ref)
                    return v59 ~= v39;
                end);
                if v24() and (v32.conversation.source == "channels" or v32.conversation.source == "chat") then
                    return v40(v18(l_id_0, v60, v37)):andThen(function(v61) --[[ Line: 165 ]]
                        -- upvalues: v32 (ref)
                        v32.navigateToConversation(v61.id);
                    end, v58);
                else
                    return v45(v60):andThen(function(v62) --[[ Line: 169 ]]
                        -- upvalues: v32 (ref)
                        v32.navigateToConversation(v62.id);
                    end, v58);
                end;
            else
                local v63 = {
                    Body = "conversationType not supported", 
                    StatusCode = 400
                };
                if v25() then
                    local v64 = if v17(v63) == "participant_chat_disabled" then v53.invalidParticipantText else v53.networkErrorText;
                    v47(v64);
                else
                    v47(v53.networkErrorText);
                end;
                v36(false);
                return v6.reject(string.format("conversationType not supported: %q", (tostring(l_conversationType_0))));
            end;
        end;
    end;
    local v66 = if v27() then l_useCallback_0(v65, {
        v40, 
        v35, 
        v36, 
        v33, 
        v32.navigateToConversation, 
        v32.conversation.id, 
        v32.conversation.conversationType, 
        v32.conversation.participants, 
        v32.conversation.source, 
        v47, 
        v37
    }) else nil;
    if v27() then
        l_useEffect_0(function() --[[ Line: 198 ]]
            -- upvalues: v32 (copy), v66 (copy)
            v32.setSystemButtonActivated(v66);
        end, {
            v32.setSystemButtonActivated, 
            v66
        });
    else
        l_useEffect_0(function() --[[ Line: 202 ]]
            -- upvalues: v32 (copy), v65 (copy)
            v32.setSystemButtonActivated(v65);
        end, {});
    end;
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        responseIndicator = v35 and v5.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        selectChatMembers = v5.createElement(v21, v4.Dictionary.join(v32, {
            maxSelections = v32.maxSelections - #v32.conversation.participants + 1, 
            selectedUsersChanged = v52, 
            localUserId = v39
        }))
    });
end);