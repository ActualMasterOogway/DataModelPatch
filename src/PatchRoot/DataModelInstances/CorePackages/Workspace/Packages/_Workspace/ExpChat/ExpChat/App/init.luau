local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(script.Parent.Localization);
local v4 = require(script.Parent.GameLocalization);
local v5 = require(script.Parent.AppContainer);
local v6 = require(script.Parent.createStore);
local v7 = v1.Component:extend("App");
local v8 = v6();
v7.defaultProps = {
    isChatWindowVisible = true, 
    isChatInputBarVisible = true, 
    isChannelBarVisible = false, 
    isDefaultChatEnabled = true, 
    isSpatialUIEnabled = false, 
    store = v8, 
    translator = {
        FormatByKey = function(_, v10) --[[ Line: 23 ]] --[[ Name: FormatByKey ]]
            return (tostring(v10));
        end
    }, 
    gameTranslator = {
        TranslateGameText = function(_, _, v13) --[[ Line: 28 ]] --[[ Name: TranslateGameText ]]
            return v13;
        end
    }
};
v7.render = function(v14) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v14.props.isDefaultChatEnabled and v1.createElement(v2.StoreProvider, {
        store = v14.props.store
    }, {
        localization = v1.createElement(v3.Provider, {
            value = v14.props.translator
        }, {
            gameLocalization = v1.createElement(v4.Provider, {
                value = v14.props.gameTranslator
            }, {
                container = v1.createElement(v5, {
                    isChatInputBarVisible = v14.props.isChatInputBarVisible, 
                    isChatWindowVisible = v14.props.isChatWindowVisible, 
                    isChannelBarVisible = v14.props.isChannelBarVisible, 
                    getIconVoiceIndicator = v14.props.getIconVoiceIndicator, 
                    onClickedVoiceIndicator = v14.props.onClickedVoiceIndicator, 
                    onClickedCameraIndicator = v14.props.onClickedCameraIndicator, 
                    selfViewListenerChanged = v14.props.selfViewListenerChanged, 
                    getPermissions = v14.props.getPermissions, 
                    displayCameraDeniedToast = v14.props.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v14.props.isCamEnabledForUserAndPlace, 
                    isCameraOnlyUser = v14.props.isCameraOnlyUser, 
                    isVoiceServiceInitialized = v14.props.isVoiceServiceInitialized, 
                    onClickedLikelySpeakingBubble = v14.props.onClickedLikelySpeakingBubble, 
                    isSpatialUIEnabled = v14.props.isSpatialUIEnabled
                })
            })
        })
    });
end;
return v7;