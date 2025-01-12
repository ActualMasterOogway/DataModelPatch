local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.devDependencies);
local l_jest_0 = v3.JestGlobals.jest;
local v5 = require(l_script_FirstAncestor_0.installReducer);
local l_t_0 = v2.t;
local v7 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v8 = require(l_script_FirstAncestor_0.Utils.foldProviders);
local v9 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v10 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v11 = require(l_script_FirstAncestor_0.EnumScreens);
local l_llama_0 = v2.llama;
local l_Foundation_0 = v3.Foundation;
local l_UIBlox_0 = v2.UIBlox;
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local l_RoactNavigation_0 = v2.RoactNavigation;
local v19 = require(l_Parent_0.ApolloClient);
local v20 = require(l_Parent_0.GraphQLServer);
local v21 = require(l_Parent_0.UserProfiles);
local l_mockApolloClient_0 = v20.ApolloClientTestUtils.mockApolloClient;
local v23 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationService_0 = v23.FocusNavigationService;
local l_CoreGui_0 = v23.EngineInterface.CoreGui;
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsLandingIsVerifiedFromUserProfile);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_GetFFlagUIBloxFoundationProvider_0 = require(l_Parent_0.SharedFlags).GetFFlagUIBloxFoundationProvider;
local v29 = l_t_0.strictInterface({
    context = l_t_0.optional(l_t_0.table), 
    initialState = l_t_0.optional(l_t_0.table), 
    props = l_t_0.optional(l_t_0.table), 
    store = l_t_0.optional(l_t_0.table), 
    policy = l_t_0.optional(l_t_0.table), 
    analytics = l_t_0.optional(l_t_0.table), 
    navigation = l_t_0.optional(l_t_0.table), 
    apolloClient = l_t_0.optional(l_t_0.table)
});
local v30 = {
    state = {
        params = {}, 
        routeName = "", 
        key = ""
    }, 
    dispatch = function() --[[ Line: 58 ]] --[[ Name: dispatch ]]

    end, 
    goBack = function() --[[ Line: 59 ]] --[[ Name: goBack ]]

    end, 
    addListener = function() --[[ Line: 60 ]] --[[ Name: addListener ]]
        return {
            remove = function() --[[ Line: 62 ]] --[[ Name: remove ]]

            end
        };
    end, 
    isFocused = function() --[[ Line: 65 ]] --[[ Name: isFocused ]]

    end, 
    setParams = function() --[[ Line: 66 ]] --[[ Name: setParams ]]

    end, 
    getParam = function() --[[ Line: 67 ]] --[[ Name: getParam ]]

    end, 
    navigate = function() --[[ Line: 68 ]] --[[ Name: navigate ]]

    end
};
return function(v31) --[[ Line: 72 ]]
    -- upvalues: v29 (copy), l_Rodux_0 (copy), v5 (copy), l_llama_0 (copy), v2 (copy), l_mockApolloClient_0 (copy), v26 (copy), v21 (copy), v19 (copy), l_jest_0 (copy), v7 (copy), v11 (copy), v9 (copy), v10 (copy), l_RoactNavigation_0 (copy), v30 (copy), l_DesignTokenProvider_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy), v23 (copy), l_RoactRodux_0 (copy), l_UIBlox_0 (copy), l_GetFFlagUIBloxFoundationProvider_0 (copy), l_Foundation_0 (copy), l_Roact_0 (copy), v8 (copy)
    return function(v32, v33) --[[ Line: 73 ]]
        -- upvalues: v29 (ref), l_Rodux_0 (ref), v5 (ref), l_llama_0 (ref), v2 (ref), l_mockApolloClient_0 (ref), v26 (ref), v21 (ref), v19 (ref), l_jest_0 (ref), v7 (ref), v11 (ref), v9 (ref), v10 (ref), l_RoactNavigation_0 (ref), v30 (ref), l_DesignTokenProvider_0 (ref), l_FocusNavigationService_0 (ref), l_CoreGui_0 (ref), v23 (ref), l_RoactRodux_0 (ref), l_UIBlox_0 (ref), l_GetFFlagUIBloxFoundationProvider_0 (ref), l_Foundation_0 (ref), l_Roact_0 (ref), v8 (ref), v31 (copy)
        assert(v29(v33));
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = game:GetService("CoreGui");
        local v35 = {};
        local v36 = {
            LocalUserId = "LocalUserId", 
            FriendsLanding = {
                NetworkStatus = {
                    ["https://friends.roblox.com//v1/users/test/friends"] = "Done"
                }
            }
        };
        local v38 = l_Rodux_0.Store.new(l_Rodux_0.combineReducers({
            FriendsLanding = v5(), 
            LocalUserId = function(v37) --[[ Line: 93 ]] --[[ Name: LocalUserId ]]
                return v37;
            end
        }), l_llama_0.Dictionary.join(v36, v33.initialState), {
            l_Rodux_0.thunkMiddleware
        });
        local v39 = {
            getShowDisplayName = function() --[[ Line: 103 ]] --[[ Name: getShowDisplayName ]]
                return true;
            end, 
            getFriendFinder = function() --[[ Line: 106 ]] --[[ Name: getFriendFinder ]]
                return true;
            end, 
            getAccountProviderName = function() --[[ Line: 109 ]] --[[ Name: getAccountProviderName ]]
                return "";
            end, 
            shouldInviteFromAccountProvider = function() --[[ Line: 112 ]] --[[ Name: shouldInviteFromAccountProvider ]]
                return true;
            end, 
            getEnableProfileQrCode = function() --[[ Line: 115 ]] --[[ Name: getEnableProfileQrCode ]]
                return true;
            end, 
            getShouldHideContactImporterUpsell = function() --[[ Line: 118 ]] --[[ Name: getShouldHideContactImporterUpsell ]]
                return false;
            end, 
            getFriendRequestNicknamesEnabled = function() --[[ Line: 121 ]] --[[ Name: getFriendRequestNicknamesEnabled ]]
                return true;
            end
        };
        table.insert(v35, {
            v2.UniversalAppPolicy.Provider, 
            {
                policy = {
                    function() --[[ Line: 130 ]]
                        -- upvalues: l_llama_0 (ref), v39 (copy), v33 (copy)
                        return l_llama_0.Dictionary.join(v39, v33.policy);
                    end
                }
            }
        });
        local v40 = l_mockApolloClient_0({});
        local v41 = if v26 then v21.Queries.userProfilesFriendsLandingQueryByUserIds else v21.Queries.userProfilesCombinedNameAndUsernameByUserIds;
        v40:writeQuery({
            variables = {
                userIds = {
                    "0"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "0", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "test", 
                            username = "test"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "40"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "40", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "offlineFriend1", 
                            username = "offlineFriend1"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "39"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "39", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "offlineFriend2", 
                            username = "offlineFriend2"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "38"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "38", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "onlineFriend", 
                            username = "onlineFriend"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "37"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "37", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "inGameFriend", 
                            username = "inGameFriend"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "36"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "36", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "inStudioFriend", 
                            username = "inStudioFriend"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "123"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "123", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "rowan", 
                            username = "mance"
                        }
                    }
                }
            }
        });
        v40:writeQuery({
            variables = {
                userIds = {
                    "456"
                }
            }, 
            query = v41, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = "456", 
                        isVerified = false, 
                        isDeleted = false, 
                        names = {
                            __typename = "Names", 
                            combinedName = "henry", 
                            username = "williams"
                        }
                    }
                }
            }
        });
        table.insert(v35, {
            v19.ApolloProvider, 
            {
                client = v40
            }
        });
        local v42 = {
            setFilterKeys = l_jest_0.fn(), 
            refreshPage = l_jest_0.fn(), 
            wideMode = true, 
            screenSize = Vector2.new(512, 512), 
            filter = v7.All, 
            navigateToLuaAppPages = {
                [v11.FriendFinder] = l_jest_0.fn(), 
                [v11.ViewUserProfile] = l_jest_0.fn()
            }, 
            getScreenTopBar = function() --[[ Line: 331 ]]
                return {
                    shouldRenderCenter = false
                };
            end, 
            friendRequestCount = 0, 
            setScreenTopBar = l_jest_0.fn()
        };
        if v33.context then
            l_llama_0.Dictionary.map(v33.context, function(v43, v44) --[[ Line: 340 ]]
                -- upvalues: v42 (copy)
                v42[v44] = v43;
            end);
        end;
        table.insert(v35, {
            v9.Provider, 
            {
                value = v42
            }
        });
        table.insert(v35, {
            v10.Context.Provider, 
            {
                value = v33.analytics or {
                    buttonClick = l_jest_0.fn(), 
                    pageLoaded = l_jest_0.fn(), 
                    navigate = l_jest_0.fn(), 
                    pageLoadingTimeReport = l_jest_0.fn(), 
                    pageLoadedWithArgs = l_jest_0.fn(), 
                    pageMountingTimeReport = l_jest_0.fn(), 
                    impressionEvent = l_jest_0.fn()
                }
            }
        });
        table.insert(v35, {
            l_RoactNavigation_0.Provider, 
            {
                value = l_llama_0.Dictionary.join(v30, v33.navigation)
            }
        });
        table.insert(v35, {
            l_DesignTokenProvider_0, 
            {
                tokenMappers = {
                    App = function(_, v46) --[[ Line: 381 ]] --[[ Name: App ]]
                        return {
                            Page = {
                                BackgroundColor = v46.Semantic.Color.Background.Default.Color3, 
                                BackgroundTransparency = v46.Semantic.Color.Background.Default.Transparency, 
                                SafeAreaMargin = Vector2.new(v46.Global.Space_800, v46.Global.Space_300)
                            }
                        };
                    end, 
                    FriendsLanding = function(_, _) --[[ Line: 390 ]] --[[ Name: FriendsLanding ]]
                        return {
                            AddFriendsPage = {}, 
                            FriendsLandingPage = {
                                GridViewItemMetrics = {
                                    minimumItemsPerRow = 6, 
                                    minimumItemWidth = 258
                                }, 
                                GridHorizontalSpacing = 24, 
                                GridVerticalSpacing = 24
                            }, 
                            ShowMore = {}
                        };
                    end
                }
            }
        });
        local v49 = l_FocusNavigationService_0.new(l_CoreGui_0);
        table.insert(v35, {
            v23.FocusNavigationContext.Provider, 
            {
                value = v49
            }
        });
        table.insert(v35, {
            l_RoactRodux_0.StoreProvider, 
            {
                store = v33.store or v38
            }
        });
        table.insert(v35, {
            l_UIBlox_0.App.Style.AppStyleProvider, 
            {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }
        });
        if l_GetFFlagUIBloxFoundationProvider_0() then
            table.insert(v35, {
                l_Foundation_0.FoundationProvider, 
                {
                    style = {
                        theme = l_Foundation_0.Enums.Theme.Dark, 
                        device = l_Foundation_0.Enums.Device.Desktop
                    }
                }
            });
        end;
        local v50 = l_Roact_0.createElement(v32, l_llama_0.Dictionary.join(v33.props));
        local v51 = v8(v50, v35);
        local v52 = l_Roact_0.mount(v31(v51), l_ScreenGui_0);
        return l_ScreenGui_0, function() --[[ Line: 456 ]]
            -- upvalues: l_Roact_0 (ref), v52 (copy), l_ScreenGui_0 (copy), v49 (copy)
            l_Roact_0.unmount(v52);
            l_ScreenGui_0:Destroy();
            v49:focusGuiObject(nil);
            v49:teardown();
        end;
    end;
end;