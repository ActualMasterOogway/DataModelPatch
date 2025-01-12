local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.SettingsService)["jest.config"], 
        require(l_Parent_0.SettingReactView)["jest.config"], 
        require(l_Parent_0.AppCommonLib)["jest.config"]
    }
};