local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local l_ScreenSideOffset_0 = v4.ScreenSideOffset;
local l_TopBarButtonHeight_0 = v4.TopBarButtonHeight;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppStyleProvider_0 = v7.App.Style.AppStyleProvider;
local l_Dark_0 = v7.App.Style.Constants.ThemeName.Dark;
local v10 = require(l_CorePackages_0.Packages.Promise);
local v11 = require(script.Parent.SelfViewTooltipFTUX);
return function(v12) --[[ Line: 17 ]]
    -- upvalues: l_CoreGui_0 (copy), v1 (copy), l_AppStyleProvider_0 (copy), l_Dark_0 (copy), l_ScreenSideOffset_0 (copy), l_TopBarButtonHeight_0 (copy), v11 (copy), v10 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "SelfViewTooltipOnCloseGui";
    l_ScreenGui_0.DisplayOrder = -1;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v14 = v1.createElement(l_AppStyleProvider_0, {
        style = {
            themeName = l_Dark_0
        }
    }, {
        frame = v1.createElement("Frame", {
            Position = UDim2.fromOffset(l_ScreenSideOffset_0, -l_TopBarButtonHeight_0), 
            Size = UDim2.fromOffset(l_TopBarButtonHeight_0, l_TopBarButtonHeight_0), 
            BackgroundTransparency = 0, 
            Visible = false
        }, {
            tooltip = v1.createElement(v11, {
                fallbackText = v12.fallbackText, 
                translationKey = v12.translationKey, 
                tooltipLifetime = v12.tooltipLifetime
            })
        })
    });
    local v15 = v1.mount(v14, l_ScreenGui_0, "SelfViewTooltipOnClose");
    v10.delay(v12.tooltipLifetime + 5):andThen(function() --[[ Line: 45 ]]
        -- upvalues: v1 (ref), v15 (copy)
        pcall(function() --[[ Line: 46 ]]
            -- upvalues: v1 (ref), v15 (ref)
            v1.unmount(v15);
        end);
    end);
end;