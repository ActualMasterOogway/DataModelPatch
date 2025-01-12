local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_MenuConfigs_0 = l_script_FirstAncestor_0.MenuConfigs;
local v3 = require(l_MenuConfigs_0.Players.MethodOfAbuseModalMenuConfig);
local v4 = require(l_MenuConfigs_0.Players.OptionalAttachScreenshotMenuConfig);
local v5 = require(l_MenuConfigs_0.Players.PlayerModalSelectorMenuConfig);
local v6 = require(l_MenuConfigs_0.Players.AbuseReasonModalSelectorMenuConfig);
local v7 = require(l_MenuConfigs_0.Players.SubmitReportButtonMenuConfig);
return {
    v3, 
    v5, 
    v6, 
    v4, 
    require(l_MenuConfigs_0.Players.FreeFormCommentMenuConfig), 
    v7
};