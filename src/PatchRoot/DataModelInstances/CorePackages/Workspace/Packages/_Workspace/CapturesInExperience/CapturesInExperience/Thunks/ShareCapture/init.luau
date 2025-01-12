local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_default_0 = require(l_Parent_1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local v6 = require(l_Parent_1.SocialStopwatch);
local v7 = require(l_Parent_0.Enums.CaptureType);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.Enums.ServerType);
local v10 = require(l_Parent_0.Analytics.EventNames);
local _ = require(l_Parent_0.Enums.ExternalShareSourceType);
local v12 = require(l_Parent_0.Analytics.FireEvent);
local v13 = require(l_Parent_0.Utils.getPlaceIdFromCapture);
local v14 = require(l_Parent_0.App.Networking);
local _ = require(l_Parent_0.Types);
local l_NetworkingShareLinks_0 = v14.NetworkingShareLinks;
local l_LinkType_0 = v14.RoduxShareLinks.Enums.LinkType;
local v18 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local function v21(v19, v20) --[[ Line: 29 ]] --[[ Name: shareImage ]]
    -- upvalues: l_default_0 (copy), v8 (copy), v18 (copy)
    if not l_default_0 then
        return;
    else
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        l_default_0:shareImage({
            context = v8.CapturesContext, 
            image = v19, 
            shareSheetTitle = v18:Format("Feature.Captures.Action.ShareYourCapture"), 
            url = v20
        });
        return;
    end;
end;
local function v24(v22, v23) --[[ Line: 44 ]] --[[ Name: shareVideo ]]
    -- upvalues: l_default_0 (copy), v8 (copy), v18 (copy)
    if not l_default_0 then
        return;
    else
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        l_default_0:shareVideo({
            context = v8.CapturesContext, 
            shareSheetTitle = v18:Format("Feature.Captures.Action.ShareYourCapture"), 
            url = v23, 
            video = v22
        });
        return;
    end;
end;
local function _(v25, v26) --[[ Line: 59 ]] --[[ Name: shareCapture ]]
    -- upvalues: v7 (copy), v24 (copy), v21 (copy), l_CaptureService_0 (copy)
    if v25.type == v7.Video then
        v24(v25.filePath, v26);
    else
        v21(v25.filePath, v26);
    end;
    l_CaptureService_0:OnCaptureShared(v25.filePath);
end;
local function _(v28) --[[ Line: 68 ]] --[[ Name: sendShareLatencyEvent ]]
    -- upvalues: v6 (copy), v12 (copy), v10 (copy)
    local v29 = v6.Stopwatch.stop(v6.Events.CaptureShared);
    v12(v10.CapturesShareLatency, {
        statValue = if v29 then v29.timeElapsed else nil, 
        externalShareSource = v28
    });
end;
return function(v31, v32, v33) --[[ Line: 76 ]]
    -- upvalues: v9 (copy), v7 (copy), v24 (copy), v21 (copy), l_CaptureService_0 (copy), v12 (copy), v10 (copy), v6 (copy), v13 (copy), l_LinkType_0 (copy), l_NetworkingShareLinks_0 (copy)
    return function(v34) --[[ Line: 81 ]]
        -- upvalues: v9 (ref), v31 (copy), v7 (ref), v24 (ref), v21 (ref), l_CaptureService_0 (ref), v12 (ref), v10 (ref), v32 (copy), v6 (ref), v13 (ref), v33 (copy), l_LinkType_0 (ref), l_NetworkingShareLinks_0 (ref)
        if not (v34:getState().ServerType == v9.StandardServer) then
            local l_v31_0 = v31;
            if l_v31_0.type == v7.Video then
                v24(l_v31_0.filePath, nil);
            else
                v21(l_v31_0.filePath, nil);
            end;
            l_CaptureService_0:OnCaptureShared(l_v31_0.filePath);
            v12(v10.CapturesShareFromNonStandardServer);
            l_v31_0 = v32;
            local v36 = v6.Stopwatch.stop(v6.Events.CaptureShared);
            v12(v10.CapturesShareLatency, {
                statValue = if v36 then v36.timeElapsed else nil, 
                externalShareSource = l_v31_0
            });
            return;
        else
            local v37 = nil;
            local l_PlaceId_0 = game.PlaceId;
            local v39 = v13(v31);
            if l_PlaceId_0 == v39 then
                v37 = game.JobId;
            end;
            local v40 = {
                instanceId = v37, 
                launchData = v33, 
                linkType = l_LinkType_0.ScreenshotInvite.rawValue(), 
                placeId = v39
            };
            v34:dispatch(l_NetworkingShareLinks_0.GenerateLink.API(v40)):andThen(function(v41) --[[ Line: 108 ]]
                -- upvalues: v31 (ref), v7 (ref), v24 (ref), v21 (ref), l_CaptureService_0 (ref), v32 (ref), v6 (ref), v12 (ref), v10 (ref)
                local l_shortUrl_0 = v41.responseBody.shortUrl;
                local l_v31_1 = v31;
                if l_v31_1.type == v7.Video then
                    v24(l_v31_1.filePath, l_shortUrl_0);
                else
                    v21(l_v31_1.filePath, l_shortUrl_0);
                end;
                l_CaptureService_0:OnCaptureShared(l_v31_1.filePath);
                l_v31_1 = v32;
                local v44 = v6.Stopwatch.stop(v6.Events.CaptureShared);
                v12(v10.CapturesShareLatency, {
                    statValue = if v44 then v44.timeElapsed else nil, 
                    externalShareSource = l_v31_1
                });
            end):catch(function(v45) --[[ Line: 113 ]]
                -- upvalues: v12 (ref), v10 (ref), v31 (ref), v7 (ref), v24 (ref), v21 (ref), l_CaptureService_0 (ref), v32 (ref), v6 (ref)
                warn("GenerateLink failed with error:", v45);
                v12(v10.ShareCaptureGenerateLinkFailed, {
                    httpError = v45.HttpError
                });
                local l_v31_2 = v31;
                if l_v31_2.type == v7.Video then
                    v24(l_v31_2.filePath, nil);
                else
                    v21(l_v31_2.filePath, nil);
                end;
                l_CaptureService_0:OnCaptureShared(l_v31_2.filePath);
                l_v31_2 = v32;
                local v47 = v6.Stopwatch.stop(v6.Events.CaptureShared);
                v12(v10.CapturesShareLatency, {
                    statValue = if v47 then v47.timeElapsed else nil, 
                    externalShareSource = l_v31_2
                });
            end);
            return;
        end;
    end;
end;