local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v3 = require(l_Parent_0.React);
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: useAnimateScrollViewToSelection ]]
    -- upvalues: v3 (copy), l_UserGameSettings_0 (copy), l_TweenService_0 (copy)
    v3.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy), l_UserGameSettings_0 (ref), l_TweenService_0 (ref), v5 (copy)
        local v6 = {};
        local v7 = nil;
        local v8 = 0;
        local v9 = 0;
        if v4 and v4.current ~= nil then
            local l_current_0 = v4.current;
            v8 = l_current_0.AbsolutePosition.Y;
            v9 = l_current_0.AbsoluteWindowSize.Y;
            table.insert(v6, l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 26 ]]
                -- upvalues: v8 (ref), l_current_0 (copy)
                v8 = l_current_0.AbsolutePosition.Y;
            end));
            table.insert(v6, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 32 ]]
                -- upvalues: v9 (ref), l_current_0 (copy)
                v9 = l_current_0.AbsoluteWindowSize.Y;
            end));
            table.insert(v6, l_current_0.SelectionChanged:Connect(function(_, _, v13) --[[ Line: 38 ]]
                -- upvalues: l_current_0 (copy), v7 (ref), v9 (ref), v8 (ref), l_UserGameSettings_0 (ref), l_TweenService_0 (ref), v5 (ref)
                if v13 == nil or not v13:IsDescendantOf(l_current_0) then
                    return;
                else
                    if v7 then
                        v7:Cancel();
                        v7 = nil;
                    end;
                    local l_Y_0 = v13.AbsoluteSize.Y;
                    local v15 = v13.AbsolutePosition.Y - (v9 * 0.5 - l_Y_0 * 0.5 + v8);
                    local l_CanvasPosition_0 = l_current_0.CanvasPosition;
                    local v17 = Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + v15);
                    if l_UserGameSettings_0.ReducedMotion then
                        l_current_0.CanvasPosition = v17;
                        return;
                    else
                        v7 = l_TweenService_0:Create(l_current_0, TweenInfo.new(v5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            CanvasPosition = v17
                        });
                        if v7 then
                            v7:Play();
                        end;
                        return;
                    end;
                end;
            end));
        end;
        return function() --[[ Line: 74 ]]
            -- upvalues: v6 (copy), v7 (ref)
            for _, v19 in v6 do
                v19:Disconnect();
            end;
            if v7 then
                v7:Cancel();
            end;
        end;
    end, {
        v4, 
        v5
    });
end;