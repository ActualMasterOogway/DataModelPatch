local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v6 = require(l_Parent_0.ArgCheck);
local v7 = require(l_script_FirstAncestor_0.Components.FitChildren);
local v8 = require(l_script_FirstAncestor_0.Components.FitTextLabel);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v10 = v2.PureComponent:extend("TitleAndParagraph");
local v11 = game:DefineFastFlag("AuthDisclaimerUseArgs", false);
v10.defaultProps = {
    layoutOrder = 0, 
    textXAlignment = Enum.TextXAlignment.Left, 
    paragraphTextKeys = {}, 
    paragraphTextArgs = {}
};
local function _(v12) --[[ Line: 28 ]]
    return "paragraphText" .. tostring(v12);
end;
local function _(v14, v15) --[[ Line: 32 ]]
    local v16 = {
        v14
    };
    for v17, v18 in pairs(v15) do
        v16[v17] = v18;
    end;
    return v16;
end;
v10.render = function(v20) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v11 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), l_FormFactor_0 (copy), v2 (copy), v8 (copy), v7 (copy)
    local l_formFactor_0 = v20.props.formFactor;
    local l_layoutOrder_0 = v20.props.layoutOrder;
    local l_titleTextKey_0 = v20.props.titleTextKey;
    local l_paragraphTextKeys_0 = v20.props.paragraphTextKeys;
    local l_paragraphTextArgs_0 = v20.props.paragraphTextArgs;
    local l_width_0 = v20.props.width;
    local l_textXAlignment_0 = v20.props.textXAlignment;
    v6.isType(l_paragraphTextKeys_0, "table", "TitleAndParagraph expects paragraphTextKeys to be a table.");
    if v11 then
        v6.isEqual(#l_paragraphTextKeys_0, #l_paragraphTextArgs_0, "paragraphTextKeys and paragraphTextArgs should have the same size");
    end;
    local v28 = UDim2.new(1, 0, 0, 0);
    if l_width_0 then
        v28 = UDim2.new(0, l_width_0, 0, 0);
    end;
    local v29 = {
        titleText = l_titleTextKey_0
    };
    for v30, v31 in ipairs(l_paragraphTextKeys_0) do
        if v11 then
            local v32 = "paragraphText" .. tostring(v30);
            local v33 = l_paragraphTextKeys_0[v30];
            local v34 = l_paragraphTextArgs_0[v30];
            local v35 = {
                v33
            };
            for v36, v37 in pairs(v34) do
                v35[v36] = v37;
            end;
            v29[v32] = v35;
        else
            v29["paragraphText" .. tostring(v30)] = v31;
        end;
    end;
    return l_withLocalization_0(v29)(function(v38) --[[ Line: 79 ]]
        -- upvalues: l_withStyle_0 (ref), l_formFactor_0 (copy), l_FormFactor_0 (ref), v2 (ref), v8 (ref), l_textXAlignment_0 (copy), v7 (ref), l_paragraphTextKeys_0 (copy), l_layoutOrder_0 (copy), v28 (ref)
        return l_withStyle_0(function(v39) --[[ Line: 80 ]]
            -- upvalues: l_formFactor_0 (ref), l_FormFactor_0 (ref), v2 (ref), v38 (copy), v8 (ref), l_textXAlignment_0 (ref), v7 (ref), l_paragraphTextKeys_0 (ref), l_layoutOrder_0 (ref), v28 (ref)
            local v40 = v39.Font.BaseSize * v39.Font.Title.RelativeSize;
            local l_Font_0 = v39.Font.Title.Font;
            local v42 = 12;
            local v43 = v39.Font.BaseSize * v39.Font.Body.RelativeSize;
            local l_Font_1 = v39.Font.Body.Font;
            if l_formFactor_0 == l_FormFactor_0.COMPACT then
                v40 = v39.Font.BaseSize * v39.Font.Title.RelativeMinSize;
                v42 = 5;
                v43 = v39.Font.BaseSize * v39.Font.Body.RelativeMinSize;
            end;
            local v45 = 0;
            local v46 = {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v42)
                }), 
                Title = v38.titleText and v2.createElement(v8, {
                    LayoutOrder = v45, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = l_textXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Text = v38.titleText, 
                    TextSize = v40, 
                    Font = l_Font_0, 
                    TextColor3 = v39.Theme.SystemPrimaryDefault.Color, 
                    TextTransparency = v39.Theme.SystemPrimaryDefault.Transparency, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v7.FitAxis.Height, 
                    TextWrapped = true
                })
            };
            for v47, _ in ipairs(l_paragraphTextKeys_0) do
                v45 = v45 + 1;
                local v49 = "paragraphText" .. tostring(v47);
                local v50 = v38[v49];
                v46[v49] = v2.createElement(v8, {
                    LayoutOrder = v45, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = l_textXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Text = v50, 
                    TextSize = v43, 
                    Font = l_Font_1, 
                    TextColor3 = v39.Theme.TextDefault.Color, 
                    TextTransparency = v39.Theme.TextDefault.Transparency, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v7.FitAxis.Height, 
                    TextWrapped = true
                });
            end;
            return v2.createElement(v7.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = v28, 
                fitAxis = v7.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, v46);
        end);
    end);
end;
return (v3.connect(function(v51, _) --[[ Line: 151 ]]
    return {
        formFactor = v51.FormFactor
    };
end)(v10));