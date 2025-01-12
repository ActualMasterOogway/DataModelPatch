local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(script.FriendStatusConnector);
local v5 = require(script.LastInputTypeConnector);
local v6 = require(script.MouseOverrideManager);
local v7 = require(script.FocusHighlightManager);
local v8 = require(script.VideoRecordConnector);
local v9 = require(script.NativeCloseEventConnector);
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.InGameMenuPolicy);
local v12 = l_t_0.strictInterface({
    isEducationalPopupEnabled = l_t_0.optional(l_t_0.boolean)
});
return v11.connect(function(v13, _) --[[ Line: 34 ]]
    return {
        isEducationalPopupEnabled = v13.enableEducationalPopup()
    };
end)(function(v15) --[[ Line: 21 ]] --[[ Name: Connection ]]
    -- upvalues: v12 (copy), l_Roact_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    assert(v12);
    return l_Roact_0.createFragment({
        FriendStatusConnector = l_Roact_0.createElement(v4), 
        LastInputTypeConnector = l_Roact_0.createElement(v5), 
        MouseOverrideManager = l_Roact_0.createElement(v6), 
        FocusHighlightManager = l_Roact_0.createElement(v7), 
        VideoRecordConnector = l_Roact_0.createElement(v8), 
        NativeCloseEventConnector = v15.isEducationalPopupEnabled and l_Roact_0.createElement(v9) or nil
    });
end);