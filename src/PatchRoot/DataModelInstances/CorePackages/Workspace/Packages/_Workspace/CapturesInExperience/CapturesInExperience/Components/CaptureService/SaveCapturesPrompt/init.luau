local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_Toggle_0 = v6.App.InputButton.Toggle;
local v10 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local v14 = require(l_Parent_0.Analytics.EventNames);
local v15 = require(l_Parent_0.Thunks.SaveCapturesPromptFinished);
local _ = require(l_Parent_0.Types);
local function v22(v17) --[[ Line: 43 ]]
    -- upvalues: v3 (copy), l_Toggle_0 (copy)
    local v18, v19 = v3.useState(true);
    v3.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v17 (copy), v18 (copy)
        v17.setIsRowSelected(v17.contentId, v18);
    end, {
        v18, 
        v17.contentId, 
        v17.setIsRowSelected
    });
    local v20 = v3.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy), v18 (copy)
        v19(not v18);
    end, {
        v18, 
        v19
    });
    local v21 = 76;
    if not v17.showToggle then
        v21 = 0;
    end;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 200), 
        BackgroundTransparency = 1, 
        LayoutOrder = v17.layoutOrder
    }, {
        Preview = v3.createElement("Frame", {
            Size = UDim2.new(1, -v21, 1, -16), 
            BackgroundTransparency = 1
        }, {
            Image = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v17.contentId, 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Crop, 
                Size = UDim2.fromScale(1, 1)
            })
        }), 
        Toggle = v17.showToggle and v3.createElement(l_Toggle_0, {
            anchorPoint = Vector2.new(1, 0.5), 
            isSelected = v18, 
            layoutOrder = 1, 
            onActivated = v20, 
            position = UDim2.new(1, -8, 0.5, 0)
        })
    });
end;
return function(v23) --[[ Line: 88 ]]
    -- upvalues: v10 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v3 (copy), l_useLocalization_0 (copy), v14 (copy), v15 (copy), l_ButtonType_0 (copy), v22 (copy), l_InteractiveAlert_0 (copy)
    local v24 = v10();
    local v25 = l_useDispatch_0();
    local v26 = l_useScreenSize_0();
    local v27, v28 = v3.useState(Vector2.new(0, 0));
    local v29, v30 = v3.useState(Vector2.new(0, 0));
    local v31 = v3.useRef({});
    local l_contentIds_0 = v23.promptData.contentIds;
    local v33 = v23.enableInputDelayed == nil or v23.enableInputDelayed;
    local v34 = l_useLocalization_0({
        bodyText = "Feature.Captures.Body.SaveCapturesPrompt", 
        no = "Feature.Captures.Action.NoThanks", 
        title = "Feature.Captures.Title.SaveCapturesPrompt", 
        yes = "Feature.Captures.Action.Save"
    });
    v3.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v24 (copy), v14 (ref)
        v24.fireEvent(v14.SaveCapturesPromptViewed);
    end, {});
    local v37 = v3.useCallback(function(v35, v36) --[[ Line: 111 ]]
        -- upvalues: v31 (copy)
        assert(v31.current ~= nil, "contentIdsMap.current should always be initialized");
        v31.current[v35] = v36;
    end, {});
    local v39 = v3.useCallback(function(v38) --[[ Line: 116 ]]
        -- upvalues: v28 (copy)
        v28(v38.AbsoluteSize);
    end, {
        v28
    });
    local v41 = v3.useCallback(function(v40) --[[ Line: 120 ]]
        -- upvalues: v30 (copy)
        v30(v40.AbsoluteSize);
    end, {
        v30
    });
    local v47 = v3.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v31 (copy), v23 (copy), v24 (copy), v14 (ref), v25 (copy), v15 (ref)
        assert(v31.current ~= nil, "contentIdsMap.current should always be initialized");
        local v42 = 0;
        local v43 = 0;
        local v44 = {};
        for _, v46 in v23.promptData.contentIds do
            v44[v46] = v31.current[v46] or false;
            if v44[v46] then
                v42 = v42 + 1;
            end;
            v43 = v43 + 1;
        end;
        v24.fireEvent(v14.SaveCapturesPromptAccepted, {
            savedCaptures = v42, 
            totalCaptures = v43
        });
        v25(v15(v23.promptId, v44));
    end, {
        v23.promptData, 
        v23.promptId
    });
    local v51 = v3.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v24 (copy), v14 (ref), v23 (copy), v25 (copy), v15 (ref)
        v24.fireEvent(v14.SaveCapturesPromptRejected);
        local v48 = {};
        for _, v50 in v23.promptData.contentIds do
            v48[v50] = false;
        end;
        v25(v15(v23.promptId, v48));
    end, {
        v23.promptData, 
        v23.promptId
    });
    local v52 = v3.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v51 (copy), v34 (copy), l_ButtonType_0 (ref), v33 (copy), v47 (copy)
        return {
            buttons = {
                {
                    props = {
                        onActivated = v51, 
                        text = v34.no
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        delayInputSeconds = 2, 
                        enableInputDelayed = v33, 
                        isDelayedInput = v33, 
                        onActivated = v47, 
                        text = v34.yes
                    }, 
                    isDefaultChild = false
                }
            }
        };
    end, {
        v34, 
        v47, 
        v51
    });
    local v59 = v3.useCallback(function() --[[ Line: 180 ]]
        -- upvalues: v27 (copy), v29 (copy), l_contentIds_0 (copy), v26 (copy), v3 (ref), v22 (ref), v37 (copy), v41 (copy)
        local v53 = v27.Y - v29.Y;
        local v54 = 200 * #l_contentIds_0;
        local v55 = v26.Y - 80 - v53;
        if v55 < v54 then
            v54 = v55;
        end;
        local v56 = {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        };
        for v57, v58 in l_contentIds_0 do
            v56[v58] = v3.createElement(v22, {
                contentId = v58, 
                layoutOrder = v57, 
                setIsRowSelected = v37, 
                showToggle = #l_contentIds_0 > 1
            });
        end;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v54), 
            [v3.Change.AbsoluteSize] = v41
        }, {
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                ScrollBarThickness = 0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Size = UDim2.new(1, 0, 1, 0)
            }, v56)
        });
    end, {
        v27, 
        l_contentIds_0, 
        v29, 
        v37
    });
    return v3.createElement(l_InteractiveAlert_0, {
        bodyText = v34.bodyText, 
        buttonStackInfo = v52, 
        isMiddleContentFocusable = false, 
        middleContent = v59, 
        onAbsoluteSizeChanged = v39, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v26, 
        title = v34.title
    });
end;