local v0 = false;
local v1 = nil;
local function v6() --[[ Line: 8 ]] --[[ Name: FindSelfieViewEnabled ]]
    -- upvalues: v0 (ref), v1 (ref)
    if v0 then
        return v1;
    else
        v0 = true;
        local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
        local v3 = if l_RobloxGui_0 then l_RobloxGui_0:FindFirstChild("Modules") else nil;
        local v4 = if v3 then v3:FindFirstChild("SelfieView") else nil;
        local v5 = if v4 then v4:FindFirstChild("Flags") else nil;
        v1 = if v5 then v5:FindFirstChild("GetFFlagSelfieViewEnabled") else nil;
        return v1;
    end;
end;
local function _() --[[ Line: 27 ]] --[[ Name: GetFFlagSelfieViewEnabled ]]
    -- upvalues: v6 (copy), v1 (ref)
    if v6() then
        return (require(v1)());
    else
        return false;
    end;
end;
return function() --[[ Line: 36 ]]
    -- upvalues: v6 (copy), v1 (ref)
    return game:GetEngineFeature("FacialAnimationStreaming2") and not if v6() then require(v1)() else false;
end;