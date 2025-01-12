local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PlayButtonStates_0 = require(l_Parent_0.GamePlayButton).PlayButtonStates;
local l_ButtonType_0 = require(l_Parent_0.UIBlox).App.Button.Enum.ButtonType;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
local l_FFlagLuaAppPlayButtonUpdates_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpdates;
local l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPlayButtonUpdatesIxp;
local l_FFlagLuaAppPlayButtonLoadingPrimary_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppEnableControlUnplayable);
return function(v11, v12, v13) --[[ Line: 42 ]] --[[ Name: getPlayButtonProps ]]
    -- upvalues: l_FFlagLuaAppPlayButtonUpdates_0 (copy), l_GetFFlagLuaAppPlayButtonUpdatesIxp_0 (copy), l_PlayButtonStates_0 (copy), l_FFlagLuaAppPlayButtonLoadingPrimary_0 (copy), l_ButtonType_0 (copy), l_FFlagLuaAppFiatPaidAccess_0 (copy), v10 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy)
    assert(v11 ~= nil, "Expect playButtonState ~= nil");
    local v14 = {};
    local v15 = l_FFlagLuaAppPlayButtonUpdates_0 and (not l_GetFFlagLuaAppPlayButtonUpdatesIxp_0() or v13);
    if v11 == l_PlayButtonStates_0.Loading then
        v14.icon = "icons/status/unavailable";
        v14.isLoading = true;
        v14.isDisabled = true;
        v14.buttonType = if v15 then if l_FFlagLuaAppPlayButtonLoadingPrimary_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary else nil;
        return v14;
    elseif v11 == l_PlayButtonStates_0.Playable then
        v14.icon = "icons/common/play";
        v14.isDisabled = false;
        return v14;
    elseif v11 == l_PlayButtonStates_0.PaidAccess then
        assert(v12 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.PaidAccess");
        v14.price = v12.price;
        v14.icon = "icons/common/robux";
        v14.isDisabled = false;
        return v14;
    elseif l_FFlagLuaAppFiatPaidAccess_0 and v11 == l_PlayButtonStates_0.FiatPaidAccess then
        assert(v12 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.FiatPaidAccess");
        v14.localizedFiatPrice = v12.localizedFiatPrice;
        v14.isDisabled = false;
        return v14;
    elseif not v15 and v11 == l_PlayButtonStates_0.Private then
        v14.icon = "icons/status/private";
        v14.textKey = "Feature.ExperienceDetails.PlayButtonText.Private";
        v14.isDisabled = true;
        return v14;
    elseif v11 == l_PlayButtonStates_0.UnplayableOther then
        v14.icon = "icons/status/unavailable";
        if v15 then
            v14.textKey = "Feature.ExperienceDetails.PlayButtonText.Unavailable";
        end;
        v14.isDisabled = not v10 or v15 and true or false;
        v14.buttonType = if v15 then l_ButtonType_0.Secondary else nil;
        return v14;
    elseif l_GetFFlagLuaAppEnableSquadPage_0() and v11 == l_PlayButtonStates_0.PlayableWithParty then
        v14.icon = "icons/common/play";
        v14.textKey = "Feature.Squads.Action.JoinWithParty";
        v14.isDisabled = false;
        v14.showSquadButton = true;
        return v14;
    elseif l_GetFFlagLuaAppEnableSquadPage_0() and v11 == l_PlayButtonStates_0.WaitingForParty then
        v14.icon = "icons/common/play";
        v14.textKey = "Feature.Squads.Action.WaitingForParty";
        v14.isDisabled = true;
        v14.showSquadButton = true;
        v14.isSquadButtonDisabled = true;
        return v14;
    elseif v15 and v11 == l_PlayButtonStates_0.ActionNeeded then
        v14.icon = "icons/status/private";
        v14.textKey = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded";
        v14.isDisabled = false;
        v14.buttonType = l_ButtonType_0.PrimarySystem;
        return v14;
    else
        v14.icon = "icons/status/unavailable";
        if v15 then
            v14.textKey = "Feature.ExperienceDetails.PlayButtonText.Unavailable";
        end;
        v14.isDisabled = not v10 or v15 and true or false;
        v14.buttonType = if v15 then l_ButtonType_0.Secondary else nil;
        return v14;
    end;
end;