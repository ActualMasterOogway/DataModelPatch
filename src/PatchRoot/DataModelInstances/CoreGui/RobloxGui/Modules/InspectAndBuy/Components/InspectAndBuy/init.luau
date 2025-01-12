local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local v8 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.Rodux);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local v13 = require(l_CoreGui_0.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider;
local l_Parent_0 = script.Parent.Parent;
local v16 = require(l_Parent_0.Actions.SetDetailsInformation);
local v17 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v18 = require(l_Parent_0.Thunk);
local v19 = require(l_Parent_0.Services.Network);
local v20 = require(l_Parent_0.Services.Analytics);
local v21 = require(l_Parent_0.Reducers.InspectAndBuyReducer);
local v22 = require(l_Parent_0.Components.Container);
local v23 = require(l_Parent_0.Constants);
local v24 = require(l_Parent_0.CompactView);
local v25 = require(l_Parent_0.WideView);
local v26 = require(l_Parent_0.WideLandscapeView);
local v27 = require(l_Parent_0.Actions.SetGamepadEnabled);
local v28 = require(l_Parent_0.Actions.SetView);
local v29 = require(l_Parent_0.Actions.SetPlayerId);
local v30 = require(l_Parent_0.Actions.SetPlayerName);
local v31 = require(l_Parent_0.Actions.SetLocale);
local v32 = require(l_Parent_0.Actions.SetItemBeingPurchased);
local v33 = require(l_Parent_0.Actions.SetIsSubjectToChinaPolicies);
local v34 = require(l_Parent_0.Actions.UpdateStoreId);
local v35 = require(l_Parent_0.Thunks.GetAssetsFromHumanoidDescription);
local v36 = require(l_Parent_0.Thunks.UpdateOwnedStatus);
local v37 = require(l_Parent_0.Thunks.GetCharacterModelFromUserId);
local v38 = require(l_Parent_0.Thunks.GetPlayerName);
local v39 = require(l_Parent_0.Components.InspectAndBuyContext);
local v40 = require(l_Parent_0.Actions.CloseOverlay);
local v41 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v42 = require(l_CoreGui_0.RobloxGui.Modules.Common.PolicyService);
local v43 = l_Symbol_0.named("OverrideCursorInspectMenu");
local v44 = v9.PureComponent:extend("InspectAndBuy");
v44.pushMouseIconOverride = function(_) --[[ Line: 56 ]] --[[ Name: pushMouseIconOverride ]]
    -- upvalues: l_UserInputService_0 (copy), v8 (copy), v43 (copy)
    if l_UserInputService_0:GetLastInputType().Name:find("Gamepad") then
        v8.push(v43, Enum.OverrideMouseIconBehavior.ForceHide);
        return;
    else
        v8.push(v43, Enum.OverrideMouseIconBehavior.ForceShow);
        return;
    end;
end;
v44.popMouseIconOverride = function(_) --[[ Line: 67 ]] --[[ Name: popMouseIconOverride ]]
    -- upvalues: v8 (copy), v43 (copy)
    v8.pop(v43);
end;
v44.configureInputType = function(v47, v48) --[[ Line: 71 ]] --[[ Name: configureInputType ]]
    -- upvalues: l_UserInputService_0 (copy), v27 (copy)
    if (v48 or l_UserInputService_0:GetLastInputType()).Name:find("Gamepad") then
        v47.state.store:dispatch(v27(true));
        return;
    else
        v47.state.store:dispatch(v27(false));
        return;
    end;
end;
v44.updateView = function(v49) --[[ Line: 82 ]] --[[ Name: updateView ]]
    -- upvalues: v23 (copy), v28 (copy)
    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    local l_Wide_0 = v23.View.Wide;
    if l_ViewportSize_0.X < 600 then
        l_Wide_0 = v23.View.Compact;
    elseif l_ViewportSize_0.X > l_ViewportSize_0.Y and l_ViewportSize_0.X < 800 then
        l_Wide_0 = v23.View.WideLandscape;
    end;
    v49.state.store:dispatch(v28(l_Wide_0));
end;
v44.init = function(v52) --[[ Line: 95 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v20 (copy), v10 (copy), v21 (copy), v18 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v34 (copy), v30 (copy), v31 (copy), l_LocalizationService_0 (copy), v29 (copy), v35 (copy), v36 (copy), v32 (copy)
    local l_playerId_0 = v52.props.playerId;
    local l_playerName_0 = v52.props.playerName;
    local l_ctx_0 = v52.props.ctx;
    v52.connections = {};
    v52.network = v52.props.network or v19.new();
    v52.analytics = v20.new(l_playerId_0, l_ctx_0);
    v52.humanoidDescription = v52.props.humanoidDescription;
    v52.analytics.reportOpenInspectMenu();
    v52.state = {
        store = v10.Store.new(v21, {}, {
            v18.middleware({
                [v19] = v52.network, 
                [v20] = v52.analytics
            })
        }), 
        views = {
            [v23.View.Compact] = v24, 
            [v23.View.Wide] = v25, 
            [v23.View.WideLandscape] = v26
        }
    };
    v52.state.store:dispatch(v34());
    v52.state.store:dispatch(v30(l_playerName_0));
    v52.state.store:dispatch(v31(l_LocalizationService_0.RobloxLocaleId));
    if l_playerId_0 then
        v52.state.store:dispatch(v29(l_playerId_0));
    end;
    if v52.humanoidDescription then
        v52.state.store:dispatch(v35(v52.humanoidDescription, false));
    end;
    v52.onPromptPurchaseFinished = function(_, v57, v58) --[[ Line: 133 ]]
        -- upvalues: v52 (copy), v23 (ref), v36 (ref), v32 (ref)
        local l_itemBeingPurchased_0 = v52.state.store:getState().itemBeingPurchased;
        v52.analytics.sendCounter(v23.Counters.PurchaseFinished);
        if v58 and tostring(v57) == l_itemBeingPurchased_0.itemId then
            v52.analytics.reportPurchaseSuccess(l_itemBeingPurchased_0.itemType, l_itemBeingPurchased_0.itemId);
            v52.state.store:dispatch(v36(l_itemBeingPurchased_0.itemId, l_itemBeingPurchased_0.itemType));
            if l_itemBeingPurchased_0.itemType == v23.ItemType.Asset then
                v52.analytics.sendCounter(v23.Counters.PurchaseSucceededAsset);
            elseif l_itemBeingPurchased_0.itemType == v23.ItemType.Bundle then
                v52.analytics.sendCounter(v23.Counters.PurchaseSucceededBundle);
            else
                v52.analytics.sendCounter(v23.Counters.PurchaseSucceededOther);
            end;
        end;
        v52.state.store:dispatch(v32(nil, nil));
    end;
end;
v44.didMount = function(v60) --[[ Line: 153 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), l_LocalizationService_0 (copy), v31 (copy), l_GuiService_0 (copy), v42 (copy), v33 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), v37 (copy), v35 (copy), v38 (copy)
    local l_playerId_1 = v60.props.playerId;
    v60.isMounted = true;
    v60:updateView();
    v60:bindButtonB();
    v60:configureInputType();
    v60:pushMouseIconOverride();
    local v63 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v62) --[[ Line: 161 ]]
        -- upvalues: v60 (copy)
        v60:configureInputType(v62);
    end);
    local v64 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 167 ]]
        -- upvalues: v60 (copy)
        v60:updateView();
    end);
    local v65 = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 171 ]]
        -- upvalues: v60 (copy), v31 (ref), l_LocalizationService_0 (ref)
        v60.state.store:dispatch(v31(l_LocalizationService_0.RobloxLocaleId));
    end);
    local v66 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 175 ]]
        -- upvalues: v60 (copy), l_GuiService_0 (ref)
        v60:popMouseIconOverride();
        l_GuiService_0.SelectedCoreObject = nil;
    end);
    local v67 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 180 ]]
        -- upvalues: v60 (copy)
        v60:pushMouseIconOverride();
    end);
    coroutine.wrap(function() --[[ Line: 184 ]]
        -- upvalues: v42 (ref), v60 (copy), v33 (ref)
        local v68 = v42:IsSubjectToChinaPolicies();
        v60.state.store:dispatch(v33(v68));
    end)();
    local v69 = l_MarketplaceService_0.PromptPurchaseFinished:Connect(v60.onPromptPurchaseFinished);
    local v70 = l_MarketplaceService_0.PromptBundlePurchaseFinished:Connect(v60.onPromptPurchaseFinished);
    local v73 = v60.state.store.changed:connect(function(v71, v72) --[[ Line: 197 ]]
        -- upvalues: v60 (copy)
        v60:update(v71, v72);
    end);
    table.insert(v60.connections, v64);
    table.insert(v60.connections, v65);
    table.insert(v60.connections, v66);
    table.insert(v60.connections, v67);
    table.insert(v60.connections, v63);
    table.insert(v60.connections, v69);
    table.insert(v60.connections, v70);
    table.insert(v60.connections, v73);
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    v60.state.store:dispatch(v37(l_UserId_0, true, function(v75) --[[ Line: 211 ]]
        -- upvalues: v60 (copy), v35 (ref)
        if v60 and v60.isMounted then
            v60.localPlayerModel = v75;
            local l_HumanoidDescription_0 = v75.Humanoid.HumanoidDescription;
            if l_HumanoidDescription_0 then
                v60.state.store:dispatch(v35(l_HumanoidDescription_0, true));
            end;
            v60:setState({
                obtainedLocalPlayerModel = true
            });
        end;
    end));
    if l_playerId_1 then
        v60.state.store:dispatch(v37(l_playerId_1, false, function(v77) --[[ Line: 227 ]]
            -- upvalues: v60 (copy), v35 (ref)
            if v60 and v60.isMounted then
                v60.playerModel = v77;
                local l_HumanoidDescription_1 = v60.playerModel.Humanoid.HumanoidDescription;
                if l_HumanoidDescription_1 then
                    v60.state.store:dispatch(v35(l_HumanoidDescription_1, false));
                end;
                v60:setState({
                    obtainedPlayerModel = true
                });
            end;
        end));
        v60.state.store:dispatch(v38(l_playerId_1));
    end;
