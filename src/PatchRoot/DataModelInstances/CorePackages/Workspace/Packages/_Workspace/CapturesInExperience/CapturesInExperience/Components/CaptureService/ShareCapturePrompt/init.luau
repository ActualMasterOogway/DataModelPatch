local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local v9 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local v13 = require(l_Parent_0.Analytics.EventNames);
local v14 = require(l_Parent_0.Utils.getCaptureSize);
local v15 = require(l_Parent_0.Thunks.ShareCapturePromptFinished);
local _ = require(l_Parent_0.Types);
return function(v17) --[[ Line: 33 ]]
    -- upvalues: v9 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), v3 (copy), l_useLocalization_0 (copy), v13 (copy), v14 (copy), v15 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v18 = v9();
    local v19 = l_useDispatch_0();
    local v20 = l_useScreenSize_0();
    local v21, v22 = v3.useState(Vector2.new(0, 0));
    local v23, v24 = v3.useState(Vector2.new(200, 200));
    local v25, v26 = v3.useState(Vector2.new(0, 0));
    local l_contentId_0 = v17.promptData.contentId;
    local v28 = v17.enableInputDelayed == nil or v17.enableInputDelayed;
    local v29 = l_useLocalization_0({
        bodyText = "Feature.Captures.Body.ShareCapturePrompt", 
        no = "Feature.Captures.Action.NoThanks", 
        title = "Feature.Captures.Title.ShareCapturePrompt", 
        yes = "Feature.Captures.Action.Share"
    });
    v3.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v18 (copy), v13 (ref), v14 (ref), l_contentId_0 (copy), v24 (copy)
        v18.fireEvent(v13.ShareCapturePromptViewed);
        task.spawn(function() --[[ Line: 55 ]]
            -- upvalues: v14 (ref), l_contentId_0 (ref), v24 (ref)
            local v30 = v14(l_contentId_0);
            if v30 then
                v24(v30);
            end;
        end);
    end, {
        l_contentId_0
    });
    local v32 = v3.useCallback(function(v31) --[[ Line: 63 ]]
        -- upvalues: v22 (copy)
        v22(v31.AbsoluteSize);
    end, {
        v22
    });
    local v34 = v3.useCallback(function(v33) --[[ Line: 67 ]]
        -- upvalues: v26 (copy)
        v26(v33.AbsoluteSize);
    end, {
        v26
    });
    local v35 = v3.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v18 (copy), v13 (ref), v19 (copy), v15 (ref), v17 (copy)
        v18.fireEvent(v13.ShareCapturePromptAccepted);
        v19(v15(v17.promptId, v17.promptData, true));
    end, {
        v17.promptData, 
        v17.promptId
    });
    local v36 = v3.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v18 (copy), v13 (ref), v19 (copy), v15 (ref), v17 (copy)
        v18.fireEvent(v13.ShareCapturePromptRejected);
        v19(v15(v17.promptId, v17.promptData, false));
    end, {
        v17.promptData, 
        v17.promptId
    });
    local v37 = v3.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v36 (copy), v29 (copy), l_ButtonType_0 (ref), v28 (copy), v35 (copy)
        return {
            buttons = {
                {
                    props = {
                        onActivated = v36, 
                        text = v29.no
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        delayInputSeconds = 2, 
                        enableInputDelayed = v28, 
                        isDelayedInput = v28, 
                        onActivated = v35, 
                        text = v29.yes
                    }, 
                    isDefaultChild = false
                }
            }
        };
    end, {
        v29, 
        v35, 
        v36
    });
    local v42 = v3.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v21 (copy), v25 (copy), v20 (copy), v23 (copy), v3 (ref), v34 (copy), l_contentId_0 (copy)
        local v38 = v21.Y - v25.Y;
        local v39 = v20.Y - 80 - v38;
        local v40 = v23.X / v23.Y;
        local v41 = v25.X / v40;
        if v41 < v39 then
            v39 = v41;
        end;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v39), 
            [v3.Change.AbsoluteSize] = v34
        }, {
            CaptureImage = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_contentId_0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Fit, 
                Size = UDim2.fromScale(1, 1)
            })
        });
    end, {
        v21, 
        v25, 
        l_contentId_0, 
        v23
    });
    return v3.createElement(l_InteractiveAlert_0, {
        bodyText = v29.bodyText, 
        buttonStackInfo = v37, 
        isMiddleContentFocusable = false, 
        middleContent = v42, 
        onAbsoluteSizeChanged = v32, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v20, 
        title = v29.title
    });
end;