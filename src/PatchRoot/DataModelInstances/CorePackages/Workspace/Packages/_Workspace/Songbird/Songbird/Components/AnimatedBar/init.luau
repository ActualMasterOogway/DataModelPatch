local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactOtter);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v8 = {
    heightRange = NumberRange.new(0.3, 1), 
    width = UDim.new(1, 0)
};
local v9 = Random.new();
return function(v10) --[[ Line: 30 ]] --[[ Name: AnimatedBar ]]
    -- upvalues: v1 (copy), v8 (copy), l_useStyle_0 (copy), l_useCallback_0 (copy), v9 (copy), v3 (copy), l_useEffect_0 (copy), v2 (copy)
    local v11 = v1.Dictionary.join(v8, v10);
    local v12 = l_useStyle_0();
    local v13 = l_useCallback_0(function() --[[ Line: 34 ]]
        -- upvalues: v9 (ref), v11 (copy)
        return v9:NextNumber(v11.heightRange.Min, v11.heightRange.Max);
    end, {
        v11.heightRange
    });
    local v14, v15 = v3.useAnimatedBinding(v13());
    l_useEffect_0(function() --[[ Line: 40 ]]
        -- upvalues: v15 (copy), v3 (ref), v13 (copy)
        local v16 = true;
        task.spawn(function() --[[ Line: 43 ]]
            -- upvalues: v16 (ref), v15 (ref), v3 (ref), v13 (ref)
            while v16 do
                v15(v3.ease(v13(), {
                    easingStyle = Enum.EasingStyle.Linear, 
                    duration = 0.25
                }));
                task.wait(0.25);
            end;
        end);
        return function() --[[ Line: 54 ]]
            -- upvalues: v16 (ref)
            v16 = false;
        end;
    end, {
        v15
    });
    return v2.createElement("Frame", {
        LayoutOrder = v11.layoutOrder, 
        Size = v14:map(function(v17) --[[ Line: 61 ]]
            -- upvalues: v11 (copy)
            return UDim2.new(v11.width, UDim.new(v17, 0));
        end), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v12.Theme.TextEmphasis.Color
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    });
end;