local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.OpenPlayerDropDown);
local v4 = require(l_Actions_0.ClosePlayerDropDown);
local v5 = require(l_Actions_0.RemovePlayer);
local v6 = require(l_Actions_0.SetPlayerListVisibility);
local v7 = {
    isVisible = false, 
    selectedPlayer = nil
};
return (v1.createReducer(v7, {
    [v6.name] = function(v8, v9) --[[ Line: 18 ]]
        if not v9.isVisible then
            return {
                isVisible = false, 
                selectedPlayer = v8.selectedPlayer
            };
        else
            return v8;
        end;
    end, 
    [v3.name] = function(_, v11) --[[ Line: 28 ]]
        return {
            isVisible = true, 
            selectedPlayer = v11.selectedPlayer
        };
    end, 
    [v4.name] = function(v12, _) --[[ Line: 35 ]]
        return {
            isVisible = false, 
            selectedPlayer = v12.selectedPlayer
        };
    end, 
    [v5.name] = function(v14, v15) --[[ Line: 42 ]]
        if v15.player == v14.selectedPlayer then
            return {
                isVisible = false, 
                selectedPlayer = nil
            };
        else
            return v14;
        end;
    end
}));