local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactRoblox);
local v7 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_DarkTheme_0 = v7.App.Style.Themes.DarkTheme;
local l_components_0 = l_script_FirstAncestor_0.components;
local v11 = require(l_components_0.StreamNotificationsHeader);
local v12 = require(l_components_0.StreamNotificationsContent);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local v15 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_GetFFlagLuaAppEnableFoundationColors_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableFoundationColors;
return function(v17) --[[ Line: 28 ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), l_CurrentCamera_0 (copy), v4 (copy), v6 (copy), l_GetFFlagLuaAppEnableFoundationColors_0 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v15 (copy), l_DarkTheme_0 (copy), v11 (copy), v12 (copy), l_CoreGui_0 (copy)
    local v18 = l_useStyle_0();
    local v19, v20 = v5.useState(l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit);
    v5.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v4 (ref), v20 (copy)
        local v21 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 34 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v4 (ref), v20 (ref)
            if l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit then
                v20(true);
                return;
            else
                v20(false);
                return;
            end;
        end);
        return function() --[[ Line: 41 ]]
            -- upvalues: v21 (copy)
            v21:Disconnect();
        end;
    end, {});
    local v22, v23 = v5.useState(true);
    local v25 = v5.useCallback(function(v24) --[[ Line: 47 ]]
        -- upvalues: v23 (copy)
        v23(v24);
    end);
    local v26, v27 = v5.useState(true);
    return v6.createPortal({
        ScreenGui = v5.createElement("ScreenGui", {
            Enabled = v26, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = 10, 
            IgnoreGuiInset = true
        }, {
            TextButtonOverlayBackground = v5.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = if v22 then if l_GetFFlagLuaAppEnableFoundationColors_0() then v18.Theme.Overlay.Transparency else v18.Theme.BackgroundOnPress.Transparency else 1, 
                BackgroundColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v18.Theme.Overlay.Color else v18.Theme.BackgroundOnPress.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Text = "", 
                [v5.Event.Activated] = function() --[[ Line: 75 ]]
                    -- upvalues: v17 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v15 (ref)
                    v17.displayStream(false);
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v15.Context.click, v15.EventNames.closeContent, {
                        closeMethod = v15.CloseMethod.backgroundOverlay
                    });
                end
            }, {
                StreamNotificationsFrame = v5.createElement("TextButton", {
                    Size = if v19 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v4.Modal.Width, 0, v4.Modal.Height), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = if l_GetFFlagLuaAppEnableFoundationColors_0() then v18.Theme.BackgroundDefault.Color else if v18.theme == l_DarkTheme_0 then v18.Theme.Overlay.Color else v18.Theme.BackgroundMuted.Color, 
                    BackgroundTransparency = if l_GetFFlagLuaAppEnableFoundationColors_0() then v18.Theme.BackgroundDefault.Transparency else nil, 
                    AutoButtonColor = false, 
                    BorderSizePixel = 0, 
                    Text = ""
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = if not v19 then UDim.new(0, v4.Modal.CornerRadius) else UDim.new(0, 0)
                    }), 
                    Header = v5.createElement(v11, {
                        isSmallScreen = v19, 
                        displayStream = v17.displayStream
                    }), 
                    StreamNotificationsContent = v5.createElement(v12, {
                        showOverlay = v25, 
                        isSmallScreen = v19, 
                        displayStream = v17.displayStream, 
                        setDisplayScreenGuiEnabled = v27
                    })
                })
            })
        })
    }, l_CoreGui_0);
end;