local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryTestHelpers").Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Rhodium);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.ReactRoblox);
local l_Element_0 = v3.Element;
local l_XPath_0 = v3.XPath;
return function(v8, v9, v10) --[[ Line: 13 ]] --[[ Name: mountInScreenGui ]]
    -- upvalues: v4 (copy), v5 (copy), l_CoreGui_0 (copy), l_XPath_0 (copy), l_Element_0 (copy)
    local v11 = v4.createElement("ScreenGui", v10 or {}, {
        Frame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, v8)
    });
    local v12 = nil;
    v5.act(function() --[[ Line: 24 ]]
        -- upvalues: v12 (ref), v4 (ref), v11 (copy), l_CoreGui_0 (ref), v9 (copy)
        v12 = v4.mount(v11, l_CoreGui_0, v9);
    end);
    local v13 = l_XPath_0.new((("game.CoreGui.%*"):format(v9)));
    l_Element_0.new(v13):waitForRbxInstance(1);
    return v12;
end;