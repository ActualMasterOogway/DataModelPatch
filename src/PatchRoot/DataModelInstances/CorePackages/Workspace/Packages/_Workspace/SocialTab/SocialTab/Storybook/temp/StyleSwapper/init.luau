local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UiModeStyleProvider_0 = v1.UiModeStyleProvider;
local v4 = require(script.Parent.mockLocale);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_RadioButtonList_0 = l_UIBlox_0.App.InputButton.RadioButtonList;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Rodux_0 = v1.Rodux;
local v10 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local function v17(v12) --[[ Line: 22 ]]
    -- upvalues: l_Roact_0 (copy), l_RadioButtonList_0 (copy), l_UIBlox_0 (copy)
    local v13 = {
        "Dark", 
        "Light"
    };
    local v15 = {
        radioButtonList = l_Roact_0.createElement(l_RadioButtonList_0, {
            radioButtons = v13, 
            onActivated = function(v14) --[[ Line: 30 ]] --[[ Name: onActivated ]]
                -- upvalues: v12 (copy), v13 (copy)
                v12.updateStyle(v13[v14]);
            end, 
            initialValue = table.find(v13, v12.styleName) or 1, 
            elementSize = UDim2.new(1, 0, 0, 40)
        })
    };
    return l_UIBlox_0.Style.withStyle(function(v16) --[[ Line: 37 ]]
        -- upvalues: l_Roact_0 (ref), v12 (copy), v15 (copy)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            sideBar = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, v12.width, 1, 0), 
                BackgroundColor3 = v16.Theme.BackgroundDefault.Color, 
                LayoutOrder = 1
            }, v15), 
            viewPort = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, -v12.width, 1, 0), 
                BackgroundColor3 = Color3.fromRGB(222, 255, 255), 
                LayoutOrder = 2
            }, v12[l_Roact_0.Children])
        });
    end);
end;
local function v21() --[[ Line: 59 ]]
    -- upvalues: l_Rodux_0 (copy)
    local v18 = {
        style = "Light"
    };
    return (l_Rodux_0.Store.new(function(v19, v20) --[[ Line: 64 ]]
        if v20.type == "receivedStyle" then
            return {
                style = v20.style
            };
        else
            return v19;
        end;
    end, v18, {
        l_Rodux_0.thunkMiddleware
    }));
end;
local v26 = l_RoactRodux_0.connect(function(v22) --[[ Line: 94 ]]
    return {
        styleName = v22.style
    };
end, function(v23) --[[ Line: 98 ]]
    return {
        updateStyle = function(v24) --[[ Line: 100 ]] --[[ Name: updateStyle ]]
            -- upvalues: v23 (copy)
            return v23({
                type = "receivedStyle", 
                style = v24
            });
        end
    };
end)(function(v25) --[[ Line: 78 ]]
    -- upvalues: l_Roact_0 (copy), l_UiModeStyleProvider_0 (copy), v17 (copy)
    return l_Roact_0.createElement(l_UiModeStyleProvider_0, {
        style = {
            themeName = v25.styleName
        }
    }, {
        viewportWithSidebar = l_Roact_0.createElement(v17, {
            width = v25.sideBarWidth, 
            updateStyle = v25.updateStyle, 
            styleName = v25.styleName
        }, {
            Story = l_Roact_0.createElement(v25.story)
        })
    });
end);
return function() --[[ Line: 109 ]]
    -- upvalues: l_mockApolloClient_0 (copy), l_Roact_0 (copy), l_RoactRodux_0 (copy), v21 (copy), v10 (copy), v26 (ref), v4 (copy)
    return function(v27, v28) --[[ Line: 110 ]]
        -- upvalues: l_mockApolloClient_0 (ref), l_Roact_0 (ref), l_RoactRodux_0 (ref), v21 (ref), v10 (ref), v26 (ref), v4 (ref)
        local v29 = l_mockApolloClient_0({});
        local v30 = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v21()
        }, {
            l_Roact_0.createElement(v10.ApolloProvider, {
                client = v29
            }, {
                container = l_Roact_0.createElement(v26, {
                    story = v27, 
                    sideBarWidth = 100
                })
            })
        });
        local v31 = l_Roact_0.mount(v4(v30), v28, "StoryRoot");
        return function() --[[ Line: 128 ]]
            -- upvalues: l_Roact_0 (ref), v31 (copy)
            l_Roact_0.unmount(v31);
        end;
    end;
end;