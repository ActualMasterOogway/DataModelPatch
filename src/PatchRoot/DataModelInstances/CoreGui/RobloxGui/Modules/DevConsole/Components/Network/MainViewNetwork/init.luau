local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Network.ClientNetwork);
local v5 = require(l_Components_0.Network.ServerNetwork);
local v6 = require(l_Components_0.UtilAndTab);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v8 = require(l_Actions_0.ClientNetworkUpdateSearchFilter);
local v9 = require(l_Actions_0.ServerNetworkUpdateSearchFilter);
local v10 = require(l_Actions_0.SetActiveTab);
local v11 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v11.GeneralFormatting.MainRowPadding;
local v13 = v1.Component:extend("MainViewNetwork");
v13.init = function(v14) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v14.onUtilTabHeightChanged = function(v15) --[[ Line: 21 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            utilTabHeight = v15
        });
    end;
    v14.onClientButton = function() --[[ Line: 27 ]]
        -- upvalues: v14 (copy)
        v14.props.dispatchSetActiveTab("Network", true);
    end;
    v14.onServerButton = function() --[[ Line: 31 ]]
        -- upvalues: v14 (copy)
        v14.props.dispatchSetActiveTab("Network", false);
    end;
    v14.onSearchTermChanged = function(v16) --[[ Line: 35 ]]
        -- upvalues: v14 (copy)
        if v14.props.isClientView then
            v14.props.dispatchClientNetworkUpdateSearchFilter(v16, {});
            return;
        else
            v14.props.dispatchServerNetworkUpdateSearchFilter(v16, {});
            return;
        end;
    end;
    v14.utilRef = v1.createRef();
    v14.state = {
        utilTabHeight = 0
    };
end;
v13.didMount = function(v17) --[[ Line: 50 ]] --[[ Name: didMount ]]
    v17:setState({
        utilTabHeight = v17.utilRef.current.Size.Y.Offset
    });
end;
v13.didUpdate = function(v18) --[[ Line: 57 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v18.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v18.state.utilTabHeight then
        v18:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v13.render = function(v20) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_MainRowPadding_0 (copy), v6 (copy), v4 (copy), v5 (copy), v11 (copy)
    local v21 = {};
    local l_size_0 = v20.props.size;
    local l_formFactor_0 = v20.props.formFactor;
    local l_tabList_0 = v20.props.tabList;
    local l_isClientView_0 = v20.props.isClientView;
    local l_utilTabHeight_0 = v20.state.utilTabHeight;
    local v27 = l_isClientView_0 and v20.props.clientSearchTerm or v20.props.serverSearchTerm;
    v21.UIListLayout = v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_MainRowPadding_0)
    });
    v21.UtilAndTab = v1.createElement(v6, {
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        isClientView = l_isClientView_0, 
        searchTerm = v27, 
        layoutOrder = 1, 
        refForParent = v20.utilRef, 
        onHeightChanged = v20.onUtilTabHeightChanged, 
        onClientButton = v20.onClientButton, 
        onServerButton = v20.onServerButton, 
        onSearchTermChanged = v20.onSearchTermChanged
    });
    if l_utilTabHeight_0 > 0 then
        if l_isClientView_0 then
            v21.ClientNetwork = v1.createElement(v4, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v27, 
                layoutOrder = 2
            });
        else
            v21.ServerNetwork = v1.createElement(v5, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v27, 
                layoutOrder = 2
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v11.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, v21);
end;
return v2.UNSTABLE_connect2(function(v28, _) --[[ Line: 121 ]] --[[ Name: mapStateToProps ]]
    return {
        isClientView = v28.MainView.isClientView, 
        clientSearchTerm = v28.NetworkData.clientSearchTerm, 
        serverSearchTerm = v28.NetworkData.serverSearchTerm
    };
end, function(v30) --[[ Line: 129 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v9 (copy), v10 (copy)
    return {
        dispatchClientNetworkUpdateSearchFilter = function(v31, v32) --[[ Line: 131 ]] --[[ Name: dispatchClientNetworkUpdateSearchFilter ]]
            -- upvalues: v30 (copy), v8 (ref)
            v30(v8(v31, v32));
        end, 
        dispatchServerNetworkUpdateSearchFilter = function(v33, v34) --[[ Line: 135 ]] --[[ Name: dispatchServerNetworkUpdateSearchFilter ]]
            -- upvalues: v30 (copy), v9 (ref)
            v30(v9(v33, v34));
        end, 
        dispatchSetActiveTab = function(v35, v36) --[[ Line: 138 ]] --[[ Name: dispatchSetActiveTab ]]
            -- upvalues: v30 (copy), v10 (ref)
            v30(v10(v35, v36));
        end
    };
end)(v13);