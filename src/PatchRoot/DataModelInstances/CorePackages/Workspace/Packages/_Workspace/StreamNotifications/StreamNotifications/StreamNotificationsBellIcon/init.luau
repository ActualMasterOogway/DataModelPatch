local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.StreamNotifications);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.UIBlox);
local l_Badge_0 = v5.App.Indicator.Badge;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local l_BadgeVariant_0 = v5.App.Indicator.Enum.BadgeVariant;
local l_UtilityActionIcon_0 = v5.App.Button.UtilityActionIcon;
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local l_ixpHelper_0 = require(l_Parent_0.NotificationsCommon).ixpHelper;
local v15 = require(l_script_FirstAncestor_0.constants);
local v16 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = require(l_Parent_0.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer;
local l_isAppNavEnabled_0 = require(l_Parent_0.SharedFlags).isAppNavEnabled;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_GetFFlagNotificationsComplianceShouldRestrictStream_0 = v4.GetFFlagNotificationsComplianceShouldRestrictStream;
local v21 = l_Images_0["icons/common/notificationOn"];
local function v29(v22) --[[ Line: 38 ]]
    -- upvalues: v2 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v16 (copy), v15 (copy), v3 (copy), l_GetFFlagNotificationsComplianceShouldRestrictStream_0 (copy), l_isAppNavEnabled_0 (copy), l_UtilityActionIcon_0 (copy), v21 (copy), l_ixpHelper_0 (copy), l_GetFStringNotificationsStreamNotificationUXLayer_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy)
    local v23, v24 = v2.useState(false);
    local v25 = v22.notificationCount and tonumber(v22.notificationCount) or 0;
    local l_layoutOrder_0 = v22.layoutOrder;
    local v27 = 44;
    if v22.compactWidth then
        v27 = 34;
    end;
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v25 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v16 (ref), v15 (ref)
        if v25 > 0 then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v16.Context.seen, v16.EventNames.openCTAShown, {
                count = v25, 
                sendrVersion = v15.SENDRVersion
            });
        end;
    end, {
        v25
    });
    local v28 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy), v2 (ref), v3 (ref), v24 (copy)
        if v23 then
            return v2.createElement(v3, {
                displayStream = v24
            });
        else
            return nil;
        end;
    end, {
        v23
    });
    if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() and v22.shouldRestrictStream then
        return nil;
    elseif l_isAppNavEnabled_0() then
        return (v2.createElement(l_UtilityActionIcon_0, {
            icon = v21, 
            onActivated = function() --[[ Line: 85 ]] --[[ Name: onActivated ]]
                -- upvalues: v24 (copy), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v16 (ref), v25 (copy), v15 (ref)
                v24(true);
                l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v16.Context.click, v16.EventNames.openContent, {
                    countOfUnreadNotification = v25, 
                    sendrVersion = v15.SENDRVersion
                });
            end, 
            badgeValue = if v25 > 0 then v25 else nil
        }, {
            DisplayStreamNotifications = v28
        }));
    else
        return (v2.createElement(l_IconButton_0, {
            size = UDim2.new(0, v27, 1, 0), 
            icon = v21, 
            iconSize = l_IconSize_0.Medium, 
            layoutOrder = l_layoutOrder_0 or 3, 
            onActivated = function() --[[ Line: 109 ]] --[[ Name: onActivated ]]
                -- upvalues: v24 (copy), l_ixpHelper_0 (ref), l_GetFStringNotificationsStreamNotificationUXLayer_0 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v16 (ref), v25 (copy), v15 (ref)
                v24(true);
                l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v16.Context.click, v16.EventNames.openContent, {
                    countOfUnreadNotification = v25, 
                    sendrVersion = v15.SENDRVersion
                });
            end
        }, {
            notificationBadge = if v25 > 0 then v2.createElement(l_Badge_0, {
                position = UDim2.new(0.5, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 1), 
                value = v25, 
                badgeVariant = l_BadgeVariant_0.Alert
            }) else nil
        }, {
            v28
        }));
    end;
end;
if l_GetFFlagNotificationsComplianceShouldRestrictStream_0() then
    v29 = l_RoactAppPolicy_0.connect(function(v30, _) --[[ Line: 135 ]]
        return {
            shouldRestrictStream = v30.getNotificationsCanReceiveStream() or false
        };
    end)(v29);
end;
return v29;