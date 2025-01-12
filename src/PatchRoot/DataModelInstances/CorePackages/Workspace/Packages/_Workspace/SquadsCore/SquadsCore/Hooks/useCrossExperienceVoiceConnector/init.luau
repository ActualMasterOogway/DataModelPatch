local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v4 = require(script.Parent.useCurrentSquadMember);
local v5 = require(script.Parent.useIsLocalPlayerPartyVoiceEligible);
local v6 = require(script.Parent.useIsCurrentSquadPartyVoiceEligible);
local v7 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local v8 = require(l_Parent_0.CrossExperienceVoice);
local v9 = require(l_Parent_0.React);
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local v12 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = require(l_Parent_0.SharedFlags).getFFlagEnableCrossExpVoiceMemoryCheck;
local l_default_0 = v8.CrossExperienceVoiceManager.default;
local l_useIsBackgroundDMActive_0 = v8.Hooks.useIsBackgroundDMActive;
local v16 = game:DefineFastFlag("PartyVoiceShouldConnect", false);
useCrossExperienceVoiceConnector = function() --[[ Line: 28 ]] --[[ Name: useCrossExperienceVoiceConnector ]]
    -- upvalues: l_Players_0 (copy), v7 (copy), v4 (copy), v9 (copy), v3 (copy), l_useStore_0 (copy), l_usePrevious_0 (copy), v6 (copy), l_useIsBackgroundDMActive_0 (copy), v5 (copy), v16 (copy), l_default_0 (copy), v12 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy)
    local v17 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    local v18 = v7() or "";
    local v19 = v4(v17);
    local v20 = v9.useContext(v3);
    local v21 = l_useStore_0();
    local v22 = v9.useRef(nil);
    local v23 = l_usePrevious_0(v18);
    local v24 = v6();
    local v25 = l_useIsBackgroundDMActive_0();
    local v26 = v5();
    local v27 = nil;
    v27 = if v16 then v18 and v18 ~= "" and v19 and not v25 and v24 and v26 else v18 and v18 ~= "" and v18 ~= v23 and v19 and not v25 and v24 and v26;
    v9.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v25 (copy), l_default_0 (ref)
        if v25 then
            l_default_0:setAsConnected();
        end;
    end, {
        v25
    });
    local v31 = v9.useCallback(function(v28, v29, v30) --[[ Line: 64 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:join({
            partyId = v28, 
            force = v29, 
            shouldIgnoreMemoryWarning = v30
        });
    end, {});
    v9.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v27 (ref), l_default_0 (ref), v31 (copy), v18 (copy), v20 (copy), v21 (copy), v12 (ref)
        if not v27 then
            return;
        elseif l_default_0:performJoinFeasibilityCheck() then
            v31(v18);
            return;
        else
            v20.setSquadPrompt(v21, {
                hideCancelButton = false, 
                promptType = v12.JoinWithLowMemory, 
                onConfirm = function() --[[ Line: 85 ]] --[[ Name: onConfirm ]]

                end, 
                onCancel = function() --[[ Line: 86 ]] --[[ Name: onCancel ]]
                    -- upvalues: v31 (ref), v18 (ref)
                    v31(v18, true, true);
                end
            });
            return;
        end;
    end, {
        v27
    });
    local v32 = v9.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:leave();
    end, {});
    v9.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v22 (copy), l_default_0 (ref), v20 (copy), v21 (copy), v12 (ref), v32 (copy)
        if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
            return function() --[[ Line: 100 ]]

            end;
        else
            local function _() --[[ Line: 103 ]]
                -- upvalues: v22 (ref)
                if v22.current then
                    v22.current:Disconnect();
                    v22.current = nil;
                end;
            end;
            v22.current = l_default_0.MemoryLow.Event:Connect(function() --[[ Line: 110 ]]
                -- upvalues: v22 (ref), v20 (ref), v21 (ref), v12 (ref), v32 (ref)
                if v22.current then
                    v22.current:Disconnect();
                    v22.current = nil;
                end;
                v20.setSquadPrompt(v21, {
                    hideCancelButton = false, 
                    promptType = v12.DisconnectVoiceDueToLowMemory, 
                    onConfirm = function() --[[ Line: 117 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v32 (ref)
                        v32();
                    end
                });
            end);
            return function() --[[ Line: 122 ]]
                -- upvalues: v22 (ref)
                if v22.current then
                    v22.current:Disconnect();
                    v22.current = nil;
                end;
            end;
        end;
    end);
    return v32;
end;
return useCrossExperienceVoiceConnector;