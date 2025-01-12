local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_createElement_0 = v1.createElement;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v12 = require(l_Parent_0.Actions.SetKeepOutArea);
local v13 = require(l_Parent_0.Constants);
noop = function() --[[ Line: 20 ]] --[[ Name: noop ]]

end;
return function(v14) --[[ Line: 28 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDispatch_0 (copy), v1 (copy), v11 (copy), v12 (copy), v13 (copy), l_createElement_0 (copy), l_Interactable_0 (copy), l_ControlState_0 (copy), l_AppFonts_0 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_useDispatch_0();
    local v17, v18 = v1.useState(false);
    local function v22(v19) --[[ Line: 33 ]]
        -- upvalues: v11 (ref), v16 (copy), v12 (ref), v13 (ref)
        if v11 and v19 then
            local v20 = Vector2.new(v19.AbsolutePosition.X - 2, v19.AbsolutePosition.Y - 2);
            local v21 = Vector2.new(v19.AbsoluteSize.X + 4, v19.AbsoluteSize.Y + 4);
            v16(v12(v13.BadgeOver13KeepOutAreaId, v20, v21));
        end;
    end;
    return l_createElement_0(l_Interactable_0, {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        isDisabled = false, 
        LayoutOrder = v14.layoutOrder, 
        onStateChanged = v1.useCallback(function(_, v24) --[[ Line: 49 ]]
            -- upvalues: v18 (copy), l_ControlState_0 (ref)
            local l_v18_0 = v18;
            local v26 = true;
            if v24 ~= l_ControlState_0.Hover then
                v26 = v24 == l_ControlState_0.Pressed;
            end;
            l_v18_0(v26);
        end), 
        [v1.Event.Activated] = v1.useCallback(function() --[[ Line: 52 ]]
            -- upvalues: v14 (copy)
            v14.setIsPopupVisible(not v14.isPopupVisible);
        end), 
        [v1.Change.AbsoluteSize] = v22, 
        [v1.Change.AbsolutePosition] = v22
    }, {
        constraint = l_createElement_0("UISizeConstraint", {
            MinSize = Vector2.new(32, 32)
        }), 
        text = l_createElement_0("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Text = "13+", 
            Font = l_AppFonts_0.default:getBold(), 
            TextSize = 12, 
            BackgroundColor3 = v15.Theme.TextEmphasis.Color, 
            BackgroundTransparency = v17 and 0.25 or v15.Theme.TextEmphasis.Transparency, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            padding = l_createElement_0("UIPadding", {
                PaddingTop = UDim.new(0, 3), 
                PaddingBottom = UDim.new(0, 3), 
                PaddingLeft = UDim.new(0, 6), 
                PaddingRight = UDim.new(0, 6)
            }), 
            shape = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            stroke = l_createElement_0("UIStroke", {
                Thickness = 2, 
                Color = v15.Theme.BackgroundMuted.Color, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            })
        })
    });
end;