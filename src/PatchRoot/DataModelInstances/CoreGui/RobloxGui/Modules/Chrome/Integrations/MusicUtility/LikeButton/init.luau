local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Service);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.Songbird);
return v2:register({
    initialAvailability = v2.AvailabilitySignal.Available, 
    id = "like_button", 
    label = "CoreScripts.TopBar.PeekLike", 
    components = {
        Icon = function(_) --[[ Line: 14 ]] --[[ Name: Icon ]]
            -- upvalues: v3 (copy), v4 (copy)
            return v3.createElement(v4.LikeButtonWrapper);
        end
    }
});