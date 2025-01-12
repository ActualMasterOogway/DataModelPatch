local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigationCore");
local v1 = require(l_script_FirstAncestor_0.createAdaptiveStackNavigator);
local v2 = require(l_script_FirstAncestor_0.createMainSwitchNavigator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_Parent_0.NavigationRodux);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v8 = game:DefineFastString("RootNavigatorInitialRouteName", (tostring(l_AppPage_0.PlatformAccountRouter)));
local function v9() --[[ Line: 16 ]]
    return {
        transitionSpec = {
            frequency = 1000000, 
            dampingRatio = 1
        }
    };
end;
return function(v10, v11) --[[ Line: 29 ]] --[[ Name: createRootNavigator ]]
    -- upvalues: v6 (copy), v2 (copy), v1 (copy), v8 (copy), v4 (copy), v9 (copy)
    local v12 = {};
    for v13, v14 in v11 do
        v12[v14] = v13;
    end;
    local v15 = {};
    local v16 = {};
    for _, v18 in v10 do
        if v12[next(v18)] ~= nil then
            table.insert(v15, v18);
        else
            table.insert(v16, v18);
        end;
    end;
    table.sort(v15, function(v19, v20) --[[ Line: 52 ]]
        -- upvalues: v12 (copy)
        local v21 = next(v19);
        local v22 = next(v20);
        return v12[v21] < v12[v22];
    end);
    table.insert(v16, {
        [v6.Constants.TempRnSwitchNavigatorName] = v2(v15)
    });
    return v1(v16, {
        initialRouteName = v8, 
        mode = v4.StackPresentationStyle.Overlay, 
        transitionConfig = v9, 
        defaultNavigationOptions = {
            absorbInputSelectable = false, 
            overlayTransparency = 0.3
        }
    });
end;