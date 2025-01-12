return function() --[[ Line: 5 ]]
    local v0 = {};
    return {
        mockEventReceiver = {
            observeEvent = function(_, v2, v3) --[[ Line: 8 ]] --[[ Name: observeEvent ]]
                -- upvalues: v0 (copy)
                v0[v2] = v3;
            end
        }, 
        events = v0
    };
end;