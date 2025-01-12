local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_TextInput_0 = require(l_Parent_0.Foundation).TextInput;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_Parent_0.AuthCommon);
local l_InputValidity_0 = v12.Enums.InputValidity;
local l_IssueCondition_0 = v12.Enums.IssueCondition;
local l_UIConstants_0 = v12.Common.UIConstants;
local v16 = require(l_script_FirstAncestor_0.Util.debounce);
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableMultiPageSignupV2Updates;
return function(v18) --[[ Line: 55 ]] --[[ Name: AuthTextInputValidator ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), v2 (copy), l_InputValidity_0 (copy), v16 (copy), l_IssueCondition_0 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), l_UIConstants_0 (copy), l_useLocalization_0 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy)
    local v19 = l_useDesignTokens_0();
    local v20 = l_useDispatch_0();
    local v21 = l_useRoactService_0(l_RoactNetworking_0);
    local v22 = l_useStyle_0();
    local v23, v24 = v2.useState("");
    local v25, v26 = v2.useState("");
    local v27, v28 = v2.useState(v18.validator.getDefaultIssues());
    local v29, v30 = v2.useState(true);
    local v31, v32 = v2.useState(l_InputValidity_0.Unvalidated);
    local v33, v34 = v2.useState(nil);
    local v35, v36 = v2.useState(false);
    local v38 = v2.useCallback(v16(function(v37) --[[ Line: 73 ]]
        -- upvalues: v26 (copy)
        v26(v37);
    end, v18.debounceTime or 0.5), {
        v26
    });
    v2.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v25 (copy), v23 (copy), v38 (copy)
        if v25 ~= v23 then
            v38(v23);
        end;
    end, {
        v23
    });
    v2.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v25 (copy), v32 (copy), l_InputValidity_0 (ref), v28 (copy), v18 (copy), v20 (copy), v21 (copy), v27 (copy), v23 (copy), v24 (copy)
        if #v25 == 0 then
            v32(l_InputValidity_0.Unvalidated);
            v28(v18.validator.getDefaultIssues());
            return;
        else
            v20(v18.validator.validateFunction(v21, v25, v27, v18.validatorAdditionalProps)):andThen(function(v39) --[[ Line: 94 ]]
                -- upvalues: l_InputValidity_0 (ref), v23 (ref), v18 (ref), v28 (ref), v32 (ref), v24 (ref)
                local v40 = if v39.InputValid then l_InputValidity_0.Valid else l_InputValidity_0.Invalid;
                if v23 == v39.Input and v18.onTextChanged then
                    v18.onTextChanged(v39.Input, v40);
                end;
                v28(v39.IssueCondition);
                v32(v40);
                v24(v39.Input);
            end);
            return;
        end;
    end, {
        v25
    });
    v2.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v31 (copy), l_InputValidity_0 (ref), v34 (copy), v18 (copy), v27 (copy), l_IssueCondition_0 (ref)
        if v31 ~= l_InputValidity_0.Invalid then
            v34(nil);
            return;
        else
            local v41 = nil;
            if v18.validatorIssuePriorityList then
                for _, v43 in ipairs(v18.validatorIssuePriorityList) do
                    if v27[v43] == l_IssueCondition_0.Problematic then
                        v41 = v43;
                        break;
                    end;
                end;
            else
                for v44, v45 in pairs(v27) do
                    if v45 == l_IssueCondition_0.Problematic then
                        v41 = v44;
                        break;
                    end;
                end;
            end;
            if v41 == nil then
                v34(nil);
                return;
            else
                if v18.onErrorShown then
                    v18.onErrorShown(v41);
                end;
                if v18.validatorIssueMessageList then
                    v34(v18.validatorIssueMessageList[v41]);
                    return;
                else
                    v34(v18.validator.getIssueMessageList()[v41]);
                    return;
                end;
            end;
        end;
    end, {
        v31
    });
    v2.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v35 (copy), v18 (copy), v36 (copy)
        if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v35 then
            local l_textBoxRef_0 = v18.textBoxRef;
            if l_textBoxRef_0.current and l_textBoxRef_0.current.focus then
                l_textBoxRef_0.current.focus();
            end;
            v36(false);
        end;
    end, {
        v35
    });
    local function v48(v47) --[[ Line: 162 ]]
        -- upvalues: v18 (copy), l_InputValidity_0 (ref), v32 (copy), v24 (copy)
        v18.onTextChanged(v47, l_InputValidity_0.Unvalidated);
        v32(l_InputValidity_0.Unvalidated);
        v24(v47);
    end;
    local function _() --[[ Line: 168 ]] --[[ Name: getTextInputType ]]
        -- upvalues: v18 (copy), v29 (copy)
        if v18.textInputType == Enum.TextInputType.Password then
            if v29 then
                return Enum.TextInputType.Password;
            else
                return Enum.TextInputType.PasswordShown;
            end;
        else
            return v18.textInputType;
        end;
    end;
    local function v50() --[[ Line: 178 ]] --[[ Name: getShowPasswordIconButton ]]
        -- upvalues: v18 (copy), v29 (copy), l_UIConstants_0 (ref), v30 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v36 (copy)
        if v18.textInputType == Enum.TextInputType.Password then
            if v29 then
                return l_UIConstants_0.HIDE_PASSWORD_ICON, function() --[[ Line: 182 ]]
                    -- upvalues: v30 (ref), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v36 (ref)
                    v30(false);
                    if l_GetFFlagEnableMultiPageSignupV2Updates_0() then
                        v36(true);
                    end;
                end;
            else
                return l_UIConstants_0.SHOW_PASSWORD_ICON, function() --[[ Line: 190 ]]
                    -- upvalues: v30 (ref), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v36 (ref)
                    v30(true);
                    if l_GetFFlagEnableMultiPageSignupV2Updates_0() then
                        v36(true);
                    end;
                end;
            end;
        else
            return nil, nil;
        end;
    end;
    local v51 = l_useLocalization_0({
        errorText = v33
    });
    local v52, v53 = v50();
    local v54 = if v31 == l_InputValidity_0.Invalid then v2.createElement(l_StyledTextLabel_0, {
        text = v51.errorText or "", 
        fontStyle = v22.Font.BodySmall, 
        colorStyle = v22.Theme.Alert, 
        automaticSize = Enum.AutomaticSize.XY, 
        textWrapped = true
    }) else nil;
    local l_createElement_0 = v2.createElement;
    local v56 = "Frame";
    local v57 = {
        LayoutOrder = v18.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    };
    local v58 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v19.Global.Space_50), 
            HorizontalFlex = Enum.UIFlexAlignment.Fill
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_l_TextInput_0_0 = l_TextInput_0;
    local v61 = {
        LayoutOrder = 1, 
        textInputType = if v18.textInputType == Enum.TextInputType.Password then if v29 then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown else v18.textInputType, 
        width = UDim.new(1, 0), 
        text = v18.initialText or "", 
        placeholder = v18.placeholder, 
        onChanged = v48, 
        iconTrailing = if v52 then {
            name = v52, 
            onActivated = v53
        } else nil, 
        label = ""
    };
    local v62 = false;
    if v31 == l_InputValidity_0.Invalid then
        v62 = #v23 > 0;
    end;
    v61.hasError = v62;
    v61.textBoxRef = v18.textBoxRef;
    v58.TextInputBox = l_createElement_1(l_l_TextInput_0_0, v61);
    v58.IssueWrapper = v2.createElement("Frame", {
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0, v19.Global.Space_200), 
        BackgroundTransparency = 1
    }, {
        Issue = v54
    });
    return l_createElement_0(v56, v57, v58);
end;