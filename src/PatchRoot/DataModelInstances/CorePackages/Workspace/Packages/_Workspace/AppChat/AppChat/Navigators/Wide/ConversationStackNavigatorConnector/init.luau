local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v6 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v9 = require(script.Parent.conversationStackNavigator);
local v10 = {
    configureTopBar = v8, 
    createNewNavigator = v9
};
ConversationStackNavigatorConnector = function(v11) --[[ Line: 31 ]] --[[ Name: ConversationStackNavigatorConnector ]]
    -- upvalues: v4 (copy), v10 (copy), l_memoize_0 (copy), v2 (copy), l_useStyle_0 (copy), v6 (copy)
    local v12 = v4.Dictionary.join(v10, v11);
    local v15 = l_memoize_0(function(v13) --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v2 (ref)
        local v14 = v12.createNewNavigator({
            cardColor3 = v13, 
            transparent = v2() and true or nil
        });
        v12.setRouter(v14.router);
        return v14;
    end);
    local v16 = l_useStyle_0();
    return v6.createElement(v6.Fragment, nil, {
        layout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v12.configureTopBar(v12.navigation), 
        navigatorFrame = v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v12.navigation.getScreenProps("topBarHeight", 0)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            navigator = v6.createElement(v15(v16.Theme.BackgroundDefault.Color), v12)
        })
    });
end;
local v17 = v6.PureComponent:extend("ConversationStackNavigatorConnectorWrapper");
v17.router = v9().router;
v17.render = function(v18) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v4 (copy), v17 (copy)
    return v6.createElement(ConversationStackNavigatorConnector, v4.Dictionary.join(v18.props, {
        setRouter = function(v19) --[[ Line: 69 ]] --[[ Name: setRouter ]]
            -- upvalues: v17 (ref)
            v17.router = v19;
        end
    }));
end;
return v17;