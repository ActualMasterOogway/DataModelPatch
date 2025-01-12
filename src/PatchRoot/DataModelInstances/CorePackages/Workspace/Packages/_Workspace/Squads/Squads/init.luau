local _ = require(script.Common.ModelTypes);
return {
    AppSquadEventReceiver = require(script.Components).AppSquadEventReceiver, 
    Enums = require(script.Enums), 
    Logger = require(script.Logger), 
    SquadComponentAccessWrapper = require(script.Components).SquadComponentAccessWrapper, 
    SquadInviteFriends = require(script.Components).SquadInviteFriends, 
    SquadJoinButton = require(script.Components).SquadJoinButton, 
    SquadLobby = require(script.Components).SquadLobby, 
    SquadTopBanner = require(script.Components).SquadTopBanner, 
    SquadVoiceAbuseReportScreen = require(script.Components).SquadVoiceAbuseReportScreen, 
    Thunks = require(script.Thunks), 
    Hooks = {
        useIsExperienceInvitePending = require(script.Hooks.useIsExperienceInvitePending)
    }, 
    ["jest.config"] = script["jest.config"]
};