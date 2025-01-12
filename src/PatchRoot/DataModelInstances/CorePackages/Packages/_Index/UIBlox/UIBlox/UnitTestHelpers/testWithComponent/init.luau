local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_FoundationProvider_0 = require(l_Parent_2.Foundation).FoundationProvider;
local v6 = require(l_Parent_1.UIBloxConfig);
local v7 = require(l_Parent_2.Roact);
local v8 = require(l_Parent_0.dumpInstanceTree);
local function v10(v9) --[[ Line: 35 ]] --[[ Name: TestApp ]]
    -- upvalues: v7 (copy)
    return v7.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, v9[v7.Children]);
end;
return function(v11, v12) --[[ Line: 41 ]] --[[ Name: testWithComponent ]]
    -- upvalues: v6 (copy), v7 (copy), v10 (copy), l_FoundationProvider_0 (copy), l_HttpService_0 (copy), l_CoreGui_0 (copy), v8 (copy)
    local v13 = nil;
    v13 = if v6.useFoundationProvider then v7.createElement(v10, nil, {
        FoundationProvider = v7.createElement(l_FoundationProvider_0, {
            theme = "Dark"
        }, {
            TestComponent = v11
        })
    }) else v7.createElement(v10, nil, {
        TestComponent = v11
    });
    local v14 = ("TestApp-%s"):format(l_HttpService_0:GenerateGUID(false));
    local v15 = v7.mount(v13, l_CoreGui_0, v14);
    local v16 = ("game.CoreGui.%s.TestComponent"):format(v14);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
        -- upvalues: v12 (copy), v16 (copy)
        v12(v16);
    end);
    if not l_status_0 then
        print("Test instance tree:");
        v8(l_CoreGui_0:FindFirstChild(v14));
        print("Test instance tree end\n");
    end;
    v7.unmount(v15);
    if not l_status_0 then
        error(l_result_0);
    end;
end;