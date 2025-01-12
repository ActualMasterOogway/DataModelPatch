local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.ReactOtter);
local v5 = require(l_Parent_1.UIBlox);
local v6 = require(l_Parent_0.App.FeedContext);
local l_useAnimatedBinding_0 = v4.useAnimatedBinding;
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useExternalEvent_0 = v5.Core.Hooks.useExternalEvent;
local v11 = require(l_Parent_0.Hooks.useGuiInset);
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
return function(v14, v15, v16, v17, v18) --[[ Line: 23 ]]
    -- upvalues: v3 (copy), v6 (copy), v11 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_useAnimatedBinding_0 (copy), l_useEffect_0 (copy), v4 (copy), l_useCallback_0 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy)
    local v19 = v3.useContext(v6);
    local v20 = v11();
    local l_isZooming_0 = v19.isZooming;
    local l_setIsZooming_0 = v19.setIsZooming;
    local v23 = l_useRef_0(nil);
    local v24 = l_useRef_0(1);
    local v25 = l_useRef_0(nil);
    local v26 = l_useRef_0(false);
    local v27 = l_useRef_0(Vector2.new(0, 0));
    local v28, v29 = l_useState_0(false);
    local v30, v31 = l_useAnimatedBinding_0(0);
    local v32, v33 = l_useAnimatedBinding_0(0);
    l_useEffect_0(function() --[[ Line: 40 ]]
        -- upvalues: v28 (copy), v25 (copy)
        if not v28 then
            v25.current = nil;
        end;
    end, {
        v28
    });
    l_useEffect_0(function() --[[ Line: 46 ]]
        -- upvalues: v14 (copy), v18 (copy), l_isZooming_0 (copy), v31 (copy), v4 (ref)
        if not v14 or v18 then
            return;
        elseif l_isZooming_0 then
            v31(v4.spring(1, {
                frequency = 4, 
                dampingRatio = 1
            }));
            return;
        else
            v31(v4.spring(0, {
                frequency = 4, 
                dampingRatio = 1
            }));
            return;
        end;
    end, {
        v14, 
        l_isZooming_0, 
        v31, 
        v4.spring
    });
    local v34 = l_useCallback_0(function() --[[ Line: 64 ]]
        -- upvalues: v14 (copy), v29 (copy), v33 (copy), v4 (ref)
        if not v14 then
            return;
        else
            v29(true);
            v33(v4.instant(0));
            task.delay(0.1, function() --[[ Line: 71 ]]
                -- upvalues: v33 (ref), v4 (ref)
                v33((v4.spring(1, {
                    dampingRatio = 1, 
                    frequency = 4
                })));
            end);
            task.delay(0.2, function() --[[ Line: 78 ]]
                -- upvalues: v29 (ref)
                v29(false);
            end);
            return;
        end;
    end, {
        v14, 
        v4.instant, 
        v4.spring
    });
    l_useEffect_0(function() --[[ Line: 83 ]]
        -- upvalues: v14 (copy), v23 (copy), v16 (copy)
        if not v14 and v23.current then
            v23.current.Size = UDim2.new(1, 0, 0, v16);
            v23.current.Position = UDim2.fromScale(0.5, 0.5);
        end;
    end, {
        v14
    });
    l_useExternalEvent_0(l_UserInputService_0.TouchPinch, function(v35, v36, _, v38, _) --[[ Line: 92 ]]
        -- upvalues: v26 (copy), v25 (copy), v34 (copy), l_setIsZooming_0 (copy), v14 (copy), v18 (copy), v28 (copy), v23 (copy), v20 (copy), v17 (copy), v16 (copy), v24 (copy), v27 (copy), v15 (copy)
        if v38 == Enum.UserInputState.End then
            if v26.current or not v25.current then
                return;
            else
                v34();
                l_setIsZooming_0(false);
                return;
            end;
        elseif not v14 or v18 or v28 then
            return;
        elseif not v23.current then
            return;
        else
            if v38 == Enum.UserInputState.Begin then
                v26.current = false;
                local v40 = (v35[1].X + v35[2].X) / 2;
                local v41 = v20.top + (v35[1].Y + v35[2].Y) / 2;
                local l_AbsolutePosition_0 = v23.current:FindFirstChild("ContentFeedImage").AbsolutePosition;
                if v40 < l_AbsolutePosition_0.X or l_AbsolutePosition_0.X + v17 < v40 then
                    return;
                elseif v41 < l_AbsolutePosition_0.Y or l_AbsolutePosition_0.Y + v16 < v41 then
                    return;
                else
                    v25.current = Vector2.new(v40, v41);
                    l_setIsZooming_0(true);
                end;
            end;
            if not v25.current then
                return;
            elseif v26.current then
                return;
            elseif #v35 < 2 then
                v26.current = true;
                v34();
                l_setIsZooming_0(false);
                return;
            else
                local v43 = math.max(1, v36);
                v24.current = v43;
                local v44 = ((v35[1].X + v35[2].X) / 2 - v25.current.X) / v43;
                local v45 = ((v35[1].Y + v35[2].Y) / 2 - v25.current.Y) / v43;
                v27.current = Vector2.new(v44, v45);
                v23.current.Size = UDim2.new(v43, 0, 0, v43 * v16);
                v23.current.Position = UDim2.new(0.5, (0.5 - (v25.current.X - v44) / v17) * v17 * (v43 - 1), 0.5, (0.5 - (v25.current.Y - v45) / v15) * v15 * (v43 - 1));
                return;
            end;
        end;
    end);
    return {
        imageContainerRef = v23, 
        imageFinalScale = v24, 
        initialZoomFocusPosition = v25, 
        nonImageTransparency = v30, 
        zoomAverageDelta = v27, 
        zoomEndTransition = v32, 
        zoomEndTransitionActive = v28
    };
end;