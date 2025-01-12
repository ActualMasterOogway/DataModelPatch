local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Components.CoreUI.EntrypointButton);
local v6 = require(l_Parent_0.Components.Common.ToastContainer);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v8 = require(l_Parent_0.Hooks.useTopbarInsetHeight);
return function(_) --[[ Line: 16 ]]
    -- upvalues: v8 (copy), l_useSelector_0 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v10 = v8();
    local v12 = l_useSelector_0(function(v11) --[[ Line: 19 ]]
        -- upvalues: v4 (ref)
        return v11[v4.RoduxKey].Carousel.IsOpen;
    end);
    local v14 = l_useSelector_0(function(v13) --[[ Line: 23 ]]
        -- upvalues: v4 (ref)
        return v13[v4.RoduxKey].IsCapturesCoreGuiEnabled;
    end);
    return v2.createElement(v2.Fragment, {}, {
        EntrypointButtonFrame = if v14 then v2.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, -v10), 
            Size = UDim2.new(1, 0, 1, v10), 
            ZIndex = v4.ZIndex.Entrypoint
        }, {
            EntrypointButtonContainer = v2.createElement(v5)
        }) else nil, 
        ToastsFrame = if not v12 then v2.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v4.ZIndex.Toasts
        }, {
            ToastContainer = v2.createElement(v6)
        }) else nil
    });
end;