local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_InExperienceSquadContract_0 = require(l_script_FirstAncestor_0.Contracts).SquadContract.InExperienceSquadContract;
local v4 = require(l_script_FirstAncestor_0.Contexts);
local l_UnreadMessagesProvider_0 = v4.UnreadMessagesProvider;
local l_ParentContainerProvider_0 = v4.ParentContainer.ParentContainerProvider;
local l_ApolloProvider_0 = require(l_Parent_0.ApolloClient).ApolloProvider;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.RoactUtils);
local v12 = require(l_Parent_0.RoactRodux);
local v13 = require(l_Parent_0.SquadsCore);
local v14 = require(l_Parent_0.SharedFlags);
local l_SquadExternalContractProvider_0 = v13.SquadExternalContractProvider.SquadExternalContractProvider;
local l_SquadLocationEnum_0 = v13.Enums.SquadLocationEnum;
local l_ProviderContainer_0 = v11.Components.ProviderContainer;
local l_GetFFlagLuaAppEnableSquadPage_0 = v14.GetFFlagLuaAppEnableSquadPage;
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMoveApolloProvider);
return function(v20) --[[ Line: 44 ]]
    -- upvalues: v10 (copy), l_ParentContainerProvider_0 (copy), l_UnreadMessagesProvider_0 (copy), v12 (copy), v19 (copy), l_ApolloProvider_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_SquadExternalContractProvider_0 (copy), l_InExperienceSquadContract_0 (copy), l_SquadLocationEnum_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_ProviderContainer_0 (copy)
    local v22 = v10.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: l_ParentContainerProvider_0 (ref), v20 (copy), l_UnreadMessagesProvider_0 (ref), v12 (ref), v19 (ref), l_ApolloProvider_0 (ref), l_GetFFlagLuaAppEnableSquadPage_0 (ref), l_SquadExternalContractProvider_0 (ref), l_InExperienceSquadContract_0 (ref), l_SquadLocationEnum_0 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref)
        local v21 = {};
        table.insert(v21, {
            class = l_ParentContainerProvider_0, 
            props = v20.parentContainerContext
        });
        table.insert(v21, {
            class = l_UnreadMessagesProvider_0, 
            props = {
                dispatch = v20.updateAppChatUnreadMessagesCount
            }
        });
        table.insert(v21, {
            class = v12.StoreProvider, 
            props = {
                store = v20.store
            }
        });
        if v19() then
            table.insert(v21, {
                class = l_ApolloProvider_0, 
                props = {
                    client = v20.apolloClient
                }
            });
        end;
        if l_GetFFlagLuaAppEnableSquadPage_0() then
            table.insert(v21, {
                class = l_SquadExternalContractProvider_0, 
                props = {
                    contract = l_InExperienceSquadContract_0, 
                    squadLocation = l_SquadLocationEnum_0.InExperience
                }
            });
        end;
        table.insert(v21, {
            class = l_LocalizationProvider_0, 
            props = {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }
        });
        return v21;
    end, {});
    return v10.createElement(l_ProviderContainer_0, {
        providers = v22
    }, v20.children);
end;