local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
dismissRobloxMenuAndRun = function(v2) --[[ Line: 5 ]] --[[ Name: dismissRobloxMenuAndRun ]]
    -- upvalues: l_RobloxGui_0 (copy), l_GuiService_0 (copy)
    local v3 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    if l_GuiService_0.MenuIsOpen then
        local v4 = tick() + 3;
        local v5 = nil;
        v5 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 10 ]]
            -- upvalues: v5 (ref), v4 (copy), v2 (copy)
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
            if tick() < v4 then
                v2(true);
            end;
        end);
        v3:SetVisibility(false);
        return;
    else
        v2(false);
        return;
    end;
end;
return {
    dismissRobloxMenuAndRun = dismissRobloxMenuAndRun
};