local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.CapturesCommon);
local v8 = require(l_Parent_1.Otter);
local l_Signal_0 = v4.Signal;
local v10 = require(l_Parent_1.UIBlox);
local v11 = require(l_Parent_0.Enums.FeedDirectionType);
local v12 = require(l_Parent_0.Enums.NavigationType);
local l_useExternalEvent_0 = v10.Core.Hooks.useExternalEvent;
local v14 = require(l_Parent_0.Hooks.useGuiInset);
local l_useRef_0 = v5.useRef;
local l_useScreenSize_0 = v6.useScreenSize;
local v17 = require(l_Parent_0.Flags.FFlagContentFeedFixOffsetForPartyBanner);
local l_FFlagContentFeedPinchToZoomEnabled_0 = v7.Flags.FFlagContentFeedPinchToZoomEnabled;
local function v23(v19, v20) --[[ Line: 33 ]]
    local v21 = v20 + 2 * Vector2.new(0, 0).Y;
    local v22 = v19 % v21;
    if v21 / 2 < v22 then
        return (math.min(v19 + (v21 - v22), 0));
    else
        return v19 - v22;
    end;
end;
local function v30(v24, v25, v26, v27, v28) --[[ Line: 48 ]]
    -- upvalues: v8 (copy)
    local v29 = v8.createSingleMotor(v24);
    v29:onStep(v26);
    v29:onComplete(v27);
    v28.current = true;
    v29:setGoal(v8.spring(v25, {
        frequency = 8
    }));
