local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v8 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v13 = require(l_RobloxGui_0.Modules.Flags.FIntVoiceChatTooltipDelay);
local l_TopBarHeight_0 = require(l_RobloxGui_0.Modules.TopBar.Constants).TopBarHeight;
return function(v15) --[[ Line: 32 ]] --[[ Name: VoiceChatTooltip ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), l_GuiService_0 (copy), v13 (copy), v7 (copy), v8 (copy), l_TopBarHeight_0 (copy), v5 (copy), l_StyledTextLabel_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_withTooltip_0 (copy)
    local v16 = l_useStyle_0();
    local v17 = v4.useRef(nil);
    local l_onClose_0 = v15.onClose;
    v4.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v15 (copy), v17 (copy), l_GuiService_0 (ref), l_onClose_0 (copy), v13 (ref)
        if v15.showPrompt then
            v17.current = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 40 ]]
                -- upvalues: v17 (ref), l_onClose_0 (ref)
                if v17.current then
                    v17.current:Disconnect();
                    v17.current = nil;
                    l_onClose_0();
                end;
            end);
            task.delay(v13, function() --[[ Line: 47 ]]
                -- upvalues: v17 (ref), v15 (ref), l_onClose_0 (ref)
                if v17.current then
                    v17.current:Disconnect();
                    v17.current = nil;
                end;
                if v15.showPrompt then
                    l_onClose_0();
                end;
            end);
        end;
        return function() --[[ Line: 58 ]]
            -- upvalues: v17 (ref)
            if v17.current then
                v17.current:Disconnect();
                v17.current = nil;
            end;
        end;
    end, {
        v15.showPrompt
    });
    local v19 = v7:IsSmallTouchScreen();
    local v20 = 38;
    local v21 = v19 and 64 or 64;
    if v8() then
        v20 = l_TopBarHeight_0;
    end;
    local v23 = {
        headerText = v15.titleText, 
        minContentWidth = 240, 
        renderCustomComponents = function(_) --[[ Line: 79 ]] --[[ Name: renderCustomComponents ]]
            -- upvalues: v5 (ref), l_StyledTextLabel_0 (ref), v15 (copy), v16 (copy)
            return v5.createElement(l_StyledTextLabel_0, {
                text = v15.subtitleText, 
                textTruncate = Enum.TextTruncate.None, 
                textXAlignment = Enum.TextXAlignment.Left, 
                fontStyle = v16.Font.CaptionSmall, 
                colorStyle = v16.Theme.TextDefault, 
                layoutOrder = 0, 
                automaticSize = Enum.AutomaticSize.XY
            });
        end, 
        onClose = l_onClose_0, 
        backgroundColor = v16.Theme.BackgroundUIDefault.Color, 
        backgroundTransparency = v16.Theme.BackgroundUIDefault.Transparency
    };
    local v24 = {
        guiTarget = l_CoreGui_0, 
        active = v15.showPrompt, 
        DisplayOrder = 10, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    };
    return l_withTooltip_0(v23, v24, function(v25) --[[ Line: 102 ]]
        -- upvalues: v5 (ref), v21 (copy), v20 (ref), v4 (ref)
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v21, 0, v20), 
            [v4.Change.AbsoluteSize] = v25, 
            [v4.Change.AbsolutePosition] = v25
        });
    end);
end;