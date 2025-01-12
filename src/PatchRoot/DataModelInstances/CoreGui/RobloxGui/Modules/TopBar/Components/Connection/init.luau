local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.CoreGuiConnector);
local v3 = require(script.MenuConnector);
local v4 = require(script.ChatConnector);
local v5 = require(script.HealthConnector);
local v6 = require(script.EnabledNotifier);
local v7 = require(script.OpenUIConnector);
local v8 = require(script.LastInputTypeConnector);
local v9 = v1.PureComponent:extend("Connection");
v9.render = function(_) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    return v1.createFragment({
        CoreGuiConnector = v1.createElement(v2), 
        MenuConnector = v1.createElement(v3), 
        ChatConnector = v1.createElement(v4), 
        HealthConnector = v1.createElement(v5), 
        EnabledNotifier = v1.createElement(v6), 
        OpenUIConnector = v1.createElement(v7), 
        LastInputTypeConnector = v1.createElement(v8)
    });
end;
return v9;