local l_TextService_0 = game:GetService("TextService");
local v1 = require(script.Parent.CleanRichTextTags);
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Logger);
local v4 = Vector2.new(2, 2);
return function(v5, v6, v7, v8, v9) --[[ Line: 13 ]] --[[ Name: getTextSize ]]
    -- upvalues: v1 (copy), l_TextService_0 (copy), v4 (copy), v3 (copy)
    if v9 then
        v5 = v1(v5);
    end;
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = Font.fromEnum(v7);
    l_GetTextBoundsParams_0.Size = v6;
    l_GetTextBoundsParams_0.Text = v5;
    l_GetTextBoundsParams_0.Width = v8.X;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 40 ]]
        -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_0 (copy)
        return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
    end);
    if l_status_0 then
        return Vector2.new(l_result_0.X, (math.min(l_result_0.Y, v8.Y))) + v4;
    else
        v3:warning("GetTextBoundsAsync call failed, falling back to frame size. Error: ", l_result_0);
        return v8;
    end;
end;