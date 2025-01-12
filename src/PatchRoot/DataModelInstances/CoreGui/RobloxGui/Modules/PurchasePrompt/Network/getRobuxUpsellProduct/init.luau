local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Enums.PaymentPlatform);
local v3 = require(l_Parent_0.Models.RobuxUpsell);
local v4 = require(l_Parent_0.Promise);
local function _(v5) --[[ Line: 11 ]] --[[ Name: paymentPlatformToUpsellPlatform ]]
    -- upvalues: v2 (copy)
    if v5 == v2.Web then
        return "Web";
    elseif v5 == v2.Apple then
        return "AppleAppStore";
    elseif v5 == v2.Google then
        return "GooglePlayStore";
    elseif v5 == v2.Amazon then
        return "AmazonStore";
    elseif v5 == v2.UWP then
        return "WindowsStore";
    elseif v5 == v2.Xbox then
        return "XboxStore";
    elseif v5 == v2.Maquettes then
        return "MaquettesStore";
    elseif v5 == v2.Palisades then
        return "PalisadesStore";
    else
        return "None";
    end;
end;
return function(v7, v8, v9, v10) --[[ Line: 33 ]] --[[ Name: getRobuxUpsellProduct ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v1 (copy)
    local v11 = v10 == v2.Web and "Web" or v10 == v2.Apple and "AppleAppStore" or v10 == v2.Google and "GooglePlayStore" or v10 == v2.Amazon and "AmazonStore" or v10 == v2.UWP and "WindowsStore" or v10 == v2.Xbox and "XboxStore" or v10 == v2.Maquettes and "MaquettesStore" or v10 == v2.Palisades and "PalisadesStore" or "None";
    return v7.getRobuxUpsellProduct(v8, v9, v11):andThen(function(v12) --[[ Line: 36 ]]
        -- upvalues: v3 (ref), v4 (ref), v1 (ref)
        local v13 = v3.fromJson(v12);
        if v13 then
            return v4.resolve(v13);
        else
            return v4.reject(v1.UnknownFailure);
        end;
    end):catch(function(_) --[[ Line: 44 ]]
        -- upvalues: v4 (ref), v1 (ref)
        return v4.reject(v1.UnknownFailure);
    end);
end;