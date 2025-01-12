local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_IconButton_0 = v9.App.Button.IconButton;
local v14 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v16 = require(script.Parent.Common.NameTextBox);
local v17 = require(script.Parent.AssetDescriptionTextBox);
local v18 = require(script.Parent.ObjectViewport);
local v19 = require(script.Parent.Common.PreviewViewport);
local v20 = require(script.Parent.EmoteThumbnailView);
local v21 = require(script.Parent.EmoteThumbnailEditor);
local v22 = require(script.Parent.EmoteThumbnailParameters);
local v23 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
local l_Images_0 = v9.App.ImageSet.Images;
local v25 = l_Images_0["icons/actions/previewExpand"];
local v26 = l_Images_0["icons/actions/edit/edit"];
local v27 = {
    [Enum.AssetType.TShirtAccessory] = true, 
    [Enum.AssetType.ShirtAccessory] = true, 
    [Enum.AssetType.PantsAccessory] = true, 
    [Enum.AssetType.JacketAccessory] = true, 
    [Enum.AssetType.SweaterAccessory] = true, 
    [Enum.AssetType.ShortsAccessory] = true, 
    [Enum.AssetType.LeftShoeAccessory] = true, 
    [Enum.AssetType.RightShoeAccessory] = true, 
    [Enum.AssetType.DressSkirtAccessory] = true, 
    [Enum.AssetType.HairAccessory] = true
};
local l_Parent_0 = script.Parent.Parent;
local v29 = require(l_Parent_0.GetFFlagValidateDescription);
local v30 = game:DefineFastFlag("SendConsentDeniedOnCancel", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableEmotePublish");
local v32 = v4.PureComponent:extend("PublishAssetPromptSingleStep");
v32.validateProps = v6.strictInterface({
    screenSize = v6.Vector2, 
    assetInstance = v6.Instance, 
    assetType = v6.enum(Enum.AssetType), 
    guid = v6.any, 
    scopes = v6.any, 
    closePrompt = v6.callback
});
v32.getDefaultText = function(v33) --[[ Line: 94 ]] --[[ Name: getDefaultText ]]
    -- upvalues: v8 (copy), l_LocalPlayer_0 (copy)
    if v33.props.assetType == Enum.AssetType.Model then
        return v8:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", {
            RBX_NAME = l_LocalPlayer_0 and l_LocalPlayer_0.Name or ""
        });
    else
        return "";
    end;
end;
v32.init = function(v34) --[[ Line: 104 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), l_ExperienceAuthService_0 (copy), v29 (copy), l_game_EngineFeature_0 (copy), v4 (copy)
    v34.assetName = v34:getDefaultText();
    v34.assetDescription = v34:getDefaultText();
    v34.isNameValid = true;
    v34.isDescriptionValid = true;
    v34:setState({
        thumbnailParameters = v22.defaultParameters, 
        showingThumbnailEditor = false, 
        showingAssetPreview = false
    });
    v34.closePrompt = function() --[[ Line: 116 ]]
        -- upvalues: v34 (copy)
        v34.props.closePrompt();
    end;
    v34.openThumbnailEditor = function() --[[ Line: 120 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showingThumbnailEditor = true
        });
    end;
    v34.closeThumbnailEditor = function() --[[ Line: 126 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showingThumbnailEditor = false
        });
    end;
    v34.openAssetPreview = function() --[[ Line: 132 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showingAssetPreview = true
        });
    end;
    v34.closeAssetPreview = function() --[[ Line: 138 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showingAssetPreview = false
        });
    end;
    v34.updateThumbnailParameters = function(v35) --[[ Line: 144 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            thumbnailParameters = v35
        });
    end;
    v34.denyAndClose = function() --[[ Line: 150 ]]
        -- upvalues: l_ExperienceAuthService_0 (ref), v34 (copy)
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v34.props.guid, v34.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {});
        v34.closePrompt();
    end;
    v34.confirmAndUpload = function() --[[ Line: 160 ]]
        -- upvalues: v34 (copy), v29 (ref), l_game_EngineFeature_0 (ref), v22 (ref), l_ExperienceAuthService_0 (ref)
        if not v34.isNameValid then
            return;
        elseif v29() and not v34.isDescriptionValid then
            return;
        else
            local v36 = {
                assetName = v34.assetName, 
                assetDescription = v34.assetDescription
            };
            if l_game_EngineFeature_0 and v34.props.assetType == Enum.AssetType.EmoteAnimation then
                v36.emoteThumbnailParameters = v22.encodeAsATable(v34.state.thumbnailParameters);
            end;
            l_ExperienceAuthService_0:ScopeCheckUIComplete(v34.props.guid, v34.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, v36);
            v34.closePrompt();
            return;
        end;
    end;
    v34.onAssetNameUpdated = function(v37, v38) --[[ Line: 190 ]]
        -- upvalues: v34 (copy)
        if v38 then
            v34.assetName = v37;
            v34.isNameValid = true;
            return;
        else
            v34.isNameValid = false;
            return;
        end;
    end;
    v34.onAssetDescriptionUpdated = function(v39, v40) --[[ Line: 199 ]]
        -- upvalues: v34 (copy)
        v34.assetDescription = v39;
        v34.isDescriptionValid = v40;
    end;
    v34.nameTextBoxRef = v4.createRef();
    v34.descriptionTextBoxRef = v4.createRef();
