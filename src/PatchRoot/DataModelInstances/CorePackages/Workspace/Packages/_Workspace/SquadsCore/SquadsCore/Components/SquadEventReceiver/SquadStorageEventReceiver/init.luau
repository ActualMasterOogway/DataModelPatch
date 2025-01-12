local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_script_FirstAncestor_0.RoduxSquads);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Thunks.fetchActiveSquad);
local v6 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local v7 = require(l_script_FirstAncestor_0.Common.validateSquadId);
local v8 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
return function() --[[ Line: 16 ]]
    -- upvalues: l_useDispatch_0 (copy), v6 (copy), v8 (copy), l_AppStorageService_0 (copy), v4 (copy), l_useEffectOnce_0 (copy), v7 (copy), v5 (copy), v3 (copy)
    local v11 = l_useDispatch_0();
    local v12 = v6() or "";
    local v13, v14 = v8.useState(false);
    v8.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v13 (copy), l_AppStorageService_0 (ref), v4 (ref), v12 (copy)
        if v13 then
            l_AppStorageService_0:SetItem(v4.ACTIVE_SQUAD_APP_STORAGE_KEY, v12);
            l_AppStorageService_0:Flush();
        end;
    end, {
        v12, 
        v13
    });
    l_useEffectOnce_0(function() --[[ Line: 30 ]]
        -- upvalues: l_AppStorageService_0 (ref), v4 (ref), v7 (ref), v12 (copy), v11 (copy), v5 (ref), v3 (ref), v14 (copy)
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v4.ACTIVE_SQUAD_APP_STORAGE_KEY);
        local v16 = v7(l_l_AppStorageService_0_Item_0);
        if v16 and v12 == "" then
            v11(v5());
        elseif l_l_AppStorageService_0_Item_0 ~= "" and not v16 or v12 ~= "" and v12 ~= l_l_AppStorageService_0_Item_0 then
            v11(v3.Actions.CurrentSquadUpdated(nil));
            l_AppStorageService_0:SetItem(v4.ACTIVE_SQUAD_APP_STORAGE_KEY, "");
            l_AppStorageService_0:Flush();
        end;
        v14(true);
    end, {});
    return nil;
end;