game:DefineFastFlag("FixMouseForAdsEuDsaModal", false);
game:DefineFastInt("AdsEudsaModalAnimationTimeMs", 350);
game:DefineFastFlag("AdsEudsaModalUseAnimationTimeFlag", false);
return {
    GetFFlagFixMouseForAdsEuDsaModal = function() --[[ Line: 6 ]] --[[ Name: GetFFlagFixMouseForAdsEuDsaModal ]]
        return game:GetFastFlag("FixMouseForAdsEuDsaModal");
    end, 
    GetFIntAdsEudsaModalAnimationTimeMs = function() --[[ Line: 9 ]] --[[ Name: GetFIntAdsEudsaModalAnimationTimeMs ]]
        return game:GetFastInt("AdsEudsaModalAnimationTimeMs");
    end, 
    GetFFlagAdsEudsaModalUseAnimationTimeFlag = function() --[[ Line: 12 ]] --[[ Name: GetFFlagAdsEudsaModalUseAnimationTimeFlag ]]
        return game:GetFastFlag("AdsEudsaModalUseAnimationTimeFlag");
    end
};