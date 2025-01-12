local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.HttpRequest);
local l_NavigateSideways_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateSideways;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v7 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v8 = require(l_script_FirstAncestor_0.Thunks.FetchDialog);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSeconds);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryTimes);
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppChallengeDialogFetchDialogConditionally);
local v12 = v4.config({
    requestFunction = v4.requestFunctions.RequestInternal
});
return v3.connect(function(_, _) --[[ Line: 121 ]]
    return {};
end, function(v15) --[[ Line: 123 ]]
    -- upvalues: l_NavigateSideways_0 (copy), v8 (copy)
    return {
        navigateToPage = function(v16, v17) --[[ Line: 127 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v15 (copy), l_NavigateSideways_0 (ref)
            return v15(l_NavigateSideways_0(v16, v17));
        end, 
        fetchDialog = function(v18) --[[ Line: 130 ]] --[[ Name: fetchDialog ]]
            -- upvalues: v15 (copy), v8 (ref)
            return v15(v8(v18));
        end
    };
end)(function(v19) --[[ Line: 31 ]]
    -- upvalues: v12 (copy), v7 (copy), l_AppPage_0 (copy), v2 (copy), v11 (copy), v9 (copy), v10 (copy)
    local l_RobloxEventReceiver_0 = v19.RobloxEventReceiver;
    local v21 = 0;
    local v22 = false;
    local function v27() --[[ Line: 36 ]]
        -- upvalues: v19 (copy), v12 (ref), v7 (ref), l_AppPage_0 (ref)
        v19.fetchDialog(v12):andThen(function(v23) --[[ Line: 39 ]]
            -- upvalues: v7 (ref), v19 (ref), l_AppPage_0 (ref)
            local v24 = v23.dialogs[1];
            if v24 ~= nil then
                local v25 = v24.isExpired and v7.ChallengeDialogExpired or v7.ChallengeDialogApproval;
                v19.navigateToPage({
                    name = l_AppPage_0.ChallengeDialogModalContainer, 
                    extraProps = {
                        modalState = v25, 
                        dialogItem = v24
                    }
                });
            end;
        end):catch(function(_) --[[ Line: 53 ]]

        end):await();
    end;
    v2.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: l_RobloxEventReceiver_0 (copy), v11 (ref), v27 (copy), v21 (ref), v22 (ref), v9 (ref), v10 (ref)
        local v36 = {
            l_RobloxEventReceiver_0:observeEvent("signalR", function(v28, _, v30) --[[ Line: 62 ]]
                -- upvalues: v11 (ref), v27 (ref), v21 (ref), v22 (ref)
                if v28 == Enum.ConnectionState.Connected then
                    if not v11() then
                        v27();
                        return;
                    elseif v30 and v30.ChallengeDialogNotification then
                        if v21 ~= v30.ChallengeDialogNotification and not v22 then
                            v27();
                        end;
                        v21 = v30.ChallengeDialogNotification;
                    end;
                end;
            end), 
            l_RobloxEventReceiver_0:observeEvent("ChallengeDialogNotification", function(v31) --[[ Line: 79 ]]
                -- upvalues: v21 (ref), v22 (ref), v27 (ref)
                v21 = v31.SequenceNumber;
                if not v22 then
                    v27();
                end;
            end), 
            l_RobloxEventReceiver_0:observeEvent("AppInput", function(_, v33) --[[ Line: 90 ]]
                -- upvalues: v22 (ref), v9 (ref), v10 (ref), v27 (ref)
                if v33 == "Focused" then
                    v22 = false;
                    local v34 = v9();
                    for v35 = 1, v10() + 1 do
                        task.delay(v35 * v34, v27);
                    end;
                    return;
                elseif v33 == "Unfocused" then
                    v22 = true;
                    return;
                else
                    v22 = false;
                    return;
                end;
            end)
        };
        return function() --[[ Line: 111 ]]
            -- upvalues: v36 (copy)
            for _, v38 in pairs(v36) do
                v38:disconnect();
            end;
        end;
    end, {});
    return nil;
end);