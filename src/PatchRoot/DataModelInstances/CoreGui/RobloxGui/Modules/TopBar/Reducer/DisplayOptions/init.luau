local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.SetMenuOpen);
local v6 = require(l_Actions_0.SetTopBarEnabled);
local v7 = require(l_Actions_0.SetSmallTouchDevice);
local v8 = require(l_Actions_0.SetScreenSize);
local v9 = require(l_Actions_0.SetKeepOutArea);
local v10 = require(l_Actions_0.RemoveKeepOutArea);
local v11 = require(l_Actions_0.SetInputType);
local v12 = require(l_Actions_0.SetInspectMenuOpen);
local v13 = require(l_Actions_0.SetGamepadMenuOpen);
local v14 = require(l_Actions_0.SetGamepadNavigationDialogOpen);
local v15 = require(script.Parent.Parent.Flags.FFlagGamepadNavigationDialogABTest);
local l_InputType_0 = require(l_Parent_0.Constants).InputType;
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v18 = {
    menuOpen = false, 
    inspectMenuOpen = false, 
    topbarEnabled = true, 
    isSmallTouchDevice = false, 
    screenSize = Vector2.new(0, 0), 
    inputType = l_InputType_0.MouseAndKeyBoard, 
    isGamepadMenuOpen = false, 
    isGamepadNavigationDialogOpen = not v15 and nil, 
    keepOutAreas = {}
};
return (v1.createReducer(v18, {
    [v5.name] = function(v19, v20) --[[ Line: 41 ]]
        -- upvalues: v2 (copy)
        local l_isGamepadMenuOpen_0 = v19.isGamepadMenuOpen;
        if not v19.menuOpen and v20.menuOpen then
            l_isGamepadMenuOpen_0 = false;
        end;
        return v2.Dictionary.join(v19, {
            menuOpen = v20.menuOpen, 
            isGamepadMenuOpen = l_isGamepadMenuOpen_0
        });
    end, 
    [v6.name] = function(v22, v23) --[[ Line: 54 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v22, {
            topbarEnabled = v23.enabled
        });
    end, 
    [v7.name] = function(v24, v25) --[[ Line: 60 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v24, {
            isSmallTouchDevice = v25.isSmallTouchDevice
        });
    end, 
    [v8.name] = function(v26, v27) --[[ Line: 66 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v26, {
            screenSize = v27.screenSize
        });
    end, 
    [v11.name] = function(v28, v29) --[[ Line: 72 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v28, {
            inputType = v29.inputType
        });
    end, 
    [v12.name] = function(v30, v31) --[[ Line: 78 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v30, {
            inspectMenuOpen = v31.inspectMenuOpen
        });
    end, 
    [v13.name] = function(v32, v33) --[[ Line: 84 ]]
        -- upvalues: v2 (copy), v15 (copy)
        return v2.Dictionary.join(v32, {
            isGamepadMenuOpen = v33.open, 
            isGamepadNavigationDialogOpen = not v15 and nil
        });
    end, 
    [v14.name] = v15 and function(v34, v35) --[[ Line: 92 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v34, {
            isGamepadNavigationDialogOpen = v35.open
        });
    end or nil, 
    [v9.name] = function(v36, v37) --[[ Line: 99 ]]
        -- upvalues: v2 (copy)
        local v38 = table.clone(v36.keepOutAreas);
        v38[v37.id] = {
            size = v37.size, 
            position = v37.position
        };
        return v2.Dictionary.join(v36, {
            keepOutAreas = v38
        });
    end, 
    [v10.name] = function(v39, v40) --[[ Line: 111 ]]
        -- upvalues: v2 (copy)
        local v41 = table.clone(v39.keepOutAreas);
        v41[v40.id] = nil;
        return v2.Dictionary.join(v39, {
            keepOutAreas = v41
        });
    end
}));