local l_Modules_0 = script:FindFirstAncestor("DiscoveryMonolith").Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetHomePageUpsellCardVariation);
local v2 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        return v1(v3):andThen(function(v5) --[[ Line: 8 ]]
            -- upvalues: v4 (copy), v2 (ref)
            if v5 and v5.responseBody then
                local l_responseBody_0 = v5.responseBody;
                v4:dispatch(v2(l_responseBody_0.upsellCardType or "", l_responseBody_0.localizedTitleTextOverride or "", l_responseBody_0.localizedBodyTextOverride or ""));
                return;
            else
                v4:dispatch(v2("", "", ""));
                return;
            end;
        end, function(_) --[[ Line: 21 ]]
            -- upvalues: v4 (copy), v2 (ref)
            v4:dispatch(v2("", "", ""));
        end);
    end;
end;