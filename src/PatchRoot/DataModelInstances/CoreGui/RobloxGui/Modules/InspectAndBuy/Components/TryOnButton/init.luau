local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.Constants);
local v10 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v11 = require(l_Parent_0.Thunks.TryOnItem);
local v12 = require(l_Parent_0.getSelectionImageObjectRounded);
local v13 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local l_TryOn_0 = require(script.Parent.Common.ControllerShortcutKeycodes).TryOn;
local v15 = v4.PureComponent:extend("TryOnButton");
v15.init = function(v16) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), l_ContextActionService_0 (copy), l_TryOn_0 (copy)
    v16.selectedImage = v12();
    l_ContextActionService_0:BindCoreAction("TryOnGamepadShortcut", function(_, v18, _) --[[ Line: 29 ]]
        -- upvalues: v16 (copy)
        if v18 == Enum.UserInputState.End then
            v16:activateButton();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, l_TryOn_0);
end;
v15.activateButton = function(v20) --[[ Line: 38 ]] --[[ Name: activateButton ]]
    -- upvalues: v9 (copy)
    if not v20.props.showTryOn then
        return;
    else
        local l_assetInfo_0 = v20.props.assetInfo;
        local l_tryOnItem_0 = v20.props.tryOnItem;
        local l_takeOffItem_0 = v20.props.takeOffItem;
        local l_tryingOn_0 = v20.props.tryingOnInfo.tryingOn;
        local l_partOfBundleAndOffsale_0 = v20.props.partOfBundleAndOffsale;
        local l_bundleId_0 = v20.props.bundleId;
        if not (l_assetInfo_0 and v20.props.localPlayerModel and v9.LayeredAssetTypes[l_assetInfo_0.assetTypeId] ~= nil and v20.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6) then
            if l_tryingOn_0 then
                l_takeOffItem_0();
                return;
            else
                l_tryOnItem_0(true, l_assetInfo_0.assetId, l_assetInfo_0.assetTypeId, l_partOfBundleAndOffsale_0, l_bundleId_0);
            end;
        end;
        return;
    end;
end;
v15.willUnmount = function(_) --[[ Line: 65 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("TryOnGamepadShortcut");
end;
v15.render = function(v28) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v9 (copy), v4 (copy), v8 (copy), v3 (copy), l_AppFonts_0 (copy)
    local l_tryingOn_1 = v28.props.tryingOnInfo.tryingOn;
    local l_showTryOn_0 = v28.props.showTryOn;
    local l_locale_0 = v28.props.locale;
    local l_assetInfo_1 = v28.props.assetInfo;
    local v33 = l_assetInfo_1 and l_assetInfo_1.creatorId or 0;
    local l_tryOnButtonRef_0 = v28.props.tryOnButtonRef;
    local v35 = v13 and -32 or v33 == "1" and -32 or -5;
    local v36 = nil;
    v36 = l_tryingOn_1 and "InGame.InspectMenu.Action.TakeOff" or "InGame.InspectMenu.Action.TryOn";
    local v37 = l_assetInfo_1 and v28.props.localPlayerModel and v9.LayeredAssetTypes[l_assetInfo_1.assetTypeId] ~= nil and v28.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
    return v4.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, v35, 0, 44), 
        Visible = l_showTryOn_0, 
        LayoutOrder = 2, 
        Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png", 
        ImageTransparency = v37 and 0.5 or 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(5, 5, 120, 20)
    }, {
        SelectionGainedImage = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = false, 
            Image = "rbxasset://textures/ui/InspectMenu/Button_white.png", 
            ImageColor3 = v8.Pumice
        }), 
        TryOnTextKey = v4.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v3:FormatByKeyForLocale(v36, l_locale_0), 
            Font = l_AppFonts_0.default:getDefault(), 
            TextSize = 16, 
            TextColor3 = v8.White, 
            TextTransparency = v37 and 0.5 or 0, 
            SelectionImageObject = v28.selectedImage, 
            ZIndex = 2, 
            [v4.Event.SelectionGained] = function(v38) --[[ Line: 121 ]]
                -- upvalues: v8 (ref)
                v38.Parent.SelectionGainedImage.Visible = true;
                v38.TextColor3 = v8.Carbon;
            end, 
            [v4.Event.SelectionLost] = function(v39) --[[ Line: 125 ]]
                -- upvalues: v8 (ref)
                v39.Parent.SelectionGainedImage.Visible = false;
                v39.TextColor3 = v8.White;
            end, 
            [v4.Ref] = l_tryOnButtonRef_0, 
            [v4.Event.Activated] = function() --[[ Line: 130 ]]
                -- upvalues: v28 (copy)
                v28:activateButton();
            end
        })
    });
end;
return v5.UNSTABLE_connect2(function(v40, _) --[[ Line: 137 ]]
    local l_assetId_0 = v40.detailsInformation.assetId;
    return {
        locale = v40.locale, 
        view = v40.view, 
        assetInfo = v40.assets[l_assetId_0], 
        bundleInfo = v40.bundles, 
        tryingOnInfo = v40.tryingOnInfo
    };
end, function(v43) --[[ Line: 147 ]]
    -- upvalues: v11 (copy), v10 (copy)
    return {
        tryOnItem = function(v44, v45, v46, v47, v48) --[[ Line: 149 ]] --[[ Name: tryOnItem ]]
            -- upvalues: v43 (copy), v11 (ref)
            v43(v11(v44, v45, v46, v47, v48));
        end, 
        takeOffItem = function() --[[ Line: 152 ]] --[[ Name: takeOffItem ]]
            -- upvalues: v43 (copy), v10 (ref)
            v43(v10(false, nil, nil));
        end
    };
end)(v15);