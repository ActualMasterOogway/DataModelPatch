return function(v0) --[[ Line: 1 ]] --[[ Name: ShareTargetGamePolicies ]]
    return {
        shouldShowCreatorName = function() --[[ Line: 3 ]] --[[ Name: shouldShowCreatorName ]]
            -- upvalues: v0 (copy)
            local l_ShowShareTargetGameCreator_0 = v0.ShowShareTargetGameCreator;
            if l_ShowShareTargetGameCreator_0 ~= nil then
                return l_ShowShareTargetGameCreator_0;
            else
                return false;
            end;
        end
    };
end;