end;
v44.update = function(v79, v80, v81) --[[ Line: 246 ]] --[[ Name: update ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if not v80.visible and v81.visible then
        l_ContextActionService_0:UnbindCoreAction("BackButtonInspectMenu");
        return;
    else
        if v80.visible and not v81.visible then
            v79:bindButtonB();
        end;
        return;
    end;
end;
v44.willUnmount = function(v82) --[[ Line: 254 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v82.isMounted = false;
    for _, v84 in pairs(v82.connections) do
        v84:disconnect();
    end;
    l_ContextActionService_0:UnbindCoreAction("BackButtonInspectMenu");
    v82:popMouseIconOverride();
end;
v44.render = function(v85) --[[ Line: 264 ]] --[[ Name: render ]]
    -- upvalues: v41 (copy), v9 (copy), v39 (copy), v11 (copy), v13 (copy), l_SelectionCursorProvider_0 (copy), v22 (copy)
    local l_localPlayerModel_0 = v85.localPlayerModel;
    if v41 then
        return v9.createElement(v39.Provider, {
            value = v85.state.views
        }, {
            StoreProvider = v9.createElement(v11.StoreProvider, {
                store = v85.state.store
            }, {
                ThemeProvider = v13({
                    CursorProvider = v9.createElement(l_SelectionCursorProvider_0, {}, {
                        Container = v9.createElement(v22, {
                            localPlayerModel = l_localPlayerModel_0
                        })
                    })
                })
            })
        });
    else
        return v9.createElement(v39.Provider, {
            value = v85.state.views
        }, {
            v9.createElement(v11.StoreProvider, {
                store = v85.state.store
            }, {
                ThemeProvider = v13({
                    Container = v9.createElement(v22, {
                        localPlayerModel = l_localPlayerModel_0
                    })
                })
            })
        });
    end;
end;
v44.bindButtonB = function(v87) --[[ Line: 300 ]] --[[ Name: bindButtonB ]]
    -- upvalues: l_ContextActionService_0 (copy), v41 (copy), v40 (copy), v16 (copy), v17 (copy), l_GuiService_0 (copy)
    l_ContextActionService_0:BindCoreAction("BackButtonInspectMenu", function(_, v89, v90) --[[ Line: 301 ]]
        -- upvalues: v87 (copy), v41 (ref), v40 (ref), v16 (ref), v17 (ref), l_GuiService_0 (ref)
        if v89 == Enum.UserInputState.End and v90.KeyCode == Enum.KeyCode.ButtonB then
            local v91 = v87.state.store:getState();
            local l_viewingDetails_0 = v91.detailsInformation.viewingDetails;
            if v41 and v91.overlay and v91.overlay.overlay ~= nil then
                v87.state.store:dispatch(v40());
            elseif l_viewingDetails_0 then
                v87.state.store:dispatch(v16(false, nil));
                v87.state.store:dispatch(v17(false, nil));
            else
                l_GuiService_0:CloseInspectMenu();
            end;
        elseif v89 == Enum.UserInputState.Begin and v90.KeyCode == Enum.KeyCode.Escape or v90.KeyCode == Enum.KeyCode.ButtonStart then
            l_GuiService_0:CloseInspectMenu();
            return Enum.ContextActionResult.Pass;
        end;
        return Enum.ContextActionResult.Sink;
    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart);
end;
return v44;