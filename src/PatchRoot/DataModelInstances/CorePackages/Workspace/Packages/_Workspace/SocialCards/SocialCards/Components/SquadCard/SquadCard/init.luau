local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCards");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Http);
local v6 = require(l_Parent_0.LuauPolyfill);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.SquadsCore);
local l_useCurrentSquadSelector_0 = require(l_Parent_0.RoduxSquads).Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_NetworkingSquads_0 = v8.Http.NetworkingSquads;
local l_SquadExternalContractContext_0 = v8.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadViewFlags_0 = v8.SquadExternalContractProvider.SquadViewFlags;
local l_clearInterval_0 = v6.clearInterval;
local l_setInterval_0 = v6.setInterval;
local v18 = require(l_script_FirstAncestor_0.Components.SquadCard.SquadStartedCard);
local v19 = require(l_script_FirstAncestor_0.Components.SquadCard.SquadEndedCard);
local v20 = game:DefineFastFlag("SquadCardOptimizationsEnabled", false);
return function(v21) --[[ Line: 37 ]] --[[ Name: SquadCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v7 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useNavigationFocus_0 (copy), l_SquadViewFlags_0 (copy), l_dependencyArray_0 (copy), v20 (copy), v2 (copy), l_NetworkingSquads_0 (copy), v5 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), v18 (copy), v19 (copy), v4 (copy)
    local v22 = l_useDispatch_0();
    local v23 = l_useLocalUserId_0();
    local v24 = v7.useContext(l_SquadExternalContractContext_0);
    local v25 = l_useCurrentSquadSelector_0();
    local v26 = if v25 then v25.squadId == v21.group_up_id else false;
    local v27, v28 = v7.useState(v21.is_alive);
    local v29, v30 = v7.useState(v21.participant_user_ids);
    local v31 = l_useNavigationFocus_0();
    local v32 = v26 and v31;
    v7.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v32 (copy), v24 (copy), l_SquadViewFlags_0 (ref)
        if v32 then
            v24.updateSquadViewFlags(l_SquadViewFlags_0.SquadSystemMessage, true);
        end;
        return function() --[[ Line: 55 ]]
            -- upvalues: v32 (ref), v24 (ref), l_SquadViewFlags_0 (ref)
            if v32 then
                v24.updateSquadViewFlags(l_SquadViewFlags_0.SquadSystemMessage, false);
            end;
        end;
    end, l_dependencyArray_0(v24.updateSquadViewFlags, v32));
    v7.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v26 (copy), v25 (copy), v30 (copy), v20 (ref), v2 (ref), v21 (copy), v23 (copy)
        if v26 then
            local v33 = {};
            for _, v35 in ipairs(v25.members) do
                table.insert(v33, v35.userId);
            end;
            v30(v33);
            return;
        else
            if v20 then
                v30(v2.List.filter(v21.participant_user_ids, function(v36) --[[ Line: 76 ]]
                    -- upvalues: v23 (ref)
                    return tostring(v36) ~= v23;
                end));
            end;
            return;
        end;
    end, l_dependencyArray_0(v25, v26, v30, v23, v21.participant_user_ids));
    local v43 = v7.useCallback(function(v37) --[[ Line: 84 ]]
        -- upvalues: v22 (copy), l_NetworkingSquads_0 (ref), v30 (copy), v5 (ref), v28 (copy)
        v22(l_NetworkingSquads_0.GetSquadFromSquadId.API({
            squadId = v37
        })):andThen(function(v38) --[[ Line: 86 ]]
            -- upvalues: v30 (ref)
            if v38 and v38.responseBody and v38.responseBody.groupUp and v38.responseBody.groupUp.members then
                local v39 = {};
                for _, v41 in ipairs(v38.responseBody.groupUp.members) do
                    table.insert(v39, v41.userId);
                end;
                v30(v39);
            end;
        end):catch(function(v42) --[[ Line: 100 ]]
            -- upvalues: v5 (ref), v28 (ref)
            if v42.StatusCode == v5.StatusCodes.NOT_FOUND then
                v28(false);
                return;
            else
                warn("Unsupported error type");
                return;
            end;
        end);
    end, {
        v22
    });
    v7.useEffect(function() --[[ Line: 109 ]]
        -- upvalues: v27 (copy), v26 (copy), l_setInterval_0 (ref), v43 (copy), v21 (copy), l_clearInterval_0 (ref)
        local v44 = nil;
        if v27 and not v26 then
            v44 = l_setInterval_0(function() --[[ Line: 113 ]]
                -- upvalues: v43 (ref), v21 (ref)
                v43(v21.group_up_id);
            end, 10000);
        end;
        return function() --[[ Line: 118 ]]
            -- upvalues: v44 (ref), l_clearInterval_0 (ref)
            if v44 then
                l_clearInterval_0(v44);
            end;
        end;
    end, l_dependencyArray_0(v43, v27, v26, v21.group_up_id));
    local v45 = v7.useMemo(function() --[[ Line: 125 ]]
        -- upvalues: v27 (copy), v7 (ref), v18 (ref), v21 (copy), v29 (copy), v19 (ref)
        if v27 then
            return (v7.createElement(v18, {
                conversationId = v21.conversation_id, 
                participantUserIds = v29, 
                squadLocation = v21.moduleLocation
            }));
        else
            return (v7.createElement(v19, {
                conversationId = v21.conversation_id, 
                squadLocation = v21.moduleLocation
            }));
        end;
    end, l_dependencyArray_0(v27, v29, v21.conversation_id, v21.group_up_id));
    return v7.createElement(v4.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0, 280, 0, 0)
    }, v45);
end;