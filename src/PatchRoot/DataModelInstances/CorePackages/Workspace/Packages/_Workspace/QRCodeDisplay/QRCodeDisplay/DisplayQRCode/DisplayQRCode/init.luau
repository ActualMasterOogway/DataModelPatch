local l_script_FirstAncestor_0 = script:FindFirstAncestor("QRCodeDisplay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.Parent.DisplayQRCodeFromMatrix.DisplayQRCodeFromMatrix);
local _ = require(l_script_FirstAncestor_0.Common.ECLevels);
local v6 = require(script.Parent.useQRCode);
return function(v7) --[[ Line: 21 ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v8 = {
        qrCodeMatrix = v6(v7)
    };
    return v2.createElement(v4, v3.join(v7, v8));
end;