game:DefineFastFlag("EnableOptionalPlaceIdForUserIdGameJoins", false);
game:DefineFastFlag("EnableOptionalPlaceIdForUserIdGameJoinsTesting", false);
return function() --[[ Line: 5 ]]
    if game:GetFastFlag("EnableOptionalPlaceIdForUserIdGameJoinsTesting") then
        return true;
    else
        return game:GetFastFlag("EnableOptionalPlaceIdForUserIdGameJoins") and game:GetEngineFeature("JoinByUserTakesOptionalPlaceId");
    end;
end;