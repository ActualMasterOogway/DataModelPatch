local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.TestHelpers.mockStore);
local v6 = require(l_script_FirstAncestor_0.TestHelpers.mockState);
local v7 = require(l_Parent_0.Dash);
local v8 = require(l_script_FirstAncestor_0.TestHelpers.DefaultTestUserId);
return {
    default = function(v9) --[[ Line: 12 ]] --[[ Name: default ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (copy), v7 (copy), v8 (copy)
        return v3.createElement(v4.StoreProvider, {
            store = v5(v6())
        }, {
            QRCodeFriendRequestNotificationElement = v3.createElement(v2, {
                notificationQueueSize = 1, 
                onClose = if v9.onClose then v9.onClose else v7.noop, 
                onAccept = if v9.onAccept then v9.onAccept else v7.noop, 
                userId = if v9.userId then v9.userId else v8
            })
        });
    end
};