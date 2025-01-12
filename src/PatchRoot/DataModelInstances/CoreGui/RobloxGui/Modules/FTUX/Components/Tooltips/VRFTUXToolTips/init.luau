local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.VR.VRHub);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v5 = require(l_CorePackages_0.Packages.React);
local l_RunService_0 = game:GetService("RunService");
local v7 = require(script.Parent.ToolTip);
local v8 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v9 = {};
local function v15(_) --[[ Line: 29 ]] --[[ Name: onRenderStepped ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v9 (copy), v3 (copy)
    if l_IsVRAppBuild_0() then
        for _, v12 in pairs(v9) do
            local l_v3_ControllerModel_0 = v3:GetControllerModel(v12.Button.Controller);
            local v14 = nil;
            if l_v3_ControllerModel_0 then
                v14 = l_v3_ControllerModel_0:getButtonPosition(v12.Button.ButtonKeycode);
            end;
            if v12.Part then
                if l_v3_ControllerModel_0 == nil or v14 == nil then
                    v12.Part.Position = Vector3.new(-99999, -99999, -99999, 0);
                else
                    v12.Part.Position = v14;
                end;
            end;
        end;
    end;
end;
spawnTooltipPart = function() --[[ Line: 50 ]] --[[ Name: spawnTooltipPart ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "TooltipPart";
    l_Part_0.Position = Vector3.new(0, -100, 0, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
    l_Part_0.Parent = game.Workspace;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Parent = l_Part_0;
    l_BillboardGui_0.Adornee = l_Part_0;
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.Active = false;
    l_BillboardGui_0.Size = UDim2.new(1, 0, 1, 0);
    return l_Part_0;
end;
showTooltipText = function(v18) --[[ Line: 70 ]] --[[ Name: showTooltipText ]]
    for _, v20 in ipairs(v18.Part:GetDescendants()) do
        if v20:IsA("TextLabel") and v20.Name == "Body" then
            v20.ZIndex = 10;
        end;
    end;
end;
Tooltips = function(v21) --[[ Line: 78 ]] --[[ Name: Tooltips ]]
    -- upvalues: v9 (copy), v5 (copy), l_RunService_0 (copy), v15 (copy), v8 (copy), v7 (copy)
    for v22, v23 in pairs(v21.tooltipButtons) do
        v9[v22] = {
            Button = v23, 
            Part = spawnTooltipPart()
        };
    end;
    v5.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v9 (ref)
        for _, v25 in pairs(v9) do
            showTooltipText(v25);
        end;
    end, {});
    l_RunService_0.RenderStepped:Connect(v15);
    return v5.createElement("Frame", {}, (v8.Array.map(v9, function(v26, v27) --[[ Line: 97 ]]
        -- upvalues: v5 (ref), v7 (ref), v21 (copy)
        return (v5.createElement(v7, {
            controllerPart = v26.Part, 
            tooltipText = v21.tooltipButtons[v27].Text
        }));
    end)));
end;
return Tooltips;