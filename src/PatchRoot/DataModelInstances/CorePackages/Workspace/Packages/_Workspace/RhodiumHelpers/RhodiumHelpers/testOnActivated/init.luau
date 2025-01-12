local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Rhodium);
local v3 = require(l_Parent_0.Roact);
local l_Element_0 = v2.Element;
local l_XPath_0 = v2.XPath;
local v6 = require(l_Parent_0.SharedFlags);
local l_mockStyle_0 = require(l_Parent_0.UnitTestHelpers).mockStyle;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v3 (copy), l_mockStyle_0 (copy), l_CoreGui_0 (copy), l_XPath_0 (copy), v6 (copy), l_Element_0 (copy)
    local v9 = false;
    local v10 = v3.createElement("ScreenGui", {}, {
        buttonElement = v3.createElement(v8, {
            onActivated = function() --[[ Line: 24 ]] --[[ Name: onActivated ]]
                -- upvalues: v9 (ref)
                v9 = true;
            end
        })
    });
    local v11 = l_mockStyle_0(v10);
    local v12 = v3.mount(v11, l_CoreGui_0, "TestRoot");
    local v13 = l_XPath_0.new(v6.GetFFlagUIBloxFoundationProvider() and "game.CoreGui.*.buttonElement" or "game.CoreGui.TestRoot.buttonElement");
    local v14 = l_Element_0.new(v13);
    assert(v14:getRbxInstance() ~= nil, "button was nil");
    v14:clickWithoutValidation();
    assert(v9 == true, "button was not activated");
    v3.unmount(v12);
end;