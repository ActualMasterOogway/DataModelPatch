local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_PolicyService_0 = require(l_RobloxGui_0.Modules.Common:WaitForChild("PolicyService"));
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_Cryo_0 = v3.Cryo;
local l_t_0 = v3.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local l_Parent_0 = script.Parent.Parent;
local v13 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v14 = require(l_Parent_0.Flags.FFlagAlwaysShowDisplayNameInExpMenu);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix;
local v17 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v19 = {
    AnchorPoint = Vector2.new(0, 1), 
    Position = UDim2.new(0, 24, 1, 1), 
    Size = UDim2.new(0, 56, 0, 56)
};
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v21 = l_Roact_0.PureComponent:extend("PlayerLabelV2");
v21.validateProps = l_t_0.strictInterface(l_validatePropsWithForwardRef_0({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    displayName = l_t_0.string, 
    isOnline = l_t_0.boolean, 
    isSelected = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer, 
    Visible = l_t_0.optional(l_t_0.boolean), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Ref] = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}));
v21.defaultProps = {
    Visible = true
};
if v13 then
    v21.init = function(v22) --[[ Line: 73 ]] --[[ Name: init ]]
        v22.onActivated = function() --[[ Line: 74 ]]
            -- upvalues: v22 (copy)
            v22.props.onActivated(v22.props.userId);
        end;
    end;
end;
v21.renderButtons = function(v23) --[[ Line: 80 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_Roact_0 (copy), l_Cryo_0 (copy)
    local v24 = v23.props[l_Roact_0.Children] or {};
    return (l_Cryo_0.Dictionary.join(v24, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v21.renderWithSelectionCursor = function(v25, v26) --[[ Line: 95 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_PolicyService_0 (copy), v14 (copy), l_withStyle_0 (copy), v13 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), l_Cryo_0 (copy), v19 (copy), v17 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_props_0 = v25.props;
    local v28 = l_PolicyService_0:IsSubjectToChinaPolicies() or v14;
    local v29 = l_props_0.displayName ~= "" and l_props_0.displayName or l_props_0.username;
    return l_withStyle_0(function(v30) --[[ Line: 106 ]]
        -- upvalues: v25 (copy), v13 (ref), l_Roact_0 (ref), l_props_0 (copy), v26 (copy), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), l_Cryo_0 (ref), v19 (ref), v17 (ref), v28 (copy), v29 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 (ref), l_OpenTypeSupport_0 (ref)
        local l_BackgroundContrast_0 = v30.Theme.BackgroundContrast;
        if v25.props.isSelected then
            l_BackgroundContrast_0 = v30.Theme.BackgroundOnHover;
        end;
        local l_onActivated_0 = v25.props.onActivated;
        if v13 then
            l_onActivated_0 = v25.props.onActivated and v25.onActivated or nil;
        end;
        local l_forwardRef_0 = v25.props.forwardRef;
        return l_Roact_0.createElement("TextButton", {
            BackgroundTransparency = l_BackgroundContrast_0.Transparency, 
            BackgroundColor3 = l_BackgroundContrast_0.Color, 
            BorderSizePixel = 0, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 71), 
            Visible = l_props_0.Visible, 
            Text = "", 
            AutoButtonColor = false, 
            [l_Roact_0.Event.Activated] = l_onActivated_0, 
            [l_Roact_0.Change.AbsolutePosition] = v25.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = l_forwardRef_0, 
            SelectionImageObject = v26(l_CursorKind_0.Square)
        }, {
            PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v19, {
                ImageColor3 = l_props_0.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115), 
                BackgroundTransparency = 1, 
                Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=60&h=60" or "", 
                ZIndex = 2
            })), 
            DisplayNameLabel = l_Roact_0.createElement(v17, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                Position = UDim2.new(0, 104, 0, v28 and 14 or 35.5), 
                AnchorPoint = v28 and Vector2.new(0, 0) or Vector2.new(0, 0.5), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = v28 and v29 or l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            UsernameLabel = v28 and l_Roact_0.createElement(v17, {
                fontKey = "Header2", 
                themeKey = "TextDefault", 
                Position = UDim2.new(0, 104, 0, 36), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = "@" .. l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() and l_GetFFlagLuaAppEnableOpenTypeIGMFix_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v25:renderButtons())
        });
    end);
end;
v21.render = function(v34) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v35) --[[ Line: 189 ]]
        -- upvalues: v34 (copy)
        return v34:renderWithSelectionCursor(v35);
    end);
end;
return l_Roact_0.forwardRef(function(v36, v37) --[[ Line: 194 ]]
    -- upvalues: l_Roact_0 (copy), v21 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v21, l_Cryo_0.Dictionary.join(v36, {
        forwardRef = v37
    }));
end);