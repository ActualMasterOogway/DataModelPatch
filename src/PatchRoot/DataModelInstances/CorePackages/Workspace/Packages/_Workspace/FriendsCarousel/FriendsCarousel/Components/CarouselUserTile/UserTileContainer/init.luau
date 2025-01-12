local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_llama_0 = v1.llama;
local v5 = require(script.Parent.userTileMapStateToProps);
local v6 = require(script.Parent.userTileMapDispatchToProps);
local v7 = require(script.Parent.CarouselUserTile);
local v8 = require(l_Parent_0.Analytics);
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.Common.LocalTypes);
local v11 = l_Roact_0.PureComponent:extend("UserTileContainer");
v11.render = function(v12) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy), l_llama_0 (copy)
    local l_props_0 = v12.props;
    return l_Roact_0.createElement(v7, l_llama_0.Dictionary.join(l_props_0, {
        fireEvent = l_llama_0.None, 
        userSeen = l_llama_0.None
    }));
end;
v11.didMount = function(v14) --[[ Line: 33 ]] --[[ Name: didMount ]]
    local l_props_1 = v14.props;
    l_props_1.userSeen(l_props_1.user, {
        absolutePosition = l_props_1.absoluteIndex
    });
end;
return l_compose_0(l_RoactRodux_0.connect(v5, v6), v8.connect(function(v16) --[[ Line: 43 ]]
    return {
        fireEvent = v16.fireEvent
    };
end))(v11);