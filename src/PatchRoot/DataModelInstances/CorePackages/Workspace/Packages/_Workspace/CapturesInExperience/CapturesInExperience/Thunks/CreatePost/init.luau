local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_0.Enums.CapturesToastType);
local v4 = require(l_Parent_0.Actions.ComposerClosed);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Analytics.EventNames);
local v7 = require(l_Parent_0.Analytics.FireEvent);
local v8 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
return function(v10, v11) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v8 (copy), v3 (copy), v7 (copy), v6 (copy), l_RbxAnalyticsService_0 (copy), l_CaptureService_0 (copy), v5 (copy)
    return function(v12) --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v8 (ref), v3 (ref), v7 (ref), v6 (ref), l_RbxAnalyticsService_0 (ref), l_CaptureService_0 (ref), v10 (copy), v11 (copy), v5 (ref)
        v12:dispatch(v4());
        v12:dispatch(v8(v3.PostUploading));
        v7(v6.PostPendingToastViewed, {
            sessionId = l_RbxAnalyticsService_0:GetSessionId()
        });
        if not pcall(function() --[[ Line: 22 ]]
            -- upvalues: l_CaptureService_0 (ref), v10 (ref), v11 (ref), v5 (ref), v12 (copy), v8 (ref), v3 (ref), v7 (ref), v6 (ref), l_RbxAnalyticsService_0 (ref)
            if l_CaptureService_0:CreatePostAsync({
                v10.filePath
            }, v11).statusCode ~= v5.StatusCodes.OK then
                v12:dispatch(v8(v3.PostFailedGeneric));
                v7(v6.PostPendingUnsuccessfulToastViewed, {
                    sessionId = l_RbxAnalyticsService_0:GetSessionId()
                });
            end;
        end) then
            v12:dispatch(v8(v3.PostFailedGeneric));
            v7(v6.PostPendingUnsuccessfulToastViewed, {
                sessionId = l_RbxAnalyticsService_0:GetSessionId()
            });
        end;
    end;
end;