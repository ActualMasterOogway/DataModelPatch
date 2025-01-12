local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.AvatarExperienceCommon)["jest.config"], 
        require(l_Parent_0.AvatarExperienceHeadRefinement)["jest.config"], 
        require(l_Parent_0.AvatarExperienceInitialization)["jest.config"], 
        require(l_Parent_0.AvatarExperienceNavigation)["jest.config"], 
        require(l_Parent_0.AvatarExperienceSearch)["jest.config"], 
        require(l_Parent_0.AvatarExperienceWidgets)["jest.config"]
    }
};