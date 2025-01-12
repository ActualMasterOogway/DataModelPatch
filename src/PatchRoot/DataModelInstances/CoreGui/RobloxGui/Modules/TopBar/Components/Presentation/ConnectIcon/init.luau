local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local l_Badge_0 = v5.Badge;
local l_BadgeVariant_0 = v5.Enums.BadgeVariant;
local l_Images_0 = v4.App.ImageSet.Images;
local v9 = require(script.Parent.IconButton);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v12 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v13 = require(l_Parent_0.Constants);
local v14 = require(l_Chrome_0.Integrations.Party.usePartyIcon);
local v15 = game:DefineFastFlag("ConnectIconImportAppSetting", false);
local v16 = if v15 then nil else require(l_RobloxGui_0.Modules.Settings.SettingsHub);
local v17 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_InExperienceAppChatExperimentation_0 = v17.App.InExperienceAppChatExperimentation;
local l_InExperienceAppChatModal_0 = v17.App.InExperienceAppChatModal;
local l_FFlagAppChatRebrandInNonChrome_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppChatRebrandInNonChrome;
local v21 = if l_FFlagAppChatRebrandInNonChrome_0 then l_Images_0["icons/menu/2-person-with-bubble"] else l_Images_0["icons/menu/platformChatOff"];
local v22 = if l_FFlagAppChatRebrandInNonChrome_0 then l_Images_0["icons/menu/2-person-with-bubble-on"] else l_Images_0["icons/menu/platformChatOn"];
local function _() --[[ Line: 57 ]]
    -- upvalues: v16 (ref), l_RobloxGui_0 (copy)
    if v16 == nil then
        v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    end;
    return v16;
end;
local function _(v24) --[[ Line: 65 ]]
    -- upvalues: l_InExperienceAppChatModal_0 (copy), v16 (ref), l_RobloxGui_0 (copy)
    if v24 then
        return l_InExperienceAppChatModal_0.default.currentSquadId;
    else
        if v16 == nil then
            v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        end;
        return v16.Instance.AppChatPage.CurrentSquadId;
    end;
end;
local function v30(v26) --[[ Line: 73 ]]
    -- upvalues: l_InExperienceAppChatModal_0 (copy), v15 (copy), v16 (ref), l_RobloxGui_0 (copy)
    if v26 then
        return l_InExperienceAppChatModal_0.default:getVisible();
    elseif v15 then
        if v16 == nil then
            v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        end;
        local l_v16_0 = v16;
        local v28 = false;
        if l_v16_0.Instance.Pages.CurrentPage ~= nil then
            v28 = l_v16_0.Instance.Pages.CurrentPage.Page.Name == l_v16_0.Instance.AppChatPage.Page.Name;
        end;
        return v28;
    else
        local v29 = false;
        if v16.Instance.Pages.CurrentPage ~= nil then
            v29 = v16.Instance.Pages.CurrentPage.Page.Name == v16.Instance.AppChatPage.Page.Name;
        end;
        return v29;
    end;
