local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).Roact;
local v4 = require(l_Parent_0.Thunks.retryAfterUpsell);
local v5 = require(l_Parent_0.connectToStore);
local v6 = require(script.Parent.ExternalEventConnection);
return (v5(nil, function(v7) --[[ Line: 31 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy)
    return {
        onBrowserWindowClosed = function() --[[ Line: 33 ]] --[[ Name: onBrowserWindowClosed ]]
            -- upvalues: v7 (copy), v4 (ref)
            v7(v4());
        end
    };
end)(function(v8) --[[ Line: 17 ]] --[[ Name: BrowserPurchaseFinishedConnector ]]
    -- upvalues: l_Roact_0 (copy), v6 (copy), l_GuiService_0 (copy)
    local l_onBrowserWindowClosed_0 = v8.onBrowserWindowClosed;
    return l_Roact_0.createElement(v6, {
        event = l_GuiService_0.BrowserWindowClosed, 
        callback = l_onBrowserWindowClosed_0
    });
end));