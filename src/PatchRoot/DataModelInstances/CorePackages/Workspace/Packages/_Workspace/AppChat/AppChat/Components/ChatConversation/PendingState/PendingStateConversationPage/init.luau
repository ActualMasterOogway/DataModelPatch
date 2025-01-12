local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v5.memo;
local l_useCallback_0 = v5.useCallback;
local l_useEffect_0 = v5.useEffect;
local l_useRef_0 = v5.useRef;
local l_useState_0 = v5.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v13 = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationExitType);
local v14 = require(script.Parent.PendingStateIndicator);
local v15 = require(script.Parent.PhoneVerificationUpsellContainer);
local v16 = require(script.Parent.IneligibleModalContainer);
local v17 = require(script.Parent.PendingStateModalContainer);
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v21 = {
    topBarHeight = 0, 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    onConversationUnmount = function(_) --[[ Line: 52 ]] --[[ Name: onConversationUnmount ]]

    end, 
    navigateToToast = function(_) --[[ Line: 53 ]] --[[ Name: navigateToToast ]]

    end, 
    navigateBack = function() --[[ Line: 54 ]] --[[ Name: navigateBack ]]

    end, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowIneligibleModal = false
};
return l_memo_0(function(v22) --[[ Line: 62 ]] --[[ Name: PendingStateConversationPage ]]
    -- upvalues: v4 (copy), v21 (copy), l_useStyle_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), l_useRef_0 (copy), v13 (copy), l_useEffect_0 (copy), v15 (copy), v16 (copy), v18 (copy), v17 (copy), v5 (copy), v2 (copy), v14 (copy)
    local v23 = v4.Dictionary.join(v21, v22);
    local v24 = l_useStyle_0();
    local v25 = v23.style or v24;
    local v26, v27 = l_useState_0(0);
    local v29 = l_useCallback_0(function(v28) --[[ Line: 68 ]]
        -- upvalues: v27 (copy)
        v27(v28);
    end, l_dependencyArray_0(v27));
    local v30 = l_useCallback_0(function() --[[ Line: 72 ]]
        -- upvalues: v23 (copy)
        v23.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v23.networkErrorText
                }
            }
        });
    end, l_dependencyArray_0(v23.navigateToToast, v23.networkErrorText));
    local v31 = l_useRef_0(v13.Default);
    local v35 = l_useCallback_0(function(_, v33, v34) --[[ Line: 84 ]]
        -- upvalues: v23 (copy), v31 (copy), v13 (ref)
        if not v23.wideMode and v33 == Enum.SwipeDirection.Right and v34 == 1 then
            v31.current = v13.SwipedRight;
            v23.navigateBack();
        end;
    end, {
        v23.wideMode, 
        v23.navigateBack
    });
    l_useEffect_0(function() --[[ Line: 91 ]]
        -- upvalues: v23 (copy), v31 (copy), v13 (ref)
        return function() --[[ Line: 92 ]]
            -- upvalues: v23 (ref), v31 (ref), v13 (ref)
            v23.onConversationUnmount(v31.current);
            v31.current = v13.Default;
        end;
    end, {});
    local v36 = if v23.shouldShowPhoneVerificationUpsell then v15 else if v23.shouldShowIneligibleModal then v16 else function() --[[ Line: 102 ]]

    end;
    if v18() then
        v36 = v17;
    end;
    return v5.createElement("TextButton", {
        BackgroundColor3 = v25.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Transparency = if v2() then v25.Tokens.Global.Color.None.Transparency else v25.Theme.BackgroundDefault.Transparency, 
        Text = "", 
        LayoutOrder = v23.layoutOrder, 
        [v5.Event.TouchSwipe] = v35
    }, {
        UIListLayout = v5.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PendingStateIndicator = v5.createElement(v14, {
            layoutOrder = 1, 
            size = UDim2.new(1, 0, 1, -v26)
        }), 
        ConversationBottomModal = v5.createElement(v36, {
            conversationId = v23.conversationId, 
            showNetworkErrorToast = v30, 
            layoutOrder = 2, 
            onHeightChanged = v29
        })
    });
end);