local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.AppChat)["jest.config"]
    }, 
    testTimeout = 30000
};