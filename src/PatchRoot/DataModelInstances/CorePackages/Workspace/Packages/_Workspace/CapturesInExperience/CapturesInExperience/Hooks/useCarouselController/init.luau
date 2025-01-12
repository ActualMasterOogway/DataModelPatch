local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_Parent_1.Otter);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_1.RoactUtils);
local v9 = require(l_Parent_1.SocialCommon);
local v10 = require(l_Parent_1.UIBlox);
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useBinding_0 = v7.useBinding;
local l_useEffectOnce_0 = v8.Hooks.useEffectOnce;
local l_useExternalEvent_0 = v10.Core.Hooks.useExternalEvent;
local l_useIsHovered_0 = v9.Hooks.useIsHovered;
local l_useIsTouchDown_0 = v9.Hooks.useIsTouchDown;
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Utils.getClosestItemToCenter);
local v19 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v20, v21, v22) --[[ Line: 69 ]] --[[ Name: isWithinEpsilon ]]
    return math.abs(v20 - v21) < v22;
end;
local function v92(v24, v25, v26) --[[ Line: 73 ]] --[[ Name: createController ]]
    -- upvalues: v6 (copy), v19 (copy), l_UserGameSettings_0 (copy), v18 (copy), l_RunService_0 (copy)
    local v27 = nil;
    local v28 = false;
    local v29 = nil;
    local v30 = false;
    local v31 = 0;
    local v32 = false;
    local function v33() --[[ Line: 85 ]] --[[ Name: getWasTouched ]]
        -- upvalues: v32 (ref)
        return v32;
    end;
    local function v34() --[[ Line: 89 ]] --[[ Name: resetTouchState ]]
        -- upvalues: v28 (ref), v32 (ref)
        v28 = false;
        v32 = false;
    end;
    local function v35() --[[ Line: 94 ]] --[[ Name: getIsNavigationLocked ]]
        -- upvalues: v30 (ref)
        return v30;
    end;
    local function _(v36) --[[ Line: 98 ]] --[[ Name: setIsNavigationLocked ]]
        -- upvalues: v28 (ref), v32 (ref), v30 (ref)
        if v36 == true then
            v28 = false;
            v32 = false;
        end;
        v30 = v36;
    end;
    local function v44(v38, v39, v40) --[[ Line: 105 ]] --[[ Name: resetMotor ]]
        -- upvalues: v29 (ref), v6 (ref), v28 (ref), v31 (ref), v24 (copy)
        if v29 then
            v29:destroy();
            v29 = nil;
        end;
        local v41 = v6.createSingleMotor(v38);
        v29 = v41;
        v41:onStep(function(v42) --[[ Line: 117 ]]
            -- upvalues: v29 (ref), v41 (copy), v28 (ref), v31 (ref), v39 (copy), v38 (copy), v24 (ref)
            if v29 ~= v41 then
                v41:destroy();
                return;
            elseif v28 then
                v41:destroy();
                v29 = nil;
                return;
            else
                local v43 = if math.abs(v42 - v31) < 0.5 then v31 else v42;
                if v39 and v39(v38, v43) then
                    return;
                else
                    if v24.current then
                        v24.current.CanvasPosition = Vector2.new(v43, 0);
                    end;
                    return;
                end;
            end;
        end);
        if v40 then
            v41:onComplete(v40);
        end;
        v41:start();
    end;
    local function v48(v45, v46, v47) --[[ Line: 150 ]] --[[ Name: setGoal ]]
        -- upvalues: v29 (ref), v31 (ref), v6 (ref), v19 (ref)
        if not v29 then
            return;
        else
            assert(v29 ~= nil, "setGoal called before resetMotor");
            v31 = v45.X * (v46 - 1);
            if v47 then
                v29:setGoal(v6.instant(v31));
                return;
            else
                v29:setGoal(v6.spring(v31, v19));
                return;
            end;
        end;
    end;
    local function v74(v49, v50, v51, v52, v53, v54) --[[ Line: 165 ]] --[[ Name: handleDeleteTransition ]]
        -- upvalues: v24 (copy), v25 (copy), v28 (ref), v32 (ref), v30 (ref), v44 (copy), v48 (copy), l_UserGameSettings_0 (ref), v6 (ref)
        local l_current_0 = v24.current;
        local l_current_1 = v25.current;
        if not l_current_0 or not l_current_1 then
            return;
        else
            assert(l_current_0 ~= nil, "carousel should exist");
            assert(l_current_1 ~= nil, "selectedItem should exist");
            local l_ScrollingEnabled_0 = l_current_0.ScrollingEnabled;
            l_current_0.ScrollingEnabled = false;
            v28 = false;
            v32 = false;
            v30 = true;
            local function v63() --[[ Line: 188 ]] --[[ Name: handleDeleteNextImageMovement ]]
                -- upvalues: v51 (copy), l_current_1 (copy), v52 (copy), v44 (ref), l_current_0 (copy), v54 (copy), v49 (copy), v30 (ref), l_ScrollingEnabled_0 (copy), v48 (ref), v53 (copy), l_UserGameSettings_0 (ref)
                local function v62(v58, v59) --[[ Line: 189 ]] --[[ Name: onStep ]]
                    -- upvalues: v51 (ref), l_current_1 (ref), v52 (ref)
                    local v60 = math.abs(v58 - v59);
                    local v61 = math.round(v51.X - v60);
                    l_current_1.Size = UDim2.fromOffset(v61, v51.Y);
                    return v52 == 1;
                end;
                v44(l_current_0.CanvasPosition.X, v62, function() --[[ Line: 199 ]]
                    -- upvalues: v54 (ref), l_current_1 (ref), v49 (ref), v30 (ref), l_current_0 (ref), l_ScrollingEnabled_0 (ref)
                    v54();
                    l_current_1.Visible = false;
                    v49(1);
                    v30 = false;
                    l_current_0.ScrollingEnabled = l_ScrollingEnabled_0;
                end);
                v48(v51, v52 - 1, v53 or l_UserGameSettings_0.ReducedMotion);
            end;
            local function v69() --[[ Line: 210 ]] --[[ Name: handleDeleteImagesFadeIn ]]
                -- upvalues: v50 (copy), v52 (copy), v44 (ref), l_current_0 (copy), v54 (copy), l_current_1 (copy), v6 (ref), v49 (copy), v30 (ref), l_ScrollingEnabled_0 (copy), v48 (ref), v51 (copy)
                if not v50 then
                    return;
                else
                    assert(v50 ~= nil, "setPostDeletionItemBinding should exist");
                    local function v66(_, _) --[[ Line: 215 ]]
                        -- upvalues: v52 (ref)
                        return v52 == 1;
                    end;
                    v44(l_current_0.CanvasPosition.X, v66, function() --[[ Line: 219 ]]
                        -- upvalues: v54 (ref), l_current_1 (ref), v6 (ref), v49 (ref), v50 (ref), v30 (ref), l_current_0 (ref), l_ScrollingEnabled_0 (ref)
                        v54();
                        l_current_1.Visible = false;
                        local v67 = v6.createSingleMotor(0);
                        v67:onStep(function(v68) --[[ Line: 223 ]]
                            -- upvalues: v49 (ref), v50 (ref)
                            v49(v68);
                            v50(1);
                        end);
                        v67:onComplete(function() --[[ Line: 227 ]]
                            -- upvalues: v30 (ref), l_current_0 (ref), l_ScrollingEnabled_0 (ref)
                            v30 = false;
                            l_current_0.ScrollingEnabled = l_ScrollingEnabled_0;
                        end);
                        v67:setGoal(v6.spring(1, {
                            frequency = 2
                        }));
                    end);
                    v48(v51, v52 - 1, true);
                    return;
                end;
            end;
            local function v71() --[[ Line: 237 ]] --[[ Name: handleDeleteNextImageFadeOut ]]
                -- upvalues: v50 (copy), v6 (ref), v69 (copy)
                if not v50 then
                    return;
                else
                    assert(v50 ~= nil, "setPostDeletionItemBinding should exist");
                    local v70 = v6.createSingleMotor(1);
                    v70:onStep(v50);
                    v70:onComplete(v69);
                    v70:setGoal(v6.spring(0, {
                        frequency = 6
                    }));
                    return;
                end;
            end;
            local v72 = v6.createSingleMotor(1);
            v72:onStep(v49);
            local v73 = nil;
            if l_UserGameSettings_0.ReducedMotion then
                v73 = 6;
                v72:onComplete(v71);
            else
                v73 = 4;
                v72:onComplete(v63);
            end;
            v72:setGoal(v6.spring(0, {
                frequency = v73
            }));
            return;
        end;
    end;
    local function v87(v75, v76) --[[ Line: 261 ]] --[[ Name: handleInertialMove ]]
        -- upvalues: v24 (copy), v28 (ref), v18 (ref), v44 (copy), v48 (copy), v27 (ref), l_RunService_0 (ref), v26 (copy)
        local v77 = nil;
        local l_current_2 = v24.current;
        if v28 or not l_current_2 then
            return;
        else
            assert(l_current_2 ~= nil, "carousel should not be nil");
            v77 = -l_current_2:GetSampledInertialVelocity().X;
            l_current_2:ClearInertialScrolling();
            local v79, v80 = v18(v75, l_current_2);
            if math.abs(v77) < 60 and v79 == v76 then
                if v80 > 0.5 then
                    v44(l_current_2.CanvasPosition.X);
                    v48(v75, v76, false);
                end;
                return;
            else
                if v27 then
                    v27:Disconnect();
                    v27 = nil;
                end;
                v27 = l_RunService_0.RenderStepped:Connect(function(v81) --[[ Line: 291 ]]
                    -- upvalues: v24 (ref), v28 (ref), v27 (ref), v18 (ref), v75 (copy), v77 (ref), v76 (copy), v44 (ref), v48 (ref), v26 (ref)
                    local l_current_3 = v24.current;
                    if not l_current_3 or v28 then
                        assert(v27 ~= nil, "handleInertialMoveConn should exist");
                        v27:Disconnect();
                        v27 = nil;
                        return;
                    else
                        assert(l_current_3 ~= nil, "carousel should not be nil");
                        local v83, v84 = v18(v75, l_current_3);
                        if math.abs(v77) < 60 then
                            assert(v27 ~= nil, "handleInertialMoveConn should exist");
                            v27:Disconnect();
                            v27 = nil;
                            if v83 == v76 then
                                v44(l_current_3.CanvasPosition.X);
                                v48(v75, v76, false);
                                return;
                            else
                                v26(v83);
                                return;
                            end;
                        else
                            l_current_3.CanvasPosition = l_current_3.CanvasPosition + Vector2.new(v77 * v81, 0);
                            local v85 = math.max(v84 / (v75.X / 2) * 1.25, 0.85);
                            local v86 = nil;
                            v86 = math.abs(v77) < 120 and 0.7 or 0.95 * v85;
                            v77 = v77 * v86 ^ (v81 / 0.016666666666666666);
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end;
    local function v90(_, v89) --[[ Line: 337 ]] --[[ Name: onInputBegan ]]
        -- upvalues: v30 (ref), v28 (ref), v32 (ref)
        if v30 then
            return;
        else
            if v89.UserInputType == Enum.UserInputType.Touch then
                v28 = true;
                v32 = true;
            end;
            return;
        end;
    end;
    local v91 = {
        carouselRef = v24, 
        getWasTouched = v33, 
        getIsNavigationLocked = v35, 
        handleDeleteTransition = v74, 
        handleInertialMove = v87, 
        onInputBegan = v90, 
        resetMotor = v44, 
        resetTouchState = v34, 
        setGoal = v48
    };
    v91.resetMotor(0);
    return v91;
end;
return function(v93, v94, v95) --[[ Line: 365 ]]
    -- upvalues: v11 (copy), l_useBinding_0 (copy), v7 (copy), l_useIsHovered_0 (copy), l_useIsTouchDown_0 (copy), v92 (copy), l_UserGameSettings_0 (copy), l_useEffectOnce_0 (copy), v18 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), v17 (copy)
    local v96 = v11();
    local v97, v98 = l_useBinding_0(1);
    local v99, v100 = l_useBinding_0(1);
    local v101 = v7.useRef(nil);
    local v102, v103, v104 = l_useIsHovered_0();
    local v105 = l_useIsTouchDown_0();
    local v106 = v7.useRef(nil);
    local v107 = v7.useRef(nil);
    if v107.current == nil then
        v107.current = v92(v101, v106, v95);
    end;
    local l_current_4 = v107.current;
    assert(l_current_4 ~= nil, "carouselController should exist");
    v7.useEffect(function() --[[ Line: 384 ]]
        -- upvalues: v101 (copy), l_UserGameSettings_0 (ref), l_current_4 (copy), v93 (copy), v94 (copy)
        local l_current_5 = v101.current;
        if not l_current_5 then
            return;
        else
            assert(l_current_5 ~= nil, "carousel should exist");
            local v110 = false;
            if l_UserGameSettings_0.ReducedMotion then
                v110 = true;
            end;
            l_current_4.resetMotor(l_current_5.CanvasPosition.X);
            l_current_4.setGoal(v93, v94, v110);
            return;
        end;
    end, {
        v94
    });
    l_useEffectOnce_0(function() --[[ Line: 402 ]]
        -- upvalues: l_current_4 (copy), v93 (copy), v94 (copy)
        l_current_4.setGoal(v93, v94, true);
    end, v94 ~= nil);
    v7.useEffect(function() --[[ Line: 408 ]]
        -- upvalues: l_current_4 (copy), v93 (copy), v94 (copy)
        l_current_4.setGoal(v93, v94, true);
    end, {
        v93
    });
    v7.useEffect(function() --[[ Line: 413 ]]
        -- upvalues: v105 (copy), l_current_4 (copy), v93 (copy), v94 (copy)
        if not v105 and l_current_4.getWasTouched() then
            l_current_4.resetTouchState();
            l_current_4.handleInertialMove(v93, v94);
        end;
    end, {
        v105
    });
    local v114 = v7.useCallback(function(v111) --[[ Line: 420 ]]
        -- upvalues: v101 (copy), l_current_4 (copy), v18 (ref), v93 (copy), v102 (copy), v95 (copy)
        local l_current_6 = v101.current;
        if not l_current_6 then
            return;
        else
            assert(l_current_6 ~= nil, "carousel should exist");
            if l_current_4.getIsNavigationLocked() then
                return;
            else
                local v113 = v18(v93, l_current_6);
                if v102 and v111 > 0 then
                    v95(v113 - 1);
                    return;
                else
                    if v102 and v111 < 0 then
                        v95(v113 + 1);
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v102, 
        v93
    });
    l_useExternalEvent_0(l_UserInputService_0.PointerAction, v114);
    local v118 = v7.useCallback(function(v115) --[[ Line: 441 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v101 (copy), l_current_4 (copy), v18 (ref), v93 (copy), v95 (copy)
        if not l_UserGameSettings_0.ReducedMotion then
            return;
        else
            local l_current_7 = v101.current;
            if not l_current_7 then
                return;
            else
                assert(l_current_7 ~= nil, "carousel should exist");
                if l_current_4.getIsNavigationLocked() then
                    return;
                else
                    local v117 = v18(v93, l_current_7);
                    if v115 == Enum.SwipeDirection.Left then
                        v95(v117 + 1);
                        return;
                    else
                        if v115 == Enum.SwipeDirection.Right then
                            v95(v117 - 1);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, {});
    l_useExternalEvent_0(l_UserInputService_0.TouchSwipe, v118);
    v7.useEffect(function() --[[ Line: 465 ]]
        -- upvalues: l_ContextActionService_0 (ref), v101 (copy), l_current_4 (copy), v96 (copy), v17 (ref), v18 (ref), v93 (copy), v95 (copy)
        l_ContextActionService_0:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, v120, v121) --[[ Line: 466 ]]
            -- upvalues: v101 (ref), l_current_4 (ref), v96 (ref), v17 (ref), v18 (ref), v93 (ref), v95 (ref)
            local l_current_8 = v101.current;
            if not l_current_8 then
                return;
            else
                assert(l_current_8 ~= nil, "carousel should exist");
                if l_current_4.getIsNavigationLocked() then
                    return;
                else
                    if v120 == Enum.UserInputState.End then
                        v96.fireEvent(v17.CapturesCarouselNavigatedByKeyboard);
                        local v123 = v18(v93, l_current_8);
                        if v121.KeyCode == Enum.KeyCode.Left then
                            v95(v123 - 1);
                            return;
                        elseif v121.KeyCode == Enum.KeyCode.Right then
                            v95(v123 + 1);
                        end;
                    end;
                    return;
                end;
            end;
        end, false, Enum.KeyCode.Left, Enum.KeyCode.Right);
        return function() --[[ Line: 488 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("CapturesCarouselNavigateShortcutAction");
        end;
    end, {});
    local v126 = v7.useCallback(function(v124, v125) --[[ Line: 493 ]]
        -- upvalues: l_current_4 (copy), l_UserGameSettings_0 (ref), v103 (copy)
        if l_current_4.getIsNavigationLocked() then
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v103(v124, v125);
            return;
        else
            l_current_4.onInputBegan(v124, v125);
            v103(v124, v125);
            return;
        end;
    end, {
        l_current_4.onInputBegan, 
        v103
    });
    local v129 = v7.useCallback(function(v127, v128) --[[ Line: 507 ]]
        -- upvalues: v104 (copy)
        v104(v127, v128);
    end, {
        v104
    });
    local v131 = v7.useCallback(function(v130) --[[ Line: 511 ]]
        -- upvalues: l_current_4 (copy), v98 (copy), v100 (copy), v93 (copy), v94 (copy)
        l_current_4.handleDeleteTransition(v98, v100, v93, v94, false, v130);
    end, {
        v93, 
        v94, 
        v98
    });
    return {
        carouselInputBegan = v126, 
        carouselInputEnded = v129, 
        carouselRef = v101, 
        deleteSelectedItem = v131, 
        postDeletionItemBinding = v99, 
        selectedItemFadeOutBinding = v97, 
        selectedItemRef = v106
    };
end;