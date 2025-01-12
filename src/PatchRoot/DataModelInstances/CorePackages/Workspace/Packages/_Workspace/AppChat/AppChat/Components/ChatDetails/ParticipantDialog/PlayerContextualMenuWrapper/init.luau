local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Component_0 = require(l_Parent_0.PlayerContextualMenu).Component;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SocialCommon);
local v5 = require(l_Parent_0.UIBlox);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_Parent_0.Responsive);
local l_memo_0 = v3.memo;
local l_convertUserPresenceTypeToString_0 = v4.Utils.convertUserPresenceTypeToString;
local l_Images_0 = v5.App.ImageSet.Images;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_useEffect_0 = v3.useEffect;
local v15 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v16 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v17 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local _ = require(l_script_FirstAncestor_0.types);
local l_GetFFlagAddAdditionalButtonsProp_0 = require(l_Parent_0.SharedFlags).GetFFlagAddAdditionalButtonsProp;
local v20 = game:DefineFastFlag("AppChatDisablePCMExperienceCTAs", false);
local v21 = game:DefineFastFlag("AppChatDisablePCMExperienceCTAsInExp", false);
local v22 = game:DefineFastFlag("UseBreakpointForPCM", false);
PlayerContextualMenuWrapper = function(v23) --[[ Line: 44 ]] --[[ Name: PlayerContextualMenuWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), v9 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v17 (copy), l_dependencyArray_0 (copy), v15 (copy), v20 (copy), v21 (copy), v3 (copy), l_Interactable_0 (copy), l_Component_0 (copy), l_convertUserPresenceTypeToString_0 (copy), v16 (copy), l_GetFFlagAddAdditionalButtonsProp_0 (copy), l_Images_0 (copy), v22 (copy)
    local v24 = l_useDispatch_0();
    local v25 = v9.useBreakpointXOrSmaller(v9.Keys.Small);
    local v27 = l_useSelector_0(function(v26) --[[ Line: 48 ]]
        return v26.ChatAppReducer.Presence.byUserId;
    end)[v23.participantId];
    local v29 = l_useSelector_0(function(v28) --[[ Line: 53 ]]
        return v28.ChatAppReducer.Friends.friendshipStatus;
    end)[v23.participantId];
    l_useEffect_0(function() --[[ Line: 58 ]]
        -- upvalues: v24 (copy), v17 (ref), v23 (copy)
        v24(v17.GetExtendedFriendshipStatus.API({
            targetUserId = v23.participantId
        }));
    end, l_dependencyArray_0(v23.participantId));
    local v30 = v15();
    local v31 = not v20 and (not v21 or not v30 or false);
    return v3.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        onStateChanged = function() --[[ Line: 73 ]] --[[ Name: onStateChanged ]]

        end, 
        [v3.Event.Activated] = v23.onDismiss
    }, {
        PCM = v3.createElement(l_Component_0, {
            enableExperienceCTAs = v31, 
            subjectPresence = if v27 then {
                locationString = v27.lastLocation, 
                locationPlaceId = v27.placeId, 
                locationRootPlaceId = v27.rootPlaceId, 
                locationUniverseId = v27.universeId, 
                status = l_convertUserPresenceTypeToString_0(v27.userPresenceType)
            } else nil, 
            subjectUserId = v23.participantId, 
            robloxFriendshipStatus = v29, 
            closeCentralOverlayThunk = function() --[[ Line: 89 ]] --[[ Name: closeCentralOverlayThunk ]]

            end, 
            onReportActivated = v23.openReportUser and function() --[[ Line: 90 ]]
                -- upvalues: v16 (ref), v23 (copy)
                v16:info("User activated reportUser | userId: {}, conversationId: {}", v23.participantId, v23.conversationId);
                v23.openReportUser(v23.participantId, v23.conversationId);
            end, 
            additionalButtons = if l_GetFFlagAddAdditionalButtonsProp_0() and v23.showRemoveUserButton then {
                {
                    icon = l_Images_0["icons/actions/leave"], 
                    text = v23.removeFromGroupText, 
                    onActivated = function() --[[ Line: 103 ]] --[[ Name: onActivated ]]
                        -- upvalues: v23 (copy)
                        v23.openRemoveUserDialog(v23.participantId, v23.conversationId);
                    end
                }
            } else nil, 
            width = if v22 then UDim.new(0, v25 and 300 or 400) else nil
        })
    });
end;
return l_memo_0(PlayerContextualMenuWrapper);