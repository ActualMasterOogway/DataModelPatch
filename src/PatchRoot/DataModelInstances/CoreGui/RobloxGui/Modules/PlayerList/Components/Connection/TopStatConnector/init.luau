local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v6 = nil;
if v5:IsEnabled() then
    v6 = v5:SetupTopStat();
end;
local v7 = v2.PureComponent:extend("TopStatConnector");
v7.render = function(v8) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v6 (ref)
    if v6 then
        v6:SetTopStatEnabled(v8.props.displayOptions.playerlistCoreGuiEnabled);
    end;
    return nil;
end;
return v3.connect(function(v9) --[[ Line: 27 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v9.displayOptions
    };
end, nil)(v7);