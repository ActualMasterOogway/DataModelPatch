local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Hooks.useCurrentSong);
local _ = require(l_script_FirstAncestor_0.types);
local l_useRef_0 = v1.useRef;
return function() --[[ Line: 20 ]] --[[ Name: useFirstSongForComponentLifetime ]]
    -- upvalues: v2 (copy), l_useRef_0 (copy)
    local v5 = v2();
    local v6 = l_useRef_0(v5);
    if not v6.current or not v6.current.sound or not v6.current.metadata then
        v6.current = v5;
    end;
    return v6.current;
end;