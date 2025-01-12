local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v8 = require(script.Parent.Components.Blocking.BlockingModalScreen);
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagWrapBlockModalScreenInProvider);
local v10 = nil;
local function _() --[[ Line: 19 ]]
    -- upvalues: v10 (ref), v4 (copy)
    if v10 ~= nil then
        v4.unmount(v10);
        v10 = nil;
    end;
end;
return function(v12, v13, v14, v15) --[[ Line: 26 ]]
    -- upvalues: v10 (ref), v4 (copy), v8 (copy), v6 (copy), v9 (copy), l_CoreScriptsRootProvider_0 (copy), l_RobloxGui_0 (copy), l_ContextActionService_0 (copy), v5 (copy)
    v13:action("SettingsHub", "blockUserButtonClick", {
        blockeeUserId = v12.UserId, 
        source = v14
    });
    if v10 ~= nil then
        v4.unmount(v10);
        v10 = nil;
    end;
    local v16 = false;
    local function v17() --[[ Line: 35 ]]
        -- upvalues: v16 (ref), v10 (ref), v4 (ref)
        v16 = true;
        if v10 ~= nil then
            v4.unmount(v10);
            v10 = nil;
        end;
    end;
    local v18 = v4.createElement(v8, {
        player = v12, 
        closeModal = v17, 
        analytics = v13, 
        translator = v15 and v15.RobloxTranslator or v6, 
        source = v14
    });
    if v9() then
        local v19 = v4.createElement(l_CoreScriptsRootProvider_0, {}, {
            BlockingModalScreen = v18
        });
        v10 = v4.mount(v19, l_RobloxGui_0, "BlockingContainer");
        l_ContextActionService_0:BindCoreAction("BlockingModalScreen", v17, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    else
        v10 = v4.mount(v18, l_RobloxGui_0, "BlockingContainer");
    end;
    return v5.new(function(v20) --[[ Line: 62 ]]
        -- upvalues: v16 (ref), v9 (ref), l_ContextActionService_0 (ref)
        coroutine.wrap(function() --[[ Line: 63 ]]
            -- upvalues: v16 (ref), v9 (ref), l_ContextActionService_0 (ref), v20 (copy)
            while not v16 do
                wait();
            end;
            if v9() then
                l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
            end;
            v20();
        end)();
    end);
end;