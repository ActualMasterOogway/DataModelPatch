local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = game:DefineFastFlag("ImpressionsTrackerScreenSizeClamp", false);
local function _(v4, v5) --[[ Line: 20 ]] --[[ Name: calculateViewportBounds ]]
    local v6 = v4 or Vector2.zero;
    local v7 = v6 + (v5 or Vector2.zero);
    return {
        min = v6, 
        max = v7
    };
end;
local function v18(v9, v10, v11) --[[ Line: 26 ]] --[[ Name: calculateClampedViewportBounds ]]
    local v12 = v9 or Vector2.zero;
    local v13 = v12 + (v10 or Vector2.zero);
    local v14 = math.max(v11.min.X, v12.X);
    local v15 = math.min(v11.max.X, v13.X);
    local v16 = math.max(v11.min.Y, v12.Y);
    local v17 = math.min(v11.max.Y, v13.Y);
    return {
        min = Vector2.new(v14, v16), 
        max = Vector2.new(v15, v17)
    };
end;
return function(v19) --[[ Line: 41 ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v1 (copy), v18 (copy)
    local v20 = nil;
    if v3 then
        local v22 = l_useSelector_0(function(v21) --[[ Line: 44 ]]
            return v21.ScreenSize;
        end);
        local v24 = l_useSelector_0(function(v23) --[[ Line: 47 ]]
            return v23.TopBar.topBarHeight;
        end);
        local v26 = l_useSelector_0(function(v25) --[[ Line: 50 ]]
            return v25.GlobalGuiInset;
        end);
        local l_v24_0 = v24 --[[ copy: 3 -> 5 ]];
        local l_v22_0 = v22 --[[ copy: 2 -> 6 ]];
        v20 = v1.useMemo(function() --[[ Line: 53 ]]
            -- upvalues: l_v24_0 (copy), l_v22_0 (copy), v26 (copy)
            return {
                min = Vector2.new(0, l_v24_0), 
                max = Vector2.new(l_v22_0.X, l_v22_0.Y - v26.bottom)
            };
        end, {
            v24, 
            v22, 
            v26
        });
    end;
    local v29, v30 = v1.useState({
        min = Vector2.zero, 
        max = Vector2.zero
    });
    v1.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v19 (copy), v30 (copy), v3 (ref), v18 (ref), v20 (ref)
        local v31 = {};
        if v19.current then
            local l_current_0 = v19.current;
            local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            local l_v30_0 = v30;
            local v36;
            if v3 then
                v36 = v18(l_AbsolutePosition_0, l_AbsoluteSize_0, v20);
            else
                local l_l_AbsolutePosition_0_0 = l_AbsolutePosition_0;
                local l_l_AbsoluteSize_0_0 = l_AbsoluteSize_0;
                local v39 = l_l_AbsolutePosition_0_0 or Vector2.zero;
                local v40 = v39 + (l_l_AbsoluteSize_0_0 or Vector2.zero);
                v36 = {
                    min = v39, 
                    max = v40
                };
            end;
            l_v30_0(v36);
            do
                local l_l_AbsolutePosition_0_1, l_l_AbsoluteSize_0_1 = l_AbsolutePosition_0, l_AbsoluteSize_0;
                table.insert(v31, l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 86 ]]
                    -- upvalues: l_l_AbsolutePosition_0_1 (ref), l_current_0 (copy), v30 (ref), v3 (ref), v18 (ref), l_l_AbsoluteSize_0_1 (ref), v20 (ref)
                    l_l_AbsolutePosition_0_1 = l_current_0.AbsolutePosition;
                    local l_v30_1 = v30;
                    local v44;
                    if v3 then
                        v44 = v18(l_l_AbsolutePosition_0_1, l_l_AbsoluteSize_0_1, v20);
                    else
                        local l_l_l_AbsolutePosition_0_1_0 = l_l_AbsolutePosition_0_1;
                        local l_l_l_AbsoluteSize_0_1_0 = l_l_AbsoluteSize_0_1;
                        local v47 = l_l_l_AbsolutePosition_0_1_0 or Vector2.zero;
                        local v48 = v47 + (l_l_l_AbsoluteSize_0_1_0 or Vector2.zero);
                        v44 = {
                            min = v47, 
                            max = v48
                        };
                    end;
                    l_v30_1(v44);
                end));
                table.insert(v31, l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 101 ]]
                    -- upvalues: l_l_AbsoluteSize_0_1 (ref), l_current_0 (copy), v30 (ref), v3 (ref), v18 (ref), l_l_AbsolutePosition_0_1 (ref), v20 (ref)
                    l_l_AbsoluteSize_0_1 = l_current_0.AbsoluteSize;
                    local l_v30_2 = v30;
                    local v50;
                    if v3 then
                        v50 = v18(l_l_AbsolutePosition_0_1, l_l_AbsoluteSize_0_1, v20);
                    else
                        local l_l_l_AbsolutePosition_0_1_1 = l_l_AbsolutePosition_0_1;
                        local l_l_l_AbsoluteSize_0_1_1 = l_l_AbsoluteSize_0_1;
                        local v53 = l_l_l_AbsolutePosition_0_1_1 or Vector2.zero;
                        local v54 = v53 + (l_l_l_AbsoluteSize_0_1_1 or Vector2.zero);
                        v50 = {
                            min = v53, 
                            max = v54
                        };
                    end;
                    l_v30_2(v50);
                end));
            end;
        end;
        return function() --[[ Line: 112 ]]
            -- upvalues: v31 (copy)
            for _, v56 in v31 do
                v56:Disconnect();
            end;
        end;
    end, {
        v19, 
        if v3 then v20 else nil
    });
    return v29;
end;