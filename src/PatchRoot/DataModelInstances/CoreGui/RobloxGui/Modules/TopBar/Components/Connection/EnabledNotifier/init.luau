local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.ChatSelector);
local v7 = require(l_RobloxGui_0.Modules.BackpackScript);
local v8 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v9 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v10 = v2.PureComponent:extend("CoreGuiCEnabledNotifieronnector");
v10.validateProps = v4.strictInterface({
    topBarEnabled = v4.boolean
});
v10.notifyEnabled = function(v11) --[[ Line: 20 ]] --[[ Name: notifyEnabled ]]
    -- upvalues: v9 (copy), v6 (copy), v7 (copy), v8 (copy)
    v9:SetTopBarEnabled(v11.props.topBarEnabled);
    v6:TopbarEnabledChanged(v11.props.topBarEnabled);
    v7:TopbarEnabledChanged(v11.props.topBarEnabled);
    v8:setTopBarEnabled(v11.props.topBarEnabled);
end;
v10.didMount = function(v12) --[[ Line: 27 ]] --[[ Name: didMount ]]
    v12:notifyEnabled();
end;
v10.render = function(_) --[[ Line: 31 ]] --[[ Name: render ]]
    return nil;
end;
v10.didUpdate = function(v14, v15, _) --[[ Line: 35 ]] --[[ Name: didUpdate ]]
    if v14.props.topBarEnabled ~= v15.topBarEnabled then
        v14:notifyEnabled();
    end;
end;
return v3.UNSTABLE_connect2(function(v17) --[[ Line: 41 ]] --[[ Name: mapStateToProps ]]
    return {
        topBarEnabled = v17.displayOptions.topbarEnabled
    };
end, nil)(v10);