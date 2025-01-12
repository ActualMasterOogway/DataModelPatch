local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(script.Parent.GetFFlagShowGamepadDisconnectDialog);
local function _() --[[ Line: 11 ]] --[[ Name: useGamepadConnectionExperiment ]]
    -- upvalues: l_useUserExperiment_0 (copy)
    return l_useUserExperiment_0({
        "PlatformExcellence.QualityImprovement.Consoles"
    }, function(v5) --[[ Line: 14 ]]
        return (v5["PlatformExcellence.QualityImprovement.Consoles"] or {}).showDisconnectDialog;
    end);
end;
return function(v7, v8) --[[ Line: 25 ]] --[[ Name: useGamepadConnectedEvent ]]
    -- upvalues: l_useUserExperiment_0 (copy), v1 (copy), v4 (copy), l_MemStorageService_0 (copy)
    local v10 = l_useUserExperiment_0({
        "PlatformExcellence.QualityImprovement.Consoles"
    }, function(v9) --[[ Line: 14 ]]
        return (v9["PlatformExcellence.QualityImprovement.Consoles"] or {}).showDisconnectDialog;
    end);
    v1.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: v10 (copy), v4 (ref), l_MemStorageService_0 (ref), v8 (copy), v7 (copy)
        if v10 or v4() then
            local v12 = l_MemStorageService_0:BindAndFire("ActiveGamepadConnected", function(v11) --[[ Line: 29 ]]
                -- upvalues: v8 (ref), v7 (ref)
                if v11 == "false" then
                    v8();
                    return;
                else
                    v7();
                    return;
                end;
            end);
            return function() --[[ Line: 37 ]]
                -- upvalues: v12 (copy)
                v12:Disconnect();
            end;
        else
            return function() --[[ Line: 41 ]]

            end;
        end;
    end, {
        v7, 
        v8, 
        v10
    });
end;