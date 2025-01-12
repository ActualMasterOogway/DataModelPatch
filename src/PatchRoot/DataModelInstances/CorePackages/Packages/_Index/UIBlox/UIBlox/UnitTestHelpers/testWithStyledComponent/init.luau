local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_1.UIBloxConfig);
local v6 = require(l_Parent_2.Roact);
local v7 = require(l_Parent_0.dumpInstanceTree);
local v8 = require(l_Parent_1.Utility.mockStyleComponent);
return function(v9, v10, v11) --[[ Line: 35 ]] --[[ Name: testWithStyledComponent ]]
    -- upvalues: v6 (copy), v8 (copy), l_HttpService_0 (copy), l_CoreGui_0 (copy), v5 (copy), v7 (copy)
    local v12 = v6.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        StyleProvider = v8({
            TestComponent = v6.createElement(v9, v10)
        })
    });
    local v13 = ("TestApp-%s"):format(l_HttpService_0:GenerateGUID());
    local v14 = v6.mount(v12, l_CoreGui_0, v13);
    local v15 = nil;
    v15 = if v5.useFoundationButton then ("game.CoreGui.%s.Children.TestComponent"):format(v13) else ("game.CoreGui.%s.StyleProvider.TestComponent"):format(v13);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
        -- upvalues: v11 (copy), v15 (ref)
        v11(v15);
    end);
    if not l_status_0 then
        print("Test instance tree:");
        v7(l_CoreGui_0:FindFirstChild(v13));
        print("Test instance tree end\n");
    end;
    v6.unmount(v14);
    if not l_status_0 then
        error(l_result_0);
    end;
end;