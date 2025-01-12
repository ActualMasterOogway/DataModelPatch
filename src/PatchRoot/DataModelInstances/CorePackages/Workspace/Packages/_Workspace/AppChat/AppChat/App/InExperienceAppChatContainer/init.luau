local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.AppCommonLib);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RealtimeDelivery);
local v7 = require(l_Parent_0.Responsive);
local v8 = require(l_Parent_0.SharedFlags);
local v9 = require(l_Parent_0.SquadsCore);
local v10 = require(l_Parent_0.UIBlox);
local v11 = require(l_script_FirstAncestor_0.AppChatEntryPoint);
local v12 = require(l_script_FirstAncestor_0.Components.EventReceivers.ChatEventReceiver);
local v13 = require(l_script_FirstAncestor_0.App.Components.ChatExternalEventReceiver);
local v14 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v15 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.useParentContainerExtents);
local v16 = require(l_script_FirstAncestor_0.Components.ExternalNavigationHandler.Container);
local v17 = require(l_script_FirstAncestor_0.Hooks.useExternalNavigationByScreen);
local l_LoadingSpinner_0 = v10.App.Loading.LoadingSpinner;
local v19 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.ParentContainerContext);
local l_getFFlagAppChatCorescriptsToastsEnabled_0 = require(l_script_FirstAncestor_0.Flags).getFFlagAppChatCorescriptsToastsEnabled;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxEventReceiver_0 = v6.RobloxEventReceiver;
local l_Signal_0 = v4.Signal;
local l_SquadAppChatEventReceiver_0 = v9.SquadAppChatEventReceiver;
local l_useMemo_0 = v5.useMemo;
local l_useState_0 = v5.useState;
local l_useEffect_0 = v5.useEffect;
local l_useCallback_0 = v5.useCallback;
local l_useContext_0 = v5.useContext;
local l_useRef_0 = v5.useRef;
local v31 = game:DefineFastInt("AppChatWideBreakpointMinWidth", 800);
local v32 = game:DefineFastInt("AppChatWideBreakpointMinHeight", 0);
local v33 = game:DefineFastInt("AppChatInExperienceMountMinLoadingTimeMs", 0);
local l_FFlagSquadAppChatRTNFix_0 = v8.FFlagSquadAppChatRTNFix;
return function(v35) --[[ Line: 51 ]]
    -- upvalues: l_useContext_0 (copy), v19 (copy), l_useState_0 (copy), v17 (copy), l_useMemo_0 (copy), l_Signal_0 (copy), l_RobloxEventReceiver_0 (copy), l_NotificationService_0 (copy), v5 (copy), v7 (copy), v31 (copy), v32 (copy), v15 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), v33 (copy), l_LoadingSpinner_0 (copy), v11 (copy), l_LocalPlayer_0 (copy), v14 (copy), v12 (copy), v13 (copy), l_getFFlagAppChatCorescriptsToastsEnabled_0 (copy), v16 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), l_SquadAppChatEventReceiver_0 (copy)
    local l_hideParentContainer_0 = l_useContext_0(v19).hideParentContainer;
    local v37, v38 = l_useState_0(0);
    local v39, v40 = v17();
    local v41 = l_useMemo_0(function() --[[ Line: 55 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v42 = l_useMemo_0(function() --[[ Line: 59 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), l_NotificationService_0 (ref)
        return l_RobloxEventReceiver_0.new(l_NotificationService_0);
    end, {});
    local v43 = v5.useRef(nil);
    local v44 = v7.useOrientation();
    local v45 = v7.useResponsive({
        {
            Key = "wide", 
            minWidth = v31, 
            minHeight = v32
        }
    }) == "wide";
    local v46 = true;
    if v44 == v7.Keys.Portrait or not v45 then
        v46 = false;
    end;
    local v47, v48 = v15();
    local v49 = v44 == v7.DefaultKey;
    local v50, v51 = l_useState_0(v49);
    local v52 = l_useRef_0(os.clock());
    local v53 = l_useCallback_0(function() --[[ Line: 85 ]]
        -- upvalues: v35 (copy), l_hideParentContainer_0 (copy)
        v35.hideAppChat();
        l_hideParentContainer_0();
    end, {
        l_hideParentContainer_0, 
        v35.hideAppChat
    });
    l_useEffect_0(function() --[[ Line: 90 ]]
        -- upvalues: v49 (copy), v52 (copy), v33 (ref), v51 (copy)
        if not v49 then
            local v54 = os.clock() - v52.current;
            local v55 = v33 / 1000;
            if v54 < v55 then
                delay(v55 - v54, function() --[[ Line: 96 ]]
                    -- upvalues: v51 (ref)
                    v51(false);
                end);
                return;
            else
                v51(false);
            end;
        end;
    end, {
        v49, 
        v51
    });
    return v5.createElement(v5.Fragment, {}, {
        AppChatWindow = v5.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Size = v47:map(function(v56) --[[ Line: 110 ]]
                return UDim2.fromOffset(v56.X, v56.Y);
            end), 
            Position = v48:map(function(v57) --[[ Line: 113 ]]
                return UDim2.fromOffset(v57.X, v57.Y);
            end), 
            ref = v43
        }, {
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            containerRef = v5.createElement(v7.ContainerRef.Provider, {
                value = v43
            }, {
                AppChatEntryPoint = if v50 then v5.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(50, 50), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5)
                }) else v5.createElement(v11, {
                    setActiveConversationId = v38, 
                    localUserId = if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else nil, 
                    chatPlacement = v14.Enum.InExperienceDefault, 
                    isVisible = true, 
                    initialConversationId = v35.initialConversationId, 
                    setInitialConversationId = v35.setInitialConversationId, 
                    wideMode = v46, 
                    navigateToRootStack = v53, 
                    updateExternalNavigationForScreen = v40
                })
            })
        }), 
        ChatEventReceiver = v5.createElement(v12, {
            robloxEventReceiver = v42, 
            rnBypassActionSignal = v41, 
            activeConversationId = tostring(v37)
        }), 
        ChatExternalEventReceiver = v5.createElement(v13, {
            robloxEventReceiver = v42, 
            localUserId = if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else nil
        }), 
        ExternalNavigationHandler = if l_getFFlagAppChatCorescriptsToastsEnabled_0() then v5.createElement(v16, {
            navigationByScreen = v39
        }) else nil, 
        SquadAppChatEventReceiver = if l_FFlagSquadAppChatRTNFix_0 then v5.createElement(l_SquadAppChatEventReceiver_0) else nil
    });
end;