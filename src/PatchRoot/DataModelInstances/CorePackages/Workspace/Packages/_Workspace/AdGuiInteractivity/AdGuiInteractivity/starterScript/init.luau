local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_0.AdsInteractivityControls);
return function() --[[ Line: 10 ]] --[[ Name: starterScript ]]
    -- upvalues: l_CoreGui_0 (copy), l_AdService_0 (copy), v4 (copy), v5 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "AdGuiInteractivityControls";
    l_Folder_0.Parent = l_CoreGui_0;
    local v7 = {};
    l_AdService_0.adGuiRegisterUI:Connect(function(v8) --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v4 (ref), v5 (ref), l_Folder_0 (copy)
        if not v8:IsA("AdGui") then
            return;
        elseif v7[v8] then
            return;
        else
            v7[v8] = v4.mount(v4.createElement(v5, {
                adGui = v8
            }), l_Folder_0, "AdsInteractivityControls");
            v8.Destroying:Connect(function() --[[ Line: 33 ]]
                -- upvalues: v4 (ref), v7 (ref), v8 (copy)
                v4.unmount(v7[v8]);
                v7[v8] = nil;
            end);
            return;
        end;
    end);
    l_AdService_0:SetAdGuiInteractivityHandlerInitialized();
end;