local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
local v2 = require(l_script_FirstAncestor_0.memoize);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v4 = require(l_Flags_0.getFFlagEnableGradientForChatWindowMessage);
local function _(v5) --[[ Line: 8 ]]
    local v6 = true;
    if v5 ~= nil then
        v6 = v5 == "";
    end;
    return v6;
end;
return (v2(function(v8, v9) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v10 = {
        text = v8.text or "", 
        prefixText = v8.prefixText or "", 
        translation = v8.translation or "", 
        useTranslation = v8.useTranslation, 
        bodyTextProperties = {}, 
        prefixTextProperties = {}
    };
    if v9 then
        for v11, _ in pairs(v1.DefaultChatWindowMessagePropertiesInstanceSettings) do
            v10.bodyTextProperties[v11] = v9[v11];
            v10.prefixTextProperties[v11] = v9[v11];
        end;
    end;
    if v4() and v8.chatWindowMessageProperties then
        local l_chatWindowMessageProperties_0 = v8.chatWindowMessageProperties;
        local l_Text_0 = l_chatWindowMessageProperties_0.Text;
        local v15 = true;
        if l_Text_0 ~= nil then
            v15 = l_Text_0 == "";
        end;
        v10.text = if v15 then v10.text else l_chatWindowMessageProperties_0.Text;
        l_Text_0 = l_chatWindowMessageProperties_0.PrefixText;
        v15 = true;
        if l_Text_0 ~= nil then
            v15 = l_Text_0 == "";
        end;
        v10.prefixText = if v15 then v10.prefixText else l_chatWindowMessageProperties_0.PrefixText;
        l_Text_0 = l_chatWindowMessageProperties_0.Translation;
        v15 = true;
        if l_Text_0 ~= nil then
            v15 = l_Text_0 == "";
        end;
        v10.translation = if v15 then v10.translation else l_chatWindowMessageProperties_0.Translation;
        for v16, _ in pairs(v1.DefaultChatWindowMessagePropertiesInstanceSettings) do
            v10.bodyTextProperties[v16] = l_chatWindowMessageProperties_0[v16];
            v10.prefixTextProperties[v16] = l_chatWindowMessageProperties_0[v16];
        end;
        if l_chatWindowMessageProperties_0.PrefixTextProperties then
            local l_PrefixTextProperties_0 = l_chatWindowMessageProperties_0.PrefixTextProperties;
            local l_PrefixText_0 = l_PrefixTextProperties_0.PrefixText;
            l_Text_0 = true;
            if l_PrefixText_0 ~= nil then
                l_Text_0 = l_PrefixText_0 == "";
            end;
            v10.prefixText = if l_Text_0 then v10.prefixText else l_PrefixTextProperties_0.PrefixText;
            for v20, _ in pairs(v1.DefaultChatWindowMessagePropertiesInstanceSettings) do
                v10.prefixTextProperties[v20] = l_PrefixTextProperties_0[v20];
            end;
            v15 = l_PrefixTextProperties_0:FindFirstChildOfClass("UIGradient");
            if v15 then
                l_Text_0 = {};
                for v22, _ in pairs(v1.DefaultChatWindowChildrenCustomizationProperties.UIGradient) do
                    l_Text_0[v22] = v15[v22];
                end;
                v10.prefixTextProperties.UIGradient = l_Text_0;
            end;
        end;
    end;
    return v10;
end));