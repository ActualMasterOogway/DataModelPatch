local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagSocialLuaAnalyticsRemoveSocialLibraries);
local v4 = nil;
if not v3 then
    v4 = v1.SocialLibraries.RoduxTools.compose;
end;
local v5 = require(l_Parent_0.Dash);
local _ = require(script.Parent.Parent.Types);
local v7 = require(script.Parent.getEventInfo);
local v8 = require(script.Parent.optionallyLog);
local v9 = require(script.Parent.reportDiagEvent);
local v10 = require(script.Parent.getFormattedDiagEventInfo);
local function v12(v11) --[[ Line: 23 ]]
    return (("Fired Diag %*: %*, %*"):format(v11.type, v11.name, v11.value));
end;
return function(v13) --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v5 (copy), v7 (copy), v10 (copy), v9 (copy), v8 (copy), v12 (copy), v4 (ref)
    return function(v14, v15) --[[ Line: 28 ]]
        -- upvalues: v3 (ref), v5 (ref), v7 (ref), v13 (copy), v10 (ref), v9 (ref), v8 (ref), v12 (ref), v4 (ref)
        if v3 then
            return (v5.compose(v7(v13.eventList), v10(), v9(v13.diagImpl), v8(v13.loggerImpl, v12))(v14, v15));
        else
            return (v4(v8(v13.loggerImpl, v12), v9(v13.diagImpl), v10(), v7(v13.eventList))(v14, v15));
        end;
    end;
end;