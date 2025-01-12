local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.UIBlox);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Images_0 = v2.App.ImageSet.Images;
local v8 = require(l_Parent_0.NotificationModalsManager);
local v9 = require(l_Parent_0.Roact);
local v10 = require(l_Parent_0.Foundation);
local l_AppStyleProvider_0 = require(l_Parent_0.UIBlox).App.Style.AppStyleProvider;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v13 = require(script.InExperienceInterventionContainer);
local l_FoundationProvider_0 = v10.FoundationProvider;
local v15 = {};
if game:DefineFastFlag("FFlagTimeoutRemoteEvent", false) then
    l_RobloxReplicatedStorage_0:WaitForChild("TimeoutChatAttempt", 1e999).OnClientEvent:Connect(function(v16, v17) --[[ Line: 28 ]]
        -- upvalues: v8 (copy), l_Images_0 (copy)
        v8.SetUIBloxToast({
            iconImage = l_Images_0["icons/status/error_large"], 
            toastTitle = "Test Chat Timeout RemoteEvent", 
            toastSubtitle = ("startTime: %*, duration: %*"):format(v16, v17), 
            sequenceNumber = DateTime.now().UnixTimestamp, 
            iconSize = Vector2.new(36, 36)
        });
    end);
end;
v15.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v9 (copy), l_LayerCollectorProvider_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_AppStyleProvider_0 (copy), l_FoundationProvider_0 (copy), v13 (copy), l_CoreGui_0 (copy)
    local v18 = setmetatable({}, v15);
    v18.root = v9.createElement("ScreenGui", {}, {
        LayerCollectorProvider = v9.createElement(l_LayerCollectorProvider_0, {}, {
            LocalizationProvider = v9.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                StyleProvider = v9.createElement(l_AppStyleProvider_0, {
                    style = {
                        themeName = "dark", 
                        fontName = "gotham"
                    }
                }, {
                    FoundationProvider = v9.createElement(l_FoundationProvider_0, {
                        theme = "Dark"
                    }, {
                        Container = v9.createElement(v13, {})
                    })
                })
            })
        })
    });
    v18.element = v9.mount(v18.root, l_CoreGui_0, "InExperienceInterventionApp");
    return v18;
end;
return v15.new();