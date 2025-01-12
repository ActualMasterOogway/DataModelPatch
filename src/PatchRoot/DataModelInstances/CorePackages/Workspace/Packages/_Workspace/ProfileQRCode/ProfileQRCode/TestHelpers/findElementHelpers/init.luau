local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.SocialTestHelpers);
local l_findElementWithAssert_0 = v2.TestHelpers.findElementWithAssert;
local l_findImageSet_0 = v2.TestHelpers.findImageSet;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
return {
    findQRCodeView = l_findElementWithAssert_0({
        Name = "QRCodeView"
    }), 
    findQRCode = l_findElementWithAssert_0({
        Name = "QRCode"
    }), 
    findDescription = l_findElementWithAssert_0({
        Text = v5.Description
    }), 
    findTopBarTitle = l_findElementWithAssert_0({
        Text = v5.Title
    }), 
    findTopBar = l_findElementWithAssert_0({
        Name = "TopBar"
    }), 
    findPlayerAvatar = l_findElementWithAssert_0({
        Name = "PlayerAvatar"
    }), 
    findCrossButton = l_findElementWithAssert_0(l_findImageSet_0("icons/navigation/close")), 
    findBackButton = l_findElementWithAssert_0(l_findImageSet_0("icons/navigation/pushBack")), 
    findRetryButton = l_findElementWithAssert_0(l_findImageSet_0("icons/common/refresh")), 
    findLoadingElement = l_findElementWithAssert_0({
        Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer.png"
    }), 
    findQRCodeIcon = l_findElementWithAssert_0({
        Name = "QRImage"
    }), 
    findUsername = l_findElementWithAssert_0({
        Name = "Username"
    }), 
    findNotificationDescription = l_findElementWithAssert_0({
        Name = "Description"
    }), 
    findCloseButton = l_findElementWithAssert_0({
        Name = "CloseButton"
    }), 
    findAcceptButton = l_findElementWithAssert_0({
        Name = "AcceptButton"
    }), 
    findAlertView = l_findElementWithAssert_0({
        Name = "FriendsInvite"
    }), 
    findToastView = l_findElementWithAssert_0({
        Name = "FriendAcceptToast"
    })
};