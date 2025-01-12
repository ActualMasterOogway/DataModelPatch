local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
return v2.createContext({
    profileUserId = "TEST_ID", 
    profileType = v3.ProfileTypes.User, 
    navigateTo = {
        qRCodePage = function() --[[ Line: 51 ]] --[[ Name: qRCodePage ]]

        end, 
        previousView = function() --[[ Line: 52 ]] --[[ Name: previousView ]]

        end, 
        itemDetails = function() --[[ Line: 53 ]] --[[ Name: itemDetails ]]

        end, 
        editUsername = function() --[[ Line: 54 ]] --[[ Name: editUsername ]]

        end
    }, 
    externalAnalytics = {
        catalogAnalytics = {}
    }, 
    sourceInfo = {
        isRecommendation = false, 
        source = "TEST_SOURCE", 
        contextualInfoType = "TEST_CONTEXTUAL_INFO_TYPE", 
        contextualOverride = {}, 
        friendshipOriginSourceType = "TEST_FRIENDSHIP_ORIGIN_SOURCE_TYPE"
    }
});