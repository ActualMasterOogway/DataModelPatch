local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.TemplatePackage)["jest.config"]
    }
};