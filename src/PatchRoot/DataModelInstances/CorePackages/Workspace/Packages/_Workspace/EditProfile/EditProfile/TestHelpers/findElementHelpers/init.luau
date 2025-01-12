local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.SocialTestHelpers);
local l_findElementWithAssert_0 = v2.TestHelpers.findElementWithAssert;
local l_findImageSet_0 = v2.TestHelpers.findImageSet;
return {
    findTopBarTitle = l_findElementWithAssert_0({
        Text = require(l_script_FirstAncestor_0.Common.TextKeys).Title
    }), 
    findTopBar = l_findElementWithAssert_0({
        Name = "TopBar"
    }), 
    findBackButton = l_findElementWithAssert_0(l_findImageSet_0("icons/navigation/pushBack"))
};