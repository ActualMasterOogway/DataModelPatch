local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Players_0 = game:GetService("Players");
local v3 = require(script.Parent.Parent.Flags.GetFFlagFixAppPolicyDefaultUserId);
local v4 = game:DefineFastFlag("FFlagLogFirstGuacRead", false);
local v5 = game:DefineFastFlag("FFlagLogAllGuacRead", false);
local v6 = game:DefineFastFlag("CacheReadParsePolicy", false);
local v7 = nil;
local v8 = nil;
if v4 then
    v7 = game:GetService("CorePackages");
    v8 = require(v7.Workspace.Packages.LoggingProtocol).default;
end;
return function(v9) --[[ Line: 17 ]]
    -- upvalues: l_HttpService_0 (copy), l_MemStorageService_0 (copy), l_Players_0 (copy), v3 (copy), v6 (copy), v5 (copy), v8 (ref), v4 (copy)
    v9 = v9 or {};
    v9.HttpService = v9.HttpService or l_HttpService_0;
    v9.MemStorageService = v9.MemStorageService or l_MemStorageService_0;
    v9.PlayersService = v9.PlayersService or l_Players_0;
    assert(v9.HttpService, "expected dependencies.HttpService");
    assert(v9.MemStorageService, "expected dependencies.MemStorageService");
    assert(v9.PlayersService, "expected dependencies.PlayersService");
    local l_HttpService_1 = v9.HttpService;
    local l_MemStorageService_1 = v9.MemStorageService;
    local l_PlayersService_0 = v9.PlayersService;
    local v13 = false;
    return function(v14) --[[ Line: 32 ]]
        -- upvalues: v3 (ref), l_PlayersService_0 (copy), v6 (ref), l_HttpService_1 (copy), l_MemStorageService_1 (copy), v5 (ref), v8 (ref), v4 (ref), v13 (ref)
        assert(v14, "expected behavior");
        local function _() --[[ Line: 35 ]] --[[ Name: getStoreKey ]]
            -- upvalues: v3 (ref), l_PlayersService_0 (ref), v14 (copy)
            local v15 = -1;
            if v3() then
                local l_LocalPlayer_0 = l_PlayersService_0.LocalPlayer;
                if l_LocalPlayer_0 and l_LocalPlayer_0.UserId > 0 then
                    v15 = l_LocalPlayer_0.UserId;
                end;
            elseif l_PlayersService_0.LocalPlayer then
                v15 = l_PlayersService_0.LocalPlayer.UserId;
            end;
            return "GUAC:" .. v15 .. ":" .. v14;
        end;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        if v6 then
            local v23 = nil;
            do
                local l_v23_0 = v23;
                local function v25() --[[ Line: 61 ]] --[[ Name: localPlayerChanged ]]
                    -- upvalues: l_v23_0 (ref), l_PlayersService_0 (ref), v21 (ref)
                    if l_v23_0 then
                        l_v23_0:Disconnect();
                        l_v23_0 = nil;
                    end;
                    if l_PlayersService_0.LocalPlayer then
                        l_v23_0 = l_PlayersService_0.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function() --[[ Line: 67 ]]
                            -- upvalues: v21 (ref)
                            v21 = nil;
                        end);
                    end;
                    v21 = nil;
                end;
                l_PlayersService_0:GetPropertyChangedSignal("LocalPlayer"):Connect(v25);
                v25();
            end;
        end;
        local function v29(v26) --[[ Line: 77 ]] --[[ Name: onPolicyUpdated ]]
            -- upvalues: v20 (ref), l_HttpService_1 (ref), v21 (ref), l_BindableEvent_0 (copy)
            if v26 ~= v20 and v26 and #v26 > 0 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 81 ]]
                    -- upvalues: l_HttpService_1 (ref), v26 (copy)
                    return l_HttpService_1:JSONDecode(v26);
                end);
                if l_status_0 then
                    v20 = v26;
                    v21 = l_result_0;
                    l_BindableEvent_0:Fire(l_result_0);
                end;
            end;
        end;
        return {
            read = function() --[[ Line: 95 ]] --[[ Name: read ]]
                -- upvalues: v6 (ref), v21 (ref), v3 (ref), l_PlayersService_0 (ref), v14 (copy), l_MemStorageService_1 (ref), l_HttpService_1 (ref), v5 (ref), v8 (ref), v4 (ref), v13 (ref), v20 (ref)
                if v6 and v21 then
                    return v21;
                else
                    local v30 = -1;
                    if v3() then
                        local l_LocalPlayer_1 = l_PlayersService_0.LocalPlayer;
                        if l_LocalPlayer_1 and l_LocalPlayer_1.UserId > 0 then
                            v30 = l_LocalPlayer_1.UserId;
                        end;
                    elseif l_PlayersService_0.LocalPlayer then
                        v30 = l_PlayersService_0.LocalPlayer.UserId;
                    end;
                    local v32 = "GUAC:" .. v30 .. ":" .. v14;
                    v30 = l_MemStorageService_1:GetItem(v32);
                    if v30 and #v30 > 0 then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 102 ]]
                            -- upvalues: l_HttpService_1 (ref), v30 (copy)
                            return l_HttpService_1:JSONDecode(v30);
                        end);
                        if l_status_1 then
                            if v5 then
                                v8:logEvent("lua_policy_read_success");
                            elseif v4 and not v13 then
                                v8:logEvent("lua_policy_read_success");
                                v13 = true;
                            end;
                            v21 = l_result_1;
                            v20 = v30;
                            return l_result_1;
                        end;
                    end;
                    return nil;
                end;
            end, 
            onPolicyChanged = function(v35) --[[ Line: 124 ]] --[[ Name: onPolicyChanged ]]
                -- upvalues: v3 (ref), l_PlayersService_0 (ref), v14 (copy), l_BindableEvent_0 (copy), v19 (ref), v18 (ref), v21 (ref), l_MemStorageService_1 (ref), v29 (copy)
                local v36 = -1;
                if v3() then
                    local l_LocalPlayer_2 = l_PlayersService_0.LocalPlayer;
                    if l_LocalPlayer_2 and l_LocalPlayer_2.UserId > 0 then
                        v36 = l_LocalPlayer_2.UserId;
                    end;
                elseif l_PlayersService_0.LocalPlayer then
                    v36 = l_PlayersService_0.LocalPlayer.UserId;
                end;
                local v38 = "GUAC:" .. v36 .. ":" .. v14;
                v36 = l_BindableEvent_0.Event:Connect(v35);
                if v19 and v18 == v38 then
                    if v21 then
                        v35(v21);
                        return v36;
                    end;
                else
                    if v19 then
                        v19:Disconnect();
                    end;
                    v18 = v38;
                    v19 = l_MemStorageService_1:BindAndFire(v38, v29);
                end;
                return v36;
            end
        };
    end;
end;