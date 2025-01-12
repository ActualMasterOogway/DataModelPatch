local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Otter);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local v7 = require(l_Parent_0.React);
local l_Images_0 = v2.App.ImageSet.Images;
local l_ContextualMenu_0 = v2.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v2.App.Menu.MenuDirection;
local v11 = require(l_script_FirstAncestor_0.Components.ChatLineReportRoot);
local v12 = {
    motorCallback = v3.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
local v13 = {
    reportAbuse = "Feature.ReportAbuse.Action.EnterChatLineReporting"
};
return function(v14) --[[ Line: 30 ]]
    -- upvalues: l_useLocalization_0 (copy), v13 (copy), l_CurrentCamera_0 (copy), v6 (copy), v7 (copy), l_ContextualMenu_0 (copy), l_Images_0 (copy), v11 (copy), l_MenuDirection_0 (copy), v12 (copy)
    local v15 = l_useLocalization_0(v13);
    local v16 = if l_CurrentCamera_0 then l_CurrentCamera_0.ViewportSize else Vector2.new(v6.ViewportSize, v6.ViewportSize);
    local v17 = v7.useRef(nil);
    v7.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v17 (copy), v16 (copy), v6 (ref)
        if v17.current and v17.current.AbsolutePosition.X + v17.current.AbsoluteSize.X > v16.X then
            v17.current.AnchorPoint = Vector2.new(1, 0);
            v17.current.Position = UDim2.new(1, v6.FramePositionXOffsetLeft, 0, v6.FramePositionYOffset);
        end;
    end, {
        v17, 
        v16
    });
    return v7.createElement("Frame", {
        Size = UDim2.new(v6.FrameSizeXScale, v6.FrameSizeXOffset, 1, 0), 
        Position = UDim2.new(1, v6.FramePositionXOffset, 0, v6.FramePositionYOffset), 
        BackgroundTransparency = 1, 
        ref = v17
    }, {
        ContextualMenu = v7.createElement(l_ContextualMenu_0, {
            buttonProps = {
                {
                    icon = l_Images_0["icons/actions/feedback"], 
                    text = v15.reportAbuse, 
                    onActivated = function() --[[ Line: 63 ]] --[[ Name: onActivated ]]
                        -- upvalues: v11 (ref), v14 (copy)
                        v11.initialize(v14.messages);
                        v14.setContextMenuOpen(false);
                        v14.onUnfocus();
                    end
                }
            }, 
            elementHeight = v6.TopBannerSize, 
            closeBackgroundVisible = false, 
            open = true, 
            menuDirection = l_MenuDirection_0.Down, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            openPositionX = UDim.new(0, 0), 
            openPositionY = UDim.new(0, 0), 
            borderCornerRadius = v6.ContextualMenuBorderRadius, 
            motorOverrideOptions = v12, 
            background = {
                Transparency = v14.backgroundTransparency, 
                Color = v14.backgroundColor3
            }, 
            screenSize = v16, 
            onDismiss = function() --[[ Line: 47 ]]
                -- upvalues: v14 (copy)
                v14.setContextMenuOpen(false);
                v14.onUnfocus();
            end
        })
    });
end;