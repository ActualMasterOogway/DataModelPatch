local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Rodux);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppStyleProvider_0 = v7.App.Style.AppStyleProvider;
local l_Constants_0 = v7.App.Style.Constants;
local function v10(v11, v12) --[[ Line: 14 ]] --[[ Name: dumpInstanceTree ]]
    -- upvalues: v10 (copy)
    v12 = v12 or "";
    if v11 == nil then
        print(v12 .. "[nil Instance]");
        return;
    else
        print(v12 .. v11.Name);
        v12 = v12 .. "  ";
        for _, v14 in ipairs(v11:GetChildren()) do
            v10(v14, v12);
        end;
        return;
    end;
end;
return function(v15, v16, v17, v18, v19) --[[ Line: 41 ]]
    -- upvalues: v5 (copy), v4 (copy), v6 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), l_HttpService_0 (copy), l_CoreGui_0 (copy), v10 (copy)
    v18 = v18 or {};
    v19 = v19 or {};
    local v20 = v5.Store.new(v17, v18, {
        v5.thunkMiddleware
    });
    local v21 = v4.createElement(v6.StoreProvider, {
        store = v20
    }, {
        AppStyleProvider = v4.createElement(l_AppStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            Root = v4.createElement(v16, v19)
        })
    });
    local v22 = tostring(v16);
    local v23 = v4.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        [v22] = v21
    });
    local v24 = "Test-" .. l_HttpService_0:GenerateGUID(false);
    local v25 = v4.mount(v23, l_CoreGui_0, v24);
    local v26 = ("game.CoreGui.%s.*"):format(v24);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
        -- upvalues: v15 (copy), v26 (copy)
        v15(v26);
    end);
    if not l_status_0 then
        print("Test instance tree:\n");
        v10(l_CoreGui_0:FindFirstChild(v24));
        print();
    end;
    v4.unmount(v25);
    if not l_status_0 then
        error(l_result_0);
    end;
end;