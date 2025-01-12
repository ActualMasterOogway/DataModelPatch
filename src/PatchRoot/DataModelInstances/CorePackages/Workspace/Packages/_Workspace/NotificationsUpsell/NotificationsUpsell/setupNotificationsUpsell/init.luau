local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.NotificationModalsManager);
local v2 = require(script.Parent.Components.NotificationsUpsellModal);
local l_GetGameNameAndDescription_0 = require(l_Parent_0.GameDetailRodux).GetGameNameAndDescription;
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v5 = require(script.Parent.Analytics.ModalEventConstants);
local v6 = require(l_Parent_0.HttpRequest);
local v7 = v6.config({
    requestFunction = v6.requestFunctions.HttpRbxApi
});
local v8 = game:DefineFastFlag("NotificationsUpsellDisableBackgroundDismiss", false);
local function v17(v9) --[[ Line: 18 ]] --[[ Name: openModal ]]
    -- upvalues: l_sendEventDeferred_0 (copy), v5 (copy), v1 (copy), l_GetGameNameAndDescription_0 (copy), v7 (copy), v2 (copy), v8 (copy)
    local function v10() --[[ Line: 19 ]]
        -- upvalues: l_sendEventDeferred_0 (ref), v5 (ref), v9 (copy)
        game:GetService("ExperienceNotificationService"):InvokeOptInPromptClosed();
        l_sendEventDeferred_0(v5.ModalContext, v5.OptInEventName, {
            [v5.ActionType] = v5.Closed, 
            [v5.UniverseId] = v9
        });
    end;
    local function v11() --[[ Line: 26 ]]
        -- upvalues: v1 (ref)
        v1.CloseModal("UENUpsell");
    end;
    local v12 = false;
    local v13 = nil;
    if v9 ~= "0" and v9 ~= "" then
        local v15, v16 = l_GetGameNameAndDescription_0(v7, v9):andThen(function(v14) --[[ Line: 32 ]]
            return v14 and v14.Name;
        end, function() --[[ Line: 34 ]]
            return nil;
        end):await();
        v12 = v15;
        v13 = v16;
    end;
    l_sendEventDeferred_0(v5.ModalContext, v5.OptInEventName, {
        [v5.ActionType] = v5.Opened, 
        [v5.UniverseId] = v9
    });
    v1.OpenModal("UENUpsell", v2, {
        CloseCallback = v10, 
        Props = {
            CloseModal = v11, 
            ExperienceId = v9, 
            ExperienceName = if v12 then v13 else nil
        }, 
        DisableBackgroundDismiss = v8 and true or nil
    });
end;
return function() --[[ Line: 55 ]]
    -- upvalues: v17 (copy)
    game:GetService("ExperienceNotificationService").PromptOptInRequested:Connect(function() --[[ Line: 56 ]]
        -- upvalues: v17 (ref)
        v17((tostring(game.GameId)));
    end);
end;