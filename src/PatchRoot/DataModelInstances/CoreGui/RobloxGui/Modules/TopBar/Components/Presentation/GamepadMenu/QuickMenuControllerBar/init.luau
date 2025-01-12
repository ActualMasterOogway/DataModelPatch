local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_ControllerBar_0 = v6.App.Bar.ControllerBar;
local v9 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReenableTextChatForTenFootInterfaces;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v13 = {
    back = "CoreScripts.TopBar.Back", 
    leave = "CoreScripts.TopBar.Leave", 
    respawn = "CoreScripts.TopBar.Respawn", 
    showChat = "CoreScripts.TopBar.ShowChat", 
    hideChat = "CoreScripts.TopBar.HideChat"
};
return function(v14) --[[ Line: 30 ]] --[[ Name: QuickMenuControllerBar ]]
    -- upvalues: l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v13 (copy), v4 (copy), l_useSelector_0 (copy), v5 (copy), l_CoreGui_0 (copy), v7 (copy), l_ControllerBar_0 (copy), v9 (copy)
    if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then
        local v15 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        local v16 = {
            {
                text = v15:Format(v13.respawn), 
                keyCode = Enum.KeyCode.ButtonY
            }, 
            {
                text = v15:Format(v13.leave), 
                keyCode = Enum.KeyCode.ButtonX
            }
        };
        if v14.chatMenuEnabled then
            local v18 = v4.useCallback(function(v17) --[[ Line: 48 ]]
                return v17.chat.visible;
            end);
            table.insert(v16, 1, {
                text = v15:Format(if l_useSelector_0(v18) then v13.hideChat else v13.showChat), 
                keyCode = Enum.KeyCode.ButtonR1
            });
        end;
        return v4.createElement(v5.Portal, {
            target = l_CoreGui_0
        }, {
            QuickMenuControllerBar = v4.createElement("ScreenGui", {
                DisplayOrder = v7.DisplayOrder.ControllerBar
            }, {
                ControllerBar = v4.createElement(l_ControllerBar_0, {
                    leftHint = {
                        text = v15:Format(v13.back), 
                        keyCode = Enum.KeyCode.ButtonB
                    }, 
                    rightHints = v16
                })
            })
        });
    else
        return v5.createElement(v5.Portal, {
            target = l_CoreGui_0
        }, {
            QuickMenuControllerBar = v5.createElement("ScreenGui", {
                DisplayOrder = v7.DisplayOrder.ControllerBar
            }, {
                ControllerBar = v5.createElement(l_ControllerBar_0, {
                    leftHint = {
                        text = v9:FormatByKey(v13.back), 
                        keyCode = Enum.KeyCode.ButtonB
                    }, 
                    rightHints = {
                        {
                            text = v9:FormatByKey(v13.respawn), 
                            keyCode = Enum.KeyCode.ButtonY
                        }, 
                        {
                            text = v9:FormatByKey(v13.leave), 
                            keyCode = Enum.KeyCode.ButtonX
                        }
                    }
                })
            })
        });
    end;
end;