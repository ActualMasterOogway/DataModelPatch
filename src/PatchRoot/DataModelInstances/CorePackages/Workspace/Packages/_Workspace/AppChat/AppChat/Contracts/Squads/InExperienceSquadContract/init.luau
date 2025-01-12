local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SquadsCore);
local l_SetSquadPrompt_0 = v4.Actions.SetSquadPrompt;
local l_CloseSquadPrompt_0 = v4.Actions.CloseSquadPrompt;
local l_SquadRootViewType_0 = v4.Enums.SquadRootViewType;
local l_makeSquadContract_0 = v4.SquadExternalContractProvider.makeSquadContract;
local v9 = require(l_script_FirstAncestor_0.App.InExperienceAppChatModal);
local v10 = require(script.Parent.SquadContract);
return (l_makeSquadContract_0(v2.Dictionary.union(v10, {
    setSquadPrompt = function(v11, v12) --[[ Line: 18 ]]
        -- upvalues: l_SetSquadPrompt_0 (copy)
        v11:dispatch(l_SetSquadPrompt_0(v12));
    end, 
    closeSquadPrompt = l_CloseSquadPrompt_0, 
    useSquadRootView = function() --[[ Line: 22 ]]
        -- upvalues: v3 (copy), l_SquadRootViewType_0 (copy), v9 (copy)
        local v13, v14 = v3.useState(l_SquadRootViewType_0.None);
        v3.useEffect(function() --[[ Line: 24 ]]
            -- upvalues: v9 (ref), v14 (copy), l_SquadRootViewType_0 (ref)
            local v16 = v9.default.visibilitySignal.Event:Connect(function(v15) --[[ Line: 25 ]]
                -- upvalues: v14 (ref), l_SquadRootViewType_0 (ref)
                if v15 then
                    v14(l_SquadRootViewType_0.InExperienceAppChatModal);
                    return;
                else
                    v14(l_SquadRootViewType_0.None);
                    return;
                end;
            end);
            return function() --[[ Line: 33 ]]
                -- upvalues: v16 (copy)
                if v16 then
                    v16:Disconnect();
                end;
            end;
        end, {});
        return v13;
    end
})));