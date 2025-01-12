local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local l_Rodux_0 = v4.Rodux;
local l_RoactRodux_0 = v4.RoactRodux;
local _ = v4.UIBlox.Style.Provider;
local l_LocaleProvider_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Locale.LocaleProvider;
local l_Toast_0 = require(l_CorePackages_0.Workspace.Packages.ToastLite).Components.Toast;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_Parent_0.Reducers.Reducer);
local v13 = require(l_Parent_0.Services.ABTest);
local v14 = require(l_Parent_0.Services.Network);
local v15 = require(l_Parent_0.Services.Analytics);
local v16 = require(l_Parent_0.Services.PlatformInterface);
local v17 = require(l_Parent_0.Services.ExternalSettings);
local v18 = require(l_Parent_0.Thunk);
local v19 = require(script.Parent.Connection.EventConnections);
local v20 = require(script.Parent.Connection.LayoutValuesProvider);
local v21 = require(script.Parent.Connection.provideRobloxLocale);
local v22 = require(l_Parent_0.Components.Connection.PurchasePromptPolicy);
local v23 = require(script.Parent.ProductPurchase.ProductPurchaseContainer);
local v24 = require(script.Parent.RobuxUpsell.RobuxUpsellContainer);
local v25 = require(script.Parent.PremiumUpsell.PremiumUpsellContainer);
local v26 = require(script.Parent.SubscriptionPurchase.SubscriptionPurchaseContainer);
local v27 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v28 = require(l_Parent_0.Flags.GetFFlagEnableToastLiteRender);
local v29 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local v30 = l_Roact_0.Component:extend("PurchasePromptApp");
v30.init = function(v31) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v27 (copy), l_Rodux_0 (copy), v12 (copy), v18 (copy)
    local v32 = {};
    local v33 = v13.new();
    local v34 = v14.new();
    local v35 = v15.new();
    local v36 = v16.new();
    local v37 = v17.new();
    v31.state = {
        store = if not v27 then l_Rodux_0.Store.new(v12, v32, {
            v18.middleware({
                [v13] = v33, 
                [v14] = v34, 
                [v15] = v35, 
                [v16] = v36, 
                [v17] = v37
            })
        }) else nil, 
        isTenFootInterface = v37.isTenFootInterface()
    };
end;
v30.renderWithStyle = function(_, v39) --[[ Line: 70 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v29 (copy)
    return v29(v39);
end;
v30.render = function(v40) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), l_Roact_0 (copy), l_RoactRodux_0 (copy), v27 (copy), v20 (copy), v22 (copy), l_LocaleProvider_0 (copy), l_LocalizationService_0 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v19 (copy), v28 (copy), l_Toast_0 (copy)
    return v21(function() --[[ Line: 75 ]]
        -- upvalues: l_Roact_0 (ref), l_RoactRodux_0 (ref), v27 (ref), v40 (copy), v20 (ref), v22 (ref), l_LocaleProvider_0 (ref), l_LocalizationService_0 (ref), v23 (ref), v24 (ref), v25 (ref), v26 (ref), v19 (ref), v28 (ref), l_Toast_0 (ref)
        return l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = if v27 then v40.props.store else v40.state.store
        }, {
            StyleProvider = v40:renderWithStyle({
                LayoutValuesProvider = l_Roact_0.createElement(v20, {
                    isTenFootInterface = v40.state.isTenFootInterface
                }, {
                    PolicyProvider = l_Roact_0.createElement(v22.Provider, {
                        policy = {
                            v22.Mapper
                        }
                    }, {
                        PurchasePrompt = l_Roact_0.createElement("ScreenGui", {
                            AutoLocalize = false, 
                            IgnoreGuiInset = true
                        }, {
                            LocaleProvider = l_Roact_0.createElement(l_LocaleProvider_0, {
                                locale = l_LocalizationService_0.RobloxLocaleId
                            }, {
                                ProductPurchaseContainer = l_Roact_0.createElement(v23), 
                                RobuxUpsellContainer = l_Roact_0.createElement(v24), 
                                PremiumUpsellContainer = l_Roact_0.createElement(v25), 
                                SubscriptionPurchaseContainer = l_Roact_0.createElement(v26)
                            }), 
                            EventConnections = l_Roact_0.createElement(v19), 
                            Toast = if v28() then l_Roact_0.createElement(l_Toast_0) else nil
                        })
                    })
                })
            })
        });
    end);
end;
return v30;