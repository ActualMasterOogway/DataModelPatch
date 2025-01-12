local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversation);
local v4 = v2.PureComponent:extend("Story");
local v5 = require(l_script_FirstAncestor_0.Tests.Utils.createMockMessages);
v4.init = function(v6) --[[ Line: 12 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v6.conversation1 = {
        id = "CONVERSATION_ONE", 
        itemList = v5({
            messageIdPrefix = "CONVERSATION_ONE", 
            read = true
        }, 50)
    };
    v6.conversation2 = {
        id = "CONVERSATION_TWO", 
        itemList = v5({
            messageIdPrefix = "CONVERSATION_TWO", 
            read = true
        }, 40)
    };
    v6.makeChatNotVisible = function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            chatIsVisible = false
        });
    end;
    v6.switchConversations = function() --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            conversation = v6.state.conversation.id == "CONVERSATION_ONE" and v6.conversation2 or v6.conversation1
        });
    end;
    v6.switchUnreadStatus = function() --[[ Line: 35 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            readingMessagesIsEnabled = not v6.state.readingMessagesIsEnabled
        });
    end;
    v6.state = {
        conversation = v6.conversation1, 
        readingMessagesIsEnabled = v6.props.initialReadingMessagesIsEnabled, 
        chatIsVisible = v6.props.initialChatIsVisible or true
    };
end;
v4.render = function(v7) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createFragment({
        layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        chatConversation = v2.createElement(v3, {
            itemList = v7.state.conversation.itemList, 
            conversationId = v7.state.conversation.id, 
            markConversationAsRead = v7.props.markConversationAsRead or function() --[[ Line: 58 ]]

            end, 
            readingMessagesIsEnabled = v7.state.readingMessagesIsEnabled, 
            chatIsVisible = v7.state.chatIsVisible, 
            replyingToMessageDispatch = v7.props.replyingToMessageDispatch or function() --[[ Line: 61 ]]

            end
        }), 
        makeChatNotVisibleButton = v2.createElement("TextButton", {
            Size = UDim2.new(0, 120, 0, 50), 
            Text = "Make Chat Not Visible", 
            [v2.Event.Activated] = v7.makeChatNotVisible
        }), 
        switchConversationButton = v2.createElement("TextButton", {
            Size = UDim2.new(0, 120, 0, 50), 
            Text = "Switch Conversations", 
            [v2.Event.Activated] = v7.switchConversations
        }), 
        toggleReadState = v2.createElement("TextButton", {
            Size = UDim2.new(0, 120, 0, 50), 
            Text = "Toggle UnreadStatus", 
            [v2.Event.Activated] = v7.switchUnreadStatus
        })
    });
end;
return function(v8) --[[ Line: 84 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromRGB(244, 244, 244), 
        Size = UDim2.new(0, 512, 0, 300)
    }, {
        ChatConversation = v2.createElement(v4, v8)
    });
end;