local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdMarqueeConstantScrollingSpeed);
local l_GetFFlagSongbirdWindowResponsiveSizing_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongbirdWindowResponsiveSizing;
local l_useCallback_0 = v4.useCallback;
local l_useBinding_0 = v4.useBinding;
local l_useState_0 = v4.useState;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useEventConnection_0 = v5.useEventConnection;
local v13 = {
    speed = v6() and 20 or 5, 
    direction = Enum.TextDirection.LeftToRight
};
local function _(v14, v15, v16) --[[ Line: 35 ]] --[[ Name: lerp ]]
    return (1 - v16) * v14 + v15 * v16;
end;
return function(v18) --[[ Line: 39 ]] --[[ Name: MarqueeScroller ]]
    -- upvalues: v2 (copy), v13 (copy), l_useTokens_0 (copy), v6 (copy), l_useBinding_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v4 (copy), v3 (copy), l_useEventConnection_0 (copy), l_RunService_0 (copy), l_GetFFlagSongbirdWindowResponsiveSizing_0 (copy)
    local v19 = v2.Dictionary.join(v13, v18);
    local v20 = l_useTokens_0();
    local v21 = if v19.padding then v19.padding else v20.Margin.Large;
    local v22 = v19.direction == Enum.TextDirection.LeftToRight;
    local v23 = nil;
    local v24 = nil;
    if not v6() then
        local v25, v26 = l_useBinding_0(0);
        v23 = v25;
        v24 = v26;
    end;
    local v27 = nil;
    local v28 = nil;
    if v6() then
        local v29, v30 = l_useBinding_0(0);
        v27 = v29;
        v28 = v30;
    end;
    local v31, v32 = l_useState_0(Vector2.new(1e999, 1e999));
    local v33 = if v6() then v31.X + v21 else nil;
    local v35 = l_useCallback_0(function(v34) --[[ Line: 57 ]]
        -- upvalues: v32 (copy)
        v32(v34.AbsoluteSize);
    end, {});
    local v36 = {};
    for v37 = 1, 2 do
        v36[("Content%*"):format(v37)] = v4.createElement(v3.View, {
            tag = "auto-xy", 
            onAbsoluteSizeChanged = if v37 == 1 then v35 else nil, 
            LayoutOrder = v37
        }, v19.children);
    end;
    if v6() then
        l_useEventConnection_0(l_RunService_0.Heartbeat, function(v38) --[[ Line: 72 ]]
            -- upvalues: v19 (copy), v27 (ref), v33 (copy), v28 (ref)
            if v19.speed > 0 then
                local v39 = v27:getValue() + v19.speed * v38;
                if v33 <= v39 then
                    v39 = v39 - v33;
                end;
                v28(v39);
            end;
        end, {
            v19.speed, 
            v33
        });
    else
        l_useEventConnection_0(l_RunService_0.Heartbeat, function(v40) --[[ Line: 82 ]]
            -- upvalues: v19 (copy), v23 (ref), v24 (ref)
            if v19.speed > 0 then
                local v41 = v23:getValue() + v19.speed / 60 * v40;
                if v41 > 1 then
                    v41 = v41 - 1;
                end;
                v24(v41);
            end;
        end, {
            v19.speed
        });
    end;
    return v4.createElement(v3.View, {
        tag = l_GetFFlagSongbirdWindowResponsiveSizing_0() and "auto-xy clip" or "size-full clip", 
        LayoutOrder = v19.LayoutOrder, 
        sizeConstraint = {
            MaxSize = v31
        }
    }, {
        Scroller = v4.createElement(v3.View, {
            tag = "auto-xy row data-testid=scroller", 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v21)
            }, 
            Position = if v6() then v27:map(function(v42) --[[ Line: 107 ]]
                -- upvalues: v22 (copy)
                if v22 then
                    return UDim2.new(0, -1 * v42, 0, 0);
                else
                    return UDim2.new(-1, v42, 0, 0);
                end;
            end) else v23:map(function(v43) --[[ Line: 114 ]]
                -- upvalues: v22 (copy), v31 (copy), v21 (copy)
                local l_new_0 = UDim2.new;
                local v45 = v22 and 0 or -1;
                local v46 = v31.X + v21;
                return l_new_0(v45, ((1 - v43) * 0 + v46 * v43) * (v22 and -1 or 1), 0, 0);
            end)
        }, v36)
    });
end;