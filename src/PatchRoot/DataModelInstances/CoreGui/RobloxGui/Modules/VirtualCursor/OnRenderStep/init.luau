local l_Parent_0 = script.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFixMissingPlayerGuiCrash);
local v7 = game:DefineFastFlag("FixVirtualCursorErrorOnDyingGuiObject", false);
local v8 = nil;
local v9 = require(l_Parent_0.Input);
local v10 = require(l_Parent_0.Interface);
local v11 = require(l_Parent_0.Properties);
local v12 = 1;
local v13 = false;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local _ = math.abs;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_sign_0 = math.sign;
local l_abs_1 = math.abs;
local function _(v21) --[[ Line: 31 ]] --[[ Name: isSelectableGuiObject ]]
    if not v21:IsA("GuiButton") and not v21:IsA("TextBox") then
        return false;
    elseif not v21.Active or not v21.Selectable then
        return false;
    elseif v21.AbsoluteSize.Magnitude == 0 then
        return false;
    else
        return true;
    end;
end;
local function _(v23, v24, v25) --[[ Line: 39 ]] --[[ Name: contains ]]
    local v26 = false;
    if v23.x >= v24.x then
        v26 = false;
        if v23.y >= v24.y then
            v26 = false;
            if v23.x <= v25.x then
                v26 = v23.y <= v25.y;
            end;
        end;
    end;
    return v26;
end;
local function v49(v28, v29, v30) --[[ Line: 43 ]] --[[ Name: handleScrollingFrame ]]
    -- upvalues: v9 (copy), v11 (copy), l_abs_1 (copy), l_cos_0 (copy), l_sin_0 (copy), l_max_0 (copy), l_min_0 (copy), l_sign_0 (copy), v10 (copy)
    if not v28:IsA("ScrollingFrame") then
        return false;
    elseif not v28.ScrollingEnabled then
        return false;
    else
        local l_v9_Thumbstick2Vector_0 = v9:GetThumbstick2Vector();
        local v32 = v11.ScrollingSpeed * v30;
        local l_ScrollingRadius_0 = v11.ScrollingRadius;
        local l_AbsoluteCanvasSize_0 = v28.AbsoluteCanvasSize;
        local l_AbsoluteSize_0 = v28.AbsoluteSize;
        local l_ScrollingDirection_0 = v28.ScrollingDirection;
        local v37 = false;
        if l_AbsoluteCanvasSize_0.X > l_AbsoluteSize_0.X then
            v37 = true;
            if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                v37 = l_ScrollingDirection_0 == Enum.ScrollingDirection.X;
            end;
        end;
        local v38 = false;
        if l_AbsoluteCanvasSize_0.Y > l_AbsoluteSize_0.Y then
            v38 = true;
            if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                v38 = l_ScrollingDirection_0 == Enum.ScrollingDirection.Y;
            end;
        end;
        local l_AbsoluteSize_1 = v28.AbsoluteSize;
        local l_AbsolutePosition_0 = v28.AbsolutePosition;
        local v41 = v28.Rotation / 180 * 3.141592653589793;
        if l_abs_1(l_v9_Thumbstick2Vector_0.x) > v11.ThumbstickDeadzone then
            v28.CanvasPosition = v28.CanvasPosition + Vector2.new(l_v9_Thumbstick2Vector_0.x * v32, 0);
        end;
        if l_abs_1(l_v9_Thumbstick2Vector_0.y) > v11.ThumbstickDeadzone then
            v28.CanvasPosition = v28.CanvasPosition + Vector2.new(0, l_v9_Thumbstick2Vector_0.y * v32);
        end;
        local v42 = Vector2.new(l_cos_0(v41), (l_sin_0(v41)));
        local v43 = Vector2.new(-l_sin_0(v41), (l_cos_0(v41)));
        local v44 = Vector2.new(v29.X, v29.Y) - l_AbsolutePosition_0;
        local v45 = v44:Dot(v42) - l_AbsoluteSize_1.X / 2;
        local v46 = v44:Dot(v43) - l_AbsoluteSize_1.Y / 2;
        local v47 = Vector2.new(l_abs_1(v45), (l_abs_1(v46))) - l_AbsoluteSize_1 / 2;
        local l_Magnitude_0 = Vector2.new(l_max_0(v47.x, 0), (l_max_0(v47.y, 0))).Magnitude;
        if l_abs_1(l_min_0(l_max_0(v47.x, v47.y), 0) + l_Magnitude_0) < l_ScrollingRadius_0 then
            if l_abs_1(v47.x) < l_abs_1(v47.y) and v37 then
                v28.CanvasPosition = v28.CanvasPosition + Vector2.new(l_sign_0(v45) * v32, 0);
                v10:SetArrow(l_sign_0(v45), 0);
                return true;
            elseif l_abs_1(v47.x) >= l_abs_1(v47.y) and v38 then
                v28.CanvasPosition = v28.CanvasPosition + Vector2.new(0, l_sign_0(v46) * v32);
                v10:SetArrow(0, (l_sign_0(v46)));
                return true;
            end;
        end;
        return false;
    end;
