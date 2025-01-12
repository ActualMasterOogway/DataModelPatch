local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_getFFlagUseCoreGuiGetService_0 = require(l_Parent_0.SharedFlags).getFFlagUseCoreGuiGetService;
local l_Toast_0 = v3.App.Dialog.Toast;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v10 = nil;
local function v12(v11) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_Toast_0 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        StyleProvider = v2.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
            ToastWrapper = v2.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                ResetOnSpawn = false, 
                DisplayOrder = 7
            }, {
                Toast = v2.createElement(l_Toast_0, {
                    duration = 3, 
                    toastContent = v11
                })
            })
        })
    });
end;
return function(v13) --[[ Line: 38 ]]
    -- upvalues: v10 (ref), l_getFFlagUseCoreGuiGetService_0 (copy), v1 (copy), v2 (copy), v12 (copy)
    if not v10 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "UIBloxToast";
        l_Folder_0.Parent = if l_getFFlagUseCoreGuiGetService_0() then game:GetService("CoreGui") else game.CoreGui;
        v10 = v1.createRoot(l_Folder_0);
    end;
    v10:render(v2.createElement(v12, v13));
end;