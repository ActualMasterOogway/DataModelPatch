local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_1.UIBloxConfig);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.Button.Button);
local v6 = require(l_Parent_0.Button.Enum.ButtonType);
local v7 = require(l_Parent_0.Button.ComboButton);
local v8 = require(l_Parent_0.ImageSet.Images);
local function v9() --[[ Line: 24 ]]

end;
return function(v10) --[[ Line: 50 ]] --[[ Name: ExperienceActionRow ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v7 (copy), v9 (copy), v5 (copy), v6 (copy)
    local l_isActionable_0 = v10.isActionable;
    local v12 = v10.horizontalPadding or 6;
    local v13 = v10.verticalPadding or 6;
    local v14 = v10.height or 48;
    local l_text_0 = v10.text;
    local v16 = v10.icon or v3.disableExperienceActionRowDefaultIcon or if l_isActionable_0 then v8["icons/common/play"] else v8["icons/status/unavailable"];
    if v3.enableComboButtonInExperienceActionRow and v10.onOverflowPressed then
        return v4.createElement(v7, {
            position = UDim2.new(0, v12, 1, -v13 - 36), 
            size = UDim2.new(1, -2 * v12, 0, v14 - 2 * v13), 
            button = {
                text = l_text_0, 
                icon = v16, 
                onActivated = v10.onPlayPressed or v9, 
                isDisabled = not l_isActionable_0
            }, 
            overflow = {
                icon = v8["icons/actions/truncationCollapse"], 
                onActivated = v10.onOverflowPressed, 
                isDisabled = not l_isActionable_0
            }
        });
    else
        return v4.createElement(v5, {
            buttonType = if v10.buttonType then v10.buttonType else v6.PrimaryContextual, 
            text = l_text_0, 
            icon = v16, 
            size = UDim2.new(1, -2 * v12, 0, v14 - 2 * v13), 
            position = UDim2.new(0, v12, 1, -v13 - 36), 
            userInteractionEnabled = l_isActionable_0, 
            onActivated = v10.onPlayPressed or v9, 
            isDisabled = not l_isActionable_0, 
            feedbackType = v10.feedbackType
        });
    end;
end;