end;
local function v65(v50, v51, v52) --[[ Line: 97 ]] --[[ Name: processCursorPosition ]]
    -- upvalues: v13 (ref), l_GuiService_0 (copy), v6 (copy), v8 (ref), l_Players_0 (copy), l_CoreGui_0 (copy), v49 (copy)
    local v53 = nil;
    local v54 = 1e999;
    local v55 = -1e999;
    v13 = false;
    v50 = v50 - l_GuiService_0:GetGuiInset();
    if v6() then
        if v8 == nil then
            v8 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        end;
    elseif v8 == nil then
        v8 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
    end;
    local v56 = if v8 then v8:GetGuiObjectsInCircle(v50, v51) else {};
    local l_l_CoreGui_0_GuiObjectsInCircle_0 = l_CoreGui_0:GetGuiObjectsInCircle(v50, v51);
    for _, v59 in ipairs(v56) do
        if v49(v59, v50, v52) then
            v13 = true;
            return nil;
        else
            if (if not not v59:IsA("GuiButton") or v59:IsA("TextBox") then if v59.Active and v59.Selectable then v59.AbsoluteSize.Magnitude ~= 0 else false else false) and not v53 then
                v53 = v59;
            end;
            if (if not not v59:IsA("GuiButton") or v59:IsA("TextBox") then if v59.Active and v59.Selectable then v59.AbsoluteSize.Magnitude ~= 0 else false else false) and v59.Parent == v53.Parent then
                local l_Magnitude_1 = (v59.AbsolutePosition + v59.AbsoluteSize / 2 - v50).Magnitude;
                if l_Magnitude_1 < v54 and v55 <= v59.ZIndex then
                    v53 = v59;
                    v54 = l_Magnitude_1;
                    v55 = v53.ZIndex;
                end;
            end;
        end;
    end;
    local v61 = false;
    for _, v63 in ipairs(l_l_CoreGui_0_GuiObjectsInCircle_0) do
        if v49(v63, v50, v52) then
            v13 = true;
            return nil;
        elseif if not not v63:IsA("GuiButton") or v63:IsA("TextBox") then if v63.Active and v63.Selectable then v63.AbsoluteSize.Magnitude ~= 0 else false else false then
            local l_Magnitude_2 = (v63.AbsolutePosition + v63.AbsoluteSize / 2 - v50).Magnitude;
            if v61 and l_Magnitude_2 < v54 and v55 <= v63.ZIndex or not v61 and l_Magnitude_2 < v54 then
                v53 = v63;
                v54 = l_Magnitude_2;
                v55 = v53.ZIndex;
                v61 = true;
            end;
        end;
    end;
    return v53;
end;
local function _() --[[ Line: 168 ]] --[[ Name: getMaxSpeed ]]
    -- upvalues: l_GuiService_0 (copy), v11 (copy)
    return l_GuiService_0:GetScreenResolution().Magnitude * v11.MaxSpeedRelative;
end;
return function(v67, v68) --[[ Line: 173 ]]
    -- upvalues: l_GuiService_0 (copy), v9 (copy), l_GamepadService_0 (copy), v12 (ref), v10 (copy), v13 (ref), v11 (copy), v65 (copy), l_CoreGui_0 (copy), v7 (copy), v8 (ref)
    local v69 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
    local l_v9_ThumbstickVector_0 = v9:GetThumbstickVector();
    local l_l_GamepadService_0_GamepadCursorPosition_0 = l_GamepadService_0:GetGamepadCursorPosition();
    local v72 = nil;
    local _ = Vector2.new();
    if v67.SelectedObject == nil then
        v12 = 1;
        v10:SetCursorHighlight(false);
    end;
    if v13 then
        v12 = v11.ScrollingSlowDown;
    end;
    v72 = l_v9_ThumbstickVector_0 * (l_GuiService_0:GetScreenResolution().Magnitude * v11.MaxSpeedRelative) * v12;
    if v72.Magnitude > 0 then
        local v74 = l_l_GamepadService_0_GamepadCursorPosition_0 + v72 * v68;
        local v75 = math.clamp(v74.x, 0, v69.x);
        local v76 = math.clamp(v74.y, 0, v69.y);
        l_l_GamepadService_0_GamepadCursorPosition_0 = Vector2.new(v75, v76);
    end;
    v10:SetCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    l_GamepadService_0:SetGamepadCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    v67.CursorPosition = l_l_GamepadService_0_GamepadCursorPosition_0;
    local v77 = v65(l_l_GamepadService_0_GamepadCursorPosition_0, v11.SelectionRadius, v68);
    if v77 ~= v67.PreviouslySelectedObject then
        v67.PreviouslySelectedObject = v77;
        v10:SetCursorHighlight(v77 ~= nil);
        if v77 then
            if v77 ~= v67.SelectedObject then
                v67.SelectedObject = v77;
                v12 = v11.SpeedAdjustmentTarget;
            end;
        else
            v67.SelectedObject = nil;
            v12 = 1;
        end;
        if v67.SelectedObject == nil then
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
            return;
        elseif v67.SelectedObject:IsDescendantOf(l_CoreGui_0) then
            l_GuiService_0.SelectedCoreObject = v67.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            return;
        elseif v7 then
            if v67.SelectedObject:IsDescendantOf(v8) then
                l_GuiService_0.SelectedObject = v67.SelectedObject;
                l_GuiService_0.SelectedCoreObject = nil;
                return;
            end;
        else
            l_GuiService_0.SelectedObject = v67.SelectedObject;
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end;
end;