local v0 = require(script.Symbol);
local v1 = require(script["Registry.global"]);
local v4 = setmetatable({}, {
    __call = function(_, v3) --[[ Line: 29 ]] --[[ Name: __call ]]
        -- upvalues: v0 (copy)
        return v0.new(v3);
    end
});
v4.for_ = v1.getOrInit;
return v4;