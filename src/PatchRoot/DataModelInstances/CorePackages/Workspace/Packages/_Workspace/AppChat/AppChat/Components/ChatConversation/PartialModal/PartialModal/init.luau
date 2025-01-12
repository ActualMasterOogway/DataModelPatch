local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Enum_0 = v6.App.Button.Enum;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local v11 = {
    titleText = "", 
    bodyText = "", 
    isButtonDisabled = false, 
    screenSize = Vector2.new(1000, 1000), 
    onActivated = function() --[[ Line: 34 ]] --[[ Name: onActivated ]]

    end, 
    onDismissed = function() --[[ Line: 35 ]] --[[ Name: onDismissed ]]

    end
};
return l_memo_0(function(v12) --[[ Line: 38 ]] --[[ Name: PartialModal ]]
    -- upvalues: v3 (copy), v11 (copy), l_useStyle_0 (copy), v4 (copy), l_PartialPageModal_0 (copy), l_Enum_0 (copy), l_StyledTextLabel_0 (copy)
    local v13 = v3.Dictionary.union(v11, v12);
    local v14 = l_useStyle_0();
    local v15 = v13.style or v14;
    local l_Space_300_0 = v15.Tokens.Global.Space_300;
    local l_LineHeight_400_0 = v15.Tokens.Global.LineHeight_400;
    return v4.createElement(l_PartialPageModal_0, {
        title = v13.titleText, 
        buttonStackProps = if v13.actionText then {
            buttons = {
                {
                    buttonType = l_Enum_0.ButtonType.PrimarySystem, 
                    props = {
                        onActivated = v13.onActivated, 
                        text = v13.actionText, 
                        isDisabled = v13.isButtonDisabled
                    }
                }
            }
        } else nil, 
        screenSize = v13.screenSize, 
        onCloseClicked = v13.onDismissed
    }, {
        Body = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ContentPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Space_300_0 / 2), 
                PaddingBottom = if v13.actionText then UDim.new(0, l_Space_300_0) else nil
            }), 
            Body = v4.createElement(l_StyledTextLabel_0, {
                text = v13.bodyText, 
                textXAlignment = Enum.TextXAlignment.Left, 
                fontStyle = v15.Font.Body, 
                lineHeight = l_LineHeight_400_0, 
                colorStyle = v15.Theme.TextDefault, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fluidSizing = false
            })
        })
    });
end);