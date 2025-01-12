local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
require(l_Parent_0.UIBlox).init({});
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Components.MockProviders);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
l_Logger_0:addSink({
    maxLevel = l_Logger_0.Levels.fromString("trace"), 
    log = function(_, v8, _) --[[ Line: 20 ]] --[[ Name: log ]]
        print(v8);
    end
});
v2:setParent(l_Logger_0);
return {
    roact = v3, 
    mapStory = function(v10) --[[ Line: 29 ]] --[[ Name: mapStory ]]
        -- upvalues: v3 (copy), v5 (copy), v4 (copy)
        return function(v11) --[[ Line: 30 ]]
            -- upvalues: v3 (ref), v5 (ref), v10 (copy), v4 (ref)
            local v12 = v11 and v11.definition and v11.definition.props or {};
            return v3.createElement(v5, {
                rodux = v12.rodux
            }, {
                story = v3.createElement(v10, v4.Dictionary.union(v12, v11))
            });
        end;
    end
};