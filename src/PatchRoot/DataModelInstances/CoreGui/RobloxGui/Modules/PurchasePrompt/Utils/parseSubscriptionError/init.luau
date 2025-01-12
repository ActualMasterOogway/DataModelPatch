local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
return function(v2) --[[ Line: 4 ]] --[[ Name: parseSubscriptionError ]]
    -- upvalues: v1 (copy)
    if v2 == "UserHasSpendLimitSet" then
        return v1.SubscriptionExceededUserSpendLimit;
    elseif v2 == "UnsupportedLocale" then
        return v1.SubscriptionUnsupportedLocale;
    elseif v2 == "RestrictedUser" then
        return v1.RestrictedUser;
    elseif v2 == "PurchasePlatformNotSupported" then
        return v1.SubscriptionPurchasePlatformNotSupported;
    elseif v2 == "InvalidSaleLocation" then
        return v1.SubscriptionInvalidSaleLocation;
    elseif v2 == "UserAlreadySubscribed" then
        return v1.AlreadySubscribed;
    elseif v2 == "ProductNotForSale" then
        return v1.SubscriptionNotForSale;
    elseif v2 == "VpcRequired" then
        return v1.VpcRequired;
    elseif v2 == "ExceedParentalSpendLimit" then
        return v1.ExceedParentalSpendLimit;
    else
        return v1.UnknownFailure;
    end;
end;