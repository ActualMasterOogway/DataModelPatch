local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.createMockAppStorageService);
local v7 = require(l_script_FirstAncestor_0.TestHelpers.createMockRobloxEventReceiver);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v9 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v10 = v6();
return {
    default = function(v11) --[[ Line: 17 ]] --[[ Name: default ]]
        -- upvalues: v7 (copy), v4 (copy), v5 (copy), v9 (copy), v8 (copy), v2 (copy), v10 (copy), v3 (copy)
        local l_mockEventReceiver_0 = v7().mockEventReceiver;
        return v4.createElement(v5.StoreProvider, {
            store = v9(v8({
                LocalUserId = "156"
            }))
        }, {
            Wrapper = v4.createElement("Frame", {
                BackgroundTransparency = 0, 
                Size = UDim2.fromOffset(400, 500), 
                BorderSizePixel = 0
            }, {
                ProfileQRCodeTopElements = v4.createElement(v2, {
                    appStorageService = if v11.appStorageService then v11.appStorageService else v10, 
                    onClose = if v11.onClose then v11.onClose else v3.noop, 
                    openQrCodeScanner = if v11.openQrCodeScanner then v11.openQrCodeScanner else v3.noop, 
                    profileQRCodeFriendRequestAlertsEnabled = if v11.profileQRCodeFriendRequestAlertsEnabled then v11.profileQRCodeFriendRequestAlertsEnabled else nil, 
                    robloxEventReceiver = if v11.robloxEventReceiver then v11.robloxEventReceiver else l_mockEventReceiver_0
                })
            })
        });
    end
};