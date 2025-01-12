return {
    getUserFlag = function(v0) --[[ Line: 11 ]] --[[ Name: getUserFlag ]]
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
            -- upvalues: v0 (copy)
            return UserSettings():IsUserFeatureEnabled(v0);
        end);
        return l_status_0 and l_result_0;
    end
};