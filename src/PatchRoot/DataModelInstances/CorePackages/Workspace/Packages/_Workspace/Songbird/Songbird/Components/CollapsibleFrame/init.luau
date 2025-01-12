local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactOtter);
local l_useBinding_0 = v2.useBinding;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_usePrevious_0 = v3.usePrevious;
local l_useAnimatedBinding_0 = v4.useAnimatedBinding;
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFixCollapsibleTitleSizeWarnings);
local v11 = {
    stiffness = 300, 
    damping = 30, 
    mass = 1
};
local _ = {
    isCollapsed = false
};
return function(v13) --[[ Line: 34 ]] --[[ Name: CollapsibleFrame ]]
    -- upvalues: l_usePrevious_0 (copy), l_useBinding_0 (copy), l_useAnimatedBinding_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), v4 (copy), v11 (copy), v2 (copy), v10 (copy), v1 (copy)
    local v14 = l_usePrevious_0(v13.isCollapsed);
    local v15, v16 = l_useBinding_0(Vector2.new(1e999, 1e999));
    local v17, v18 = l_useAnimatedBinding_0(v13.isCollapsed and 0 or 1);
    local v20 = l_useCallback_0(function(v19) --[[ Line: 39 ]]
        -- upvalues: v16 (copy)
        v16(v19.AbsoluteCanvasSize);
    end, {});
    l_useEffect_0(function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v13 (copy), v18 (copy), v4 (ref), v11 (ref)
        if v14 ~= nil then
            if not v13.isCollapsed and v14 then
                v18(v4.spring(1, v11));
                return;
            elseif v13.isCollapsed and not v14 then
                v18(v4.spring(0, v11));
            end;
        end;
    end, {
        v13.isCollapsed, 
        v14
    });
    local v23 = v2.joinBindings({
        maxSize = v15, 
        alpha = v17
    }):map(function(v21) --[[ Line: 56 ]]
        -- upvalues: v10 (ref)
        if v10() then
            local v22 = math.max(v21.maxSize.Y * v21.alpha, 0);
            return Vector2.new(1e999, v22);
        else
            return Vector2.new(1e999, v21.maxSize.Y * v21.alpha);
        end;
    end);
    return v2.createElement(v1.View, {
        tag = "size-full clip", 
        sizeConstraint = {
            MaxSize = v23
        }
    }, {
        ScrollingFrame = v2.createElement("ScrollingFrame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ClipsDescendants = true, 
            ScrollingEnabled = false, 
            HorizontalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarImageTransparency = 1, 
            [v2.Change.AbsoluteCanvasSize] = v20
        }, {
            Container = v2.createElement(v1.View, {
                tag = "auto-y size-full-0"
            }, v13.children)
        })
    });
end;