local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_InspectAndBuy_0 = l_RobloxGui_0.Modules.InspectAndBuy;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_InspectAndBuy_0.Components.InspectAndBuy);
local v6 = nil;
local v7 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v8 = require(l_RobloxGui_0.Modules.TopBar);
local function v14(v9, v10, v11, v12) --[[ Line: 18 ]] --[[ Name: mount ]]
    -- upvalues: v6 (ref), v4 (copy), v7 (copy), v5 (copy), l_RobloxGui_0 (copy), l_GuiService_0 (copy), v8 (copy)
    if v6 then
        v4.unmount(v6);
        v6 = nil;
    end;
    local v13 = v7({
        inspectAndBuy = v4.createElement(v5, {
            humanoidDescription = v9, 
            playerName = v10, 
            playerId = v11, 
            ctx = v12
        })
    });
    v6 = v4.mount(v13, l_RobloxGui_0, "InspectAndBuy");
    l_GuiService_0:SetMenuIsOpen(true, "InspectMenu");
    v8:setInspectMenuOpen(true);
end;
local function _() --[[ Line: 39 ]] --[[ Name: unmountInspectAndBuy ]]
    -- upvalues: v6 (ref), v4 (copy), l_GuiService_0 (copy), v8 (copy)
    if v6 then
        v4.unmount(v6);
        v6 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        v8:setInspectMenuOpen(false);
    end;
end;
local function _(v16, v17, v18) --[[ Line: 49 ]] --[[ Name: mountInspectAndBuyFromHumanoidDescription ]]
    -- upvalues: v14 (copy)
    v14(v16, v17, nil, v18);
end;
local function _(v20, v21) --[[ Line: 53 ]] --[[ Name: mountInspectAndBuyFromUserId ]]
    -- upvalues: v14 (copy)
    v14(nil, nil, v20, v21);
end;
l_GuiService_0.InspectPlayerFromHumanoidDescriptionRequest:Connect(function(v23, v24) --[[ Line: 57 ]]
    -- upvalues: v14 (copy)
    v14(v23, v24, nil, "developerThroughHumanoidDescription");
end);
l_GuiService_0.InspectPlayerFromUserIdWithCtxRequest:Connect(function(v25, v26) --[[ Line: 61 ]]
    -- upvalues: v14 (copy)
    v14(nil, nil, v25, v26);
end);
l_GuiService_0.CloseInspectMenuRequest:Connect(function() --[[ Line: 65 ]]
    -- upvalues: v6 (ref), v4 (copy), l_GuiService_0 (copy), v8 (copy)
    if v6 and v6 then
        v4.unmount(v6);
        v6 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        v8:setInspectMenuOpen(false);
    end;
end);
l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v27) --[[ Line: 71 ]]
    -- upvalues: v6 (ref), v4 (copy), l_GuiService_0 (copy), v8 (copy)
    if not v27 and v6 and v6 then
        v4.unmount(v6);
        v6 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        v8:setInspectMenuOpen(false);
    end;
end);