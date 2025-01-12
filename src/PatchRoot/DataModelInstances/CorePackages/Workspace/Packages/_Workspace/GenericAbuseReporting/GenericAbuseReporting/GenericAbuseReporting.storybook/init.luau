local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local v5 = require(script.Parent.MockProviders);
local l_Dictionary_0 = v2.Dictionary;
local v7 = require(l_script_FirstAncestor_0.Logger);
v7:addSink({
    maxLevel = v7.Levels.fromString("trace"), 
    log = function(_, v9, v10) --[[ Line: 14 ]] --[[ Name: log ]]
        print((("[%*] %*"):format(v10.loggerName, v9)));
    end
});
return {
    roact = v3, 
    reactRoblox = v4, 
    mapStory = function(v11) --[[ Line: 22 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Dictionary_0 (copy), v3 (copy), v5 (copy)
        return function(v12) --[[ Line: 23 ]]
            -- upvalues: l_Dictionary_0 (ref), v3 (ref), v5 (ref), v11 (copy)
            local v13 = l_Dictionary_0.union(v12, v12.definition and v12.definition.props or {});
            return v3.createElement(v5, {}, {
                story = v3.createElement(v11, v13)
            });
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};