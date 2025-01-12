local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
return function(v2, v3, v4) --[[ Line: 7 ]] --[[ Name: sortCurrentlyWearingItems ]]
    local v5 = {
        isOffSale = v2.isOffSale or false, 
        price = v2.price or v2.lowestResalePrice or 0, 
        favoriteCount = v2.favoriteCount or 0
    };
    local v6 = {
        isOffSale = v3.isOffSale or false, 
        price = v3.price or v3.lowestResalePrice or 0, 
        favoriteCount = v3.favoriteCount or 0
    };
    if v5.isOffSale ~= v6.isOffSale then
        return not v5.isOffSale;
    else
        if v5.price ~= v6.price then
            if v5.price == 0 then
                return false;
            elseif v6.price == 0 then
                return true;
            elseif v4 == "priceDecreasing" then
                return v5.price > v6.price;
            end;
        end;
        return (tonumber(v2.id) or 0) < (tonumber(v3.id) or 0);
    end;
end;