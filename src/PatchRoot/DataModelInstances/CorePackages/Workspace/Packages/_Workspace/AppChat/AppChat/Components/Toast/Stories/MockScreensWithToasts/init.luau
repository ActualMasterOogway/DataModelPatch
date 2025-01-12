local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.createChatTopBar);
return {
    ChatLanding = function(v6) --[[ Line: 11 ]] --[[ Name: ChatLanding ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy)
        local l_navigation_0 = v6.navigation;
        local v8 = l_navigation_0.getScreenProps("wideMode", false);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v6, {
                backButtonDisabled = true, 
                barHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
                headerText = "Chat"
            })), 
            CreateNewChat = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 90), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "CreateNewChat", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 34 ]]
                    -- upvalues: l_navigation_0 (copy), v2 (ref)
                    l_navigation_0.navigate(v2.CreateNewChat);
                end
            }), 
            ChatConversation1 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 150), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatConversation123", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 47 ]]
                    -- upvalues: l_navigation_0 (copy), v2 (ref)
                    l_navigation_0.navigate(v2.ChatConversation, {
                        conversationId = 123
                    });
                end
            }), 
            ChatConversation2 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatConversation456", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 60 ]]
                    -- upvalues: l_navigation_0 (copy), v2 (ref)
                    l_navigation_0.navigate(v2.ChatConversation, {
                        conversationId = 456
                    });
                end
            }), 
            EmptyConversation = v8 and v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 220), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Empty Conv", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 73 ]]
                    -- upvalues: l_navigation_0 (copy)
                    l_navigation_0.navigate("EmptyConversation");
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 280), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 86 ]]
                    -- upvalues: l_navigation_0 (copy), v2 (ref)
                    l_navigation_0.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the ChatLanding screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    CreateNewChat = function(v9) --[[ Line: 99 ]] --[[ Name: CreateNewChat ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy)
        local l_navigation_1 = v9.navigation;
        local v11 = l_navigation_1.getScreenProps("wideMode", false);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v9, {
                barHeight = l_navigation_1.getScreenProps("topBarHeight", 0), 
                headerText = "CreateNewChat"
            })), 
            ChatConversation = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatConversation123", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 121 ]]
                    -- upvalues: v11 (copy), l_navigation_1 (copy), v2 (ref)
                    if v11 then
                        l_navigation_1.navigate(v2.ChatConversation, {
                            conversationId = 123
                        });
                        return;
                    else
                        l_navigation_1.replace(v2.ChatConversation, {
                            conversationId = 123
                        });
                        return;
                    end;
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 250), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 138 ]]
                    -- upvalues: l_navigation_1 (copy), v2 (ref)
                    l_navigation_1.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the CreateNewChat screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    EmptyConversation = function(v12) --[[ Line: 151 ]] --[[ Name: EmptyConversation ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy)
        return v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0, 
            Font = Enum.Font.Gotham, 
            Text = "Empty Conversation page", 
            TextColor3 = Color3.new(0, 0, 0), 
            TextSize = 18
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v12, {
                backButtonDisabled = true, 
                barHeight = v12.navigation.getScreenProps("topBarHeight", 0), 
                headerText = "No Title"
            }))
        });
    end, 
    ChatConversation = function(v13) --[[ Line: 169 ]] --[[ Name: ChatConversation ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy)
        local l_navigation_2 = v13.navigation;
        local v15 = l_navigation_2.getParam("conversationId", 0);
        local v16 = l_navigation_2.getScreenProps("wideMode", false);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v13, {
                backButtonDisabled = v16, 
                barHeight = l_navigation_2.getScreenProps("topBarHeight", 0), 
                headerText = "Conversation" .. tostring(v15)
            })), 
            ChatDetails = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatDetails", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 193 ]]
                    -- upvalues: l_navigation_2 (copy), v2 (ref), v15 (copy)
                    l_navigation_2.navigate(v2.ChatDetails, {
                        conversationId = v15
                    });
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 206 ]]
                    -- upvalues: l_navigation_2 (copy), v2 (ref)
                    l_navigation_2.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the ChatConversation screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    ChatDetails = function(v17) --[[ Line: 219 ]] --[[ Name: ChatDetails ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy)
        local l_navigation_3 = v17.navigation;
        local v19 = l_navigation_3.getParam("conversationId", 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v17, {
                barHeight = l_navigation_3.getScreenProps("topBarHeight", 0), 
                headerText = "ChatDetails" .. v19
            })), 
            EditChatMembers = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "EditChatMembers", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 241 ]]
                    -- upvalues: l_navigation_3 (copy), v2 (ref), v19 (copy)
                    l_navigation_3.push(v2.EditChatMembers, {
                        conversationId = v19
                    });
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 254 ]]
                    -- upvalues: l_navigation_3 (copy), v2 (ref)
                    l_navigation_3.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the ChatDetails screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    EditChatMembers = function(v20) --[[ Line: 267 ]] --[[ Name: EditChatMembers ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy)
        local l_navigation_4 = v20.navigation;
        local v22 = l_navigation_4.getParam("conversationId", 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v20, {
                barHeight = l_navigation_4.getScreenProps("topBarHeight", 0), 
                headerText = "EditChatMembers"
            })), 
            ChatConversation = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Back To Conversation", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 289 ]]
                    -- upvalues: l_navigation_4 (copy), v2 (ref), v22 (copy)
                    l_navigation_4.navigate(v2.ChatConversation, {
                        conversationId = v22
                    });
                end
            }), 
            Toast1 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 302 ]]
                    -- upvalues: l_navigation_4 (copy), v2 (ref)
                    l_navigation_4.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "A Toast this is"
                            }
                        }
                    });
                end
            }), 
            Toast2 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 210), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Different Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function() --[[ Line: 321 ]]
                    -- upvalues: l_navigation_4 (copy), v2 (ref)
                    l_navigation_4.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a different toast"
                            }
                        }
                    });
                end
            })
        });
    end
};