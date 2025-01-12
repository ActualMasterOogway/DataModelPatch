local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local _ = require(l_script_FirstAncestor_0.ImageSet.ImagesTypes);
local v5 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local v6 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local v7 = require(l_script_FirstAncestor_0.Indicator.StatWidget);
local _ = require(l_script_FirstAncestor_0.Style.Fonts);
local v9 = require(l_Parent_0.Core.Style.useStyle);
local v10 = require(l_Parent_0.Core.Text.GetTextSize);
local v11 = v6(v5.Large);
local function _(v12, v13, v14) --[[ Line: 30 ]] --[[ Name: getTextWidth ]]
    -- upvalues: v10 (copy)
    local l_BaseSize_0 = v14.Font.BaseSize;
    local v16 = v13.RelativeSize * l_BaseSize_0;
    local v17 = Vector2.new(10000, 10000);
    return v10(v12, v16, v13.Font, v17).X;
end;
local function _(v19, v20) --[[ Line: 37 ]] --[[ Name: getMeasuredSectionWidth ]]
    -- upvalues: v10 (copy), v11 (copy)
    local l_countText_0 = v19.countText;
    local l_Title_0 = v20.Font.Title;
    local l_BaseSize_1 = v20.Font.BaseSize;
    local v24 = l_Title_0.RelativeSize * l_BaseSize_1;
    local v25 = Vector2.new(10000, 10000);
    local l_X_0 = v10(l_countText_0, v24, l_Title_0.Font, v25).X;
    l_Title_0 = v19.labelText;
    l_BaseSize_1 = v20.Font.CaptionHeader;
    v24 = v20.Font.BaseSize;
    v25 = l_BaseSize_1.RelativeSize * v24;
    local v27 = Vector2.new(10000, 10000);
    return math.max(l_X_0, v10(l_Title_0, v25, l_BaseSize_1.Font, v27).X) + v11 + 12;
end;
return function(v29) --[[ Line: 43 ]] --[[ Name: PlayerCount ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v3 (copy), v7 (copy)
    local v30 = v9();
    local l_countLeft_0 = v29.countLeft;
    local l_countText_1 = l_countLeft_0.countText;
    local l_Title_1 = v30.Font.Title;
    local l_BaseSize_2 = v30.Font.BaseSize;
    local v35 = l_Title_1.RelativeSize * l_BaseSize_2;
    local v36 = Vector2.new(10000, 10000);
    local l_X_1 = v10(l_countText_1, v35, l_Title_1.Font, v36).X;
    l_Title_1 = l_countLeft_0.labelText;
    l_BaseSize_2 = v30.Font.CaptionHeader;
    v35 = v30.Font.BaseSize;
    v36 = l_BaseSize_2.RelativeSize * v35;
    local v38 = Vector2.new(10000, 10000);
    local v39 = math.max(l_X_1, v10(l_Title_1, v36, l_BaseSize_2.Font, v38).X) + v11 + 12;
    l_X_1 = v29.countRight;
    l_Title_1 = l_X_1.countText;
    l_BaseSize_2 = v30.Font.Title;
    v35 = v30.Font.BaseSize;
    v36 = l_BaseSize_2.RelativeSize * v35;
    v38 = Vector2.new(10000, 10000);
    l_countText_1 = v10(l_Title_1, v36, l_BaseSize_2.Font, v38).X;
    l_BaseSize_2 = l_X_1.labelText;
    v35 = v30.Font.CaptionHeader;
    v36 = v30.Font.BaseSize;
    v38 = v35.RelativeSize * v36;
    local v40 = Vector2.new(10000, 10000);
    l_X_1 = v39 / (v39 + (math.max(l_countText_1, v10(l_BaseSize_2, v38, v35.Font, v40).X) + v11 + 12));
    l_countText_1 = 1 - l_X_1;
    l_Title_1 = v29.countLeft;
    l_BaseSize_2 = v29.countRight;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v29.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        LeftSection = v3.createElement(v7, {
            countText = l_Title_1.countText, 
            labelText = l_Title_1.labelText, 
            icon = l_Title_1.icon, 
            layoutOrder = 1, 
            position = UDim2.new(0, 0, 0, 0), 
            anchorPoint = Vector2.new(0, 0), 
            size = UDim2.new(l_X_1, 0, 1, 0), 
            horizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        RightSection = v3.createElement(v7, {
            countText = l_BaseSize_2.countText, 
            labelText = l_BaseSize_2.labelText, 
            icon = l_BaseSize_2.icon, 
            layoutOrder = 2, 
            position = UDim2.new(1, 0, 0, 0), 
            anchorPoint = Vector2.new(1, 0), 
            size = UDim2.new(l_countText_1, 0, 1, 0), 
            horizontalAlignment = Enum.HorizontalAlignment.Right
        })
    });
end;