local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_RobloxGui_0.Modules.Ads.AdTeleportPromptUI);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local v10 = {};
v10.__index = v10;
local v11, v12 = v7.createBinding(1);
v10.new = function(v13, v14) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v9 (copy)
    assert(v13.Parent ~= nil, "Typechecker assurance, guaranteed by engine");
    local v15 = setmetatable({}, v10);
    v15.window = nil;
    v15.portal = v13;
    v15.hasActiveWindow = false;
    v15.destination = v14;
    v15.fadingIn = true;
    v15.movedAway = false;
    local l_Parent_0 = v13.Parent;
    v15.maxDistance = l_Parent_0.Size.X / 2 + l_Parent_0.Size.Z + 2;
    v15.createTime = -1;
    v15.focusController = v9.createFocusController();
    return v15;
end;
v10.acceptPrompt = function(v17) --[[ Line: 37 ]] --[[ Name: acceptPrompt ]]
    -- upvalues: l_Players_0 (copy)
    v17.portal:TeleportConfirmed(v17.destination, l_Players_0.LocalPlayer);
    v17:closeWindow();
end;
v10.rejectButton = function(v18) --[[ Line: 42 ]] --[[ Name: rejectButton ]]
    v18:rejectPrompt(true, false);
end;
v10.rejectPrompt = function(v19, v20, v21) --[[ Line: 46 ]] --[[ Name: rejectPrompt ]]
    v19.portal:TeleportRejected(v20, v21);
    v19:closeWindow();
end;
local function _(v22, v23) --[[ Line: 51 ]] --[[ Name: getTransparencyFactor ]]
    local v24 = 1 - (1 - v22 / v23) ^ 3;
    if v24 > 1 then
        v24 = 1;
    end;
    return v24;
end;
v10.onHeartbeat = function(v26) --[[ Line: 59 ]] --[[ Name: onHeartbeat ]]
    -- upvalues: l_Players_0 (copy), v12 (copy)
    assert(l_Players_0.LocalPlayer ~= nil, "Typechecker assurance");
    assert(v26.portal.Parent ~= nil, "Typechecker assurance, guaranteed on engine side.");
    if l_Players_0.LocalPlayer.Character == nil or l_Players_0.LocalPlayer.Character.PrimaryPart == nil or v26.portal == nil or v26.portal.Parent.CFrame == nil then
        v26:rejectPrompt(false, false);
        return;
    else
        if v26.fadingIn then
            local v27 = DateTime.now().UnixTimestampMillis - v26.createTime;
            local v28 = v27 > 450;
            local l_v12_0 = v12;
            local v30 = 1 - (1 - (450 - v27) / 450) ^ 3;
            if v30 > 1 then
                v30 = 1;
            end;
            l_v12_0(v30);
            if v28 then
                v26.fadingIn = false;
                v12(0);
            end;
        end;
        assert(l_Players_0.LocalPlayer.Character ~= nil, "Typechecker assurance, guaranteed above.");
        assert(l_Players_0.LocalPlayer.Character.PrimaryPart ~= nil, "Typechecker assurance guaranteed above.");
        local l_Position_0 = v26.portal.Parent.Position;
        if (l_Players_0.LocalPlayer.Character.PrimaryPart.Position - l_Position_0).Magnitude > v26.maxDistance and not v26.movedAway then
            v26.createTime = DateTime.now().UnixTimestampMillis;
            v26.movedAway = true;
            v26.fadingIn = false;
        end;
        if v26.movedAway then
            local v32 = DateTime.now().UnixTimestampMillis - v26.createTime;
            local v33 = v32 > 450;
            local l_v12_1 = v12;
            local v35 = 1 - (1 - v32 / 450) ^ 3;
            if v35 > 1 then
                v35 = 1;
            end;
            l_v12_1(v35);
            if v33 then
                v26:rejectPrompt(false, true);
            end;
        end;
        return;
    end;
end;
local function _(v36) --[[ Line: 111 ]] --[[ Name: isGamepad ]]
    return v36.Name:match("^Gamepad*") ~= nil;
end;
v10.focusIfGamepad = function(v38) --[[ Line: 115 ]] --[[ Name: focusIfGamepad ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0:GetLastInputType().Name:match("^Gamepad*") ~= nil then
        v38.focusController:captureFocus();
    end;
end;
v10.instantiatePrompt = function(v39, v40, v41) --[[ Line: 121 ]] --[[ Name: instantiatePrompt ]]
    -- upvalues: v8 (copy), v7 (copy), v6 (copy), v9 (copy), v11 (copy), l_CoreGui_0 (copy)
    local l_AppStyleProvider_0 = v8.App.Style.AppStyleProvider;
    local l_Constants_0 = v8.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v46 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v47, v48 = v7.createBinding(UDim2.fromOffset(0, 0));
    local v50 = v7.createElement(v6, {
        shouldRenderCancelButton = v41, 
        experienceName = v40, 
        handler = v39, 
        onAbsoluteSizeChanged = function(v49) --[[ Line: 140 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v48 (copy)
            v48(UDim2.fromOffset(v49.AbsoluteSize.X, v49.AbsoluteSize.Y));
        end
    });
    local v51 = v7.createElement("ScreenGui", {
        ResetOnSpawn = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = 1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false
    }, v7.createElement(l_AppStyleProvider_0, {
        style = v46.Dark
    }, {
        CanvasGroup = v7.createElement(v9.Focusable.CanvasGroup, {
            focusController = v39.focusController, 
            Selectable = false, 
            GroupTransparency = v11, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v47, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Prompt = v50
        })
    }));
    v39.window = v7.mount(v51, l_CoreGui_0, "AdTeleportPrompt");
    v39.hasActiveWindow = true;
    v39:focusIfGamepad();
end;
local function _(v52) --[[ Line: 175 ]] --[[ Name: fetchExperienceName ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetProductInfo(v52).Name;
end;
v10.fetchTitle = function(v54) --[[ Line: 179 ]] --[[ Name: fetchTitle ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    local l_destination_0 = v54.destination;
    local l_Name_0 = l_MarketplaceService_0:GetProductInfo(l_destination_0).Name;
    if l_Name_0 == "Grey Adidas Shoes" then
        error("Name not found.");
        return;
    else
        return l_Name_0;
    end;
end;
v10.closeWindow = function(v57) --[[ Line: 188 ]] --[[ Name: closeWindow ]]
    -- upvalues: v7 (copy)
    assert(v57.hasActiveWindow == true, "Only way unmounting makes sense is if window is active.");
    v7.unmount(v57.window);
    v57.hasActiveWindow = false;
end;
v10.updateCreateTime = function(v58) --[[ Line: 194 ]] --[[ Name: updateCreateTime ]]
    v58.createTime = DateTime.now().UnixTimestampMillis;
end;
return v10;