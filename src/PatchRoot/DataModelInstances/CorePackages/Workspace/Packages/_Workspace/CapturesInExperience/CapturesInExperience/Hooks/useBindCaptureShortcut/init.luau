local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactAppExperiment);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.SocialStopwatch);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.Analytics.EventNames);
local v10 = require(l_Parent_0.Utils.getCaptureShortcutSetupKeys);
local v11 = require(l_Parent_0.Thunks.TakeCapture);
local v12 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local v15 = require(l_Parent_0.Hooks.useKeyboardEnabled);
local v16 = require(l_Parent_0.Hooks.usePlayShutterSound);
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useUserExperiment_0 = v5.useUserExperiment;
local v19 = require(l_Parent_0.Flags.FFlagCapturesHotkeyEnabledForAll);
local v20 = require(l_Parent_0.Flags.FFlagEnableCapturesHotkeyExperiment);
local l_FStringCapturesIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringCapturesIXPLayer;
local _ = function() --[[ Line: 31 ]]
    -- upvalues: v10 (copy), l_UserInputService_0 (copy)
    for _, v23 in (v10()) do
        if l_UserInputService_0:IsKeyDown(v23) then
            return true;
        end;
    end;
    return false;
end;
return function() --[[ Line: 41 ]]
    -- upvalues: v20 (copy), v19 (copy), v12 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v8 (copy), v16 (copy), v15 (copy), l_useUserExperiment_0 (copy), l_FStringCapturesIXPLayer_0 (copy), l_useEffect_0 (copy), v7 (copy), v9 (copy), v11 (copy), l_ContextActionService_0 (copy), v10 (copy), l_UserInputService_0 (copy)
    if not v20 and not v19 then
        return;
    else
        local v25 = v12();
        local v26 = l_useDispatch_0();
        local v28 = l_useSelector_0(function(v27) --[[ Line: 49 ]]
            -- upvalues: v8 (ref)
            return v27[v8.RoduxKey].IsActive;
        end);
        local v30 = l_useSelector_0(function(v29) --[[ Line: 53 ]]
            -- upvalues: v8 (ref)
            return v29[v8.RoduxKey].IsCapturesCoreGuiEnabled;
        end);
        local v31 = v16();
        local v32 = false;
        if v19 then
            v32 = v15();
        elseif v20 then
            v32 = l_useUserExperiment_0({
                l_FStringCapturesIXPLayer_0
            }, function(v33) --[[ Line: 63 ]]
                -- upvalues: l_FStringCapturesIXPLayer_0 (ref)
                return (v33[l_FStringCapturesIXPLayer_0] or {}).CapturesDesktopHotkeyEnabled;
            end);
        end;
        l_useEffect_0(function() --[[ Line: 69 ]]
            -- upvalues: v32 (ref), v30 (copy), v31 (copy), v7 (ref), v25 (copy), v9 (ref), v26 (copy), v11 (ref), l_ContextActionService_0 (ref), v10 (ref), l_UserInputService_0 (ref)
            if not v32 then
                return;
            elseif not v30 then
                return;
            else
                local function v34() --[[ Line: 78 ]]
                    -- upvalues: v31 (ref), v7 (ref), v25 (ref), v9 (ref), v26 (ref), v11 (ref)
                    v31();
                    if not v7.Stopwatch.get(v7.Events.CaptureTaken) then
                        v7.Stopwatch.start(v7.Events.CaptureTaken);
                    end;
                    v25.fireEvent(v9.CapturesEntrypointActivated);
                    v25.fireEvent(v9.CapturesDesktopHotkeyCaptureTriggered);
                    v26(v11());
                end;
                l_ContextActionService_0:BindCoreAction("CaptureShortcutAction", function(_, v36) --[[ Line: 89 ]]
                    -- upvalues: v10 (ref), l_UserInputService_0 (ref), v34 (copy)
                    local v37 = false;
                    if v36 == Enum.UserInputState.Begin then
                        local v38;
                        for _, v40 in (v10()) do
                            if l_UserInputService_0:IsKeyDown(v40) then
                                v38 = true;
                                v37 = true;
                            end;
                            if v37 then
                                break;
                            end;
                        end;
                        if not v37 then
                            v38 = false;
                        end;
                        v37 = false;
                        if v38 then
                            v34();
                            return Enum.ContextActionResult.Sink;
                        end;
                    end;
                    return Enum.ContextActionResult.Pass;
                end, false, Enum.KeyCode.One);
                return function() --[[ Line: 98 ]]
                    -- upvalues: l_ContextActionService_0 (ref)
                    l_ContextActionService_0:UnbindCoreAction("CaptureShortcutAction");
                end;
            end;
        end, {
            v28, 
            v30, 
            v32
        });
        return;
    end;
end;