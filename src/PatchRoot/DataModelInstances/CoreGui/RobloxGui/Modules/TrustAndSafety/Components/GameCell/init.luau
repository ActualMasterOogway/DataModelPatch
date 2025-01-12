local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Cell_0 = v2.App.Table.Cell;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v2.App.SelectionImage.withSelectionCursorProvider;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(v8.GameIcon);
local v10 = require(v8.ThemedTextLabel);
local v11 = require(v8.withLocalization);
local v12 = v1.PureComponent:extend("GameCell");
v12.validateProps = v3.strictInterface({
    gameId = v3.number, 
    layoutOrder = v3.optional(v3.union(v3.integer, v3.table)), 
    onActivated = v3.optional(v3.callback)
});
v12.renderWithSelectionCursor = function(v13, v14) --[[ Line: 28 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v11 (copy), v1 (copy), l_Cell_0 (copy), l_CursorKind_0 (copy), v9 (copy), v10 (copy)
    local l_props_0 = v13.props;
    return v11({
        labelText = "CoreScripts.InGameMenu.Report.ReportExperience"
    })(function(v16) --[[ Line: 32 ]]
        -- upvalues: v1 (ref), l_Cell_0 (ref), l_props_0 (copy), v14 (copy), l_CursorKind_0 (ref), v9 (ref), v10 (ref)
        return v1.createElement(l_Cell_0, {
            onActivated = l_props_0.onActivated, 
            SelectionImageObject = v14(l_CursorKind_0.Square), 
            layoutOrder = l_props_0.layoutOrder, 
            size = UDim2.new(1, 0, 0, 72), 
            head = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 72)
            }, {
                GameIcon = v1.createElement(v9, {
                    gameId = l_props_0.gameId, 
                    iconSize = 48, 
                    cornerRadius = UDim.new(0, 8), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                }), 
                Label = v1.createElement(v10, {
                    fontKey = "Header2", 
                    themeKey = "TextEmphasis", 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v16.labelText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Position = UDim2.new(0, 54, 0.5, 0)
                })
            }), 
            tail = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
v12.render = function(v17) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v18) --[[ Line: 72 ]]
        -- upvalues: v17 (copy)
        return v17:renderWithSelectionCursor(v18);
    end);
end;
return v12;