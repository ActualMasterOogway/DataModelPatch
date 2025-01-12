local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.SocialLibraries);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = require(l_script_FirstAncestor_0.Components.ChatDetails.Dialogs.GenericDialogType);
local v8 = require(l_script_FirstAncestor_0.createChatTopBar);
local l_ModalBottomSheet_0 = v3.ModalBottomSheet;
local l_Warning_0 = v4.Components.AlertViews.Warning;
local function v12(v11) --[[ Line: 16 ]] --[[ Name: GenericButton ]]
    -- upvalues: v2 (copy)
    return v2.createElement("TextButton", {
        AnchorPoint = v11.AnchorPoint or Vector2.new(0.5, 0), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        Font = Enum.Font.Gotham, 
        LayoutOrder = v11.LayoutOrder or 1, 
        Size = v11.Size or UDim2.new(0, 200, 0, 30), 
        Position = v11.Position or UDim2.new(0, 0, 0, 0), 
        Text = v11.Text, 
        TextColor3 = Color3.new(0, 0, 0), 
        TextSize = 18, 
        [v2.Event.Activated] = v11.onActivated
    });
end;
return {
    ChatLanding = function(v13) --[[ Line: 31 ]] --[[ Name: ChatLanding ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy), v12 (copy), v6 (copy)
        local l_navigation_0 = v13.navigation;
        local v15 = l_navigation_0.getScreenProps("wideMode", false);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v13, {
                backButtonDisabled = true, 
                barHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
                headerText = "Chat"
            })), 
            CreateNewChat = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 90), 
                Text = "CreateNewChat", 
                onActivated = function() --[[ Line: 48 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_0 (copy), v6 (ref)
                    l_navigation_0.navigate(v6.CreateNewChat);
                end
            }), 
            ChatConversation1 = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 150), 
                Text = "ChatConversation123", 
                onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_0 (copy), v6 (ref)
                    l_navigation_0.navigate(v6.ChatConversation, {
                        conversationId = 123
                    });
                end
            }), 
            ChatConversation2 = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 180), 
                Text = "ChatConversation456", 
                onActivated = function() --[[ Line: 62 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_0 (copy), v6 (ref)
                    l_navigation_0.navigate(v6.ChatConversation, {
                        conversationId = 456
                    });
                end
            }), 
            EmptyConversation = v15 and v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 220), 
                Text = "Empty Conv", 
                onActivated = function() --[[ Line: 69 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_0 (copy)
                    l_navigation_0.navigate("EmptyConversation");
                end
            })
        });
    end, 
    CreateNewChat = function(v16) --[[ Line: 76 ]] --[[ Name: CreateNewChat ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy), v12 (copy), v6 (copy)
        local l_navigation_1 = v16.navigation;
        local v18 = l_navigation_1.getScreenProps("wideMode", false);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v16, {
                barHeight = l_navigation_1.getScreenProps("topBarHeight", 0), 
                headerText = "CreateNewChat"
            })), 
            ChatConversation = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "ChatConversation123", 
                onActivated = function() --[[ Line: 92 ]] --[[ Name: onActivated ]]
                    -- upvalues: v18 (copy), l_navigation_1 (copy), v6 (ref)
                    if v18 then
                        l_navigation_1.navigate(v6.ChatConversation, {
                            conversationId = 123
                        });
                        return;
                    else
                        l_navigation_1.replace(v6.ChatConversation, {
                            conversationId = 123
                        });
                        return;
                    end;
                end
            })
        });
    end, 
    EmptyConversation = function(v19) --[[ Line: 103 ]] --[[ Name: EmptyConversation ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy)
        return v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0, 
            Font = Enum.Font.Gotham, 
            Text = "Empty Conversation page", 
            TextColor3 = Color3.new(0, 0, 0), 
            TextSize = 18
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v19, {
                backButtonDisabled = true, 
                barHeight = v19.navigation.getScreenProps("topBarHeight", 0), 
                headerText = "No Title"
            }))
        });
    end, 
    ChatConversation = function(v20) --[[ Line: 121 ]] --[[ Name: ChatConversation ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy), v12 (copy), v6 (copy)
        local l_navigation_2 = v20.navigation;
        local v22 = l_navigation_2.getParam("conversationId", 0);
        local v23 = l_navigation_2.getScreenProps("wideMode", false);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v20, {
                backButtonDisabled = v23, 
                barHeight = l_navigation_2.getScreenProps("topBarHeight", 0), 
                headerText = "Conversation" .. tostring(v22)
            })), 
            ChatDetails = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "ChatDetails", 
                onActivated = function() --[[ Line: 139 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_2 (copy), v6 (ref), v22 (copy)
                    l_navigation_2.navigate(v6.ChatDetails, {
                        conversationId = v22
                    });
                end
            })
        });
    end, 
    ChatDetails = function(v24) --[[ Line: 146 ]] --[[ Name: ChatDetails ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy), v12 (copy), v6 (copy)
        local l_navigation_3 = v24.navigation;
        local v26 = l_navigation_3.getParam("conversationId", 0);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v24, {
                barHeight = l_navigation_3.getScreenProps("topBarHeight", 0), 
                headerText = "ChatDetails" .. v26
            })), 
            EditChatMembers = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "EditChatMembers", 
                onActivated = function() --[[ Line: 162 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_3 (copy), v6 (ref), v26 (copy)
                    l_navigation_3.push(v6.EditChatMembers, {
                        conversationId = v26
                    });
                end
            })
        });
    end, 
    EditChatMembers = function(v27) --[[ Line: 169 ]] --[[ Name: EditChatMembers ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy), v12 (copy), v6 (copy)
        local l_navigation_4 = v27.navigation;
        local v29 = l_navigation_4.getParam("conversationId", 0);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v27, {
                barHeight = l_navigation_4.getScreenProps("topBarHeight", 0), 
                headerText = "EditChatMembers"
            })), 
            ChatConversation = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "Back To Conversation", 
                onActivated = function() --[[ Line: 185 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_4 (copy), v6 (ref), v29 (copy)
                    l_navigation_4.navigate(v6.ChatConversation, {
                        conversationId = v29
                    });
                end
            })
        });
    end, 
    ChatDetailsWithModals = function(v30) --[[ Line: 192 ]] --[[ Name: ChatDetailsWithModals ]]
        -- upvalues: v2 (copy), v8 (copy), v5 (copy), v12 (copy), v7 (copy)
        local l_navigation_5 = v30.navigation;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ChatTopBar = v8(v5.Dictionary.join(v30, {
                backButtonDisabled = true, 
                barHeight = l_navigation_5.getScreenProps("topBarHeight", 0), 
                contentHeight = l_navigation_5.getScreenProps("contentHeight", 0), 
                headerText = "ChatDetails", 
                LayoutOrder = 0
            })), 
            EditChatGroupName = v2.createElement(v12, {
                LayoutOrder = 1, 
                Text = "EditChatGroupName", 
                onActivated = function() --[[ Line: 215 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_5 (copy), v7 (ref)
                    l_navigation_5.navigate(v7.EditChatGroupNameDialog);
                end
            }), 
            LeaveGroup = v2.createElement(v12, {
                LayoutOrder = 2, 
                Text = "LeaveGroup", 
                onActivated = function() --[[ Line: 222 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_5 (copy), v7 (ref)
                    l_navigation_5.navigate(v7.LeaveGroupDialog);
                end
            }), 
            RemoveUser = v2.createElement(v12, {
                LayoutOrder = 3, 
                Text = "RemoveUser", 
                onActivated = function() --[[ Line: 229 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_5 (copy), v7 (ref)
                    l_navigation_5.navigate(v7.RemoveUserDialog);
                end
            }), 
            ModalBottomSheet = v2.createElement(v12, {
                LayoutOrder = 4, 
                Text = "ModalBottomSheet", 
                onActivated = function() --[[ Line: 236 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_navigation_5 (copy), v7 (ref)
                    l_navigation_5.navigate(v7.ParticipantDialog);
                end
            })
        });
    end, 
    EditChatGroupNameDialog = function(v32) --[[ Line: 243 ]] --[[ Name: EditChatGroupNameDialog ]]
        -- upvalues: v2 (copy), l_Warning_0 (copy)
        return v2.createElement(l_Warning_0, {
            titleText = "EditChatGroupName", 
            bodyText = "Change to new name?", 
            onModalClose = function() --[[ Line: 247 ]] --[[ Name: onModalClose ]]
                -- upvalues: v32 (copy)
                v32.navigation.goBack();
            end
        });
    end, 
    LeaveGroupDialog = function(v33) --[[ Line: 253 ]] --[[ Name: LeaveGroupDialog ]]
        -- upvalues: v2 (copy), l_Warning_0 (copy)
        return v2.createElement(l_Warning_0, {
            titleText = "LeaveGroup", 
            bodyText = "Leave group?", 
            onModalClose = function() --[[ Line: 257 ]] --[[ Name: onModalClose ]]
                -- upvalues: v33 (copy)
                v33.navigation.goBack();
            end
        });
    end, 
    ParticipantDialog = function(v34) --[[ Line: 273 ]] --[[ Name: ParticipantDialog ]]
        -- upvalues: v2 (copy), l_ModalBottomSheet_0 (copy), v7 (copy)
        return v2.createElement(l_ModalBottomSheet_0, {
            bottomGap = 10, 
            onDismiss = function() --[[ Line: 276 ]] --[[ Name: onDismiss ]]
                -- upvalues: v34 (copy)
                v34.navigation.goBack();
            end, 
            buttonModels = {
                {
                    text = "ViewProfile", 
                    onActivated = function() --[[ Line: 282 ]] --[[ Name: onActivated ]]
                        -- upvalues: v34 (copy)
                        v34.navigation.replace("Webview");
                    end
                }, 
                {
                    text = "ReportUser", 
                    onActivated = function() --[[ Line: 288 ]] --[[ Name: onActivated ]]
                        -- upvalues: v34 (copy)
                        v34.navigation.replace("Webview");
                    end
                }, 
                {
                    text = "RemoveUser", 
                    onActivated = function() --[[ Line: 294 ]] --[[ Name: onActivated ]]
                        -- upvalues: v34 (copy), v7 (ref)
                        v34.navigation.replace(v7.RemoveUserDialog);
                    end
                }, 
                {
                    text = "Cancel", 
                    onActivated = function() --[[ Line: 300 ]] --[[ Name: onActivated ]]

                    end
                }
            }, 
            screenWidth = 400, 
            showImages = false
        });
    end, 
    RemoveUserDialog = function(v35) --[[ Line: 263 ]] --[[ Name: RemoveUserDialog ]]
        -- upvalues: v2 (copy), l_Warning_0 (copy)
        return v2.createElement(l_Warning_0, {
            titleText = "RemoveUser", 
            bodyText = "Remove user?", 
            onModalClose = function() --[[ Line: 267 ]] --[[ Name: onModalClose ]]
                -- upvalues: v35 (copy)
                v35.navigation.goBack();
            end
        });
    end, 
    Webview = function(v36) --[[ Line: 308 ]] --[[ Name: Webview ]]
        -- upvalues: v2 (copy), v12 (copy)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            BackButton = v2.createElement(v12, {
                AnchorPoint = Vector2.new(0, 0), 
                Text = "Back", 
                onActivated = function() --[[ Line: 317 ]] --[[ Name: onActivated ]]
                    -- upvalues: v36 (copy)
                    v36.navigation.goBack();
                end
            })
        });
    end
};