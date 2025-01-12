local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.FFlagSocialLuaAnalyticsRemoveSocialLibraries);
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = nil;
if not v2 then
    v4 = v3.SocialLibraries.config({});
end;
return {
    t = require(l_Parent_0.t), 
    tutils = require(l_Parent_0.tutils), 
    RoduxPresence = v3.RoduxPresence.config({
        keyPath = "SocialLuaAnalytics.Presence"
    }), 
    llama = v3.llama, 
    enumerate = require(l_Parent_0.enumerate), 
    SocialLibraries = if v2 then nil else v4, 
    LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
    Rodux = require(l_Parent_0.Rodux), 
    Dash = require(l_Parent_0.Dash)
};