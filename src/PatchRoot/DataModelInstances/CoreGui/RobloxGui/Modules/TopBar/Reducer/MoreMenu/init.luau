local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.SetMoreMenuOpen);
local v5 = require(l_Actions_0.SetBackpackOpen);
local v6 = require(l_Actions_0.SetEmotesOpen);
local v7 = require(l_Actions_0.SetLeaderboardOpen);
local v8 = require(l_Actions_0.SetEmotesEnabled);
local v9 = {
    open = false, 
    backpackOpen = false, 
    leaderboardOpen = false, 
    emotesOpen = false, 
    emotesEnabled = true
};
return (v1.createReducer(v9, {
    [v4.name] = function(v10, v11) --[[ Line: 23 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            open = v11.open
        });
    end, 
    [v5.name] = function(v12, v13) --[[ Line: 29 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            open = false, 
            backpackOpen = v13.open
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 36 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            open = false, 
            emotesOpen = v15.open
        });
    end, 
    [v8.name] = function(v16, v17) --[[ Line: 43 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            emotesEnabled = v17.enabled
        });
    end, 
    [v7.name] = function(v18, v19) --[[ Line: 49 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v18, {
            open = false, 
            leaderboardOpen = v19.open
        });
    end
}));