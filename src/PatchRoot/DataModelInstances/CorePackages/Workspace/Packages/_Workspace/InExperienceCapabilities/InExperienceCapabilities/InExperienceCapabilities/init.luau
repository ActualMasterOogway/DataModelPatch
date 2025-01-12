local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies();
return {
    canNavigateHome = v1.getInExperienceCanNavigateHome(), 
    canListPeopleInSameServer = v1.getInExperienceCanListPeopleInSameServer(), 
    canDisplayPeoplesUsernames = v1.getInExperienceCanDisplayPeoplesUsernames(), 
    canViewEducationalPopup = v1.getInExperienceCanViewEducationalPopup(), 
    canViewPlayerDropdownInLeaderboard = v1.getInExperienceCanViewPlayerDropdownInLeaderboard()
};