local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Memory.ClientMemory);
local v5 = require(l_Components_0.Memory.ServerMemory);
local v6 = require(l_Components_0.UtilAndTab);
local v7 = require(l_Components_0.DataConsumer);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v9 = require(l_Actions_0.ClientMemoryUpdateSearchFilter);
local v10 = require(l_Actions_0.ServerMemoryUpdateSearchFilter);
local v11 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v11.GeneralFormatting.MainRowPadding;
local v13 = v1.Component:extend("LogButton");
v13.init = function(v14) --[[ Line: 21 ]] --[[ Name: init ]]
    v14.onAction = function() --[[ Line: 22 ]]
        -- upvalues: v14 (copy)
        local v15 = v14.props.isClientView and v14.props.ClientMemoryData or v14.props.ServerMemoryData;
        local v16 = "\n";
        local function _(v17) --[[ Line: 25 ]] --[[ Name: line ]]
            -- upvalues: v16 (ref)
            v16 = v16 .. v17 .. "\n";
        end;
        v16 = v16 .. "Name                                       Min   Max" .. "\n";
        v16 = v16 .. "----------------------------------------   ---   ---" .. "\n";
        local function v19(v20, v21, v22) --[[ Line: 32 ]] --[[ Name: recurseMemoryTree ]]
            -- upvalues: v16 (ref), v19 (copy)
            local v23 = string.format("%s %s %s %3d   %3d", string.rep(" ", v22), v20, string.rep(" ", 40 - v22 - #v20), v21.min, v21.max);
            v16 = v16 .. v23 .. "\n";
            if v21.children then
                for v24, v25 in pairs(v21.children) do
                    v19(v24, v25, v22 + 2);
                end;
            end;
        end;
        v19("Memory", v15._memoryData.Memory, 0);
        print(v16);
    end;
end;
v13.render = function(v26) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v11 (copy)
    return v1.createElement("TextButton", {
        Text = "Log", 
        Visible = true, 
        BorderSizePixel = 1, 
        BackgroundColor3 = v11.Color.UnselectedGray, 
        TextColor3 = v11.Color.Text, 
        [v1.Event.Activated] = v26.onAction
    });
end;
v13 = v7(v13, "ClientMemoryData", "ServerMemoryData");
local v27 = v1.Component:extend("MainViewMemory");
v27.init = function(v28) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v28.onUtilTabHeightChanged = function(v29) --[[ Line: 68 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            utilTabHeight = v29
        });
    end;
    v28.onClientButton = function() --[[ Line: 74 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            isClientView = true
        });
    end;
    v28.onServerButton = function() --[[ Line: 78 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            isClientView = false
        });
    end;
    v28.onSearchTermChanged = function(v30) --[[ Line: 82 ]]
        -- upvalues: v28 (copy)
        if v28.state.isClientView then
            v28.props.dispatchClientMemoryUpdateSearchFilter(v30, {});
            return;
        else
            v28.props.dispatchServerMemoryUpdateSearchFilter(v30, {});
            return;
        end;
    end;
    v28.utilRef = v1.createRef();
    v28.state = {
        utilTabHeight = 0, 
        isClientView = true
    };
end;
v27.didMount = function(v31) --[[ Line: 98 ]] --[[ Name: didMount ]]
    v31:setState({
        utilTabHeight = v31.utilRef.current.Size.Y.Offset
    });
end;
v27.didUpdate = function(v32) --[[ Line: 105 ]] --[[ Name: didUpdate ]]
    local l_Offset_0 = v32.utilRef.current.Size.Y.Offset;
    if l_Offset_0 ~= v32.state.utilTabHeight then
        v32:setState({
            utilTabHeight = l_Offset_0
        });
    end;
end;
v27.render = function(v34) --[[ Line: 116 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_MainRowPadding_0 (copy), v6 (copy), v13 (ref), v4 (copy), v5 (copy), v11 (copy)
    local v35 = {};
    local l_size_0 = v34.props.size;
    local l_isDeveloperView_0 = v34.props.isDeveloperView;
    local l_formFactor_0 = v34.props.formFactor;
    local l_tabList_0 = v34.props.tabList;
    local l_utilTabHeight_0 = v34.state.utilTabHeight;
    local l_isClientView_0 = v34.state.isClientView;
    local v42 = l_isClientView_0 and v34.props.clientSearchTerm or v34.props.serverSearchTerm;
    v35.UIListLayout = v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_MainRowPadding_0)
    });
    v35.UtilAndTab = v1.createElement(v6, {
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        isClientView = l_isClientView_0, 
        searchTerm = v42, 
        layoutOrder = 1, 
        refForParent = v34.utilRef, 
        onHeightChanged = v34.onUtilTabHeightChanged, 
        onClientButton = l_isDeveloperView_0 and v34.onClientButton, 
        onServerButton = l_isDeveloperView_0 and v34.onServerButton, 
        onSearchTermChanged = v34.onSearchTermChanged
    }, {
        v13 and v1.createElement(v13, {
            isClientView = l_isClientView_0
        })
    });
    if l_utilTabHeight_0 > 0 then
        if l_isClientView_0 then
            v35.ClientMemory = v1.createElement(v4, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v42, 
                layoutOrder = 2
            });
        else
            v35.ServerMemory = v1.createElement(v5, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v42, 
                layoutOrder = 2
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v11.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, v35);
end;
return v2.UNSTABLE_connect2(function(v43, _) --[[ Line: 174 ]] --[[ Name: mapStateToProps ]]
    return {
        clientSearchTerm = v43.MemoryData.clientSearchTerm, 
        clientTypeFilters = v43.MemoryData.clientTypeFilters, 
        serverSearchTerm = v43.MemoryData.serverSearchTerm, 
        serverTypeFilters = v43.MemoryData.serverTypeFilters
    };
end, function(v45) --[[ Line: 183 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        dispatchClientMemoryUpdateSearchFilter = function(v46, v47) --[[ Line: 185 ]] --[[ Name: dispatchClientMemoryUpdateSearchFilter ]]
            -- upvalues: v45 (copy), v9 (ref)
            v45(v9(v46, v47));
        end, 
        dispatchServerMemoryUpdateSearchFilter = function(v48, v49) --[[ Line: 189 ]] --[[ Name: dispatchServerMemoryUpdateSearchFilter ]]
            -- upvalues: v45 (copy), v10 (ref)
            v45(v10(v48, v49));
        end
    };
end)(v27);