end;
ConnectIcon = function(v31) --[[ Line: 86 ]] --[[ Name: ConnectIcon ]]
    -- upvalues: l_InExperienceAppChatExperimentation_0 (copy), v2 (copy), l_InExperienceAppChatModal_0 (copy), v16 (ref), l_RobloxGui_0 (copy), v30 (copy), v14 (copy), v22 (copy), v21 (copy), v15 (copy), v13 (copy), v12 (copy), v3 (copy), v9 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy)
    local v32 = l_InExperienceAppChatExperimentation_0.default:shouldUseIndependentAppChatContainer();
    local v33 = v2.useRef(nil);
    local l_useState_0 = v2.useState;
    local v35;
    if v32 then
        v35 = l_InExperienceAppChatModal_0.default.currentSquadId;
    else
        if v16 == nil then
            v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        end;
        v35 = v16.Instance.AppChatPage.CurrentSquadId;
    end;
    l_useState_0, v35 = l_useState_0(v35);
    local v36, v37 = v2.useState(v30(v32));
    local v38 = v2.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: l_useState_0 (copy)
        return l_useState_0 ~= "";
    end, {
        l_useState_0
    });
    local v39 = v14(30, 26, if v36 then v22 else v21);
    v2.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v35 (copy), v32 (copy), l_InExperienceAppChatModal_0 (ref), v16 (ref), l_RobloxGui_0 (ref), v15 (ref)
        local l_v35_0 = v35;
        local v41;
        if v32 then
            v41 = l_InExperienceAppChatModal_0.default.currentSquadId;
        else
            if v16 == nil then
                v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            end;
            v41 = v16.Instance.AppChatPage.CurrentSquadId;
        end;
        l_v35_0(v41);
        if v32 then
            v35(l_InExperienceAppChatModal_0.default.currentSquadId);
            l_v35_0 = l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v42) --[[ Line: 100 ]]
                -- upvalues: v35 (ref)
                v35(v42);
            end);
            return function() --[[ Line: 103 ]]
                -- upvalues: l_v35_0 (copy)
                l_v35_0:Disconnect();
            end;
        elseif v15 then
            if v16 == nil then
                v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            end;
            l_v35_0 = v16;
            v35(l_v35_0.Instance.AppChatPage.CurrentSquadId);
            v41 = l_v35_0.Instance.AppChatPage.CurrentSquadIdSignal.Event:Connect(function(v43) --[[ Line: 110 ]]
                -- upvalues: v35 (ref)
                v35(v43);
            end);
            return function() --[[ Line: 113 ]]
                -- upvalues: v41 (copy)
                v41:Disconnect();
            end;
        else
            v35(v16.Instance.AppChatPage.CurrentSquadId);
            l_v35_0 = v16.Instance.AppChatPage.CurrentSquadIdSignal.Event:Connect(function(v44) --[[ Line: 118 ]]
                -- upvalues: v35 (ref)
                v35(v44);
            end);
            return function() --[[ Line: 121 ]]
                -- upvalues: l_v35_0 (copy)
                l_v35_0:Disconnect();
            end;
        end;
    end, {
        v32
    });
    v2.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v37 (copy), v30 (ref), v32 (copy), l_InExperienceAppChatModal_0 (ref), v15 (ref), v16 (ref), l_RobloxGui_0 (ref)
        v37(v30(v32));
        if v32 then
            local v46 = l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v45) --[[ Line: 132 ]]
                -- upvalues: v37 (ref)
                v37(v45);
            end);
            return function() --[[ Line: 136 ]]
                -- upvalues: v46 (copy)
                v46:Disconnect();
            end;
        elseif v15 then
            if v16 == nil then
                v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            end;
            local v48 = v16.Instance.CurrentPageSignal:connect(function(v47) --[[ Line: 142 ]]
                -- upvalues: v37 (ref), v16 (ref)
                v37(v16.Instance.AppChatPage.Page.Name == v47);
            end);
            return function() --[[ Line: 145 ]]
                -- upvalues: v48 (copy)
                v48:disconnect();
            end;
        else
            local v50 = v16.Instance.CurrentPageSignal:connect(function(v49) --[[ Line: 149 ]]
                -- upvalues: v37 (ref), v16 (ref)
                v37(v16.Instance.AppChatPage.Page.Name == v49);
            end);
            return function() --[[ Line: 152 ]]
                -- upvalues: v50 (copy)
                v50:disconnect();
            end;
        end;
    end, {
        v32
    });
    local v52 = v2.useCallback(function(v51) --[[ Line: 159 ]]
        -- upvalues: v38 (copy), v31 (copy), v13 (ref)
        if v38 and v51 then
            v31.setKeepOutArea(v13.ConnectIconKeepOutAreaId, v51.AbsolutePosition, v51.AbsoluteSize);
            return;
        else
            v31.removeKeepOutArea(v13.ConnectIconKeepOutAreaId);
            return;
        end;
    end, {
        v38, 
        v31.setKeepOutArea, 
        v31.removeKeepOutArea
    });
    local function v54(v53) --[[ Line: 167 ]]
        -- upvalues: v33 (copy), v52 (copy)
        if v53 then
            v33.current = v53;
            v52(v53);
        end;
    end;
    v2.useEffect(function() --[[ Line: 174 ]]
        -- upvalues: v12 (ref), v33 (copy), v52 (copy)
        if v12 and v33.current then
            v52(v33.current);
        end;
    end, {
        v52
    });
    local v55 = v2.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: l_InExperienceAppChatModal_0 (ref)
        l_InExperienceAppChatModal_0:toggleVisibility();
    end, {});
    local v59 = v2.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v15 (ref), v16 (ref), l_RobloxGui_0 (ref), v36 (copy)
        if v15 then
            if v16 == nil then
                v16 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
            end;
            local l_v16_1 = v16;
            local l_l_v16_1_Visibility_0 = l_v16_1:GetVisibility();
            if l_l_v16_1_Visibility_0 and v36 then
                l_v16_1.Instance:PopMenu(false, true);
                return;
            else
                if not l_l_v16_1_Visibility_0 then
                    l_v16_1.Instance:SetVisibility(true, false);
                end;
                l_v16_1:SwitchToPage(l_v16_1.Instance.AppChatPage);
                return;
            end;
        else
            local l_v16_Visibility_0 = v16:GetVisibility();
            if l_v16_Visibility_0 and v36 then
                v16.Instance:PopMenu(false, true);
                return;
            else
                if not l_v16_Visibility_0 then
                    v16.Instance:SetVisibility(true, false);
                end;
                v16:SwitchToPage(v16.Instance.AppChatPage);
                return;
            end;
        end;
    end, {
        v36
    });
    return v3.createElement("TextButton", {
        Text = "", 
        Visible = v38, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 30, 1, 0), 
        LayoutOrder = v31.layoutOrder, 
        Selectable = false, 
        [v3.Change.AbsoluteSize] = if v12 then v52 else nil, 
        [v3.Change.AbsolutePosition] = if v12 then v52 else nil
    }, {
        Background = v3.createElement(v9, {
            backgroundTransparency = v39.image.backgroundColor == nil and 1 or 0, 
            backgroundColor3 = v39.image.backgroundColor, 
            icon = v39.image.thumbnail, 
            backgroundCornerRadius = UDim.new(0, 6), 
            iconSize = v39.size:map(function(v60) --[[ Line: 226 ]]
                return UDim2.fromOffset(v60, v60);
            end), 
            onActivated = if v32 then v55 else v59, 
            [v3.Ref] = v54
        }), 
        BadgeContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromOffset(19, 8), 
            ZIndex = 2
        }, {
            Badge = v3.createElement(l_Badge_0, {
                variant = l_BadgeVariant_0.Primary
            })
        })
    });
end;
return ConnectIcon;