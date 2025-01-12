local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(script.Parent.AdsEuDsaPromptUI);
local v8 = require(script.Parent.Flags);
local l_GetFFlagFixMouseForAdsEuDsaModal_0 = v8.GetFFlagFixMouseForAdsEuDsaModal;
local v10 = v8.GetFIntAdsEudsaModalAnimationTimeMs();
local v11 = v8.GetFFlagAdsEudsaModalUseAnimationTimeFlag();
local v12 = require(l_Parent_0.RobloxTranslator);
local function v15(v13, v14) --[[ Line: 21 ]] --[[ Name: getBodyText ]]
    -- upvalues: v12 (copy)
    if v13 ~= "" and v14 == "" then
        return v12:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamic", {
            AdvertiserName = v13
        });
    elseif v13 ~= "" and v14 ~= "" then
        return v12:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamicWithPayer", {
            AdvertiserName = v13, 
            PayerName = v14
        });
    else
        return v12:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic");
    end;
end;
local v16 = v5.PureComponent:extend("AdsEuDsaPromptHandler");
v16.init = function(v17) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_AdService_0 (copy), v15 (copy)
    v17:setState({
        enabled = false
    });
    v17.animating = false;
    v17.canvasGroupRef = v5.createRef();
    v17.savedSelectedCoreObject = nil;
    v17:setState({
        bodyText = ""
    });
    l_AdService_0.ShowDynamicEudsaDisclosure:Connect(function(v18, v19) --[[ Line: 50 ]]
        -- upvalues: v17 (copy), v15 (ref)
        v17:setState({
            bodyText = v15(v18, v19)
        });
        v17:showPrompt();
    end);
end;
v16.saveSelectedObject = function(v20) --[[ Line: 58 ]] --[[ Name: saveSelectedObject ]]
    -- upvalues: l_GuiService_0 (copy)
    v20.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
end;
v16.restoreSelectedObject = function(v21) --[[ Line: 63 ]] --[[ Name: restoreSelectedObject ]]
    -- upvalues: l_CoreGui_0 (copy), l_GuiService_0 (copy)
    if v21.savedSelectedCoreObject == nil or v21.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0) then
        l_GuiService_0.SelectedCoreObject = v21.savedSelectedCoreObject;
    end;
end;
v16.showPrompt = function(v22) --[[ Line: 70 ]] --[[ Name: showPrompt ]]
    -- upvalues: l_TweenService_0 (copy), v11 (copy), v10 (copy)
    if v22.animating or not v22.canvasGroupRef.current then
        return;
    else
        v22:saveSelectedObject();
        v22:setState({
            enabled = true
        });
        v22.animating = true;
        local v23 = l_TweenService_0:Create(v22.canvasGroupRef.current, TweenInfo.new(if v11 then v10 / 1000 else 1, Enum.EasingStyle.Linear), {
            GroupTransparency = 0
        });
        v23:Play();
        v23.Completed:Connect(function() --[[ Line: 88 ]]
            -- upvalues: v22 (copy)
            v22.animating = false;
        end);
        return;
    end;
end;
v16.hidePrompt = function(v24) --[[ Line: 93 ]] --[[ Name: hidePrompt ]]
    -- upvalues: l_TweenService_0 (copy), v11 (copy), v10 (copy), l_AdService_0 (copy)
    if v24.animating or not v24.canvasGroupRef.current then
        return;
    else
        v24.animating = true;
        local v25 = l_TweenService_0:Create(v24.canvasGroupRef.current, TweenInfo.new(if v11 then v10 / 1000 else 1, Enum.EasingStyle.Linear), {
            GroupTransparency = 1
        });
        v25:Play();
        v25.Completed:Connect(function() --[[ Line: 107 ]]
            -- upvalues: v24 (copy), l_AdService_0 (ref)
            v24.animating = false;
            v24:setState({
                enabled = false
            });
            l_AdService_0:HideEudsaDisclosure();
            v24:restoreSelectedObject();
        end);
        return;
    end;
end;
v16.render = function(v26) --[[ Line: 117 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), v7 (copy), l_GetFFlagFixMouseForAdsEuDsaModal_0 (copy)
    local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
    local l_Constants_0 = v6.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v31 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v32 = v5.createElement(v7, {
        handler = v26, 
        bodyText = v26.state.bodyText
    });
    return (v5.createElement("ScreenGui", {
        ResetOnSpawn = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = 1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        Enabled = v26.state.enabled
    }, v5.createElement(l_AppStyleProvider_0, {
        style = v31.Dark
    }, {
        CanvasGroup = v5.createElement("CanvasGroup", {
            [v5.Ref] = v26.canvasGroupRef, 
            Selectable = false, 
            GroupTransparency = 1, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Prompt = v32, 
            ModalFix = l_GetFFlagFixMouseForAdsEuDsaModal_0() and v5.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            })
        })
    })));
end;
return v16;