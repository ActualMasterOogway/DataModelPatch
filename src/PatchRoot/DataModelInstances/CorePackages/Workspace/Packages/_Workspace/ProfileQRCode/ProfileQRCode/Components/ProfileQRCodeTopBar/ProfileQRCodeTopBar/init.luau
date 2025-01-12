local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.SocialCommon);
local v9 = require(l_Parent_0.UIBlox);
local v10 = require(l_Parent_0.UniversalAppPolicy);
local l_HeaderBar_0 = v9.App.Bar.HeaderBar;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local l_Images_0 = v9.App.ImageSet.Images;
local l_TooltipOrientation_0 = v9.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v9.App.Dialog.TooltipV2.withTooltip;
local l_makeBackButton_0 = require(l_Parent_0.AppHeaderBar).makeBackButton;
local l_ExternalEventConnection_0 = v7.ExternalEventConnection;
local l_InputUtilities_0 = v8.Utils.InputUtilities;
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v21 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v22 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useAppPolicy_0 = v10.useAppPolicy;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local function _(v26) --[[ Line: 39 ]] --[[ Name: getTooltipWasShown ]]
    -- upvalues: l_AppStorageService_0 (copy)
    v26 = v26 or l_AppStorageService_0;
    assert(v26 ~= nil, "AppStorageService is not nil");
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 43 ]]
        -- upvalues: v26 (ref)
        return v26:GetItem("QrCodeScannerTooltipSeen");
    end);
    if not l_status_0 or l_result_0 == nil then
        return false;
    else
        return l_result_0 == "true";
    end;
end;
local function _(v30, v31) --[[ Line: 54 ]] --[[ Name: setTooltipWasShown ]]
    -- upvalues: l_AppStorageService_0 (copy)
    v30 = v30 or l_AppStorageService_0;
    assert(v30 ~= nil, "AppStorageService is not nil");
    pcall(function() --[[ Line: 58 ]]
        -- upvalues: v30 (ref), v31 (copy)
        v30:SetItem("QrCodeScannerTooltipSeen", (tostring(v31)));
        v30:Flush();
    end);
end;
return function(v33) --[[ Line: 72 ]]
    -- upvalues: v22 (copy), l_useLocalization_0 (copy), v21 (copy), l_useAppPolicy_0 (copy), v6 (copy), l_AppStorageService_0 (copy), v20 (copy), l_InputUtilities_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_withTooltip_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_HeaderBar_0 (copy), l_GetFFlagUIBloxUseNewHeaderBar_0 (copy), l_makeBackButton_0 (copy)
    local v34 = v22();
    local v35 = l_useLocalization_0({
        title = v21.Title, 
        tooltipBodyText = v21.TooltipText, 
        tooltipHeaderText = v21.TooltipTitle
    });
    local v37 = l_useAppPolicy_0(function(v36) --[[ Line: 80 ]]
        return v36.getFriendCodeQrCodeScannerEnabled();
    end);
    local v38, v39 = v6.useState(false);
    v6.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v33 (copy), l_AppStorageService_0 (ref), v39 (copy), v34 (copy), v20 (ref)
        local v40 = v33.appStorageService or l_AppStorageService_0;
        assert(v40 ~= nil, "AppStorageService is not nil");
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 43 ]]
            -- upvalues: v40 (ref)
            return v40:GetItem("QrCodeScannerTooltipSeen");
        end);
        local v43;
        if not l_status_1 or l_result_1 == nil then
            v43 = false;
            --[[ close >= 1 ]]
        else
            v43 = l_result_1 == "true";
            --[[ close >= 1 ]]
        end;
        v39(not v43);
        if not v43 then
            v34.fireEvent(v20.QRCodeScannerTooltipShown);
        end;
    end, {});
    local v49 = v6.useCallback(function(v44) --[[ Line: 93 ]]
        -- upvalues: l_InputUtilities_0 (ref), v38 (copy), v39 (copy), v33 (copy), l_AppStorageService_0 (ref)
        if l_InputUtilities_0.isActivationInput(v44) and v38 then
            v39(false);
            local v45 = v33.appStorageService or l_AppStorageService_0;
            assert(v45 ~= nil, "AppStorageService is not nil");
            local l_pcall_0 = pcall;
            local v47 = true;
            do
                local l_v45_0 = v45;
                l_pcall_0(function() --[[ Line: 58 ]]
                    -- upvalues: l_v45_0 (ref), v47 (copy)
                    l_v45_0:SetItem("QrCodeScannerTooltipSeen", (tostring(v47)));
                    l_v45_0:Flush();
                end);
            end;
        end;
    end, {
        v38
    });
    local v50 = v6.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v34 (copy), v20 (ref), v33 (copy)
        v34.fireEvent(v20.QRCodeScannerOpened);
        v33.openQrCodeScanner();
    end, {
        v33.openQrCodeScanner
    });
    local l_tooltipBodyText_0 = v35.tooltipBodyText;
    local l_tooltipHeaderText_0 = v35.tooltipHeaderText;
    local v56 = v6.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: l_tooltipBodyText_0 (copy), l_tooltipHeaderText_0 (copy), v38 (copy), l_CoreGui_0 (ref), l_TooltipOrientation_0 (ref), l_withTooltip_0 (ref), v6 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v50 (copy), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v49 (copy)
        local v53 = {
            bodyText = l_tooltipBodyText_0, 
            headerText = l_tooltipHeaderText_0
        };
        local v54 = {
            active = v38, 
            DisplayOrder = 10, 
            guiTarget = l_CoreGui_0, 
            preferredOrientation = l_TooltipOrientation_0.Bottom
        };
        return l_withTooltip_0(v53, v54, function(v55) --[[ Line: 123 ]]
            -- upvalues: v6 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v50 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v49 (ref)
            return v6.createElement(l_IconButton_0, {
                icon = l_Images_0["icons/actions/scan"], 
                iconSize = l_IconSize_0.Medium, 
                onActivated = v50, 
                size = UDim2.fromOffset(0, 0), 
                onAbsolutePositionChanged = v55, 
                [v6.Change.AbsoluteSize] = v55
            }, {
                InputBeganConnection = v6.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputBegan, 
                    callback = v49
                })
            });
        end);
    end, {
        v50, 
        v37, 
        v38, 
        l_tooltipBodyText_0, 
        l_tooltipHeaderText_0
    });
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 56), 
        LayoutOrder = v33.layoutOrder, 
        ZIndex = 2
    }, {
        headerBar = v6.createElement(l_HeaderBar_0, {
            isSecondary = true, 
            title = v35.title, 
            backgroundTransparency = 1, 
            barHeight = 56, 
            renderLeft = if l_GetFFlagUIBloxUseNewHeaderBar_0() then l_makeBackButton_0(v33.onClose) else l_HeaderBar_0.renderLeft.backButton(v33.onClose), 
            renderRight = if v37 then v56 else nil
        })
    });
end;