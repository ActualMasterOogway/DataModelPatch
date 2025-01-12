local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v7 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
return function(v8) --[[ Line: 20 ]] --[[ Name: ModalBasedSelector ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Images_0 (copy), v7 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v8.selectorHeight), 
        BackgroundTransparency = 1
    }, {
        ControlButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.new(1, 0, 1, 0), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            text = v8.selectedValue or v8.placeholderText, 
            inputIcon = l_Images_0["icons/actions/truncationExpand"], 
            onActivated = function() --[[ Line: 32 ]] --[[ Name: onActivated ]]
                -- upvalues: v7 (ref), v8 (copy)
                v7.mountModalSelector(v8.viewportHeight, v8.viewportWidth, v8.selections, v8.onSelect, function() --[[ Line: 38 ]]
                    -- upvalues: v7 (ref)
                    v7.unmountModalSelector();
                end);
            end
        })
    });
end;