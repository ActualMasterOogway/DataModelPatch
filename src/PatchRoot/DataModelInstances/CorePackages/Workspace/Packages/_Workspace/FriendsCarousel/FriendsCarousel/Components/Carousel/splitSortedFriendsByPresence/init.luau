local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_llama_0 = v1.llama;
local l_memoize_0 = v1.memoize;
local _ = require(l_Parent_0.Common.LocalTypes);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
return (l_memoize_0(function(v6) --[[ Line: 12 ]]
    -- upvalues: l_llama_0 (copy), l_PresenceType_0 (copy)
    local v8 = l_llama_0.List.find(l_llama_0.List.map(v6, function(v7) --[[ Line: 14 ]]
        return v7.userPresenceType;
    end), l_PresenceType_0.Offline);
    if v8 then
        return l_llama_0.List.slice(v6, 0, v8 - 1), (l_llama_0.List.slice(v6, v8));
    else
        return v6, {};
    end;
end));