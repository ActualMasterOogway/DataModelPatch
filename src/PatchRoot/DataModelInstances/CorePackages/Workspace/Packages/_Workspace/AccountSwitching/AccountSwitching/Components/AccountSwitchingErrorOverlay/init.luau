local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_useEffect_0 = l_React_0.useEffect;
local l_RoactRodux_0 = v1.RoactRodux;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_CloseCentralOverlay_0 = v1.CentralOverlay.Thunks.CloseCentralOverlay;
local l_UIBlox_0 = v1.UIBlox;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v11 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v12 = require(l_Parent_0.Analytics.EventConstants);
return (l_RoactRodux_0.connect(nil, function(v13) --[[ Line: 110 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 112 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v13 (copy), l_CloseCentralOverlay_0 (ref)
            return v13(l_CloseCentralOverlay_0());
        end
    };
end)(function(v14) --[[ Line: 28 ]]
    -- upvalues: l_useLocalization_0 (copy), l_ButtonType_0 (copy), v11 (copy), v12 (copy), l_useEffect_0 (copy), l_withStyle_0 (copy), l_React_0 (copy), l_InteractiveAlert_0 (copy)
    local v15 = false;
    if v14.primaryButtonTextKey ~= nil then
        v15 = false;
        if v14.primaryButtonTextKey ~= "" then
            v15 = v14.primaryButtonCallback ~= nil;
        end;
    end;
    local v16 = false;
    if v14.secondaryButtonTextKey ~= nil then
        v16 = false;
        if v14.secondaryButtonTextKey ~= "" then
            v16 = v14.secondaryButtonCallback ~= nil;
        end;
    end;
    local v17 = l_useLocalization_0({
        titleText = v14.titleTextKey, 
        bodyTextKey = v14.bodyTextKey, 
        primaryButtonTextKey = v14.primaryButtonTextKey, 
        secondaryButtonTextKey = v14.secondaryButtonTextKey
    });
    local v18 = {};
    if v16 then
        table.insert(v18, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                text = v17.secondaryButtonTextKey, 
                onActivated = function() --[[ Line: 50 ]] --[[ Name: onActivated ]]
                    -- upvalues: v11 (ref), v12 (ref), v14 (copy)
                    v11.sendButtonClickEvent(v12.ctx.accountSwitcherConfirmation, v12.btn.secondaryButton, v14.errorType);
                    v14.secondaryButtonCallback();
                end
            }
        });
    end;
    if v15 then
        table.insert(v18, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                text = v17.primaryButtonTextKey, 
                onActivated = function() --[[ Line: 67 ]] --[[ Name: onActivated ]]
                    -- upvalues: v11 (ref), v12 (ref), v14 (copy)
                    v11.sendButtonClickEvent(v12.ctx.accountSwitcherConfirmation, v12.btn.primaryButton, v14.errorType);
                    v14.primaryButtonCallback();
                end
            }
        });
    end;
    l_useEffect_0(function() --[[ Line: 79 ]]
        -- upvalues: v11 (ref), v12 (ref), v14 (copy)
        v11.sendModalShownEvent(v12.ctx.accountSwitcherConfirmation, v14.errorType);
    end, {});
    return l_withStyle_0(function(v19) --[[ Line: 83 ]]
        -- upvalues: l_React_0 (ref), v14 (copy), l_InteractiveAlert_0 (ref), v17 (copy), v18 (copy)
        return l_React_0.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = v19.Theme.Overlay.Color, 
            AutoButtonColor = false, 
            BackgroundTransparency = v19.Theme.Overlay.Transparency, 
            Visible = true, 
            [l_React_0.Event.Activated] = function() --[[ Line: 91 ]]
                -- upvalues: v14 (ref)
                v14.closeCentralOverlay();
            end
        }, {
            Alert = l_React_0.createElement(l_InteractiveAlert_0, {
                title = v17.titleText, 
                bodyText = v17.bodyTextKey, 
                buttonStackInfo = {
                    buttons = v18
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = Vector2.new(400, nil)
            })
        });
    end);
end));