return function(v0) --[[ Line: 1 ]] --[[ Name: createMockRobloxEventReceiver ]]
    return {
        GetItem = function(_, _) --[[ Line: 3 ]] --[[ Name: GetItem ]]
            -- upvalues: v0 (copy)
            if v0 then
                return v0;
            else
                return "true";
            end;
        end, 
        SetItem = function(_, _, _) --[[ Line: 7 ]] --[[ Name: SetItem ]]

        end, 
        Flush = function(_) --[[ Line: 11 ]] --[[ Name: Flush ]]

        end
    };
end;