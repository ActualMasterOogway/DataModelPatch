local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ProfileQRCodePage);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local v7 = require(l_script_FirstAncestor_0.TestHelpers.createMockAppStorageService);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.createMockRobloxEventReceiver);
local v9 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v10 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v11 = v7();
return {
    default = function(v12) --[[ Line: 19 ]] --[[ Name: default ]]
        -- upvalues: v8 (copy), v4 (copy), v5 (copy), v10 (copy), v9 (copy), v2 (copy), v11 (copy), v3 (copy)
        local l_mockEventReceiver_0 = v8().mockEventReceiver;
        return v4.createElement(v5.StoreProvider, {
            store = v10(v9({
                LocalUserId = "156", 
                FormFactor = nil
            }))
        }, {
            AvatarBackground = v4.createElement("Frame", {
                Size = UDim2.new(0, 500, 0, 700), 
                BackgroundColor3 = Color3.new(1, 0, 1), 
                ZIndex = -2
            }, {
                AvatarImage = v4.createElement("Frame", {
                    Size = UDim2.new(0, 500, 0, 350), 
                    BackgroundColor3 = Color3.new(0, 1, 1), 
                    ZIndex = -1
                }), 
                ProfileQRCodePage = v4.createElement(v2, {
                    appStorageService = if v12.appStorageService then v12.appStorageService else v11, 
                    profileQRCodeFriendRequestAlertsEnabled = if v12.profileQRCodeFriendRequestAlertsEnabled then v12.profileQRCodeFriendRequestAlertsEnabled else nil, 
                    onClose = if v12 and v12.onClose then v12.onClose else v3.noop, 
                    openQrCodeScanner = if v12 and v12.openQrCodeScanner then v12.openQrCodeScanner else v3.noop, 
                    robloxEventReceiver = if v12.robloxEventReceiver then v12.robloxEventReceiver else l_mockEventReceiver_0
                })
            })
        });
    end, 
    longScreen = function(v14) --[[ Line: 54 ]] --[[ Name: longScreen ]]
        -- upvalues: v4 (copy), v5 (copy), v10 (copy), v9 (copy), v2 (copy), v3 (copy), v8 (copy)
        return v4.createElement(v5.StoreProvider, {
            store = v10(v9({
                LocalUserId = "156", 
                FormFactor = nil
            }))
        }, {
            AvatarBackground = v4.createElement("Frame", {
                Size = UDim2.new(0, 500, 0, 900), 
                BackgroundColor3 = Color3.new(1, 0, 1)
            }, {
                AvatarImage = v4.createElement("Frame", {
                    Size = UDim2.new(0, 500, 0, 450), 
                    BackgroundColor3 = Color3.new(0, 1, 1)
                }), 
                ProfileQRCodePage = v4.createElement(v2, {
                    profileQRCodeFriendRequestAlertsEnabled = true, 
                    onClose = if v14 and v14.onClose then v14.onClose else v3.noop, 
                    openQrCodeScanner = if v14 and v14.openQrCodeScanner then v14.openQrCodeScanner else v3.noop, 
                    robloxEventReceiver = v8().mockEventReceiver
                })
            })
        });
    end, 
    loading = function(v15) --[[ Line: 81 ]] --[[ Name: loading ]]
        -- upvalues: v4 (copy), v5 (copy), v10 (copy), v9 (copy), v6 (copy), v2 (copy), v3 (copy), v8 (copy)
        return v4.createElement(v5.StoreProvider, {
            store = v10(v9({
                LocalUserId = "156", 
                FormFactor = nil, 
                [v6.RODUX_KEY] = {
                    Users = {}, 
                    NetworkStatus = {}
                }
            }))
        }, {
            AvatarBackground = v4.createElement("Frame", {
                Size = UDim2.new(0, 500, 0, 900), 
                BackgroundColor3 = Color3.new(1, 0, 1)
            }, {
                ProfileQRCodePage = v4.createElement(v2, {
                    profileQRCodeFriendRequestAlertsEnabled = true, 
                    onClose = if v15 and v15.onClose then v15.onClose else v3.noop, 
                    openQrCodeScanner = if v15 and v15.openQrCodeScanner then v15.openQrCodeScanner else v3.noop, 
                    robloxEventReceiver = v8().mockEventReceiver
                })
            })
        });
    end
};