local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.ProfileQRCodeTopBar);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dash);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.createMockAppStorageService);
local v7 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v9 = v6();
return {
    default = function(v10) --[[ Line: 16 ]] --[[ Name: default ]]
        -- upvalues: v3 (copy), v5 (copy), v7 (copy), v8 (copy), v2 (copy), v9 (copy), v4 (copy)
        return v3.createElement(v5.StoreProvider, {
            store = v7(v8())
        }, {
            ProfileQRCodeTopBar = v3.createElement(v2, {
                appStorageService = if v10.appStorageService then v10.appStorageService else v9, 
                layoutOrder = 1, 
                onClose = if v10.onClose then v10.onClose else v4.noop, 
                openQrCodeScanner = if v10.openQrCodeScanner then v10.openQrCodeScanner else v4.noop
            })
        });
    end
};