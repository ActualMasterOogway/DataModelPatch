local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Flags.FFlagSocialLuaAnalyticsRemoveSocialLibraries);
local v4 = nil;
if not v3 then
    v4 = v1.SocialLibraries.RoduxTools.compose;
end;
local v5 = require(l_Parent_1.Dash);
local _ = require(script.Parent.Parent.Types);
local v7 = require(script.Parent.getEventInfo);
local v8 = require(script.Parent.optionallyLog);
local v9 = require(script.Parent.reportCounter);
local function v11(v10) --[[ Line: 21 ]]
    return "Fired diagCounter: " .. v10.name .. ", count: " .. (v10.count and tostring(v10.count) or "1");
end;
return function(v12) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), v5 (copy), v7 (copy), v8 (copy), v11 (copy), v9 (copy), v4 (ref)
    return function(v13) --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v5 (ref), v7 (ref), v12 (copy), v8 (ref), v11 (ref), v9 (ref), v4 (ref)
        if v3 then
            return (v5.compose(v7(v12.eventList), v8(v12.loggerImpl, v11), v9(v12.diagImpl))(v13));
        else
            return (v4(v9(v12.diagImpl), v8(v12.loggerImpl, v11), v7(v12.eventList))(v13));
        end;
    end;
end;