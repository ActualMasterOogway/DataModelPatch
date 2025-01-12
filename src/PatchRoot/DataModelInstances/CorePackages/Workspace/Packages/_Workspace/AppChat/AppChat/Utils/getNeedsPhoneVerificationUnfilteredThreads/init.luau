return function(v0) --[[ Line: 8 ]]
    if not v0 or v0.isFullyEligible then
        return false;
    else
        return v0.isAgeEligible and v0.isIXPEligible and v0.isRolloutEligible;
    end;
end;