local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.constants);
local v6 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useEffect_0 = v2.useEffect;
local l_usePrevious_0 = v3.usePrevious;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v10 = {
    height = 2.6666666666666665
};
return function(v11) --[[ Line: 30 ]] --[[ Name: ProgressBar ]]
    -- upvalues: v1 (copy), v10 (copy), l_usePrevious_0 (copy), v4 (copy), l_useStyle_0 (copy), l_useEffect_0 (copy), v5 (copy), v2 (copy)
    local v12 = v1.Dictionary.join(v10, v11);
    local v13 = l_usePrevious_0(v12.timeLength);
    local v14, v15 = v4.useAnimatedBinding(0);
    local v16 = l_useStyle_0();
    l_useEffect_0(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v13 (copy), v4 (ref), v5 (ref), v15 (copy)
        local v17 = math.clamp(v12.timePosition / v12.timeLength, 0, 1);
        local v18 = nil;
        v18 = if not v13 or v13 ~= v12.timeLength then v4.instant(v17) else v4.spring(v17, v5.PROGRESS_BAR_SPRING);
        v15(v18);
    end, {
        v12.timePosition, 
        v12.timeLength, 
        v13
    });
    return v2.createElement("Frame", {
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, v12.height), 
        BackgroundTransparency = v16.Theme.UIDefault.Transparency, 
        BackgroundColor3 = v16.Theme.UIDefault.Color, 
        LayoutOrder = v12.LayoutOrder
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Progress = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = v16.Theme.UIEmphasis.Transparency, 
            BackgroundColor3 = v16.Theme.UIEmphasis.Color, 
            Size = v14:map(function(v19) --[[ Line: 68 ]]
                return UDim2.fromScale(v19, 1);
            end)
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        })
    });
end;