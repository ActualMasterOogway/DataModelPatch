local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_enumerate_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).enumerate;
local v3 = require(l_Parent_0.Utils.addRawValueMethodToEnum);
local v4 = {
    None = "None", 
    Product = "Product", 
    RobuxUpsell = "RobuxUpsell", 
    RobuxUpsellV2 = "RobuxUpsellV2", 
    LargeRobuxUpsell = "LargeRobuxUpsell", 
    PremiumUpsell = "PremiumUpsell"
};
local v5 = l_enumerate_0(script.Name, v4);
v3(v5, v4);
return v5;