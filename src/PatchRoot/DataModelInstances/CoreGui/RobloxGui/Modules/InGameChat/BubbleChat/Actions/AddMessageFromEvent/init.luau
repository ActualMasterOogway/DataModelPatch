local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(script.Parent.Parent.Types);
local v5 = require(script.Parent.Parent.Helpers.maybeAssert);
local v6 = require(script.Parent.AddMessageWithTimeout);
local v7 = require(l_RobloxGui_0.Modules.Flags.GetFFlagConsolidateBubbleChat);
return function(v8) --[[ Line: 20 ]] --[[ Name: addMessageFromEvent ]]
    -- upvalues: v5 (copy), v4 (copy), l_Players_0 (copy), v7 (copy), v2 (copy), v6 (copy)
    v5(v4.IMessageData(v8));
    return function(v9) --[[ Line: 23 ]]
        -- upvalues: l_Players_0 (ref), v8 (copy), v7 (ref), v2 (ref), v6 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: l_Players_0 (ref), v8 (ref)
            return l_Players_0:GetPlayerByUserId(v8.SpeakerUserId);
        end);
        if l_status_0 and l_result_0 then
            local l_Character_0 = l_result_0.Character;
            if l_Character_0 then
                local v13 = {
                    id = tostring(v8.ID), 
                    userId = tostring(v8.SpeakerUserId), 
                    name = v8.FromSpeaker, 
                    text = v8.Message or "", 
                    timestamp = v8.Time, 
                    adornee = l_Character_0
                };
                if v7() then
                    local l_Events_0 = v2.Events;
                    if l_Events_0.LegacyBubbleCreated ~= nil then
                        l_Events_0.LegacyBubbleCreated(v13);
                    end;
                end;
                return v9:dispatch(v6(v13));
            end;
        end;
    end;
end;