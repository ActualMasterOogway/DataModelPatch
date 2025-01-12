local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v8 = require(l_Parent_0.Analytics);
local v9 = require(l_Parent_0.Constants);
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v11 = require(l_Parent_1.RobloxTranslator);
local v12 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer);
local v13 = require(l_Actions_0.HideMenu);
local v14 = require(l_Actions_0.HideError);
local v15 = require(l_Actions_0.ShowError);
local v16 = v8.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0));
local function v24(v17, v18, v19, v20) --[[ Line: 30 ]] --[[ Name: handlePlayFailure ]]
    -- upvalues: v16 (copy), v9 (copy), v11 (copy), v15 (copy), v14 (copy), v13 (copy)
    if v18 then
        v16:onEmoteFailed(v19, v20, v18);
        local l_locale_0 = v17:getState().locale;
        local v22 = v9.LocalizationKeys.ErrorMessages[v18];
        local v23 = v11:FormatByKeyForLocale(v22, l_locale_0);
        v17:dispatch(v15(v23));
        delay(v9.ErrorDisplayTimeSeconds, function() --[[ Line: 39 ]]
            -- upvalues: v17 (copy), v14 (ref)
            v17:dispatch(v14());
        end);
    end;
    v17:dispatch(v13());
end;
return function(_, v26, v27, _, _) --[[ Line: 47 ]] --[[ Name: PlayEmote ]]
    -- upvalues: l_LocalPlayer_0 (copy), v12 (copy), v24 (copy), v13 (copy), v16 (copy), v9 (copy)
    return function(v30) --[[ Line: 48 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v12 (ref), v24 (ref), v26 (copy), v27 (copy), v13 (ref), v16 (ref), v9 (ref)
        local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
        if v12(l_l_LocalPlayer_0_0, function(v32) --[[ Line: 50 ]]
            -- upvalues: v24 (ref), v30 (copy), v26 (ref), v27 (ref)
            v24(v30, v32, v26, v27);
        end) then
            return;
        else
            v30:dispatch(v13());
            local l_Humanoid_0 = l_l_LocalPlayer_0_0.Character:FindFirstChildOfClass("Humanoid");
            local v34, v35, _ = pcall(function() --[[ Line: 60 ]]
                -- upvalues: l_Humanoid_0 (copy), v27 (ref)
                return l_Humanoid_0:PlayEmoteAndGetAnimTrackById(v27);
            end);
            if v34 and v35 then
                v16:onEmotePlayed(v26, v27);
                return;
            else
                v24(v30, v9.ErrorTypes.TemporarilyUnavailable, v26, v27);
                return;
            end;
        end;
    end;
end;