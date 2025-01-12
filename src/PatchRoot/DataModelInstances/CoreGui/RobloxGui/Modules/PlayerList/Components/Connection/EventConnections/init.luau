local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.PlayerServiceConnector);
local v3 = require(script.Parent.TeamServiceConnector);
local v4 = require(script.Parent.LeaderstatsConnector);
local v5 = require(script.Parent.CoreGuiConnector);
local v6 = require(script.Parent.SocialConnector);
local v7 = require(script.Parent.GuiServiceConnector);
local v8 = require(script.Parent.UserInputServiceConnector);
local v9 = require(script.Parent.ScreenSizeConnector);
local v10 = v1.PureComponent:extend("EventConnections");
v10.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return v1.createFragment({
        PlayerServiceConnector = v1.createElement(v2), 
        TeamServiceConnector = v1.createElement(v3), 
        LeaderstatsConnector = v1.createElement(v4), 
        CoreGuiConnector = v1.createElement(v5), 
        SocialConnector = v1.createElement(v6), 
        GuiServiceConnector = v1.createElement(v7), 
        UserInputServiceConnector = v1.createElement(v8), 
        ScreenSizeConnector = v1.createElement(v9)
    });
end;
return v10;