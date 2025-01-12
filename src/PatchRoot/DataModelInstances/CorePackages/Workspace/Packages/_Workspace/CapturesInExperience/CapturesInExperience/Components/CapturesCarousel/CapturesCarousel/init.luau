local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.RobloxAppHooks);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = v7.useScreenSize;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useSignal_0 = v6.Hooks.useSignal;
local v12 = require(l_Parent_0.Components.CapturesCarousel.CarouselItem);
local v13 = require(l_Parent_0.Components.CapturesCarousel.CarouselNavArrow);
local v14 = require(l_Parent_0.Thunks.CarouselScrolled);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.Utils.getClosestItemToCenter);
local _ = require(l_Parent_0.Types);
local v19 = require(l_Parent_0.Analytics.useAnalytics);
local v20 = require(l_Parent_0.Hooks.useCarouselController);
local function _(v21, v22) --[[ Line: 35 ]] --[[ Name: getMargins ]]
    local l_X_0 = (v22 - v21).X;
    if l_X_0 % 2 == 0 then
        local v24 = l_X_0 / 2;
        return v24, v24;
    else
        local v25 = math.floor(l_X_0 / 2);
        return v25 + 1, v25;
    end;
end;
local function _() --[[ Line: 49 ]] --[[ Name: getTouchScrollingEnabled ]]
    -- upvalues: l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v28 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v28 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
    local l_ReducedMotion_0 = l_UserGameSettings_0.ReducedMotion;
    return v28 and l_TouchEnabled_0 and not l_ReducedMotion_0;
