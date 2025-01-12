local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ProfileQRCodeEntryPoint);
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
    default = function(v12) --[[ Line: 17 ]] --[[ Name: default ]]
        -- upvalues: v4 (copy), v5 (copy), v10 (copy), v9 (copy), v2 (copy), v11 (copy), v3 (copy), v8 (copy)
        return v4.createElement(v5.StoreProvider, {
            store = v10(v9({
                LocalUserId = "156"
            }))
        }, {
            ProfileQRCodeEntryPoint = v4.createElement(v2, {
                appStorageService = v12.appStorageService or v11, 
                layoutOrder = 1, 
                analyticsService = if v12 and v12.analyticsService then v12.analyticsService else nil, 
                onClose = if v12 and v12.onClose then v12.onClose else v3.noop, 
                openQrCodeScanner = if v12 and v12.openQrCodeScanner then v12.openQrCodeScanner else v3.noop, 
                robloxEventReceiver = v8().mockEventReceiver
            })
        });
    end, 
    loading = function(v13) --[[ Line: 33 ]] --[[ Name: loading ]]
        -- upvalues: v4 (copy), v5 (copy), v10 (copy), v9 (copy), v6 (copy), v2 (copy), v11 (copy), v3 (copy), v8 (copy)
        return v4.createElement(v5.StoreProvider, {
            store = v10(v9({
                LocalUserId = "156", 
                [v6.RODUX_KEY] = {
                    Users = {}, 
                    NetworkStatus = {}
                }
            }))
        }, {
            ProfileQRCodeEntryPoint = v4.createElement(v2, {
                appStorageService = v13.appStorageService or v11, 
                layoutOrder = 1, 
                analyticsService = if v13 and v13.analyticsService then v13.analyticsService else nil, 
                onClose = if v13 and v13.onClose then v13.onClose else v3.noop, 
                openQrCodeScanner = if v13 and v13.openQrCodeScanner then v13.openQrCodeScanner else v3.noop, 
                robloxEventReceiver = v8().mockEventReceiver
            })
        });
    end
};