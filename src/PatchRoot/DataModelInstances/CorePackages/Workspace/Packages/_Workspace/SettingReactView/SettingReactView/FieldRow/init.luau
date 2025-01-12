local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.SettingsService);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_0.Field);
local v6 = require(l_Parent_1.ReactUtils);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_createNextOrder_0 = v6.createNextOrder;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_ControlState_0 = v3.Enums.ControlState;
return function(v12) --[[ Line: 23 ]]
    -- upvalues: l_useTokens_0 (copy), l_createNextOrder_0 (copy), v4 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_Text_0 (copy), v5 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_createNextOrder_0();
    local v15 = UDim2.fromScale(0.6, 1);
    local v16 = UDim2.fromScale(0.4, 1);
    local v17 = {
        Color3 = v13.Color.Extended.Gray.Gray_1000.Color3, 
        Transparency = 0.3
    };
    local v18 = {
        Color3 = v17.Color3, 
        Transparency = 1
    };
    local v19, v20 = v4.useBinding(v18);
    local function v22(v21) --[[ Line: 33 ]]
        -- upvalues: v20 (copy), l_ControlState_0 (ref), v17 (copy), v18 (copy)
        v20(if v21 == l_ControlState_0.Hover then v17 else v18);
    end;
    local v23, v24 = v4.useBinding(v12.visibility:get());
    v12.visibility:connect(v24);
    return v4.createElement(l_View_0, {
        tag = "auto-y row size-full-1300 radius-medium", 
        backgroundStyle = v19, 
        onStateChanged = v22, 
        Visible = v23, 
        LayoutOrder = v12.layoutOrder
    }, {
        LabelContainer = v4.createElement(l_View_0, {
            tag = "auto-y gui-object-defaults col padding-y-small padding-left-small", 
            Size = v16, 
            LayoutOrder = v14()
        }, {
            Label = v4.createElement(l_Text_0, {
                LayoutOrder = v14(), 
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap text-label-large", 
                textStyle = v13.Color.Extended.White.White_100, 
                Text = v12.label
            }), 
            Description = if v12.description then v4.createElement(l_Text_0, {
                LayoutOrder = v14(), 
                tag = "auto-y size-full-0 text-align-x-left text-wrap text-caption-medium padding-top-xsmall", 
                textStyle = v13.Color.Extended.White.White_80, 
                Text = v12.description
            }) else nil
        }), 
        FieldContainer = v4.createElement(l_View_0, {
            Size = v15, 
            LayoutOrder = v14()
        }, v4.createElement(l_View_0, {
            tag = "auto-xy anchor-center-right position-center-right padding-x-xlarge"
        }, v4.createElement(v5, v12)))
    });
end;