local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v8 = require(script.Parent.AvatarParts.AvatarPartGrid);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_Parent_0 = script.Parent.Parent;
local v12 = require(l_Parent_0.BasePublishPrompt);
local v13 = require(l_Parent_0.Common.ObjectViewport);
local v14 = require(l_Parent_0.Common.LabeledTextBox);
local v15 = require(l_Parent_0.Common.PublishInfoList);
local v16 = require(l_RobloxGui_0.Modules.PurchasePrompt);
local l_PublishAssetAnalytics_0 = v16.PublishAssetAnalytics;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v19 = require(l_Actions_0.SetPromptVisibility);
local v20 = require(script.Parent.Parent.Parent.FFlagPromptCreateAvatarDescriptionInvalidFix);
local v21 = UDim.new(0, 20);
local v22 = v3.PureComponent:extend("PublishAvatarPrompt");
v22.validateProps = v5.strictInterface({
    screenSize = v5.Vector2, 
    humanoidModel = v5.optional(v5.instanceOf("Model")), 
    guid = v5.any, 
    scopes = v5.any, 
    SetPromptVisibility = v5.callback
});
v22.init = function(v23) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), l_PublishAssetAnalytics_0 (copy), v16 (copy), l_mutedError_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    assert(l_LocalPlayer_0, "LocalPlayer must not be nil");
    v23:setState({
        showingPreviewView = false, 
        name = l_LocalPlayer_0.Name .. "'s Body", 
        isNameValid = true, 
        description = l_LocalPlayer_0.Name .. "'s Body", 
        isDescValid = true, 
        showTopScrim = false, 
        purchasePromptReady = true
    });
    v23.openPreviewView = function() --[[ Line: 70 ]]
        -- upvalues: l_PublishAssetAnalytics_0 (ref), v23 (copy)
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Expand);
        v23:setState({
            showingPreviewView = true
        });
    end;
    v23.closePreviewView = function() --[[ Line: 76 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            showingPreviewView = false
        });
    end;
    v23.canSubmit = function() --[[ Line: 83 ]]
        -- upvalues: v23 (copy)
        return v23.state.isNameValid and v23.state.isDescValid and v23.props.humanoidModel ~= nil and v23.state.purchasePromptReady;
    end;
    v23.onSubmit = function() --[[ Line: 90 ]]
        -- upvalues: l_PublishAssetAnalytics_0 (ref), v23 (copy), v16 (ref), l_mutedError_0 (ref)
        l_PublishAssetAnalytics_0.sendButtonClicked(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Buy);
        local v25 = {
            name = v23.state.name, 
            description = v23.state.description
        };
        if v16.initiateAvatarCreationFeePurchase then
            v16.initiateAvatarCreationFeePurchase(v25, v23.props.guid, v23.props.humanoidModel, v23.props.priceInRobux);
            return;
        else
            l_mutedError_0("PurchasePrompt.initiateAvatarCreationFeePurchase is not available");
            return;
        end;
    end;
    v23.onNameUpdated = function(v26, v27) --[[ Line: 109 ]]
        -- upvalues: v23 (copy), l_PublishAssetAnalytics_0 (ref)
        v23:setState({
            name = v26, 
            isNameValid = v27
        });
        if not v23.sentNameFieldTouched then
            v23.sentNameFieldTouched = true;
            l_PublishAssetAnalytics_0.sendFieldTouched(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Name);
        end;
    end;
    v23.onDescriptionUpdated = function(v28, v29) --[[ Line: 121 ]]
        -- upvalues: v23 (copy), l_PublishAssetAnalytics_0 (ref)
        v23:setState({
            description = v28, 
            isDescValid = v29
        });
        if not v23.sentDescriptionFieldTouched then
            v23.sentDescriptionFieldTouched = true;
            l_PublishAssetAnalytics_0.sendFieldTouched(l_PublishAssetAnalytics_0.Section.BuyCreationPage, l_PublishAssetAnalytics_0.Element.Description);
        end;
    end;
    v23.onWindowStateChanged = function(v30) --[[ Line: 133 ]]
        -- upvalues: v23 (copy)
        local l_hasCompletedPurchase_0 = v30.hasCompletedPurchase;
        local l_isShown_0 = v30.isShown;
        if l_hasCompletedPurchase_0 and not l_isShown_0 then
            v23.props.SetPromptVisibility(false);
            return;
        else
            v23:setState({
                showTopScrim = l_isShown_0
            });
            if l_isShown_0 then
                v23:setState({
                    purchasePromptReady = false
                });
            end;
            return;
        end;
    end;
    v23.onPromptStateSetToNone = function() --[[ Line: 158 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            purchasePromptReady = true
        });
    end;
