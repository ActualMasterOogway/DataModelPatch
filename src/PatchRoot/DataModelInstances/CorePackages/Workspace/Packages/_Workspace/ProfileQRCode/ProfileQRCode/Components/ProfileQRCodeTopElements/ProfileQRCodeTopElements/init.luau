local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactAppExperiment);
local v6 = require(l_Parent_0.Localization);
local v7 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v7.App.Dialog.Toast;
local v9 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v10 = require(l_script_FirstAncestor_0.Components.ProfileQRCodeTopBar);
local v11 = require(l_script_FirstAncestor_0.Components.QRCodeFriendRequestNotification);
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Networking.useAcceptFriendUrl);
local v14 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v15 = require(l_script_FirstAncestor_0.Networking.useGetUsersInfoUrl);
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v18 = require(l_Parent_0.FriendsNetworking);
local l_Images_0 = v7.App.ImageSet.Images;
local v20 = require(l_script_FirstAncestor_0.Common.SignalREvents);
local v21 = require(l_script_FirstAncestor_0.Flags.getFStringProfileQRCodeFriendRequestAlertsExperimentKey);
local v22 = require(l_script_FirstAncestor_0.Flags.getFStringProfileQRCodeFriendRequestAlertsLayer);
local v23 = l_Images_0["icons/actions/friends/friendAdd"];
return (v5.connectUserLayer({
    v22()
}, function(v24, _) --[[ Line: 192 ]]
    -- upvalues: v22 (copy), v21 (copy)
    return {
        profileQRCodeFriendRequestAlertsEnabled = (v24[v22()] or {})[v21()]
    };
end, false)(function(v26) --[[ Line: 49 ]]
    -- upvalues: l_useLocalization_0 (copy), v12 (copy), v14 (copy), v4 (copy), l_IXPService_0 (copy), v22 (copy), v3 (copy), l_useLocalUserId_0 (copy), v15 (copy), v13 (copy), v20 (copy), v18 (copy), v10 (copy), l_Toast_0 (copy), v23 (copy), v11 (copy), v9 (copy)
    local v27 = l_useLocalization_0({
        description = v12.Description, 
        friendAdded = v12.FriendAdded
    });
    local v28 = v14();
    local l_profileQRCodeFriendRequestAlertsEnabled_0 = v26.profileQRCodeFriendRequestAlertsEnabled;
    local l_robloxEventReceiver_0 = v26.robloxEventReceiver;
    local v31, v32 = v4.useState(false);
    local v35, v36 = v4.useReducer(function(v33, v34) --[[ Line: 59 ]]
        -- upvalues: l_IXPService_0 (ref), v22 (ref), v3 (ref)
        if v34.type == "addItemToQueue" then
            l_IXPService_0:LogUserLayerExposure(v22());
            return v3.List.join(v33, {
                v34.newUserId
            });
        elseif v34.type == "removeItemFromQueue" then
            return v3.List.removeIndex(v33, 1);
        else
            return v33;
        end;
    end, {});
    local v37 = l_useLocalUserId_0();
    local v38 = v15();
    local v39 = v13();
    local function v43(v40) --[[ Line: 76 ]] --[[ Name: friendshipNotificationReceived ]]
        -- upvalues: v20 (ref), v18 (ref), v37 (copy), v38 (copy), v36 (copy)
        if v40.Type == v20.FriendshipRequested and v40.EventArgs.SourceType == v18.Enums.FriendshipOriginSourceType.QrCode.rawValue() then
            local v41 = tostring(v40.EventArgs.UserId1);
            if v41 == v37 then
                v41 = tostring(v40.EventArgs.UserId2);
            end;
            do
                local l_v41_0 = v41;
                v38(l_v41_0):andThen(function() --[[ Line: 90 ]]
                    -- upvalues: v36 (ref), l_v41_0 (ref)
                    v36({
                        type = "addItemToQueue", 
                        newUserId = l_v41_0
                    });
                end);
            end;
        end;
    end;
    v4.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v20 (ref), v43 (copy)
        l_robloxEventReceiver_0:observeEvent(v20.FriendshipNotifications, function(v44) --[[ Line: 97 ]]
            -- upvalues: v43 (ref)
            v43(v44);
        end);
    end, {
        l_robloxEventReceiver_0
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 56), 
        BackgroundTransparency = 1, 
        ZIndex = 3, 
        LayoutOrder = 1
    }, {
        TopBarWrapper = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TopBar = v4.createElement(v10, {
                appStorageService = v26.appStorageService, 
                layoutOrder = 1, 
                onClose = v26.onClose, 
                openQrCodeScanner = v26.openQrCodeScanner
            })
        }), 
        FriendAcceptToastFrame = if l_profileQRCodeFriendRequestAlertsEnabled_0 and v31 then v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 100
        }, {
            FriendAcceptToast = v4.createElement(l_Toast_0, {
                toastContent = {
                    toastTitle = v27.friendAdded, 
                    iconImage = v23, 
                    onDismissed = function() --[[ Line: 137 ]] --[[ Name: onDismissed ]]
                        -- upvalues: v32 (copy)
                        v32(false);
                    end
                }, 
                duration = 3, 
                show = true
            })
        }) else nil, 
        FriendsInviteFrame = if not (l_profileQRCodeFriendRequestAlertsEnabled_0 and #v35 > 0) or v31 then nil else v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 24), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 100
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 28), 
                PaddingLeft = UDim.new(0, 28)
            }), 
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            FriendsInvite = v4.createElement(v11, {
                notificationQueueSize = #v35, 
                onAccept = function(v45) --[[ Line: 168 ]] --[[ Name: onAccept ]]
                    -- upvalues: v39 (copy), v37 (copy), v36 (copy), v32 (copy), v28 (copy), v9 (ref), v35 (copy)
                    v39(v37, v45):andThen(function() --[[ Line: 169 ]]
                        -- upvalues: v36 (ref), v32 (ref)
                        v36({
                            type = "removeItemFromQueue", 
                            newUserId = "0"
                        });
                        v32(true);
                    end);
                    v28.fireEvent(v9.QRPageFriendRequestBannerAccepted, {
                        qrCodeBannerQueueSize = #v35
                    });
                end, 
                onClose = function() --[[ Line: 177 ]] --[[ Name: onClose ]]
                    -- upvalues: v36 (copy), v28 (copy), v9 (ref), v35 (copy)
                    v36({
                        type = "removeItemFromQueue", 
                        newUserId = "0"
                    });
                    v28.fireEvent(v9.QRPageFriendRequestBannerDismissed, {
                        qrCodeBannerQueueSize = #v35
                    });
                end, 
                userId = tostring(v35[1])
            })
        })
    });
end));