local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.logger);
local v3 = require(l_script_FirstAncestor_0.Hooks.useCurrentSong);
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
return function(v6, v7) --[[ Line: 15 ]] --[[ Name: useMusicPeek ]]
    -- upvalues: l_useRef_0 (copy), v3 (copy), l_useEffect_0 (copy), v2 (copy)
    local v8 = l_useRef_0({});
    local v9 = v3();
    l_useEffect_0(function() --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v8 (copy), v2 (ref), v7 (copy), v6 (copy)
        local v10 = if v9 then v9.sound else nil;
        if v10 then
            if v8.current[v10.SoundId] then
                v2:debug((("song with SoundId %* has already been shown. skipping..."):format(v10.SoundId)));
                return;
            elseif if v7 then v6:tryShowPeek("music_peek_portrait") else v6:tryShowPeek("music_peek") then
                v2:info((("Peek shown for SoundId %*"):format(v10.SoundId)));
                v8.current[v10.SoundId] = true;
            end;
        end;
    end, {
        v9
    });
end;