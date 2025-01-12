local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local function v9(v5) --[[ Line: 15 ]] --[[ Name: secondsToHHM ]]
    local v6 = math.floor(v5 / 3600);
    local v7 = math.floor(v5 % 3600 / 60);
    local v8 = v5 % 60;
    if v6 > 0 then
        return string.format("%i:%02i:%02i", v6, v7, v8);
    else
        return string.format("%i:%02i", v7, v8);
    end;
end;
return function(v10) --[[ Line: 27 ]] --[[ Name: ProgressCountdown ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), v9 (copy), l_StyledTextLabel_0 (copy)
    local v11 = l_useStyle_0();
    local v13 = v1.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v10 (copy), v9 (ref)
        local v12 = v10.timeLength - v10.timePosition;
        return "-" .. v9(v12);
    end, {
        v10.timeLength, 
        v10.timePosition
    });
    return v1.createElement(l_StyledTextLabel_0, {
        size = UDim2.fromOffset(v11.Tokens.Global.Space_400, 0), 
        automaticSize = Enum.AutomaticSize.Y, 
        text = v13, 
        fontStyle = v11.Font.CaptionBody, 
        colorStyle = v11.Theme.TextMuted, 
        lineHeight = 1, 
        layoutOrder = v10.LayoutOrder, 
        textXAlignment = Enum.TextXAlignment.Right
    });
end;