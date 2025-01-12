local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.AuthAnalytics);
local v5 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_TextButton_0 = require(l_Parent_0.UIBlox).App.Button.TextButton;
local l_authButtonClick_0 = v4.Events.authButtonClick;
local l_EventStreamConstants_0 = v4.EventStreamConstants;
local v11 = require(l_script_FirstAncestor_0.Context.LoginContext);
return function(v12) --[[ Line: 27 ]] --[[ Name: NeedHelpButton ]]
    -- upvalues: v5 (copy), v11 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_ContentProvider_0 (copy), l_TextButton_0 (copy)
    local v13 = v5.useContext(v11);
    local v14 = l_useDesignTokens_0();
    local v15 = l_useLocalization_0({
        needHelpButtonText = v12.textKey
    });
    local function v18() --[[ Line: 35 ]]
        -- upvalues: v12 (copy), v3 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_ContentProvider_0 (ref), v13 (copy)
        if v12.originPage then
            local v16 = v3.isNonEmptyString(v12.originPage, "props.originPage");
            l_authButtonClick_0(v16, l_EventStreamConstants_0.Button.NeedHelpLink, nil, nil);
        end;
        local v17 = l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username";
        v13.utils.openWebView(v17);
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v14.Global.Space_150), 
            PaddingBottom = UDim.new(0, v14.Global.Space_150)
        }), 
        Button = v5.createElement(l_TextButton_0, {
            text = v15.needHelpButtonText, 
            isDisabled = v12.isDisabled, 
            onActivated = v18, 
            verticalPadding = v14.Global.Space_200, 
            fontStyle = "CaptionHeader", 
            colorStyleDefault = "TextDefault", 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    });
end;