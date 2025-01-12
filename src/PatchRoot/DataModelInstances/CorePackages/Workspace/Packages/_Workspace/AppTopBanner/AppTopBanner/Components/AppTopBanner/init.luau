local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTopBanner");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v3.Hooks.useTokens;
local v7 = require(l_script_FirstAncestor_0.Enums.AppTopBannerType);
local v8 = {
    contentMaps = {}, 
    deviceStatusBarHeight = 0
};
return function(v9) --[[ Line: 24 ]] --[[ Name: AppTopBanner ]]
    -- upvalues: v2 (copy), v8 (copy), l_useTokens_0 (copy), v4 (copy), l_useSelector_0 (copy), v7 (copy), v3 (copy)
    v9 = v2.Dictionary.join(v8, v9);
    local v10 = l_useTokens_0();
    local v11, v12 = v4.useState(0);
    local v14 = v4.useCallback(function(v13) --[[ Line: 34 ]]
        if v13.AppTopBanner then
            return v13.AppTopBanner.expanded;
        else
            return false;
        end;
    end, {});
    local v15 = l_useSelector_0(v14);
    local v17 = v4.useCallback(function(v16) --[[ Line: 38 ]]
        return v16.AppTopBanner and v16.AppTopBanner.appTopBannerContentProps;
    end, {});
    local v18 = l_useSelector_0(v17);
    local v20 = v4.useCallback(function(v19) --[[ Line: 42 ]]
        return v19.AppTopBanner and v19.AppTopBanner.onAppTopBannerClick;
    end, {});
    local v21 = l_useSelector_0(v20);
    local v23 = v4.useCallback(function(v22) --[[ Line: 46 ]]
        return v22.AppTopBanner and v22.AppTopBanner.appTopBannerContentHeight;
    end, {});
    local v24 = l_useSelector_0(v23);
    local v26 = v4.useCallback(function(v25) --[[ Line: 50 ]]
        if v25.AppTopBanner then
            return v25.AppTopBanner.isDisabled;
        else
            return false;
        end;
    end, {});
    local v27 = l_useSelector_0(v26);
    v4.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v15 (copy), v27 (copy), v12 (copy), v24 (copy), v9 (ref)
        if v15 and not v27 then
            v12(v24 + v9.deviceStatusBarHeight);
            return;
        else
            v12(0);
            return;
        end;
    end, {
        v24, 
        v15, 
        v9.deviceStatusBarHeight, 
        v27
    });
    local v29 = v4.useCallback(function(v28) --[[ Line: 73 ]]
        -- upvalues: v7 (ref)
        if v28.AppTopBanner then
            return v28.AppTopBanner.appTopBannerType;
        else
            return v7.None;
        end;
    end, {});
    local v30 = l_useSelector_0(v29);
    local v31 = v9.contentMaps[v30];
    return if not (v11 > 0) or v27 then nil else v4.createElement(v3.View, {
        Size = UDim2.new(1, 0, 0, v11), 
        backgroundStyle = v10.Color.Extended.Green.Green_800, 
        onActivated = v21, 
        padding = {
            left = UDim.new(0, v10.Padding.XLarge), 
            right = UDim.new(0, v10.Padding.XLarge), 
            top = UDim.new(0, v9.deviceStatusBarHeight)
        }
    }, {
        content = if v31 then v4.createElement(v31, v18) else nil
    });
end;