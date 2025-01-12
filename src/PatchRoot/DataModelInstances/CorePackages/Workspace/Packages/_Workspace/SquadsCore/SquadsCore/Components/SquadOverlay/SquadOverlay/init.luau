local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(script.Parent.SquadPrompt);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v2.Hooks.useTokens;
SquadOverlay = function() --[[ Line: 15 ]] --[[ Name: SquadOverlay ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_useSelector_0 (copy), v1 (copy)
    local v6 = l_useTokens_0();
    local v7, v8 = v3.useState(Vector2.new(0, 0));
    local v10 = l_useSelector_0(function(v9) --[[ Line: 19 ]]
        return v9.Squad.SquadPrompt.arguments;
    end);
    return v3.createElement("ScreenGui", {
        Enabled = true, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = 12, 
        [v3.Change.AbsoluteSize] = function(v11) --[[ Line: 28 ]]
            -- upvalues: v8 (copy)
            v8(v11.AbsoluteSize);
        end
    }, {
        Overlay = v3.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v6.Color.Extended.Black.Black_70.Color3, 
            BackgroundTransparency = v6.Color.Extended.Black.Black_70.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = ""
        }), 
        SquadPrompt = v3.createElement(v1, {
            onConfirm = v10.onConfirm, 
            promptType = v10.promptType, 
            screenSize = v7
        })
    });
end;
return SquadOverlay;