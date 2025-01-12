local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v4 = require(script.Parent.ChatAbuseReport);
return function(v5) --[[ Line: 8 ]] --[[ Name: AbuseReportScreen ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local l_navigation_0 = v5.navigation;
    local v7 = l_navigation_0.getParam("conversationId", nil);
    local v8 = l_navigation_0.getParam("participantId", nil);
    return v2.createElement(v3, {
        horizontalAlignment = Enum.HorizontalAlignment.Center, 
        verticalAlignment = Enum.VerticalAlignment.Center, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        constraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(800, 450)
        }), 
        padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        abuseReportFlow = v2.createElement(v4, {
            conversationId = v7, 
            participantId = v8, 
            onAbandon = l_navigation_0.pop, 
            onComplete = l_navigation_0.pop
        })
    });
end;