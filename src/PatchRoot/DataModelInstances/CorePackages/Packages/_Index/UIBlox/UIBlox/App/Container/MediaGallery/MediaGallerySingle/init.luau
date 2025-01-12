local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local v1 = require(l_script_FirstAncestor_0.UIBloxConfig);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Otter);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = {
    itemAspectRatio = 1.7777777777777777, 
    itemPadding = 16, 
    dragIntent = 20, 
    borderRadius = UDim.new(0, 8), 
    spring = v3.spring
};
return function(v6) --[[ Line: 35 ]] --[[ Name: MediaGallerySingle ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), v1 (copy), v3 (copy)
    local v7 = v2.Dictionary.join(v5, v6);
    local v8, v9 = v4.useState(Vector2.new(0, 0));
    local v10, v11 = v4.useState(Vector2.new(0, 0));
    local v12 = v4.useRef(nil);
    local v13 = v4.useRef(nil);
    local v14 = v4.useRef(0);
    local v15 = v4.useRef(false);
    local v16 = v4.useRef(1);
    local v17 = nil;
    if not v1.updateMediaGallerySingle then
        local v18 = v8.X + v7.itemPadding;
        v17 = 1 + math.round(v10.X / v18);
    end;
    local v20 = v4.useCallback(function(v19) --[[ Line: 53 ]]
        -- upvalues: v17 (ref)
        if v19 == "Right" then
            return v17 + 1;
        else
            return v17 - 1;
        end;
    end);
    local v23 = v4.useCallback(function(v21) --[[ Line: 63 ]]
        -- upvalues: v8 (copy), v7 (copy)
        local v22 = v8.X + v7.itemPadding;
        return Vector2.new(v22 * (v21 - 1), 0);
    end);
    local v28 = v4.useCallback(function(v24) --[[ Line: 69 ]]
        -- upvalues: v15 (copy), v3 (ref), v23 (copy), v11 (copy), v10 (copy), v7 (copy)
        v15.current = true;
        local v25 = v3.createSingleMotor(0);
        local v26 = v23(v24);
        v25:onStep(function(v27) --[[ Line: 75 ]]
            -- upvalues: v11 (ref), v10 (ref), v26 (copy)
            v11(v10:Lerp(v26, v27));
        end);
        v25:onComplete(function() --[[ Line: 79 ]]
            -- upvalues: v15 (ref)
            v15.current = false;
        end);
        v25:setGoal(v7.spring(1, {
            frequency = 3, 
            dampingRatio = 1, 
            restingVelocityLimit = 0.05
        }));
    end);
    local v35 = v4.useCallback(function(v29) --[[ Line: 90 ]]
        -- upvalues: v16 (copy), v7 (copy), v14 (copy), v8 (copy), v15 (copy), v3 (ref), v11 (copy), v10 (copy)
        local v30 = nil;
        v30 = if v29 == "Right" then v16.current + 1 else v16.current - 1;
        if v30 >= 1 and v30 <= #v7.items and math.abs(v14.current) >= v7.dragIntent then
            v16.current = v30;
        end;
        local v31 = v8.X + v7.itemPadding;
        local v32 = Vector2.new(v31 * (v16.current - 1), 0);
        v15.current = true;
        local v33 = v3.createSingleMotor(0);
        v33:onStep(function(v34) --[[ Line: 109 ]]
            -- upvalues: v11 (ref), v10 (ref), v32 (copy)
            v11(v10:Lerp(v32, v34));
        end);
        v33:onComplete(function() --[[ Line: 113 ]]
            -- upvalues: v15 (ref)
            v15.current = false;
        end);
        v33:setGoal(v7.spring(1, {
            frequency = 3, 
            dampingRatio = 1, 
            restingVelocityLimit = 0.05
        }));
    end);
    local v38 = v4.useCallback(function(_, v37) --[[ Line: 124 ]]
        -- upvalues: v15 (copy), v12 (copy)
        if v15.current then
            return;
        else
            if v37.UserInputType == Enum.UserInputType.MouseButton1 or v37.UserInputType == Enum.UserInputType.Touch then
                v12.current = v37;
            end;
            return;
        end;
    end);
    local v45 = v4.useCallback(function(_, v40) --[[ Line: 137 ]]
        -- upvalues: v12 (copy), v15 (copy), v13 (copy), v14 (copy), v11 (copy)
        if v12.current and not v15.current and (v40.UserInputType == Enum.UserInputType.MouseMovement or v40.UserInputType == Enum.UserInputType.Touch) then
            if not v13.current then
                v13.current = v40.Position;
            end;
            local v41 = v13.current - v40.Position;
            if v41 ~= Vector3.zero then
                local l_v14_0 = v14;
                l_v14_0.current = l_v14_0.current + v41.x;
                v11(function(v43) --[[ Line: 155 ]]
                    -- upvalues: v41 (copy)
                    local v44 = math.clamp(v43.X + v41.X, 0, 1e999);
                    return Vector2.new(v44, 0);
                end);
            end;
            v13.current = v40.Position;
        end;
    end);
    local v50 = v4.useCallback(function(_, v47) --[[ Line: 165 ]]
        -- upvalues: v12 (copy), v13 (copy), v14 (copy), v1 (ref), v35 (copy), v20 (copy), v7 (copy), v28 (copy), v17 (ref)
        if v47 == v12.current then
            v12.current = nil;
            v13.current = nil;
            local v48 = v14.current > 1 and "Right" or "Left";
            if v1.updateMediaGallerySingle then
                v35(v48);
            else
                local v49 = v20(v48);
                if v49 >= 1 and v49 <= #v7.items then
                    if math.abs(v14.current) >= v7.dragIntent then
                        v28(v49);
                    else
                        v28(v17);
                    end;
                end;
            end;
            v14.current = 0;
        end;
    end);
    local v51, v52 = v4.useState(1e999);
    local v54 = v4.useCallback(function(v53) --[[ Line: 190 ]]
        -- upvalues: v9 (copy), v52 (copy), v7 (copy)
        v9(v53.AbsoluteSize);
        v52(v53.AbsoluteSize.X / v7.itemAspectRatio);
    end, {
        v7.itemAspectRatio
    });
    local v55 = {};
    for v56, v57 in v7.items do
        v55["Item" .. v56] = v4.createElement("ImageLabel", {
            LayoutOrder = v56, 
            Size = UDim2.new(1, 0, 0, v51), 
            Image = v57.imageId, 
            ScaleType = Enum.ScaleType.Crop
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = v7.borderRadius
            })
        });
    end;
    return v4.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasPosition = v10, 
        ScrollingEnabled = false, 
        ScrollBarImageTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ClipsDescendants = false, 
        [v4.Change.AbsoluteSize] = v54, 
        [v4.Event.InputBegan] = v38, 
        [v4.Event.InputChanged] = v45, 
        [v4.Event.InputEnded] = v50
    }, {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v7.itemPadding)
        }), 
        Items = v4.createElement(v4.Fragment, {}, v55)
    });
end;