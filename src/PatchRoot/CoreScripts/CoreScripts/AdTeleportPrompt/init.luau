local l_AdService_0 = game:GetService("AdService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Ads.AdTeleportPromptHandler);
local v3 = nil;
onPortalPrompt = function(v4, v5, v6) --[[ Line: 10 ]] --[[ Name: onPortalPrompt ]]
    -- upvalues: v3 (ref), v2 (copy)
    if v3 and v3.hasActiveWindow then
        return;
    else
        v3 = v2.new(v5, v4);
        if v3 == nil then
            error("Error in instantiating handler for adteleportprompt.");
            return;
        else
            assert(v3 ~= nil, "Appeasing the type checking");
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
                -- upvalues: v3 (ref)
                return v3:fetchTitle();
            end);
            if not l_status_0 or l_result_0 == nil then
                v3:rejectPrompt(false, false);
                error("Error: Marketplace service failed to get placename for ad portal prompt.");
                return;
            else
                v3:instantiatePrompt(l_result_0, v6);
                v3:updateCreateTime();
                return;
            end;
        end;
    end;
end;
l_AdService_0.PortalPrompt:Connect(onPortalPrompt);