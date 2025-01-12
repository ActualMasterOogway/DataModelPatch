local l_script_FirstAncestor_0 = script:FindFirstAncestor("RealtimeDelivery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.Cryo).Dictionary;
local l_List_0 = require(l_Parent_0.Cryo).List;
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.RealtimeTypes);
local v6 = require(script.Parent.useRobloxEventReceiver);
local v7 = require(script.Parent.useRealtimeNamespace);
game:DefineFastFlag("RealtimeDeliveryReconnectFix", false);
return function(v8, v9, v10) --[[ Line: 15 ]] --[[ Name: useRealtimeConnectionStateChanged ]]
    -- upvalues: v6 (copy), v4 (copy), v7 (copy), l_List_0 (copy), l_Dictionary_0 (copy)
    local v11 = v6();
    local v12 = v4.useRef(nil);
    v7(v8, function(v13) --[[ Line: 25 ]]
        -- upvalues: v12 (copy)
        local l_SequenceNumber_0 = v13.SequenceNumber;
        if game:GetFastFlag("RealtimeDeliveryReconnectFix") then
            if l_SequenceNumber_0 and (v12.current == nil or v12.current < l_SequenceNumber_0) then
                v12.current = l_SequenceNumber_0;
                return;
            end;
        else
            v12.current = l_SequenceNumber_0;
        end;
    end, if game:GetFastFlag("RealtimeDeliveryReconnectFix") then l_List_0.join({
        v8
    }, v10) else l_Dictionary_0.union({
        v8
    }, v10));
    v4.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy), v8 (copy), v12 (copy), v9 (copy)
        local v21 = v11:observeEvent("signalR", function(v15, _, v17) --[[ Line: 50 ]]
            -- upvalues: v8 (ref), v12 (ref), v9 (ref)
            local v18 = v17[v8];
            if game:GetFastFlag("RealtimeDeliveryReconnectFix") then
                local v19 = v18 ~= nil and (v12.current == nil or v12.current ~= v18);
                if v18 then
                    v12.current = v18;
                end;
                v9(v15, v19);
                return;
            else
                local v20 = v12.current ~= nil and v12.current ~= v18;
                v12.current = v18;
                v9(v15, v20);
                return;
            end;
        end);
        return function() --[[ Line: 76 ]]
            -- upvalues: v21 (copy)
            v21:disconnect();
        end;
    end, if game:GetFastFlag("RealtimeDeliveryReconnectFix") then l_List_0.join({
        v11, 
        v12.current
    }, v10) else l_Dictionary_0.union({
        v11
    }, v10));
end;