local l_AppStorageService_0 = game:GetService("AppStorageService");
return {
    getShouldShowMenuNavigationPrompt = function() --[[ Line: 4 ]] --[[ Name: getShouldShowMenuNavigationPrompt ]]
        -- upvalues: l_AppStorageService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("GamepadMenuVirtualCursorPromptShown") == "false";
        end);
        if not l_status_0 then
            return false;
        else
            return l_result_0;
        end;
    end, 
    setMenuNavigationPromptShown = function() --[[ Line: 15 ]] --[[ Name: setMenuNavigationPromptShown ]]
        -- upvalues: l_AppStorageService_0 (copy)
        pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            l_AppStorageService_0:SetItem("GamepadMenuVirtualCursorPromptShown", "true");
        end);
    end
};