local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.AffiliateLinks)["jest.config"], 
        require(l_Parent_0.ExternalAttribution)["jest.config"], 
        require(l_Parent_0.PlayerFeedback)["jest.config"]
    }
};