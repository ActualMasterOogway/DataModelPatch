local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(script.Parent.Parent.Utility.GenerateDummy);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v8 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleRadius);
local v9 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleTransparencyPercent) * 0.01;
local v10 = true;
local v11 = math.max(v8 * l_CurrentCamera_0.HeadScale, 0.1);
local v12 = nil;
initDummy = function() --[[ Line: 23 ]] --[[ Name: initDummy ]]
    -- upvalues: v12 (ref), v6 (copy), l_Workspace_0 (copy)
    v12 = v6(Vector3.new(0, 8.800000190734863, -50.5, 0), (Vector3.new(0, 180, 0, 0)));
    v12.Parent = l_Workspace_0;
end;
local function v19(_, v14) --[[ Line: 28 ]] --[[ Name: calculateTransparency ]]
    -- upvalues: l_VRService_0 (copy), l_CurrentCamera_0 (copy), v12 (ref), v11 (copy), v9 (copy)
    if not v14 then
        return 0;
    else
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local l_Magnitude_0 = ((l_CurrentCamera_0.CFrame * l_l_VRService_0_UserCFrame_0).Position - v12.HumanoidRootPart.Position).Magnitude;
        local _ = 0;
        local v18 = v11 * 0.75;
        return (math.clamp(if l_Magnitude_0 < v18 then v9 else (1 - (l_Magnitude_0 - v18) / (v11 - v18)) * v9, 0, 1));
    end;
end;
EnableSafetyBubbleDummy = function() --[[ Line: 51 ]] --[[ Name: EnableSafetyBubbleDummy ]]
    -- upvalues: v12 (ref), l_UserGameSettings_0 (copy), v10 (ref), v19 (copy), l_RunService_0 (copy)
    initDummy();
    local function v25() --[[ Line: 54 ]] --[[ Name: onStep ]]
        -- upvalues: v12 (ref), l_UserGameSettings_0 (ref), v10 (ref), v19 (ref)
        local l_v12_Children_0 = v12:GetChildren();
        if l_UserGameSettings_0.VRSafetyBubbleMode == Enum.VRSafetyBubbleMode.Anyone then
            v10 = false;
        else
            v10 = true;
        end;
        for _, v22 in ipairs(game.Players:GetPlayers()) do
            if v22.Character then
                local v23 = v19(v22, v10);
                v12.Head.Face.Transparency = v23;
                for v24 = 1, #l_v12_Children_0 do
                    if l_v12_Children_0[v24]:IsA("Part") then
                        l_v12_Children_0[v24].Transparency = v23;
                    end;
                end;
            end;
        end;
    end;
    l_RunService_0.Stepped:Connect(v25);
end;
return EnableSafetyBubbleDummy;