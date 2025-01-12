local _ = require(script.Enums.SquadRootViewType);
local _ = require(script.Enums.SquadState);
return {
    Actions = require(script.Actions), 
    Analytics = {
        EventNames = require(script.Analytics).EventNames
    }, 
    Common = {
        Constants = {
            CONVERSATION_CHANNEL_GROUP_TYPE = require(script.Common.Constants).CONVERSATION_CHANNEL_GROUP_TYPE, 
            GROUP_ICON_CONTAINER_SIZE = require(script.Common.Constants).GROUP_ICON_CONTAINER_SIZE, 
            GROUP_ICON_SIZE = require(script.Common.Constants).GROUP_ICON_SIZE, 
            ACTIVE_SQUAD_APP_STORAGE_KEY = require(script.Common.Constants).ACTIVE_SQUAD_APP_STORAGE_KEY
        }, 
        getColorFromUserId = require(script.Common.getColorFromUserId), 
        clearSquadStorage = require(script.Common.clearSquadStorage), 
        validateSquadId = require(script.Common.validateSquadId)
    }, 
    Enums = require(script.Enums), 
    Flags = require(script.Flags), 
    Hooks = require(script.Hooks), 
    Http = require(script.Http), 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    RoduxSquads = require(script.RoduxSquads), 
    SquadAppChatEventReceiver = require(script.Components).SquadAppChatEventReceiver, 
    SquadEventReceiver = require(script.Components).SquadEventReceiver, 
    SquadExternalContractProvider = require(script.Components).SquadExternalContractProvider, 
    SquadOverlay = require(script.Components).SquadOverlay, 
    SquadPrompt = require(script.Components).SquadPrompt, 
    Thunks = require(script.Thunks), 
    installReducer = require(script.installReducer), 
    ["jest.config"] = script["jest.config"]
};