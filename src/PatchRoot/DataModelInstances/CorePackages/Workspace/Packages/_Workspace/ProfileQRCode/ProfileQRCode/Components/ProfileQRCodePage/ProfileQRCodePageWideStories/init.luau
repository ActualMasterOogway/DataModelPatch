local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ProfileQRCodePage);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v7 = require(l_Parent_0.Dash);
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.TestHelpers.createMockRobloxEventReceiver);
local v10 = require(l_Parent_0.Dev.FormFactor);
return {
    default = function(v11) --[[ Line: 14 ]] --[[ Name: default ]]
        -- upvalues: v9 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v10 (copy), v2 (copy), v7 (copy)
        local l_mockEventReceiver_0 = v9().mockEventReceiver;
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156", 
                FormFactor = v10.Enums.FormFactor.WIDE
            }))
        }, {
            AvatarBackground = v3.createElement("Frame", {
                Size = UDim2.new(0, 1200, 0, 800), 
                BackgroundColor3 = Color3.new(1, 0, 1)
            }, {
                ProfileQRCodePage = v3.createElement(v2, {
                    profileQRCodeFriendRequestAlertsEnabled = if v11.profileQRCodeFriendRequestAlertsEnabled then v11.profileQRCodeFriendRequestAlertsEnabled else nil, 
                    onClose = if v11 and v11.onClose then v11.onClose else v7.noop, 
                    openQrCodeScanner = if v11 and v11.openQrCodeScanner then v11.openQrCodeScanner else v7.noop, 
                    robloxEventReceiver = if v11.robloxEventReceiver then v11.robloxEventReceiver else l_mockEventReceiver_0
                })
            })
        });
    end, 
    loading = function(v13) --[[ Line: 41 ]] --[[ Name: loading ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v10 (copy), v8 (copy), v2 (copy), v7 (copy), v9 (copy)
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6({
                LocalUserId = "156", 
                FormFactor = v10.Enums.FormFactor.WIDE, 
                [v8.RODUX_KEY] = {
                    Users = {}, 
                    NetworkStatus = {}
                }
            }))
        }, {
            AvatarBackground = v3.createElement("Frame", {
                Size = UDim2.new(0, 1200, 0, 800), 
                BackgroundColor3 = Color3.new(1, 0, 1)
            }, {
                ProfileQRCodePage = v3.createElement(v2, {
                    profileQRCodeFriendRequestAlertsEnabled = true, 
                    onClose = if v13 and v13.onClose then v13.onClose else v7.noop, 
                    openQrCodeScanner = if v13 and v13.openQrCodeScanner then v13.openQrCodeScanner else v7.noop, 
                    robloxEventReceiver = v9().mockEventReceiver
                })
            })
        });
    end
};