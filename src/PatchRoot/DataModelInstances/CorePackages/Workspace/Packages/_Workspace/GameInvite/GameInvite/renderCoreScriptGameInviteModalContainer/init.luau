local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactRodux);
local v6 = require(l_Parent_1.ReactRoblox);
local v7 = require(l_Parent_1.Style);
local v8 = require(l_Parent_1.UniversalAppPolicy);
local l_ApolloProvider_0 = require(l_Parent_1.ApolloClient).ApolloProvider;
local v10 = require(l_Parent_0.GameInviteConstants);
local v11 = require(l_Components_0.GameInviteModal);
local _ = require(l_Parent_0.gameInviteModalType);
local l_AppFeaturePolicies_0 = v8.AppFeaturePolicies;
local l_RoactAppPolicy_0 = v8.RoactAppPolicy;
local l_StyleProviderWithDefaultTheme_0 = v7.StyleProviderWithDefaultTheme;
game:DefineFastFlag("FixGameInviteModalLoadTimeIncrease", false);
local v16 = nil;
if not game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then
    v16 = require(l_Parent_1.RobloxApolloClient).initializeApolloClient({});
end;
return function(v17) --[[ Line: 29 ]]
    -- upvalues: l_Parent_0 (copy), l_CoreGui_0 (copy), v4 (copy), v5 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_ApolloProvider_0 (copy), v16 (ref), v11 (copy), v10 (copy), v6 (copy)
    local v18 = require(l_Parent_0.State.GameInviteStore);
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "GameInvite";
    l_Folder_0.Parent = l_CoreGui_0;
    local v20 = v4.createElement(v5.StoreProvider, {
        store = v18
    }, {
        PolicyProvider = v4.createElement(l_RoactAppPolicy_0.Provider, {
            policy = {
                l_AppFeaturePolicies_0
            }
        }, {
            StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
                ApolloClientProvider = v4.createElement(l_ApolloProvider_0, {
                    client = if game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then v17 else v16
                }, {
                    GameInviteModalWrapper = v4.createElement(v11, {
                        displayOrder = -1, 
                        renderLocation = v10.RenderLocation.CoreScripts
                    })
                })
            })
        })
    });
    local v21 = v6.createRoot(l_Folder_0);
    v21:render(v20);
    return v21;
end;