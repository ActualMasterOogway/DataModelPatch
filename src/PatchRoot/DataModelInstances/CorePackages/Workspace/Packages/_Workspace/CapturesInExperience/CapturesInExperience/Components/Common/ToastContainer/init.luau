local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.Dash);
local v5 = require(l_Parent_1.Localization);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.RoactUtils);
local v8 = require(l_Parent_1.SocialStopwatch);
local v9 = require(l_Parent_1.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_Toast_0 = v9.App.Dialog.Toast;
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local v13 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local v17 = require(l_Parent_0.Enums.CapturesToastType);
local v18 = require(l_Parent_0.Actions.CarouselOpened);
local v19 = require(l_Parent_0.Actions.ComposerOpened);
local v20 = require(l_Parent_0.Constants);
local v21 = require(l_Parent_0.Analytics.EventNames);
local v22 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v23 = require(l_Parent_0.Utils.getCaptureUploadData);
local v24 = require(l_Parent_0.Thunks.ShareCapture);
local v25 = require(l_Parent_0.Thunks.SharePost);
local v26 = require(l_Parent_0.Actions.ToastVanished);
local _ = require(l_Parent_0.Types);
local v28 = {
    captureSaved = "captureSaved", 
    captureSavedToDevice = "captureSavedToDevice", 
    capturesEnabled = "capturesEnabled", 
    openInFiles = "openInFiles", 
    postAction = "postAction", 
    postFailed = "postFailed", 
    postGenericError = "postGenericError", 
    postModeratedDescription = "postModeratedDescription", 
    postShared = "postShared", 
    postUploading = "postUploading", 
    shareAction = "shareAction", 
    shareCaptureDescription = "shareCaptureDescription", 
    viewAction = "viewAction"
};
local v29 = true;
if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Windows then
    v29 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
end;
local v43 = {
    [v17.CaptureSavedToDevice] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = v29 and function(v30) --[[ Line: 68 ]]
            -- upvalues: v21 (copy)
            v30.fireEvent(v21.CapturesSavedToDeviceToastOpenButtonActivated);
            game:OpenScreenshotsFolder();
        end or nil, 
        toastCTAKey = if v29 then v28.openInFiles else nil, 
        toastTitleKey = v28.captureSavedToDevice
    }, 
    [v17.CaptureTaken] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v31, v32, v33) --[[ Line: 78 ]] --[[ Name: onActivated ]]
            -- upvalues: v21 (copy), v8 (copy), v24 (copy), v22 (copy)
            v31.fireEvent(v21.CapturesShareToastButtonActivated);
            if v33 and v33.captureInfo then
                if not v8.Stopwatch.get(v8.Events.CaptureShared) then
                    v8.Stopwatch.start(v8.Events.CaptureShared);
                end;
                v32(v24(v33.captureInfo, v22.Toast));
            end;
        end, 
        toastCTAKey = v28.shareAction, 
        toastSubtitleKey = v28.shareCaptureDescription, 
        toastTitleKey = v28.captureSaved
    }, 
    [v17.CaptureTakenWithPostCTA] = {
        iconImage = l_Images_0["icons/controls/cameraOff"], 
        onActivated = function(v34, v35, v36) --[[ Line: 94 ]] --[[ Name: onActivated ]]
            -- upvalues: v23 (copy), v21 (copy), l_RbxAnalyticsService_0 (copy), v19 (copy)
            local v37 = nil;
            if v36 ~= nil and v36.captureInfo then
                v37 = v23(v36.captureInfo);
            end;
            v34.fireEvent(v21.CapturesPostToastButtonActivated, {
                sessionId = l_RbxAnalyticsService_0:GetSessionId(), 
                universeId = if v37 then v37.context.experienceId else nil
            });
            if v36 ~= nil then
                v35(v19(v36.captureInfo));
            end;
        end, 
        toastCTAKey = v28.postAction, 
        toastTitleKey = v28.captureSaved
    }, 
    [v17.PostFailedGeneric] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v28.postFailed, 
        toastSubtitleKey = v28.postGenericError
    }, 
    [v17.PostFailedModerated] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v28.postFailed, 
        toastSubtitleKey = v28.postModeratedDescription
    }, 
    [v17.PostShared] = {
        iconImage = l_Images_0["icons/status/success"], 
        toastTitleKey = v28.postShared
    }, 
    [v17.PostSharedWithShareCTA] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = function(v38, v39, v40) --[[ Line: 126 ]] --[[ Name: onActivated ]]
            -- upvalues: v21 (copy), v25 (copy)
            v38.fireEvent(v21.PostShareToastButtonActivated);
            if v40 and v40.postId then
                v39(v25(v40.postId));
            end;
        end, 
        toastCTAKey = v28.shareAction, 
        toastTitleKey = v28.postShared
    }, 
    [v17.PostUploading] = {
        iconImage = l_Images_0["icons/status/pending_small"], 
        iconSize = Vector2.new(24, 24), 
        toastTitleKey = v28.postUploading
    }, 
    [v17.CapturesActivated] = {
        iconImage = l_Images_0["icons/status/success"], 
        toastTitleKey = v28.capturesEnabled
    }, 
    [v17.ViewCapture] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v41, v42) --[[ Line: 146 ]] --[[ Name: onActivated ]]
            -- upvalues: v21 (copy), v18 (copy)
            v41.fireEvent(v21.CapturesViewToastButtonActivated);
            v42(v18(1));
        end, 
        toastCTAKey = v28.viewAction, 
        toastTitleKey = v28.captureSaved
    }
};
return function(_) --[[ Line: 157 ]]
    -- upvalues: v13 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v28 (copy), l_useSelector_0 (copy), v20 (copy), v6 (copy), v17 (copy), v43 (copy), v26 (copy), v4 (copy), l_dependencyArray_0 (copy), l_Toast_0 (copy)
    local v45 = v13();
    local v46 = l_useDispatch_0();
    local v47 = l_useLocalization_0({
        [v28.captureSaved] = "Feature.Captures.Toast.CaptureSaved", 
        [v28.captureSavedToDevice] = "Feature.Captures.Toast.CaptureSavedToDevice", 
        [v28.capturesEnabled] = "Feature.Captures.Toast.CapturesEnabled", 
        [v28.openInFiles] = "Feature.Captures.Action.OpenInFiles", 
        [v28.postAction] = "Feature.Captures.Action.Post", 
        [v28.postFailed] = "Feature.Captures.Toast.PostUnsuccessful", 
        [v28.postGenericError] = "Feature.Captures.Description.PostGenericError", 
        [v28.postModeratedDescription] = "Feature.Captures.Description.PostModerated", 
        [v28.postShared] = "Feature.Captures.Toast.PostShared", 
        [v28.postUploading] = "Feature.ContentFeed.Toast.PostUploading", 
        [v28.shareAction] = "Feature.Captures.Action.Share", 
        [v28.shareCaptureDescription] = "Feature.Captures.Description.ShareCTA", 
        [v28.viewAction] = "Feature.Captures.Action.ViewCapture"
    });
    local v49 = l_useSelector_0(function(v48) --[[ Line: 177 ]]
        -- upvalues: v20 (ref)
        return v48[v20.RoduxKey].Toast.ToastType;
    end);
    local v51 = l_useSelector_0(function(v50) --[[ Line: 181 ]]
        -- upvalues: v20 (ref)
        return v50[v20.RoduxKey].Toast.ToastConfig;
    end);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 185 ]]
        -- upvalues: v20 (ref)
        return v52[v20.RoduxKey].Toast.IsDismissed;
    end);
    local v55 = v6.useCallback(function(v54) --[[ Line: 189 ]]
        -- upvalues: v47 (copy)
        if v54 then
            return v47[v54];
        else
            return nil;
        end;
    end);
    local v61 = v6.useMemo(function() --[[ Line: 196 ]]
        -- upvalues: v49 (copy), v17 (ref), v43 (ref), v46 (copy), v26 (ref), v45 (copy), v51 (copy), v20 (ref), v4 (ref), v55 (copy)
        if v49 == v17.None then
            return nil;
        else
            local v56 = v43[v49];
            local l_v49_0 = v49;
            local function v58() --[[ Line: 204 ]]
                -- upvalues: l_v49_0 (copy), v49 (ref), v46 (ref), v26 (ref)
                if l_v49_0 == v49 then
                    v46(v26());
                end;
            end;
            local v59 = nil;
            if v56.onActivated then
                v59 = function() --[[ Line: 212 ]]
                    -- upvalues: v56 (copy), v45 (ref), v46 (ref), v51 (ref), l_v49_0 (copy), v49 (ref), v26 (ref)
                    v56.onActivated(v45, v46, v51);
                    if l_v49_0 == v49 then
                        v46(v26());
                    end;
                end;
            end;
            local v60 = v56.duration or v20.ToastDuration;
            return v4.join(v56, {
                buttonText = v55(v56.toastCTAKey), 
                duration = v60, 
                onActivated = v59, 
                onDismissed = v58, 
                toastCTAKey = v4.None, 
                toastSubtitle = v55(v56.toastSubtitleKey), 
                toastSubtitleKey = v4.None, 
                toastTitle = v55(v56.toastTitleKey), 
                toastTitleKey = v4.None
            });
        end;
    end, l_dependencyArray_0(v49, v51));
    if not v61 then
        return nil;
    else
        return v6.createElement(v6.Fragment, {}, {
            [v49] = v6.createElement(l_Toast_0, {
                duration = v61.duration, 
                show = not v53, 
                toastContent = v61
            })
        });
    end;
end;