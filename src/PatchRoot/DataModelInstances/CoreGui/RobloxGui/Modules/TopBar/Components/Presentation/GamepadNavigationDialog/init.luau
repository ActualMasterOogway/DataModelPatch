local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("AppStorageService");
local _ = game:GetService("HttpService");
local _ = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local _ = v6.Core.Style.withStyle;
local v9 = require(script.GamepadNavigationDialogShowCounter);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Parent.Actions;
local v12 = require(l_Actions_0.SetGamepadNavigationDialogOpen);
local v13 = require(script.Parent.Parent.Parent.Flags.GetFStringGamepadNavigationDialogABTestLayerName);
local v14 = require(script.Parent.Parent.Parent.Flags.FFlagAlwaysShowGamepadNavigationDialog);
local v15 = require(script.Parent.Parent.Parent.Flags.FFlagAlwaysSelectButtonDismissesGamepadNavigationDialog);
local v16 = require(l_Parent_0.Parent.Flags.GetFIntGamepadNavigationDialogShowCount);
local v17 = v13();
local v21 = v7.connectUserLayer({
    v17
}, function(v18, _) --[[ Line: 30 ]]
    -- upvalues: v17 (copy), v14 (copy), v15 (copy), v16 (copy)
    local v20 = v18[v17] or {};
    return {
        isGamepadNavigationDialogEnabled = v14 or v20.isGamepadNavigationDialogEnabled, 
        selectButtonDismissesGamepadNavigationDialog = v15 or v20.selectButtonDismissesGamepadNavigationDialog, 
        appStorageKey = "GamepadMenuVirtualCursorPromptShown", 
        maxShownCount = v16()
    };
end)(v9);
return v4.connect(function(v22) --[[ Line: 43 ]]
    return {
        isGamepadNavigationDialogOpen = v22.displayOptions.isGamepadNavigationDialogOpen
    };
end, function(v23) --[[ Line: 47 ]]
    -- upvalues: v12 (copy)
    return {
        SetGamepadNavigationDialogOpen = function(v24) --[[ Line: 49 ]] --[[ Name: SetGamepadNavigationDialogOpen ]]
            -- upvalues: v23 (copy), v12 (ref)
            return v23(v12(v24));
        end
    };
end)(v21);