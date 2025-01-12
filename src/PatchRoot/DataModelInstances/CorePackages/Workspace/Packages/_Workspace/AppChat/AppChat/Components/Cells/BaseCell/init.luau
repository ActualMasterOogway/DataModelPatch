local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_useState_0 = v3.useState;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v3.memo;
local l_useMemo_0 = v3.useMemo;
local v8 = require(l_Parent_0.UIBlox);
local l_ControlState_0 = v8.Core.Control.Enum.ControlState;
local v10 = l_memo_0(v8.Core.Control.Interactable);
local _ = require(l_script_FirstAncestor_0.types);
local l_FFlagUIBloxUseNewInteractable_0 = require(l_Parent_0.SharedFlags).UIBlox.FFlagUIBloxUseNewInteractable;
local v13 = {
    Size = UDim2.new(1, 0, 0, 48), 
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
    BackgroundTransparency = 0, 
    onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242), 
    onPressedBackgroundTransparency = 1, 
    LayoutOrder = 0, 
    isDisabled = false, 
    onActivated = function() --[[ Line: 51 ]] --[[ Name: onActivated ]]
        print("BaseCell onActivated");
    end, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227), 
    avatarCircleCellWidth = 60
};
return l_memo_0(function(v14) --[[ Line: 61 ]] --[[ Name: BaseCell ]]
    -- upvalues: v2 (copy), v13 (copy), l_useState_0 (copy), l_ControlState_0 (copy), v3 (copy), l_useMemo_0 (copy), l_dependencyArray_0 (copy), v10 (copy), l_FFlagUIBloxUseNewInteractable_0 (copy)
    local v15 = v2.Dictionary.join(v13, v14);
    local v16, v17 = l_useState_0(l_ControlState_0.Initialize);
    local v20 = v3.useCallback(function(_, v19) --[[ Line: 65 ]]
        -- upvalues: v17 (copy)
        v17(v19);
    end, {});
    local v21 = l_useMemo_0(function() --[[ Line: 69 ]]
        -- upvalues: v16 (copy), l_ControlState_0 (ref), v3 (ref), v15 (copy)
        if v16 == l_ControlState_0.Pressed then
            return (v3.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v15.onPressedBackgroundTransparency, 
                BackgroundColor3 = v15.onPressedBackground3, 
                BorderSizePixel = 0
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v16, v15.onPressedBackground3, v15.onPressedBackgroundTransparency));
    local v22 = l_useMemo_0(function() --[[ Line: 80 ]]
        -- upvalues: v15 (copy), v3 (ref)
        if v15.showDivider then
            return (v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v3.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                divider = v3.createElement("Frame", {
                    BackgroundTransparency = v15.dividerTransparency, 
                    BackgroundColor3 = v15.dividerColor3, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -v15.avatarCircleCellWidth, 0, 1)
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v15.showDivider, v15.dividerTransparency, v15.dividerColor3, v15.avatarCircleCellWidth));
    local v23 = l_useMemo_0(function() --[[ Line: 103 ]]
        -- upvalues: v2 (ref), v15 (copy), v21 (copy), v22 (copy)
        return v2.Dictionary.join(v15.children or {}, {
            overlay = v21, 
            divider = v22
        });
    end, l_dependencyArray_0(v15.children, v21, v22));
    return v3.createElement(v10, {
        onStateChanged = if l_FFlagUIBloxUseNewInteractable_0 then v20 else function(_, v25) --[[ Line: 113 ]]
            -- upvalues: v17 (copy)
            v17(v25);
        end, 
        isDisabled = v15.isDisabled, 
        [v3.Event.Activated] = v15.onActivated, 
        AutoButtonColor = false, 
        Size = v15.Size, 
        AutomaticSize = v15.AutomaticSize, 
        BackgroundColor3 = v15.BackgroundColor3, 
        BackgroundTransparency = v15.BackgroundTransparency, 
        LayoutOrder = v15.LayoutOrder, 
        BorderSizePixel = 0
    }, v23);
end);