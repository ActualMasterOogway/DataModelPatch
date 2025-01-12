local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.HttpRequest);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local v7 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v8 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v9 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogAlreadyCompleted);
local v10 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogApproval);
local v11 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogDenied);
local v12 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogExpired);
local v13 = require(l_script_FirstAncestor_0.Thunks.FetchDialog);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogPollingIntervalSeconds);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v16 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal
});
local v17 = {
    [v7.ChallengeDialogApproval] = v10, 
    [v7.ChallengeDialogDenied] = v11, 
    [v7.ChallengeDialogExpired] = v12, 
    [v7.ChallengeDialogAlreadyCompleted] = v9
};
return v3.connect(function(_, _) --[[ Line: 121 ]]
    return {};
end, function(v20) --[[ Line: 123 ]]
    -- upvalues: l_NavigateBack_0 (copy), v13 (copy)
    return {
        navigateBack = function() --[[ Line: 125 ]] --[[ Name: navigateBack ]]
            -- upvalues: v20 (copy), l_NavigateBack_0 (ref)
            return v20(l_NavigateBack_0());
        end, 
        fetchDialog = function(v21) --[[ Line: 128 ]] --[[ Name: fetchDialog ]]
            -- upvalues: v20 (copy), v13 (ref)
            return v20(v13(v21));
        end
    };
end)(function(v22) --[[ Line: 34 ]]
    -- upvalues: v2 (copy), v7 (copy), v15 (copy), v8 (copy), v16 (copy), v14 (copy), v17 (copy), v4 (copy)
    local v23, v24 = v2.useState(v22);
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v23 (copy), v7 (ref), v15 (ref), v8 (ref), v22 (copy)
        if v23.modalState == v7.ChallengeDialogApproval or v23.modalState == v7.ChallengeDialogExpired then
            v15.sendDialogOpenedEvent(v8.toRawValue(v8.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v22.dialogItem.typeInternalId, v22.dialogItem.isExpired);
        end;
    end, {
        v23
    });
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v23 (copy), v7 (ref), v22 (copy), v16 (ref), v24 (copy), v14 (ref)
        local v29 = task.spawn(function() --[[ Line: 51 ]]
            -- upvalues: v23 (ref), v7 (ref), v22 (ref), v16 (ref), v24 (ref), v14 (ref)
            while v23.modalState == v7.ChallengeDialogApproval or v23.modalState == v7.ChallengeDialogExpired do
                v22.fetchDialog(v16):andThen(function(v25) --[[ Line: 58 ]]
                    -- upvalues: v23 (ref), v7 (ref), v24 (ref), v22 (ref)
                    local v26 = v25.dialogs[1];
                    if v26 ~= nil then
                        if v23.modalState == v7.ChallengeDialogApproval and v26.isExpired then
                            v24({
                                modalState = v7.ChallengeDialogExpired, 
                                dialogItem = v26
                            });
                            return;
                        end;
                    else
                        v22.navigateBack();
                    end;
                end):catch(function(_) --[[ Line: 74 ]]

                end):await();
                local v28 = v14();
                task.wait(v28);
            end;
        end);
        return function() --[[ Line: 83 ]]
            -- upvalues: v29 (copy)
            task.cancel(v29);
        end;
    end, {
        v23.modalState
    });
    local function v34() --[[ Line: 88 ]]
        -- upvalues: v22 (copy), v16 (ref), v7 (ref), v24 (copy)
        v22.fetchDialog(v16):andThen(function(v30) --[[ Line: 91 ]]
            -- upvalues: v7 (ref), v24 (ref), v22 (ref)
            local v31 = v30.dialogs[1];
            if v31 ~= nil then
                local v32 = v31.isExpired and v7.ChallengeDialogExpired or v7.ChallengeDialogApproval;
                v24({
                    modalState = v32, 
                    dialogItem = v31
                });
                return;
            else
                v22.navigateBack();
                return;
            end;
        end):catch(function(_) --[[ Line: 104 ]]
            -- upvalues: v22 (ref)
            v22.navigateBack();
        end):await();
    end;
    local v35 = v17[v23.modalState];
    return v35 and v2.createElement(v35, v4.Dictionary.join(v23, {
        navigateToModalState = v24, 
        closeModal = v34
    }));
end);