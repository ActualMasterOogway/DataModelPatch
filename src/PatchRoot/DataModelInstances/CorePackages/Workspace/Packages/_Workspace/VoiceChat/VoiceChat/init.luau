local v0 = require(script.Constants);
local _ = require(script.Utils.GetIcon);
return {
    AgeVerificationOverlay = require(script.AgeVerificationOverlay), 
    Constants = v0, 
    OptInStatus = require(script.OptInStatus), 
    Flags = require(script.Flags), 
    GetInformedOfBan = require(script.Requests.GetInformedOfBan), 
    GetUserSettings = require(script.Requests.GetUserSettings), 
    PostInformedOfBan = require(script.Requests.PostInformedOfBan), 
    PostSeenAvatarVideoModal = require(script.Requests.PostSeenAvatarVideoModal), 
    PostUserOptIn = require(script.Requests.PostUserOptIn), 
    Utils = require(script.Utils), 
    ["jest.config"] = script["jest.config"]
};