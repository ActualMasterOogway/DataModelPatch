local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.strict);
return v1({
    ABTests = v1({
        PRODUCT_PURCHASE = "AllUsers.Payments.ProductPurchaseABTest", 
        PRODUCT_PURCHASE_UPSELL = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTest", 
        PRODUCT_PURCHASE_UPSELL_UWP = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestUWP", 
        PRODUCT_PURCHASE_UPSELL_AMAZON = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestAmazon", 
        PRODUCT_PURCHASE_UPSELL_XBOX = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestXbox"
    }, "Constants.ABTests"), 
    PlatformPurchaseResult = v1({
        PurchaseResult_Error = -1, 
        PurchaseResult_Success = 0, 
        PurchaseResult_UserCancelled = 1, 
        PurchaseResult_ConsumeRequestFail = 2, 
        PurchaseResult_RobuxUpdated = 3, 
        PurcahseResult_NoActionNeeded = 4
    }, "Constants.PlatformPurchaseResult"), 
    PurchaseFailureReason = v1({
        TwoStepVerificationRequired = "TwoStepVerificationRequired", 
        EconomyDisabled = "EconomyDisabled"
    }, "Constants.TransactionStatus"), 
    ProductType = v1({
        CollectibleItem = "Collectible Item", 
        DeveloperProduct = "Developer Product"
    }, "Constants.ProductType")
}, "Constants");