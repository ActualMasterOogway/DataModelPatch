local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v7 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v9 = require(l_script_FirstAncestor_0.Components.Cells.FlexIconWithTextCell);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v12 = {
    bodyText = "Placeholder body", 
    subTitleText = "Placeholder subtitle", 
    iconImage = nil, 
    cellHeight = 48, 
    onActivated = function() --[[ Line: 39 ]] --[[ Name: onActivated ]]

    end
};
return function(v13) --[[ Line: 44 ]] --[[ Name: CreateUnfilteredChatCell ]]
    -- upvalues: v3 (copy), v12 (copy), l_useStyle_0 (copy), v5 (copy), l_useTokens_0 (copy), v11 (copy), l_useEffectOnMount_0 (copy), v7 (copy), v4 (copy), v9 (copy)
    local v14 = v3.Dictionary.join(v12, v13);
    local v15 = l_useStyle_0();
    local v16 = v14.style or v15;
    local v17 = v5();
    local v18 = l_useTokens_0();
    local v19 = v11();
    l_useEffectOnMount_0(function() --[[ Line: 52 ]]
        -- upvalues: v17 (copy), v7 (ref), v14 (copy)
        if v17 then
            v17.fireAnalyticsEvent(v7.ChatDetailsCreateUnfilteredChatCellRendered, {
                conversationId = v14.conversationId
            });
        end;
    end);
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v14.layoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        CreateUnfilteredChatRow = v4.createElement(v9, {
            LayoutOrder = v14.layoutOrder, 
            onActivated = v14.onActivated, 
            primaryIcon = v14.iconImage, 
            showDivider = false, 
            Size = UDim2.new(1, 0, 0, v14.cellHeight), 
            style = v16, 
            Text = v14.bodyText, 
            SubTitleText = v14.subTitleText, 
            isDisabled = v14.isLoading, 
            BackgroundTransparency = if v19 then v18.Color.None.Transparency else nil
        })
    });
end;