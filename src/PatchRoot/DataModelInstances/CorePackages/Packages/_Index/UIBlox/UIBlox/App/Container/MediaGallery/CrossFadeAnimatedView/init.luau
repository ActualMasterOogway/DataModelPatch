local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Core.Style.useStyle);
local v6 = {
    zIndex = 1, 
    overlayTransparency = 0.5, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 6.666666666666667
    }
};
return function(v7) --[[ Line: 54 ]] --[[ Name: CrossFadeAnimatedView ]]
    -- upvalues: v4 (copy), v6 (copy), v5 (copy), v2 (copy), v3 (copy)
    local v8 = v4.Dictionary.join(v6, v7);
    local v9 = #v8.items;
    local v10 = v5();
    local v11 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v8 (copy)
        if v8.crossAnim.isCrossFade then
            v8.crossAnim.setCrossFade(false);
            v8.crossAnim.setCurrentIndex(v8.crossAnim.nextIndex);
        end;
    end, {
        v8.crossAnim.isCrossFade, 
        v8.crossAnim.nextIndex, 
        v8.crossAnim.setCrossFade, 
        v8.crossAnim.setCurrentIndex
    });
    local v12, v13 = v3.useAnimatedBinding(0, v11);
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v9 (copy), v8 (copy), v13 (copy), v3 (ref)
        if v9 < 2 then
            return;
        elseif v8.crossAnim.isCrossFade then
            v13(v3.spring(1, v8.animationConfig));
            return;
        else
            v13((v3.instant(0)));
            return;
        end;
    end, {
        v8.crossAnim.isCrossFade, 
        v8.crossAnim.nextIndex, 
        v8.animationConfig
    });
    return v2.createElement("ImageLabel", {
        Size = UDim2.fromScale(1, 1), 
        ZIndex = v8.zIndex, 
        Image = v8.items[v8.crossAnim.currentIndex].imageId, 
        ScaleType = Enum.ScaleType.Crop, 
        BackgroundTransparency = 1, 
        ImageTransparency = v12
    }, {
        NextImage = if v9 >= 2 then v2.createElement("ImageLabel", {
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            Image = v8.items[v8.crossAnim.nextIndex].imageId, 
            ScaleType = Enum.ScaleType.Crop, 
            BackgroundTransparency = 1, 
            ImageTransparency = v12:map(function(v14) --[[ Line: 103 ]]
                return 1 - v14;
            end)
        }) else nil, 
        Overlay = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = v8.overlayTransparency, 
            BackgroundColor3 = v10.Theme.Overlay.Color
        })
    });
end;