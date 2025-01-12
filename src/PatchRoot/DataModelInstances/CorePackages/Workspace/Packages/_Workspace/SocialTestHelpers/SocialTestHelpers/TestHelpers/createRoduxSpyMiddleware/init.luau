return function(v0) --[[ Line: 1 ]] --[[ Name: createRoduxSpyMiddleware ]]
    return function(v1) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        return function(v2) --[[ Line: 3 ]]
            -- upvalues: v0 (ref), v1 (copy)
            v0(v2);
            return v1(v2);
        end;
    end;
end;