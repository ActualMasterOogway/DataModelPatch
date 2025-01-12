local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
return function() --[[ Line: 16 ]] --[[ Name: EditSocialNetworksErrorModal ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_useNavigation_0 (copy), l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v6 (copy), v7 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v14 = l_useNavigationProps_0(function(_, v13) --[[ Line: 17 ]]
        return {
            errorCode = v13.errorCode
        };
    end);
    local v15 = l_useNavigation_0();
    local v16 = l_useScreenSize_0();
    local v17 = l_useLocalization_0({
        title = v6.SocialNetworksError, 
        InvalidFacebook = v6.InvalidFacebook, 
        InvalidX = v6.InvalidX, 
        InvalidYouTube = v6.InvalidYouTube, 
        InvalidTwitch = v6.InvalidTwitch, 
        InvalidGuilded = v6.InvalidGuilded, 
        OK = v6.OK
    });
    local v18 = ({
        [v7.SocialNetworksErrorCodes.Facebook] = v17.InvalidFacebook, 
        [v7.SocialNetworksErrorCodes.Twitter] = v17.InvalidX, 
        [v7.SocialNetworksErrorCodes.YouTube] = v17.InvalidYouTube, 
        [v7.SocialNetworksErrorCodes.Twitch] = v17.InvalidTwitch, 
        [v7.SocialNetworksErrorCodes.Guilded] = v17.InvalidGuilded
    })[v14.errorCode];
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v16, 
        title = v17.title, 
        bodyText = v18, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 43 ]] --[[ Name: onClose ]]
                            -- upvalues: v15 (copy)
                            v15.goBack();
                        end, 
                        text = v17.OK
                    }
                }
            }
        }
    });
end;