local l_Parent_0 = script.Parent.Parent;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
return {
    projects = {
        require(l_RobloxGui_0.Modules.AbuseReportMenu)["jest.config"], 
        require(l_Parent_0.InGameAssetReporting)["jest.config"]
    }
};