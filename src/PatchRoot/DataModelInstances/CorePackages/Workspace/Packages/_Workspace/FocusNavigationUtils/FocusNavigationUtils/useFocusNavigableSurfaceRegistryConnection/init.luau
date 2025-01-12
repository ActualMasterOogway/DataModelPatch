local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry);
local l_useRegisterFocusNavigableSurface_0 = v3.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = v3.useDeRegisterFocusNavigableSurface;
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local l_FFlagEnableRNFocusRestoration_0 = require(l_Parent_0.SharedFlags).FFlagEnableRNFocusRestoration;
local l_FFlagFocusRegistryConnectionRefactor_0 = require(l_Parent_0.SharedFlags).FFlagFocusRegistryConnectionRefactor;
return function(v9, v10, v11) --[[ Line: 20 ]]
    -- upvalues: l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_FFlagFocusRegistryConnectionRefactor_0 (copy), v2 (copy), l_FFlagEnableRNFocusRestoration_0 (copy)
    local v12 = l_useRegisterFocusNavigableSurface_0();
    local v13 = l_useDeRegisterFocusNavigableSurface_0();
    if l_FFlagFocusRegistryConnectionRefactor_0 then
        local v14 = false;
        if v9 ~= nil then
            v14 = v11 == nil or v11;
        end;
        v2.useEffect(function() --[[ Line: 30 ]]
            -- upvalues: v14 (copy), v12 (copy), v10 (copy), v9 (copy), v13 (copy)
            if v14 then
                v12(v10, v9);
            else
                v13(v10, v9);
            end;
            return function() --[[ Line: 37 ]]
                -- upvalues: v13 (ref), v10 (ref), v9 (ref)
                v13(v10, v9);
            end;
        end, {
            v14, 
            v10
        });
        return;
    else
        v2.useEffect(function() --[[ Line: 43 ]]
            -- upvalues: v9 (copy), l_FFlagEnableRNFocusRestoration_0 (ref), v11 (copy), v12 (copy), v10 (copy), v13 (copy)
            local v15 = v9 ~= nil;
            if l_FFlagEnableRNFocusRestoration_0 and v11 ~= nil then
                v15 = v15 and v11;
            end;
            if v15 then
                v12(v10, v9);
            else
                v13(v10, v9);
            end;
            return function() --[[ Line: 55 ]]
                -- upvalues: v13 (ref), v10 (ref), v9 (ref)
                v13(v10, v9);
            end;
        end, {
            v9, 
            v11, 
            v10, 
            v12, 
            v13
        });
        return;
    end;
end;