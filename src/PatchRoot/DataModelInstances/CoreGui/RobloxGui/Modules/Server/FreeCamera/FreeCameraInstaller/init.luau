local v0 = game:DefineFastFlag("AllowLuobuFreecamGroup", false);
local v1 = {
    4358041
};
local v2 = {
    7842878
};
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.Common.Url);
local v10 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
return function() --[[ Line: 28 ]] --[[ Name: Install ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), v9 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v1 (copy), v0 (copy), l_PolicyService_0 (copy), v2 (copy), l_Players_0 (copy)
    local function v14(v11, v12) --[[ Line: 29 ]] --[[ Name: WaitForChildOfClass ]]
        local l_v11_FirstChildOfClass_0 = v11:FindFirstChildOfClass(v12);
        while not l_v11_FirstChildOfClass_0 or l_v11_FirstChildOfClass_0.ClassName ~= v12 do
            l_v11_FirstChildOfClass_0 = v11.ChildAdded:Wait();
        end;
        return l_v11_FirstChildOfClass_0;
    end;
    local function v20(v15) --[[ Line: 37 ]] --[[ Name: AddFreeCamera ]]
        -- upvalues: v14 (copy), v10 (ref)
        local v16 = v14(v15, "PlayerGui");
        local l_FreeCamera_0 = script.Parent:WaitForChild("FreeCamera");
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "Freecam";
        l_ScreenGui_0.ResetOnSpawn = false;
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = "FreecamScript";
        if v10.getFFlagServerCoreScriptSourceCode() then
            l_LocalScript_0.Source = v10.getSourceForServerScript(l_FreeCamera_0);
        else
            l_LocalScript_0.Source = l_FreeCamera_0.Source;
        end;
        l_LocalScript_0.Parent = l_ScreenGui_0;
        l_ScreenGui_0.Parent = v16;
    end;
    local function v35(v21) --[[ Line: 58 ]] --[[ Name: ShouldAddFreeCam ]]
        -- upvalues: l_RunService_0 (ref), v9 (ref), l_HttpService_0 (ref), l_HttpRbxApiService_0 (ref), v1 (ref), v0 (ref), l_PolicyService_0 (ref), v2 (ref)
        if l_RunService_0:IsStudio() then
            return true;
        elseif v21.UserId <= 0 then
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 66 ]]
                -- upvalues: v9 (ref), l_HttpService_0 (ref), v21 (copy), l_HttpRbxApiService_0 (ref)
                local v22 = string.format(v9.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions");
                local v23 = l_HttpService_0:JSONEncode({
                    requests = {
                        {
                            subject = {
                                subjectType = "User", 
                                subjectId = v21.UserId
                            }, 
                            action = "Edit", 
                            assetId = game.PlaceId
                        }
                    }
                });
                local v24 = l_HttpRbxApiService_0:PostAsyncFullUrl(v22, v23);
                return l_HttpService_0:JSONDecode(v24);
            end);
            if l_status_0 then
                l_result_0 = l_result_0.results[1];
                if l_result_0.value and l_result_0.value.status == "HasPermission" then
                    return true;
                end;
            end;
            for _, v28 in ipairs(v1) do
                local l_status_1, l_result_1 = pcall(v21.IsInGroup, v21, v28);
                if l_status_1 and l_result_1 then
                    return true;
                end;
            end;
            if v0 and game:GetEngineFeature("LuobuModerationStatus") and l_PolicyService_0.IsLuobuServer == Enum.TriStateBoolean.True then
                for _, v32 in ipairs(v2) do
                    local l_status_2, l_result_2 = pcall(v21.IsInGroup, v21, v32);
                    if l_status_2 and l_result_2 then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end;
    local function v37(v36) --[[ Line: 116 ]] --[[ Name: PlayerAdded ]]
        -- upvalues: v35 (copy), v20 (copy)
        if v35(v36) then
            v20(v36);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v37);
    for _, v39 in ipairs(l_Players_0:GetPlayers()) do
        coroutine.wrap(v37)(v39);
    end;
end;