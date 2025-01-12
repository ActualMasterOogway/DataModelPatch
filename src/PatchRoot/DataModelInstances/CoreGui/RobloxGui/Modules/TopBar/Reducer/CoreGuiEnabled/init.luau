local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.UpdateCoreGuiEnabled);
local v5 = {
    [Enum.CoreGuiType.PlayerList] = true, 
    [Enum.CoreGuiType.Health] = true, 
    [Enum.CoreGuiType.Backpack] = true, 
    [Enum.CoreGuiType.Chat] = true, 
    [Enum.CoreGuiType.EmotesMenu] = true
};
return (v1.createReducer(v5, {
    [v4.name] = function(v6, v7) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        if v7.coreGuiType == Enum.CoreGuiType.All then
            local v8 = {};
            for v9, _ in pairs(v6) do
                v8[v9] = v7.enabled;
            end;
            return v8;
        else
            return v2.Dictionary.join(v6, {
                [v7.coreGuiType] = v7.enabled
            });
        end;
    end
}));