end;
v32.renderMiddle = function(v41, v42) --[[ Line: 208 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), l_game_EngineFeature_0 (copy), v4 (copy), v14 (copy), v18 (copy), v20 (copy), l_IconButton_0 (copy), v25 (copy), v26 (copy), v16 (copy), v17 (copy)
    return l_withStyle_0(function(v43) --[[ Line: 209 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v41 (copy), v4 (ref), v14 (ref), v18 (ref), v20 (ref), l_IconButton_0 (ref), v25 (ref), v26 (ref), v42 (copy), v16 (ref), v17 (ref)
        local l_Font_0 = v43.Font;
        local l_Theme_0 = v43.Theme;
        local v46 = l_game_EngineFeature_0 and v41.props.assetType == Enum.AssetType.EmoteAnimation and v41.props.assetInstance:IsA("AnimationClip");
        return v4.createElement(v14.Focusable.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 150), 
            defaultChild = v41.nameTextBoxRef, 
            [v4.Ref] = v41.middleContentRef
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(200, 200)
            }), 
            TopSection = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -50), 
                BackgroundTransparency = 1
            }, {
                ViewportParent = v4.createElement("Frame", {
                    Size = UDim2.new(0.4, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ObjectViewport = not v46 and v4.createElement(v18, {
                        model = v41.props.assetInstance
                    }) or nil, 
                    EmoteThumbnailParent = v46 and v4.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        AspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.FitWithinMaxSize, 
                            DominantAxis = Enum.DominantAxis.Width
                        }), 
                        EmoteThumbnailView = v4.createElement(v20, {
                            animationClip = v41.props.assetInstance, 
                            thumbnailParameters = v41.state.thumbnailParameters
                        }), 
                        PreviewButton = v4.createElement(l_IconButton_0, {
                            position = UDim2.new(1, -2, 1, -2), 
                            anchorPoint = Vector2.new(1, 1), 
                            icon = v25, 
                            size = UDim2.new(0, 30, 0, 30), 
                            showBackground = true, 
                            onActivated = v41.openAssetPreview
                        }), 
                        EditButton = v4.createElement(l_IconButton_0, {
                            position = UDim2.new(0, 2, 1, -2), 
                            anchorPoint = Vector2.new(0, 1), 
                            icon = v26, 
                            size = UDim2.new(0, 30, 0, 30), 
                            showBackground = true, 
                            onActivated = v41.openThumbnailEditor
                        })
                    }) or nil
                }), 
                NameDescriptionFields = v4.createElement("Frame", {
                    Size = UDim2.new(0.6, -10, 1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1
                }, {
                    NameLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 15), 
                        Font = l_Font_0.Body.Font, 
                        Text = v42.name, 
                        TextSize = 12, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    NameInput = v4.createElement(v16, {
                        Size = UDim2.new(1, 0, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 15), 
                        onNameUpdated = v41.onAssetNameUpdated, 
                        nameTextBoxRef = v41.nameTextBoxRef, 
                        NextSelectionDown = v41.descriptionTextBoxRef, 
                        defaultName = v41.assetName
                    }), 
                    DescriptionLabel = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 15), 
                        Position = UDim2.new(0, 0, 0, 60), 
                        Font = l_Font_0.Body.Font, 
                        TextSize = 12, 
                        Text = v42.description, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    DescriptionInput = v4.createElement(v17, {
                        Size = UDim2.new(1, 0, 0, 80), 
                        Position = UDim2.new(0, 0, 0, 75), 
                        onAssetDescriptionUpdated = v41.onAssetDescriptionUpdated, 
                        descriptionTextBoxRef = v41.descriptionTextBoxRef, 
                        NextSelectionUp = v41.nameTextBoxRef, 
                        defaultDescription = v41.assetDescription
                    })
                })
            }), 
            Disclaimer = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 50), 
                Text = v42.disclaimer, 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                TextWrapped = true
            })
        });
    end);
