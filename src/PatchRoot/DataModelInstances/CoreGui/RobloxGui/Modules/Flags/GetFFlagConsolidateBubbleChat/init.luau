local l_Players_0 = game:GetService("Players");
game:DefineFastFlag("ConsolidateBubbleChat5", false);
game:DefineFastInt("ConsolidateBubbleChatRollout4", 0);
return function() --[[ Line: 6 ]]
    -- upvalues: l_Players_0 (copy)
    if game:GetFastFlag("ConsolidateBubbleChat5") then
        return true;
    else
        local l_game_FastInt_0 = game:GetFastInt("ConsolidateBubbleChatRollout4");
        if l_game_FastInt_0 <= 0 then
            return false;
        elseif not l_Players_0.LocalPlayer or not l_Players_0.LocalPlayer.UserId then
            return false;
        else
            return (l_Players_0.LocalPlayer.UserId + 21) % 100 < l_game_FastInt_0;
        end;
    end;
end;