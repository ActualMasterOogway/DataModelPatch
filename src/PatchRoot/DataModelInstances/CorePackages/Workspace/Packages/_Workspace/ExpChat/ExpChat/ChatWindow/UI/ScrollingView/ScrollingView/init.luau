local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_script_FirstAncestor_0.ChatWindow.UI.BottomLockedScrollView);
local v4 = (if require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatWindowMemoization)() then v2.PureComponent else v2.Component):extend("ScrollingView");
v4.defaultProps = {};
v4.render = function(v5) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = v5.props.size
    }, {
        bottomLockedScrollView = v2.createElement(v3, {
            Size = UDim2.fromScale(1, 1), 
            messages = v5.props.messages, 
            targetTextChannel = v5.props.targetTextChannel, 
            isChannelBarVisible = v5.props.isChannelBarVisible
        }, v5.props[v2.Children])
    });
end;
return v4;