local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_t_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).t;
local _ = require(l_Parent_0.strict);
local v4 = l_t_0.interface({
    productId = l_t_0.number, 
    mobileProductId = l_t_0.string, 
    robuxAmount = l_t_0.number, 
    isSubscriptionOnly = l_t_0.boolean, 
    premiumFeatureTypeName = l_t_0.string, 
    description = l_t_0.string, 
    price = l_t_0.interface({
        amount = l_t_0.number, 
        currency = l_t_0.interface({
            currencySymbol = l_t_0.string
        })
    })
});
return function(v5) --[[ Line: 30 ]]
    -- upvalues: v4 (copy)
    local v6, _ = v4(v5);
    if not v6 then
        return nil;
    else
        return {
            productId = v5.productId, 
            mobileProductId = v5.mobileProductId, 
            robuxAmount = v5.robuxAmount, 
            isSubscriptionOnly = v5.isSubscriptionOnly, 
            premiumFeatureTypeName = v5.premiumFeatureTypeName, 
            description = v5.description, 
            price = v5.price.amount, 
            currencySymbol = v5.price.currency.currencySymbol
        };
    end;
end;