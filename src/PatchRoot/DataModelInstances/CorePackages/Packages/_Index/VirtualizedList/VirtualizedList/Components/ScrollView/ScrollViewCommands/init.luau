local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(l_Parent_0.React);
return {
    default = {
        flashScrollIndicators = function(_) --[[ Line: 59 ]] --[[ Name: flashScrollIndicators ]]
            warn("flashScrollIndicators not implemented");
        end, 
        scrollTo = function(v4, v5, v6, v7) --[[ Line: 62 ]] --[[ Name: scrollTo ]]
            if v7 then
                v4._nativeRef.animateScrollTo(v5, v6);
                return;
            else
                v4._nativeRef.current.CanvasPosition = Vector2.new(v5, v6);
                return;
            end;
        end, 
        scrollToEnd = function(v8, v9) --[[ Line: 69 ]] --[[ Name: scrollToEnd ]]
            local v10 = v8._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y and 0 or v8._nativeRef.current.AbsoluteCanvasSize.X;
            local v11 = if v8._nativeRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v8._nativeRef.current.AbsoluteCanvasSize.Y else 0;
            if v9 then
                v8._nativeRef.animateScrollTo(v10, v11);
                return;
            else
                v8._nativeRef.current.CanvasPosition = Vector2.new(v10, v11);
                return;
            end;
        end, 
        zoomToRect = function(_, _, _) --[[ Line: 83 ]] --[[ Name: zoomToRect ]]
            warn("zoomToRect not implemented");
        end
    }
};