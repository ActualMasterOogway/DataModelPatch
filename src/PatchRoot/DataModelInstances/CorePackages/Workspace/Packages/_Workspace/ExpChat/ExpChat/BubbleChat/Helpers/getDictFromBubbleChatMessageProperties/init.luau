local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v3 = require(l_Flags_0.getFFlagReplicateUIPaddingChildProperties);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v5 = {};
    for v6, _ in pairs(v1.DefaultBubbleChatMessagePropertiesInstanceSettings) do
        v5[v6] = v4[v6];
    end;
    local l_ImageLabel_0 = v4:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_0 then
        local v9 = {};
        for v10, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.ImageLabel) do
            v9[v10] = l_ImageLabel_0[v10];
        end;
        v5.ImageLabel = v9;
    end;
    local l_UIGradient_0 = v4:FindFirstChildOfClass("UIGradient");
    if l_UIGradient_0 then
        local v13 = {};
        for v14, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UIGradient) do
            v13[v14] = l_UIGradient_0[v14];
        end;
        v5.UIGradient = v13;
    end;
    local l_UICorner_0 = v4:FindFirstChildOfClass("UICorner");
    if l_UICorner_0 then
        local v17 = {};
        for v18, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UICorner) do
            v17[v18] = l_UICorner_0[v18];
        end;
        v5.UICorner = v17;
    end;
    if v3() then
        local l_UIPadding_0 = v4:FindFirstChildOfClass("UIPadding");
        if l_UIPadding_0 then
            local v21 = {};
            for v22, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UIPadding) do
                v21[v22] = l_UIPadding_0[v22];
            end;
            v5.UIPadding = v21;
        end;
    end;
    return v5;
end;