end;
return function(v32) --[[ Line: 65 ]]
    -- upvalues: v19 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useSelector_0 (copy), v15 (copy), v5 (copy), v16 (copy), v14 (copy), v20 (copy), l_useSignal_0 (copy), v17 (copy), v12 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), v13 (copy)
    local v33 = v19();
    local v34 = l_useDispatch_0();
    local v35 = l_useScreenSize_0();
    local v37 = l_useSelector_0(function(v36) --[[ Line: 70 ]]
        -- upvalues: v15 (ref)
        return v36[v15.RoduxKey].Captures;
    end);
    local v39 = l_useSelector_0(function(v38) --[[ Line: 74 ]]
        -- upvalues: v15 (ref)
        return v38[v15.RoduxKey].Carousel.SelectedCaptureIndex;
    end);
    local v40, v41 = v5.useState(v39);
    local v42 = v35.X / v35.Y > 1 and 0.15 or 0.075;
    local v43 = math.clamp(math.floor(v35.X * v42), 50, 200);
    local v44 = math.floor(v43 * 0.2);
    local l_maxHeight_0 = v32.maxHeight;
    local v46 = v35.X - v43 * 2;
    local v47 = Vector2.new(math.floor(v46), (math.floor(l_maxHeight_0)));
    local v48 = v47.X * #v37;
    local l_X_1 = (v35 - v47).X;
    local v50, v51;
    if l_X_1 % 2 == 0 then
        local v52 = l_X_1 / 2;
        v50 = v52;
        v51 = v52;
    else
        local v53 = math.floor(l_X_1 / 2);
        v50 = v53 + 1;
        v51 = v53;
    end;
    local v56 = v5.useCallback(function(v54) --[[ Line: 95 ]]
        -- upvalues: v37 (copy), v39 (copy), v15 (ref), v33 (copy), v16 (ref), v34 (copy), v14 (ref)
        if v54 < 1 or #v37 < v54 then
            return;
        else
            local v55 = v54 < v39 and v15.CarouselDirection.Left or v15.CarouselDirection.Right;
            v33.fireEvent(v16.CapturesCarouselScrolled, {
                direction = v55
            });
            v34(v14(v54));
            return;
        end;
    end, {
        v37, 
        v39
    });
    l_X_1 = v20(v47, v39, v56);
    local l_carouselRef_0 = l_X_1.carouselRef;
    local l_carouselInputBegan_0 = l_X_1.carouselInputBegan;
    local l_carouselInputEnded_0 = l_X_1.carouselInputEnded;
    local l_deleteSelectedItem_0 = l_X_1.deleteSelectedItem;
    local l_selectedItemFadeOutBinding_0 = l_X_1.selectedItemFadeOutBinding;
    local l_postDeletionItemBinding_0 = l_X_1.postDeletionItemBinding;
    local l_selectedItemRef_0 = l_X_1.selectedItemRef;
    local v65 = v5.useCallback(function(v64) --[[ Line: 118 ]]
        -- upvalues: l_deleteSelectedItem_0 (copy)
        l_deleteSelectedItem_0(v64);
    end, {
        l_deleteSelectedItem_0
    });
    l_useSignal_0(v32.deleteItemSignal, v65);
    local v68 = v5.useCallback(function(v66) --[[ Line: 123 ]]
        -- upvalues: v17 (ref), v47 (copy), v40 (copy), v41 (copy)
        local v67 = v17(v47, v66);
        if v67 ~= v40 then
            v41(v67);
        end;
    end, {
        v47, 
        v40, 
        v41
    });
    local v72 = v5.useCallback(function(v69, v70) --[[ Line: 131 ]]
        -- upvalues: v40 (copy), v5 (ref), v12 (ref), v39 (copy), l_selectedItemFadeOutBinding_0 (copy), l_postDeletionItemBinding_0 (copy), v44 (copy), v47 (copy)
        if v40 + 3 < v70 or v70 < v40 - 3 then
            return nil;
        else
            local v71 = true;
            if v70 ~= v40 - 1 then
                v71 = false;
                if v40 == 1 then
                    v71 = v70 == 2;
                end;
            end;
            return v5.createElement(v12, {
                capture = v69, 
                fadeOutBinding = if v70 == v39 then l_selectedItemFadeOutBinding_0 else nil, 
                transitionBinding = if v70 == v39 then l_selectedItemFadeOutBinding_0 else if v71 then l_postDeletionItemBinding_0 else nil, 
                imagePadding = v44, 
                itemIndex = v70, 
                itemSize = v47, 
                unfocusedSizeMultiplier = 0.8
            });
        end;
    end, {
        v47, 
        v40, 
        v44, 
        l_postDeletionItemBinding_0, 
        v39, 
        l_selectedItemFadeOutBinding_0
    });
    local v76 = v5.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: v5 (ref), v37 (copy), v47 (copy), v39 (copy), l_selectedItemRef_0 (copy), v72 (copy)
        local v73 = {
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        };
        for v74, v75 in v37 do
            v73[v75.contentId] = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v74, 
                Size = UDim2.fromOffset(v47.X, v47.Y), 
                ref = if v74 == v39 then l_selectedItemRef_0 else nil
            }, {
                Item = v72(v75, v74)
            });
        end;
        return v73;
    end, {
        v37, 
        v47, 
        v72, 
        v39
    });
    local v77 = math.floor(v47.Y * 0.8);
    local v78 = v40 > 1;
    local v79 = v40 < #v37;
    local v80 = v78 or v79;
    local l_createElement_0 = v5.createElement;
    local v82 = "Frame";
    local v83 = {
        BackgroundTransparency = 1, 
        LayoutOrder = v32.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v32.maxHeight), 
        ZIndex = v32.ZIndex
    };
    local v84 = {};
    local l_createElement_1 = v5.createElement;
    local v86 = "ScrollingFrame";
    local v87 = {
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.new(0, v48, 1, 0), 
        ClipsDescendants = false, 
        Position = UDim2.fromOffset(v50, 0), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X
    };
    local l_v80_0 = v80;
    if l_v80_0 then
        local l_l_UserInputService_0_Platform_1 = l_UserInputService_0:GetPlatform();
        local v90 = true;
        if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.IOS then
            v90 = l_l_UserInputService_0_Platform_1 == Enum.Platform.Android;
        end;
        local l_TouchEnabled_1 = l_UserInputService_0.TouchEnabled;
        local l_ReducedMotion_1 = l_UserGameSettings_0.ReducedMotion;
        l_v80_0 = v90 and l_TouchEnabled_1 and not l_ReducedMotion_1;
    end;
    v87.ScrollingEnabled = l_v80_0;
    v87.Size = UDim2.fromOffset(v47.X, v47.Y);
    v87[v5.Change.CanvasPosition] = v68;
    v87[v5.Event.InputBegan] = l_carouselInputBegan_0;
    v87[v5.Event.InputEnded] = l_carouselInputEnded_0;
    v87.ref = l_carouselRef_0;
    v84.AnimatedCarousel = l_createElement_1(v86, v87, v76);
    v84.LeftArrow = v78 and v5.createElement(v13, {
        direction = v15.CarouselDirection.Left, 
        isDisabled = v32.isDisabled, 
        Size = UDim2.fromOffset(v50 - v44, v77), 
        ZIndex = 2
    });
    v84.RightArrow = v79 and v5.createElement(v13, {
        direction = v15.CarouselDirection.Right, 
        isDisabled = v32.isDisabled, 
        Size = UDim2.fromOffset(v51 - v44, v77), 
        ZIndex = 2
    });
    return l_createElement_0(v82, v83, v84);
end;