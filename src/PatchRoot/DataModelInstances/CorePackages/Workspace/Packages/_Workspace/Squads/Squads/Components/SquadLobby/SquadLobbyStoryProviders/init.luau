local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_Roact_0 = v1.Roact;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Rodux_0 = v1.Rodux;
local l_UserProfiles_0 = v1.UserProfiles;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_UniversalAppPolicy_0 = v1.UniversalAppPolicy.UniversalAppPolicy;
local l_withDefaults_0 = v1.Foundation.Utility.withDefaults;
local l_Constants_0 = v1.CrossExperience.Constants;
local l_SquadLocationEnum_0 = v1.SquadsCore.Enums.SquadLocationEnum;
local l_SquadExternalContractProvider_0 = v1.SquadsCore.SquadExternalContractProvider.SquadExternalContractProvider;
local l_makeSquadContract_0 = v1.SquadsCore.SquadExternalContractProvider.makeSquadContract;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v17 = require(l_Parent_0.Dev.ApolloClient);
local v18 = require(l_Parent_0.Dev.GraphQLServer);
local l_ApolloProvider_0 = v17.ApolloProvider;
local v20 = v18.ApolloClientTestUtils.mockApolloClient({});
local function v23(v21, v22) --[[ Line: 30 ]] --[[ Name: writeNameQuery ]]
    -- upvalues: l_UserProfiles_0 (copy), v20 (copy)
    l_UserProfiles_0.Mutations.writeNamesQuery({
        userId = v21, 
        client = v20, 
        names = {
            alias = v22, 
            contactName = v22, 
            displayName = v22, 
            username = v22, 
            platformName = v22
        }, 
        query = l_UserProfiles_0.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
end;
v23("1111111111", "User 1 has a long name. User 1 has a long name.");
v23("2222222222", "User2");
v23(tostring(3333333333), "User " .. 3);
v23(tostring(4444444444), "User " .. 4);
v23(tostring(5555555555), "User " .. 5);
v23(tostring(6666666666), "User " .. 6);
v23(tostring(7777777777), "User " .. 7);
v23(tostring(8888888888), "User " .. 8);
v23(tostring(9999999999), "User " .. 9);
v23(tostring(11111111110), "User " .. 10);
local v24 = {
    canUsePlatformChat = true, 
    userPresences = {
        ["1111111111"] = {
            userPresenceType = l_PresenceType_0.InGame, 
            lastLocation = "Dress to impress", 
            placeId = 12345
        }
    }, 
    children = nil
};
return function(v25) --[[ Line: 68 ]]
    -- upvalues: l_withDefaults_0 (copy), v24 (copy), l_React_0 (copy), l_Rodux_0 (copy), l_Constants_0 (copy), l_dependencyArray_0 (copy), l_Roact_0 (copy), l_ApolloProvider_0 (copy), v20 (copy), l_RoactNavigation_0 (copy), l_UniversalAppPolicy_0 (copy), l_RoactRodux_0 (copy), l_SquadExternalContractProvider_0 (copy), l_SquadLocationEnum_0 (copy), l_makeSquadContract_0 (copy)
    local v26 = l_withDefaults_0(v25, v24);
    local v27 = l_React_0.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: l_Rodux_0 (ref), l_Constants_0 (ref), v26 (copy)
        return l_Rodux_0.Store.new(function() --[[ Line: 72 ]]
            -- upvalues: l_Constants_0 (ref), v26 (ref)
            return {
                ScreenSize = Vector2.new(450, 200), 
                LocalUserId = "1111111111", 
                Squad = {
                    CrossExperienceVoice = {
                        Experience = {
                            voiceStatus = l_Constants_0.VOICE_STATUS.VOICE_CONNECTED, 
                            voiceChannelId = "party_12345", 
                            voiceSessionId = "party_12345_game"
                        }, 
                        Participants = {
                            participants = {
                                ["1111111111"] = {
                                    userId = "1111111111", 
                                    isMuted = false, 
                                    isSpeaking = false
                                }
                            }, 
                            activeUserIds = {}
                        }
                    }, 
                    Presence = {
                        byUserId = v26.userPresences
                    }, 
                    Squad = {
                        currentSquad = {
                            squadId = "12345", 
                            members = {
                                [1] = {
                                    userId = 1111111111
                                }
                            }, 
                            additionalData = {
                                title = "Best friends for life"
                            }
                        }
                    }, 
                    NetworkStatus = {}, 
                    UserBlocking = {
                        isBlockedByMe = {}
                    }
                }
            };
        end, {}, {
            l_Rodux_0.thunkMiddleware
        });
    end, l_dependencyArray_0(v26.userPresences));
    local v28 = l_React_0.useMemo(function() --[[ Line: 119 ]]
        -- upvalues: v26 (copy)
        return {
            function() --[[ Line: 121 ]]
                -- upvalues: v26 (ref)
                return {
                    getCanUsePlatformChat = function() --[[ Line: 123 ]] --[[ Name: getCanUsePlatformChat ]]
                        -- upvalues: v26 (ref)
                        return v26.canUsePlatformChat;
                    end
                };
            end
        };
    end, l_dependencyArray_0(v26.canUsePlatformChat));
    return l_Roact_0.createElement(l_ApolloProvider_0, {
        client = v20
    }, {
        navigationProvider = l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
            value = {
                addListener = function(_) --[[ Line: 136 ]] --[[ Name: addListener ]]

                end, 
                getParam = function(v30) --[[ Line: 137 ]] --[[ Name: getParam ]]
                    return v30;
                end, 
                getScreenProps = function(_) --[[ Line: 140 ]] --[[ Name: getScreenProps ]]
                    return 0;
                end, 
                navigate = function(_) --[[ Line: 143 ]] --[[ Name: navigate ]]

                end, 
                pop = function() --[[ Line: 144 ]] --[[ Name: pop ]]

                end
            }
        }, {
            policyProvider = l_Roact_0.createElement(l_UniversalAppPolicy_0.Provider, {
                policy = v28
            }, {
                storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                    store = v27
                }, {
                    squadExternalContractProvider = l_Roact_0.createElement(l_SquadExternalContractProvider_0, {
                        squadLocation = l_SquadLocationEnum_0.UniversalApp, 
                        contract = l_makeSquadContract_0({
                            useParentChannelTitleSelector = function() --[[ Line: 156 ]] --[[ Name: useParentChannelTitleSelector ]]
                                return "Best friends for life";
                            end
                        })
                    }, v26.children)
                })
            })
        })
    });
end;