end;
v22.didMount = function(v33) --[[ Line: 165 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy), l_mutedError_0 (copy), l_PublishAssetAnalytics_0 (copy)
    v33.sentNameFieldTouched = false;
    v33.sentDescriptionFieldTouched = false;
    local l_windowStateChangedEvent_0 = v16.windowStateChangedEvent;
    local l_promptStateSetToNoneEvent_0 = v16.promptStateSetToNoneEvent;
    if l_windowStateChangedEvent_0 and l_promptStateSetToNoneEvent_0 then
        v33.windowStateChangedConnection = l_windowStateChangedEvent_0:Connect(v33.onWindowStateChanged);
        v33.promptStateSetToNoneConnection = l_promptStateSetToNoneEvent_0:Connect(v33.onPromptStateSetToNone);
    else
        l_mutedError_0("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available");
    end;
    l_PublishAssetAnalytics_0.sendPageLoad(l_PublishAssetAnalytics_0.Section.BuyCreationPage);
end;
v22.willUnmount = function(v36) --[[ Line: 184 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_mutedError_0 (copy)
    if v36.windowStateChangedConnection then
        v36.windowStateChangedConnection:Disconnect();
    else
        l_mutedError_0("windowStateChangedConnection was not established");
    end;
    if v36.promptStateSetToNoneConnection then
        v36.promptStateSetToNoneConnection:Disconnect();
        return;
    else
        l_mutedError_0("promptStateSetToNoneConnection was not established");
        return;
    end;
end;
v22.renderPromptBody = function(v37) --[[ Line: 198 ]] --[[ Name: renderPromptBody ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v21 (copy), v13 (copy), v14 (copy), v7 (copy), v20 (copy), v15 (copy), v8 (copy)
    local v38 = v37.props.humanoidModel == nil;
    return l_withStyle_0(function(_) --[[ Line: 200 ]]
        -- upvalues: v3 (ref), v21 (ref), v13 (ref), v37 (copy), v38 (copy), v14 (ref), v7 (ref), v20 (ref), v15 (ref), v8 (ref)
        return v3.createFragment({
            UIListLayout = v3.createElement("UIListLayout", {
                Padding = v21, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = v21, 
                PaddingTop = v21
            }), 
            EmbeddedPreview = v3.createElement(v13, {
                openPreviewView = v37.openPreviewView, 
                model = v37.props.humanoidModel, 
                isLoading = v38, 
                useFullBodyCameraSettings = true, 
                fieldOfView = 30, 
                LayoutOrder = 1
            }), 
            DescriptionInput = v3.createElement(v14, {
                LayoutOrder = 2, 
                labelText = v7:FormatByKey("CoreScripts.PublishAssetPrompt.Description"), 
                centerText = false, 
                defaultText = v37.state.description, 
                maxLength = 1000, 
                onTextUpdated = v37.onDescriptionUpdated, 
                textBoxHeight = 104, 
                invalidInputText = if v20 then v7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription") else nil
            }), 
            InfoList = v3.createElement(v15, {
                typeName = v7:FormatByKey("Feature.Catalog.Label.Body"), 
                LayoutOrder = 3
            }), 
            AvatarPartGrid = v3.createElement(v8, {
                humanoidModel = v37.props.humanoidModel, 
                name = v37.state.name, 
                LayoutOrder = 4, 
                screenSize = v37.props.screenSize
            })
        });
    end);
end;
v22.render = function(v40) --[[ Line: 246 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v3 (copy), v12 (copy), v7 (copy)
    assert(l_Players_0, "Players must not be nil");
    return v3.createElement(v12, {
        promptBody = v40:renderPromptBody(), 
        screenSize = v40.props.screenSize, 
        showingPreviewView = v40.state.showingPreviewView, 
        closePreviewView = v40.closePreviewView, 
        asset = v40.props.humanoidModel, 
        nameLabel = v7:FormatByKey("CoreScripts.PublishAvatarPrompt.BodyName"), 
        defaultName = v40.state.name, 
        titleText = v7:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"), 
        onNameUpdated = v40.onNameUpdated, 
        canSubmit = v40.canSubmit, 
        onSubmit = v40.onSubmit, 
        delayInputSeconds = 3, 
        priceInRobux = v40.props.priceInRobux, 
        showTopScrim = v40.state.showTopScrim
    });
end;
return v4.connect(function(v41) --[[ Line: 267 ]] --[[ Name: mapStateToProps ]]
    return {
        humanoidModel = v41.promptRequest.promptInfo.humanoidModel, 
        guid = v41.promptRequest.promptInfo.guid, 
        scopes = v41.promptRequest.promptInfo.scopes, 
        priceInRobux = v41.promptRequest.promptInfo.priceInRobux
    };
end, function(v42) --[[ Line: 276 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy)
    return {
        SetPromptVisibility = function(v43) --[[ Line: 278 ]] --[[ Name: SetPromptVisibility ]]
            -- upvalues: v42 (copy), v19 (ref)
            v42(v19(v43));
        end
    };
end)(v22);