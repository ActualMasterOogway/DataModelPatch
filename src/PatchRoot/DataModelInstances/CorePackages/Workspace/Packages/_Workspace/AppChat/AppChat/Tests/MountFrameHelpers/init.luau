local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.UnitTestHelpers);
local l_mountFrame_0 = v2.mountFrame;
local l_mountStyledFrame_0 = v2.mountStyledFrame;
local v5 = require(l_script_FirstAncestor_0.LegacyAnalytics.Mock.mockAnalytics);
local v6 = require(script.Parent.mockApolloProvider);
local v7 = require(script.Parent.mockTopBar);
return {
    mountFrameWithApollo = function(v8, v9) --[[ Line: 13 ]] --[[ Name: mountFrameWithApollo ]]
        -- upvalues: l_mountFrame_0 (copy), v6 (copy), v5 (copy)
        return l_mountFrame_0(v6(v5(v8)), v9);
    end, 
    mountFrame = l_mountFrame_0, 
    mountStyledFrame = function(v10, v11) --[[ Line: 17 ]] --[[ Name: mountStyledFrame ]]
        -- upvalues: l_mountStyledFrame_0 (copy), v5 (copy)
        return l_mountStyledFrame_0(v5(v10), v11);
    end, 
    mountFrameWithAnalytics = function(v12, v13) --[[ Line: 20 ]] --[[ Name: mountFrameWithAnalytics ]]
        -- upvalues: l_mountFrame_0 (copy), v5 (copy)
        return l_mountFrame_0(v5(v12), v13);
    end, 
    mountFrameWithTopBar = function(v14, v15) --[[ Line: 23 ]] --[[ Name: mountFrameWithTopBar ]]
        -- upvalues: l_mountFrame_0 (copy), v6 (copy), v5 (copy), v7 (copy)
        return l_mountFrame_0(v6(v5(v7(v14))), v15);
    end
};