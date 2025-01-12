local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.FullPageNavigationHeader);
local v4 = require(l_script_FirstAncestor_0.Components.FullPageNavigationFooter);
local _ = require(l_script_FirstAncestor_0.Components.ActivationFrameworkTokenMapper);
local _ = require(l_script_FirstAncestor_0.Types);
local v7 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v8 = require(l_script_FirstAncestor_0.Enums.ActivationFrameworkContextAction);
local v9 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local v10 = require(l_script_FirstAncestor_0.Thunks.UpdateActivationWorkflow);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v12 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v12.EventStreamConstants;
local l_authButtonClick_0 = v12.Events.authButtonClick;
local l_authPageload_0 = v12.Events.authPageload;
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
local v17 = game:DefineFastFlag("UseHookVersionUpdateActivationWorkflowAndNavigate2", false);
local v18 = require(l_script_FirstAncestor_0.Hooks.useUpdateActivationWorkflowAndNavigate);
local v19 = require(l_script_FirstAncestor_0.Enums.UserActivationSignupPageState);
return function(v20) --[[ Line: 53 ]] --[[ Name: ActivationFrameworkWrapper ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDesignTokens_0 (copy), l_authPageload_0 (copy), v17 (copy), v18 (copy), v10 (copy), v19 (copy), v8 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), v9 (copy), v3 (copy), v4 (copy)
    local v21 = v2.useContext(v7);
    local l_activationFrameworkState_0 = v21.activationFrameworkState;
    local l_dispatch_0 = v21.dispatch;
    local v24, v25 = v2.useState(0);
    local v26, v27 = v2.useState(0);
    local v28, v29 = v2.useState(0);
    local v30, v31 = v2.useState(0);
    local v32, v33 = v2.useState(0);
    local v34, v35 = v2.useState(0);
    local v36, v37 = v2.useState(0);
    local v38, v39 = v2.useState(0);
    local l_ActivationFramework_0 = l_useDesignTokens_0().LuaApps.ActivationFramework;
    local v41 = not v20.shouldExpandMiddleContent;
    v2.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: l_authPageload_0 (ref), v20 (copy), l_activationFrameworkState_0 (copy)
        l_authPageload_0(v20.namespace, l_activationFrameworkState_0.currentState);
    end, {});
    local v42 = nil;
    v42 = if v17 then v18(v20.navigation) else v2.useCallback(function(v43) --[[ Line: 83 ]]
        -- upvalues: v10 (ref), v20 (copy), l_activationFrameworkState_0 (copy), v19 (ref), l_dispatch_0 (copy), v8 (ref)
        local v44 = v10(v20.namespace, l_activationFrameworkState_0.currentState, l_activationFrameworkState_0.payloadTable, v43, l_activationFrameworkState_0.history);
        if v44 == nil then
            l_activationFrameworkState_0.onClose();
            return;
        elseif v44.state == v19.Complete then
            l_activationFrameworkState_0.onWorkflowComplete(l_activationFrameworkState_0.payloadTable);
            return;
        else
            l_dispatch_0({
                type = v8.SetActivationFrameworkState, 
                data = {
                    currentState = v44.state, 
                    availableActions = v44.availableActions, 
                    history = v44.history
                }
            });
            v20.navigation.navigate(v44.state);
            return;
        end;
    end, {
        l_activationFrameworkState_0.currentState, 
        v20.namespace, 
        l_activationFrameworkState_0.payloadTable, 
        l_dispatch_0, 
        v20.navigation
    });
    local function v45() --[[ Line: 119 ]]
        -- upvalues: l_authButtonClick_0 (ref), v20 (copy), l_EventStreamConstants_0 (ref), l_activationFrameworkState_0 (copy), v42 (ref), v9 (ref)
        l_authButtonClick_0(v20.namespace, l_EventStreamConstants_0.Button.Back, l_activationFrameworkState_0.currentState);
        v42(v9.Back);
    end;
    local function v46() --[[ Line: 124 ]]
        -- upvalues: l_authButtonClick_0 (ref), v20 (copy), l_EventStreamConstants_0 (ref), l_activationFrameworkState_0 (copy), v42 (ref), v9 (ref)
        l_authButtonClick_0(v20.namespace, l_EventStreamConstants_0.Button.Skip, l_activationFrameworkState_0.currentState);
        v42(v9.Skip);
    end;
    local v47, v48 = v2.useState({
        shouldShowBackButton = false, 
        icon = "icons/actions/cycleLeft", 
        onBack = v45
    });
    local v49, v50 = v2.useState({
        shouldShowSkipButton = false, 
        skipButtonTextKey = "Authentication.SignUp.Label.Skip", 
        onSkip = v46
    });
    v2.useEffect(function() --[[ Line: 137 ]]
        -- upvalues: v47 (copy), v49 (copy), l_activationFrameworkState_0 (copy), v9 (ref), v48 (copy), v50 (copy)
        local v51 = table.clone(v47);
        local v52 = table.clone(v49);
        v52.shouldShowSkipButton = table.find(l_activationFrameworkState_0.availableActions, v9.Skip) ~= nil;
        v51.shouldShowBackButton = false;
        if table.find(l_activationFrameworkState_0.availableActions, v9.Back) then
            v51.shouldShowBackButton = true;
            v51.icon = "icons/actions/cycleLeft";
        elseif table.find(l_activationFrameworkState_0.availableActions, v9.Close) then
            v51.shouldShowBackButton = true;
            v51.icon = "icons/navigation/close";
        end;
        v48(v51);
        v50(v52);
    end, {
        l_activationFrameworkState_0.availableActions
    });
    local l_verticalPaddingPx_0 = l_ActivationFramework_0.verticalPaddingPx;
    local l_verticalPaddingPx_1 = l_ActivationFramework_0.verticalPaddingPx;
    v2.useLayoutEffect(function() --[[ Line: 161 ]]
        -- upvalues: v28 (copy), l_ActivationFramework_0 (copy), v33 (copy), v37 (copy)
        if v28 > 0 then
            local v55 = v28 - l_ActivationFramework_0.horizontalPaddingPx * 2;
            v33(v55);
            v37(v55);
        end;
    end, {
        v28
    });
    v2.useLayoutEffect(function() --[[ Line: 171 ]]
        -- upvalues: v41 (copy), v24 (copy), v26 (copy), v30 (copy), v34 (copy), l_verticalPaddingPx_0 (copy), l_verticalPaddingPx_1 (copy), v39 (copy)
        if v41 and v24 > 0 and v26 > 0 and v30 > 0 and v34 > 0 then
            local v56 = v30 - v24 - v26 - l_verticalPaddingPx_0 - l_verticalPaddingPx_1 - v34;
            v39(v56);
        end;
    end, {
        v24, 
        v26, 
        v30, 
        v34
    });
    v2.useLayoutEffect(function() --[[ Line: 188 ]]
        -- upvalues: v20 (copy), v24 (copy), v26 (copy), v30 (copy), l_verticalPaddingPx_0 (copy), l_verticalPaddingPx_1 (copy), v38 (copy), v35 (copy)
        if v20.shouldExpandMiddleContent and v24 > 0 and v26 > 0 and v30 > 0 then
            local v57 = v30 - v24 - v26 - l_verticalPaddingPx_0 - l_verticalPaddingPx_1 - v38;
            v35(v57);
        end;
    end, {
        v24, 
        v26, 
        v30, 
        v38
    });
    local v58 = {
        primaryButton = v20.primaryButton, 
        secondaryButton = v20.secondaryButton, 
        updateActivationWorkflowAndNavigate = v42
    };
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = function(v59) --[[ Line: 207 ]]
            -- upvalues: v29 (copy), v31 (copy)
            v29(v59.AbsoluteSize.X);
            v31(v59.AbsoluteSize.Y);
        end, 
        BorderSizePixel = 0
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_ActivationFramework_0.verticalPaddingPx), 
            PaddingTop = UDim.new(0, l_ActivationFramework_0.verticalPaddingPx), 
            PaddingLeft = UDim.new(0, l_ActivationFramework_0.horizontalPaddingPx), 
            PaddingRight = UDim.new(0, l_ActivationFramework_0.horizontalPaddingPx)
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = function(v60) --[[ Line: 230 ]]
                -- upvalues: v25 (copy)
                v25(v60.AbsoluteSize.Y);
            end, 
            LayoutOrder = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_ActivationFramework_0.headerTopPadding)
            }), 
            HeaderContent = v2.createElement(v3, {
                skipProps = v49, 
                backProps = v47, 
                titleTextKey = v20.titleTextKey, 
                bodyTextKey = v20.bodyTextKey, 
                headingTextKey = v20.headingTextKey, 
                ixpTitleTextKey = v20.ixpTitleTextKey, 
                ixpBodyTextKey = v20.ixpBodyTextKey
            })
        }), 
        Content = v2.createElement("Frame", {
            Size = if v20.shouldExpandMiddleContent then UDim2.new(0, v32, 0, v34) else UDim2.new(0, v32, 0, 0), 
            AutomaticSize = if not v20.shouldExpandMiddleContent then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v2.Change.AbsoluteSize] = function(v61) --[[ Line: 255 ]]
                -- upvalues: v20 (copy), v35 (copy)
                if not v20.shouldExpandMiddleContent then
                    v35(v61.AbsoluteSize.Y);
                end;
            end
        }, {
            v20.children
        }), 
        Footer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v2.Change.AbsoluteSize] = function(v62) --[[ Line: 266 ]]
                -- upvalues: v27 (copy)
                v27(v62.AbsoluteSize.Y);
            end, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_ActivationFramework_0.footerTopPaddingPx)
            }), 
            FooterContent = v2.createElement(v4, v58)
        }), 
        SubFooterContent = if v20.subFooterContent then v2.createElement("Frame", {
            Size = if v41 then UDim2.new(0, v36, 0, v38) else UDim2.new(0, v36, 0, 0), 
            AutomaticSize = if not v41 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            [v2.Change.AbsoluteSize] = function(v63) --[[ Line: 285 ]]
                -- upvalues: v41 (copy), v39 (copy)
                if not v41 then
                    v39(v63.AbsoluteSize.Y);
                end;
            end
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_ActivationFramework_0.subfooterTopPaddingPx), 
                PaddingBottom = UDim.new(0, l_ActivationFramework_0.subfooterBottomPaddingPx)
            }); 
            v20.subFooterContent
        }) else nil
    });
end;