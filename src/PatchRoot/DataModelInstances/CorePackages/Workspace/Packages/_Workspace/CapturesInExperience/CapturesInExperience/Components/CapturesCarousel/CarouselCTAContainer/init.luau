local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactAppExperiment);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.SocialStopwatch);
local v7 = require(l_Parent_1.UIBlox);
local l_IconButton_0 = v7.App.Button.IconButton;
local l_Images_0 = v7.App.ImageSet.Images;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local v15 = require(l_Parent_0.App.CapturesPolicy);
local v16 = require(l_Parent_0.Actions.ComposerOpened);
local v17 = require(l_Parent_0.Constants);
local v18 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local v19 = require(l_Parent_0.Analytics.EventNames);
local v20 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v21 = require(l_Parent_0.Utils.getCaptureUploadData);
local v22 = require(l_Parent_0.Utils.getIsCapturePostable);
local v23 = require(l_Parent_0.Utils.getIsDeleteWarningModalOptedOut);
local v24 = require(l_Parent_0.Utils.getSaveToStoragePermission);
local v25 = require(l_Parent_0.Thunks.ShareCapture);
local _ = require(l_Parent_0.Types);
local l_FFlagCapturesPostEnabledForAll_0 = require(l_Parent_1.SharedFlags).FFlagCapturesPostEnabledForAll;
local l_FFlagEnableOnPlatformSharingExperiment_0 = require(l_Parent_1.SharedFlags).FFlagEnableOnPlatformSharingExperiment;
local l_FStringSocialCaptureTakenIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer;
local l_useUserExperiment_0 = v4.useUserExperiment;
local v31 = UDim.new(0.12, 0);
local v32 = UDim2.fromOffset(36, 36);
local v33 = UDim.new(0, 8);
return (v15.connect(function(v34) --[[ Line: 222 ]]
    return {
        enableShareCaptureCTA = v34.enableShareCaptureCTA()
    };
end)(function(v35) --[[ Line: 55 ]]
    -- upvalues: v11 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v3 (copy), l_useRef_0 (copy), l_FFlagEnableOnPlatformSharingExperiment_0 (copy), l_useUserExperiment_0 (copy), l_FStringSocialCaptureTakenIXPLayer_0 (copy), l_useSelector_0 (copy), v17 (copy), v22 (copy), v24 (copy), v19 (copy), v21 (copy), v16 (copy), l_RbxAnalyticsService_0 (copy), v6 (copy), v25 (copy), v20 (copy), v23 (copy), v18 (copy), v33 (copy), v31 (copy), l_IconButton_0 (copy), l_Images_0 (copy), v32 (copy), l_FFlagCapturesPostEnabledForAll_0 (copy)
    local v36 = v11();
    local v37 = l_useDispatch_0();
    local v38 = l_useStyle_0();
    local v39, v40 = v3.useState(false);
    local v41 = l_useRef_0(0);
    local v43 = if l_FFlagEnableOnPlatformSharingExperiment_0 then l_useUserExperiment_0({
        l_FStringSocialCaptureTakenIXPLayer_0
    }, function(v42) --[[ Line: 64 ]]
        -- upvalues: l_FStringSocialCaptureTakenIXPLayer_0 (ref)
        return (v42[l_FStringSocialCaptureTakenIXPLayer_0] or {}).OnPlatformSharingEnabled;
    end, false) else false;
    local v46 = l_useSelector_0(function(v44) --[[ Line: 70 ]]
        -- upvalues: v17 (ref)
        local l_SelectedCaptureIndex_0 = v44[v17.RoduxKey].Carousel.SelectedCaptureIndex;
        return v44[v17.RoduxKey].Captures[l_SelectedCaptureIndex_0];
    end);
    v3.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v22 (ref), v46 (copy), v40 (copy)
        local v47 = v22(v46);
        v40(v47);
    end, {
        v46
    });
    local v48 = v3.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v35 (copy), v41 (copy)
        if v35.isDisabled then
            return true;
        elseif DateTime.now().UnixTimestampMillis - v41.current < 500 then
            return true;
        else
            return false;
        end;
    end, {
        v35.isDisabled
    });
    local v49 = v3.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v41 (copy)
        v41.current = DateTime.now().UnixTimestampMillis;
    end, {});
    local v50 = v3.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v48 (copy), v24 (ref), v46 (copy), v35 (copy), v37 (copy), v49 (copy), v36 (copy), v19 (ref)
        if v48() then
            return;
        else
            v24(v46, v35.openPermissionModal, v37);
            v49();
            v36.fireEvent(v19.CapturesCarouselSaveToExternalStorageActivated);
            return;
        end;
    end, {
        v46, 
        v48, 
        v49, 
        v35.openPermissionModal
    });
    local v52 = v3.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v48 (copy), v21 (ref), v46 (copy), v49 (copy), v37 (copy), v16 (ref), v36 (copy), v19 (ref), l_RbxAnalyticsService_0 (ref)
        if v48() then
            return;
        else
            local v51 = v21(v46);
            v49();
            v37(v16(v46));
            v36.fireEvent(v19.CapturesCarouselPostActivated, {
                sessionId = l_RbxAnalyticsService_0:GetSessionId(), 
                universeId = if v51 then v51.context.experienceId else nil
            });
            return;
        end;
    end, {
        v46, 
        v35.isDisabled, 
        v48, 
        v49
    });
    local v53 = v3.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v48 (copy), v49 (copy), v36 (copy), v19 (ref), v6 (ref), v37 (copy), v25 (ref), v46 (copy), v20 (ref)
        if v48() then
            return;
        else
            v49();
            v36.fireEvent(v19.CapturesCarouselShareActivated);
            if v6.Stopwatch.get(v6.Events.CaptureShared) == nil then
                v6.Stopwatch.start(v6.Events.CaptureShared);
            end;
            v37(v25(v46, v20.CapturesCarousel));
            return;
        end;
    end, {
        v46, 
        v35.isDisabled, 
        v48, 
        v49
    });
    local v54 = v3.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v48 (copy), v49 (copy), v36 (copy), v19 (ref), v23 (ref), v35 (copy), v37 (copy), v18 (ref)
        if v48() then
            return;
        else
            v49();
            v36.fireEvent(v19.CapturesDeleteActivatedInCarousel);
            if v23() then
                assert(v35.deleteItem ~= nil, "props.deleteItem should not be nil");
                v35.deleteItem();
                return;
            else
                v37(v18());
                return;
            end;
        end;
    end, {
        v46, 
        v35.deleteItem, 
        v35.isDisabled, 
        v48, 
        v49
    });
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.None, 
        BackgroundColor3 = v38.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = v38.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v35.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v35.height), 
        ZIndex = v35.ZIndex
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = v33
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = v31, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SaveButton = v3.createElement(l_IconButton_0, {
            backgroundColor = v38.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/download_medium"], 
            layoutOrder = 1, 
            onActivated = v50, 
            showBackground = false, 
            size = v32
        }), 
        PostButton = (not not l_FFlagCapturesPostEnabledForAll_0 or v43) and v39 and v3.createElement(l_IconButton_0, {
            backgroundColor = v38.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/edit/add"], 
            layoutOrder = 2, 
            onActivated = v52, 
            showBackground = false, 
            size = v32
        }), 
        ShareButton = v35.enableShareCaptureCTA and v3.createElement(l_IconButton_0, {
            backgroundColor = v38.Theme.BackgroundUIContrast, 
            icon = l_Images_0["icons/actions/share"], 
            layoutOrder = 3, 
            onActivated = v53, 
            showBackground = false, 
            size = v32
        }), 
        DeleteButton = v3.createElement(l_IconButton_0, {
            icon = l_Images_0["icons/actions/edit/delete"], 
            layoutOrder = 4, 
            onActivated = v54, 
            showBackground = false, 
            size = v32
        })
    });
end));