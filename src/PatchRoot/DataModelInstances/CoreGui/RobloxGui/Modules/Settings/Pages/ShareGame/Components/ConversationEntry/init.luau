local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_Modules_0.Settings.Theme);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v7 = require(l_ShareGame_0.Components.ConversationDetails);
local v8 = require(l_ShareGame_0.Components.ConversationThumbnail);
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v10 = require(l_ShareGame_0.Components.InviteButton);
local l_InviteStatus_0 = require(l_ShareGame_0.Constants).InviteStatus;
local v12 = Rect.new(10, 10, 10, 10);
local v13 = v4.PureComponent:extend("ConversationEntry");
v13.init = function(v14) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy), l_InviteStatus_0 (copy), l_Players_0 (copy)
    v14.eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0);
    v14.onInvite = function() --[[ Line: 37 ]]
        -- upvalues: v14 (copy), l_InviteStatus_0 (ref), l_Players_0 (ref)
        local l_inviteStatus_0 = v14.props.inviteStatus;
        if l_inviteStatus_0 and l_inviteStatus_0 ~= l_InviteStatus_0.Failed then
            return;
        else
            local l_analytics_0 = v14.props.analytics;
            local l_users_0 = v14.props.users;
            local l_inviteUser_0 = v14.props.inviteUser;
            if #l_users_0 == 1 then
                local function v24(v19) --[[ Line: 49 ]]
                    -- upvalues: l_users_0 (copy), l_Players_0 (ref), l_analytics_0 (copy)
                    if not v19 then
                        return;
                    else
                        local v20 = {};
                        for _, v22 in pairs(l_users_0) do
                            table.insert(v20, v22.id);
                        end;
                        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                        l_analytics_0:onActivatedInviteSent(l_LocalPlayer_0.UserId, v19.conversationId, v20);
                        return;
                    end;
                end;
                l_inviteUser_0(l_users_0[1].id):andThen(v24, function() --[[ Line: 64 ]]

                end);
            end;
            return;
        end;
    end;
end;
v13.render = function(v25) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v4 (copy), v12 (copy), v8 (copy), v7 (copy), v10 (copy)
    local l_visible_0 = v25.props.visible;
    local l_layoutOrder_0 = v25.props.layoutOrder;
    local l_zIndex_0 = v25.props.zIndex;
    local l_size_0 = v25.props.size;
    local l_subtitle_0 = v25.props.subtitle;
    local l_title_0 = v25.props.title;
    local l_users_1 = v25.props.users;
    local l_inviteStatus_1 = v25.props.inviteStatus;
    local l_presence_0 = v25.props.presence;
    local l_UIBloxThemeEnabled_0 = v5.UIBloxThemeEnabled;
    return v4.createElement("ImageButton", {
        Visible = l_visible_0, 
        Selectable = true, 
        BackgroundColor3 = v5.color("PlayerRowFrame"), 
        BackgroundTransparency = v5.transparency("PlayerRowFrame", 1), 
        Image = not l_UIBloxThemeEnabled_0 and "rbxasset://textures/ui/dialog_white.png" or nil, 
        ImageTransparency = not l_UIBloxThemeEnabled_0 and 0.85 or 0, 
        ScaleType = not l_UIBloxThemeEnabled_0 and Enum.ScaleType.Slice or Enum.ScaleType.Stretch, 
        SliceCenter = not l_UIBloxThemeEnabled_0 and v12 or Rect.new(), 
        Size = l_size_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0, 
        [v4.Event.Activated] = v25.onInvite
    }, {
        UICorner = l_UIBloxThemeEnabled_0 and v4.createElement("UICorner", {
            CornerRadius = v5.MenuContainerCornerRadius
        }) or nil, 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        Thumbnail = v4.createElement(v8, {
            users = l_users_1, 
            size = UDim2.new(0, 32, 0, 32), 
            layoutOrder = 0, 
            zIndex = l_zIndex_0
        }), 
        Details = v4.createElement(v7, {
            title = l_title_0, 
            subtitle = l_subtitle_0, 
            presence = l_presence_0, 
            size = UDim2.new(1, -125, 1, 0), 
            layoutOrder = 1, 
            zIndex = l_zIndex_0
        }), 
        InviteButton = v4.createElement(v10, {
            size = UDim2.new(0, 69, 1, 0), 
            layoutOrder = 2, 
            zIndex = l_zIndex_0, 
            onInvite = v25.onInvite, 
            inviteStatus = l_inviteStatus_1
        })
    });
end;
return v13;