end;
return function(v31, v32, v33, v34) --[[ Line: 62 ]]
    -- upvalues: l_useScreenSize_0 (copy), v14 (copy), l_useRef_0 (copy), l_Signal_0 (copy), v17 (copy), v23 (ref), l_FFlagContentFeedPinchToZoomEnabled_0 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy), v12 (copy), v30 (copy), v5 (copy), l_ContextActionService_0 (copy), v11 (copy)
    local v35 = l_useScreenSize_0();
    local v36 = v14();
    local v37 = l_useRef_0(nil);
    local v38 = l_useRef_0(false);
    local v39 = l_useRef_0(false);
    local v40 = l_useRef_0(nil);
    local v41 = l_useRef_0(nil);
    local v42 = l_useRef_0(nil);
    local v43 = l_useRef_0(l_Signal_0.new());
    if v17 then
        v23 = function(v44, v45) --[[ Line: 75 ]]
            -- upvalues: v36 (copy)
            local v46 = v44 % v45;
            if v45 / 2 < v46 then
                return math.min(v44 + (v45 - v46), 0) - v36.top;
            else
                return v44 - v46 - v36.top;
            end;
        end;
    end;
    if l_FFlagContentFeedPinchToZoomEnabled_0 then
        l_useExternalEvent_0(l_UserInputService_0.TouchPinch, function(_, _, _, v50, _) --[[ Line: 88 ]]
            -- upvalues: v39 (copy)
            if v50 == Enum.UserInputState.Begin then
                v39.current = true;
            end;
            if v50 == Enum.UserInputState.End then
                v39.current = false;
            end;
        end);
    end;
    l_useExternalEvent_0(l_UserInputService_0.TouchStarted, function(v52) --[[ Line: 100 ]]
        -- upvalues: v38 (copy), v40 (copy), v37 (copy), v42 (copy), v34 (copy), v41 (copy)
        v38.current = false;
        if v40.current == nil and v37.current and v42.current == nil and not v34 then
            v40.current = v37.current.Position.Y.Offset;
            v41.current = v52.Position.Y;
            v42.current = v52;
        end;
    end);
    l_useExternalEvent_0(l_UserInputService_0.TouchMoved, function(v53) --[[ Line: 114 ]]
        -- upvalues: v37 (copy), l_FFlagContentFeedPinchToZoomEnabled_0 (ref), v39 (copy), v40 (copy), v41 (copy), v42 (copy), v34 (copy), v31 (copy), v32 (copy)
        if v37.current and (not l_FFlagContentFeedPinchToZoomEnabled_0 or not v39.current) and v40.current ~= nil and v41.current ~= nil and v53 == v42.current and not v34 then
            local v54 = v53.Position.Y - v41.current;
            if v31 then
                v54 = math.min(v54, 100);
            end;
            if v32 then
                v54 = math.max(v54, -100);
            end;
            v37.current.Position = UDim2.fromOffset(0, v40.current + v54);
        end;
    end);
    l_useExternalEvent_0(l_UserInputService_0.TouchSwipe, function(v55) --[[ Line: 137 ]]
        -- upvalues: v37 (copy), v38 (copy), v34 (copy), v31 (copy), v32 (copy), v35 (copy), v12 (ref), v23 (ref), v33 (copy), v17 (ref), v36 (copy), v43 (copy), v30 (ref)
        if not v37.current or v38.current or v34 then
            return;
        else
            assert(v37.current ~= nil, "feedMotionRef.current is nil");
            if v31 and v55 == Enum.SwipeDirection.Down then
                return;
            elseif v32 and v55 == Enum.SwipeDirection.Up then
                return;
            else
                local v56 = 0;
                if v55 == Enum.SwipeDirection.Up and v37.current.Position.Y.Offset % v35.Y > v35.Y / 2 then
                    v56 = v35.Y;
                elseif v55 == Enum.SwipeDirection.Down and v37.current.Position.Y.Offset % v35.Y < v35.Y / 2 then
                    v56 = -v35.Y;
                end;
                local v57 = if v55 == Enum.SwipeDirection.Up then v12.NavigatedToPreviousItem else v12.NavigatedToNextItem;
                local l_Offset_0 = v37.current.Position.Y.Offset;
                local v59 = math.clamp(v23(v37.current.Position.Y.Offset - v56, v35.Y), -(v33 - 1) * v35.Y - if v17 then v36.top else 0, 0);
                v30(l_Offset_0, v59, function(v60) --[[ Line: 175 ]]
                    -- upvalues: v37 (ref)
                    if not v37.current then
                        return;
                    else
                        v37.current.Position = UDim2.fromOffset(0, v60);
                        return;
                    end;
                end, function() --[[ Line: 181 ]]
                    -- upvalues: l_Offset_0 (copy), v59 (copy), v38 (ref), v43 (ref), v57 (copy)
                    if math.abs(l_Offset_0 - v59) < 2 then
                        return;
                    else
                        v38.current = false;
                        v43.current:fire(v57);
                        return;
                    end;
                end, v38);
                return;
            end;
        end;
    end);
    l_useExternalEvent_0(l_UserInputService_0.TouchEnded, function(v61) --[[ Line: 192 ]]
        -- upvalues: v42 (copy), v37 (copy), v40 (copy), v38 (copy), v34 (copy), v23 (ref), v35 (copy), v12 (ref), v43 (copy), v30 (ref)
        if v42.current == v61 then
            v42.current = nil;
        end;
        if not v37.current or not v40.current or v38.current or v42.current ~= nil or v34 then
            return;
        else
            assert(v37.current ~= nil, "feedMotionRef.current is nil");
            assert(v40.current ~= nil, "feedStartPositionYOffset.current is nil");
            local v62 = nil;
            local v63 = v23(v40.current, v35.Y);
            local v64 = v23(v37.current.Position.Y.Offset, v35.Y);
            v62 = if v63 < v64 then v12.NavigatedToPreviousItem else if v64 < v63 then v12.NavigatedToNextItem else v12.NavigatedToCurrentItem;
            v40.current = nil;
            local l_Offset_1 = v37.current.Position.Y.Offset;
            task.wait();
            if l_Offset_1 ~= v37.current.Position.Y.Offset then
                return;
            else
                local l_Offset_2 = v37.current.Position.Y.Offset;
                v30(l_Offset_2, v64, function(v67) --[[ Line: 234 ]]
                    -- upvalues: v37 (ref)
                    if not v37.current then
                        return;
                    else
                        v37.current.Position = UDim2.fromOffset(0, v67);
                        return;
                    end;
                end, function() --[[ Line: 240 ]]
                    -- upvalues: v38 (ref), v62 (ref), v43 (ref)
                    v38.current = false;
                    if v62 then
                        v43.current:fire(v62);
                    end;
                end, v38);
                return;
            end;
        end;
    end);
    v5.useEffect(function() --[[ Line: 250 ]]
        -- upvalues: v37 (copy), v38 (copy), v34 (copy), v31 (copy), v32 (copy), v35 (copy), v23 (ref), v43 (copy), v12 (ref), v30 (ref), l_ContextActionService_0 (ref)
        l_ContextActionService_0:BindCoreAction("NAVIGATE_FEED_WITH_KEYBOARD", function(_, v69, v70) --[[ Line: 251 ]]
            -- upvalues: v37 (ref), v38 (ref), v34 (ref), v31 (ref), v32 (ref), v35 (ref), v23 (ref), v43 (ref), v12 (ref), v30 (ref)
            if not v37.current or v38.current or v34 then
                return;
            else
                assert(v37.current ~= nil, "feedMotionRef.current is nil");
                if v69 ~= Enum.UserInputState.End then
                    return;
                elseif v31 and v70.KeyCode == Enum.KeyCode.Up then
                    return;
                elseif v32 and v70.KeyCode == Enum.KeyCode.Down then
                    return;
                else
                    local v71 = 0;
                    if v70.KeyCode == Enum.KeyCode.Up then
                        v71 = -v35.Y;
                    elseif v70.KeyCode == Enum.KeyCode.Down then
                        v71 = v35.Y;
                    end;
                    local l_Offset_3 = v37.current.Position.Y.Offset;
                    local v73 = v23(v37.current.Position.Y.Offset - v71, v35.Y);
                    local function v75(v74) --[[ Line: 282 ]]
                        -- upvalues: v37 (ref), v73 (copy)
                        if not v37.current then
                            return;
                        elseif v73 - v74 < 2 and v73 - v74 > -2 then
                            v37.current.Position = UDim2.fromOffset(0, v73);
                            return;
                        else
                            v37.current.Position = UDim2.fromOffset(0, v74);
                            return;
                        end;
                    end;
                    local function v76() --[[ Line: 292 ]]
                        -- upvalues: v38 (ref), v70 (copy), v43 (ref), v12 (ref)
                        v38.current = false;
                        if v70.KeyCode == Enum.KeyCode.Down then
                            v43.current:fire(v12.NavigatedToPreviousItem);
                            return;
                        else
                            if v70.KeyCode == Enum.KeyCode.Up then
                                v43.current:fire(v12.NavigatedToNextItem);
                            end;
                            return;
                        end;
                    end;
                    v38.current = true;
                    v30(l_Offset_3, v73, v75, v76, v38);
                    return;
                end;
            end;
        end, false, Enum.KeyCode.Up, Enum.KeyCode.Down);
        return function() --[[ Line: 313 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("NAVIGATE_FEED_WITH_KEYBOARD");
        end;
    end, {
        v35
    });
    local v84 = v5.useCallback(function(v77) --[[ Line: 318 ]]
        -- upvalues: v37 (copy), v38 (copy), v11 (ref), v35 (copy), v23 (ref), v43 (copy), v12 (ref), v30 (ref)
        if not v37.current or v38.current then
            return;
        else
            assert(v37.current ~= nil, "feedMotionRef.current is nil");
            local v78 = 0;
            if v77 == v11.Up then
                v78 = -v35.Y;
            elseif v77 == v11.Down then
                v78 = v35.Y;
            end;
            local l_Offset_4 = v37.current.Position.Y.Offset;
            local v80 = v23(v37.current.Position.Y.Offset - v78, v35.Y);
            local function v82(v81) --[[ Line: 335 ]]
                -- upvalues: v80 (copy), v37 (ref)
                if v80 - v81 < 2 and v80 - v81 > -2 then
                    v37.current.Position = UDim2.fromOffset(0, v80);
                    return;
                else
                    v37.current.Position = UDim2.fromOffset(0, v81);
                    return;
                end;
            end;
            local function v83() --[[ Line: 342 ]]
                -- upvalues: v38 (ref), v77 (copy), v11 (ref), v43 (ref), v12 (ref)
                v38.current = false;
                if v77 == v11.Down then
                    v43.current:fire(v12.NavigatedToPreviousItem);
                    return;
                else
                    if v77 == v11.Up then
                        v43.current:fire(v12.NavigatedToNextItem);
                    end;
                    return;
                end;
            end;
            v38.current = true;
            v30(l_Offset_4, v80, v82, v83, v38);
            return;
        end;
    end, {
        v35
    });
    return v37, v43.current, v84;
end;