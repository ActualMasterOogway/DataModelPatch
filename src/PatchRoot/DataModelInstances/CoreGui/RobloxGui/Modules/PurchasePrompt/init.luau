local l_script_0 = script;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local v8 = require(script.Components.PurchasePromptApp);
local v9 = require(l_script_0.Reducers.Reducer);
local v10 = require(l_script_0.Services.ABTest);
local v11 = require(l_script_0.Services.Network);
local v12 = require(l_script_0.Services.Analytics);
local v13 = require(l_script_0.Services.PlatformInterface);
local v14 = require(l_script_0.Services.ExternalSettings);
local v15 = require(l_script_0.Services.PublicBindables);
local v16 = require(l_script_0.Thunk);
local v17 = require(l_script_0.Thunks.initiateAvatarCreationFeePurchase);
local v18 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagPublishAvatarPromptEnabled);
local v19 = require(l_RobloxGui_0.Modules.PublishAssetPrompt.FFlagHideAvatarIECPromptOnUpsellSuccess);
local v20 = require(l_script_0.Enums.WindowState);
local v21 = require(l_script_0.Enums.PromptState);
local v22 = require(l_script_0.Utils.PublishAssetAnalytics);
local v23 = nil;
local v24 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local function v35() --[[ Line: 39 ]] --[[ Name: createStore ]]
    -- upvalues: v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v19 (copy), v15 (copy), l_BindableEvent_0 (copy), v24 (ref), l_Rodux_0 (copy), v9 (copy), v16 (copy), v20 (copy), v21 (copy), l_BindableEvent_1 (copy)
    local v27 = v10.new();
    local v28 = v11.new();
    local v29 = v12.new();
    local v30 = v13.new();
    local v31 = v14.new();
    local v32 = nil;
    if v19 then
        v32 = v15.new({
            windowStateChangedBindable = l_BindableEvent_0
        });
    end;
    v24 = l_Rodux_0.Store.new(v9, {}, {
        v16.middleware({
            [v10] = v27, 
            [v11] = v28, 
            [v12] = v29, 
            [v13] = v30, 
            [v14] = v31, 
            [v15] = if v19 then v32 else nil
        })
    });
    v24.changed:connect(function(v33, v34) --[[ Line: 64 ]]
        -- upvalues: l_BindableEvent_0 (ref), v20 (ref), v21 (ref), l_BindableEvent_1 (ref)
        if v34.windowState ~= v33.windowState then
            l_BindableEvent_0:Fire({
                isShown = v33.windowState == v20.Shown, 
                hasCompletedPurchase = v33.hasCompletedPurchase
            });
        end;
        if v34.promptState ~= v33.promptState and v33.promptState == v21.None then
            l_BindableEvent_1:Fire();
        end;
    end);
end;
local v36 = nil;
v36 = v18 and function() --[[ Line: 83 ]]
    -- upvalues: l_RunService_0 (copy), v23 (ref), v35 (copy), l_Roact_0 (copy), v8 (copy), v24 (ref), l_CoreGui_0 (copy)
    if l_RunService_0:IsStudio() and l_RunService_0:IsEdit() or v23 then
        return nil;
    else
        v35();
        local v37 = l_Roact_0.createElement(v8, {
            store = v24
        });
        v23 = l_Roact_0.mount(v37, l_CoreGui_0, "PurchasePromptApp");
        return v23;
    end;
end or function() --[[ Line: 98 ]]
    -- upvalues: l_RunService_0 (copy), l_Roact_0 (copy), v8 (copy), l_CoreGui_0 (copy)
    if l_RunService_0:IsStudio() and l_RunService_0:IsEdit() then
        return nil;
    else
        return (l_Roact_0.mount(l_Roact_0.createElement(v8), l_CoreGui_0, "PurchasePromptApp"));
    end;
end;
local function v42(v38, v39, v40, v41) --[[ Line: 112 ]] --[[ Name: initiateAvatarCreationFeePurchase ]]
    -- upvalues: v24 (ref), v17 (copy)
    if not v24 then
        error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted");
    end;
    v24:dispatch(v17(v38, v39, v40, v41));
end;
return {
    mountPurchasePrompt = v36, 
    initiateAvatarCreationFeePurchase = if v18 then v42 else nil, 
    windowStateChangedEvent = if v18 then l_BindableEvent_0.Event else nil, 
    promptStateSetToNoneEvent = if v18 then l_BindableEvent_1.Event else nil, 
    PublishAssetAnalytics = v22
};