end;
v32.renderAlertLocalized = function(v47, v48) --[[ Line: 334 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v4 (copy), l_InteractiveAlert_0 (copy), v30 (copy), l_ButtonType_0 (copy), l_game_EngineFeature_0 (copy), v21 (copy), v19 (copy)
    local v49 = v4.createElement(l_InteractiveAlert_0, {
        title = v48.title, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = if v30 then v47.denyAndClose else v47.closePrompt, 
                        text = v48.cancel
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v47.confirmAndUpload, 
                        text = v48.submit, 
                        isDelayedInput = true, 
                        enableInputDelayed = true, 
                        delayInputSeconds = 3
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        middleContent = function() --[[ Line: 359 ]] --[[ Name: middleContent ]]
            -- upvalues: v47 (copy), v48 (copy)
            return v47:renderMiddle(v48);
        end, 
        screenSize = v47.props.screenSize, 
        defaultChildRef = v47.props.defaultChildRef, 
        isMiddleContentFocusable = true
    });
    if l_game_EngineFeature_0 then
        return v4.createFragment({
            Prompt = v49, 
            ThumbnailEditor = v47.state.showingThumbnailEditor and v4.createElement(v21, {
                animationClip = v47.props.assetInstance, 
                initialThumbnailParameters = v47.state.thumbnailParameters, 
                screenSize = v47.props.screenSize, 
                updateThumbnailCallback = v47.updateThumbnailParameters, 
                closePromptCallback = v47.closeThumbnailEditor
            }) or nil, 
            PreviewFrame = v47.state.showingAssetPreview and v4.createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 0
            }, {
                PreviewViewport = v4.createElement(v19, {
                    asset = v47.props.assetInstance, 
                    closePreviewView = v47.closeAssetPreview
                })
            }) or nil
        });
    else
        return v49;
    end;
end;
local function _(v50) --[[ Line: 397 ]] --[[ Name: IsLayeredClothingType ]]
    -- upvalues: v27 (copy)
    if v27[v50] == true then
        return true;
    else
        return false;
    end;
end;
local function v54(v52) --[[ Line: 405 ]] --[[ Name: GetLocalizedStringsForAssetType ]]
    -- upvalues: v8 (copy), v27 (copy)
    local v53 = {
        name = v8:FormatByKey("CoreScripts.PublishAssetPrompt.Name"), 
        description = v8:FormatByKey("CoreScripts.PublishAssetPrompt.Description"), 
        invalidName = v8:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"), 
        invalidDescription = v8:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"), 
        cancel = v8:FormatByKey("CoreScripts.PublishAssetPrompt.Cancel"), 
        submit = v8:FormatByKey("CoreScripts.PublishAssetPrompt.Submit")
    };
    if v27[v52] == true then
        v53.title = v8:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextClothing");
        v53.disclaimer = v8:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerAvatar");
        return v53;
    elseif v52 == Enum.AssetType.EmoteAnimation then
        v53.title = v8:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextEmote");
        v53.disclaimer = v8:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerEmote");
        return v53;
    elseif v52 == Enum.AssetType.Model then
        v53.title = v8:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextModel");
        v53.disclaimer = v8:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel");
        return v53;
    else
        if v52 == Enum.AssetType.Package then
            v53.title = v8:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextPackage");
            v53.disclaimer = v8:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel");
        end;
        return v53;
    end;
end;
v32.render = function(v55) --[[ Line: 434 ]] --[[ Name: render ]]
    -- upvalues: v54 (copy)
    return v55:renderAlertLocalized((v54(v55.props.assetType)));
end;
return v5.connect(function(v56) --[[ Line: 439 ]] --[[ Name: mapStateToProps ]]
    return {
        assetInstance = v56.promptRequest.promptInfo.assetInstance, 
        assetType = v56.promptRequest.promptInfo.assetType, 
        guid = v56.promptRequest.promptInfo.guid, 
        scopes = v56.promptRequest.promptInfo.scopes
    };
end, function(v57) --[[ Line: 448 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v23 (copy)
    return {
        closePrompt = function() --[[ Line: 450 ]] --[[ Name: closePrompt ]]
            -- upvalues: v57 (copy), v23 (ref)
            return v57(v23());
        end
    };
end)(v32);