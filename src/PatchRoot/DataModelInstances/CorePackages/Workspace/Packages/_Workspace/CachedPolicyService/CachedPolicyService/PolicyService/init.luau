local l_Players_0 = game:GetService("Players");
local v1 = true;
local v2 = nil;
local v3 = false;
local v4 = false;
local l_BindableEvent_0 = Instance.new("BindableEvent");
return {
    InitAsync = function(_) --[[ Line: 20 ]] --[[ Name: InitAsync ]]
        -- upvalues: v1 (ref), v3 (ref), v4 (ref), l_BindableEvent_0 (copy), l_Players_0 (copy), v2 (ref)
        if _G.__TESTEZ_RUNNING_TEST__ then
            v1 = false;
            return;
        elseif v3 then
            return;
        elseif v4 then
            l_BindableEvent_0.Event:Wait();
            return;
        else
            v4 = true;
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            while not l_LocalPlayer_0 do
                l_Players_0.PlayerAdded:Wait();
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            end;
            assert(l_LocalPlayer_0, "");
            pcall(function() --[[ Line: 43 ]]
                -- upvalues: v2 (ref), l_LocalPlayer_0 (ref)
                v2 = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
            end);
            if v2 then
                v1 = v2.IsSubjectToChinaPolicies;
            end;
            v3 = true;
            l_BindableEvent_0:Fire();
            return;
        end;
    end, 
    IsSubjectToChinaPolicies = function(v8) --[[ Line: 54 ]] --[[ Name: IsSubjectToChinaPolicies ]]
        -- upvalues: v1 (ref)
        v8:InitAsync();
        return v1;
    end
};