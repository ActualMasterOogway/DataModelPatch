local l_Parent_0 = script:FindFirstAncestor("ItemsReceivedAlert").Parent;
local v1 = require(l_Parent_0.React);
local l_useDefaultFocusBehavior_0 = require(l_Parent_0.ReactFocusNavigation).useDefaultFocusBehavior;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v5 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v10) --[[ Line: 35 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useDefaultFocusBehavior_0 (copy), l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v11 = l_useScreenSize_0();
    local v12, v13 = l_useDefaultFocusBehavior_0();
    local v14 = l_useDispatch_0();
    local v16 = l_useDesignTokens_0(function(v15) --[[ Line: 39 ]]
        return {
            listPadding = v15.Global.Space_200, 
            thumbnailContainerTransparency = v15.Global.Opacity_8, 
            thumbnailContainerRadius = v15.Semantic.Radius.Large, 
            bodyTextFont = v15.Semantic.Typography.Body, 
            bodyTextColor = v15.Semantic.Color.Text.Default, 
            buttonStackSpacing = v15.Global.Space_150, 
            buttonTextFont = v15.Semantic.Typography.Body
        };
    end);
    local v17 = v1.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v1 (ref), v16 (copy), v10 (copy), l_StyledTextLabel_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v16.listPadding)
            }), 
            AvatarThumbnailContainer = v1.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, v10.avatarThumbnailDisplayHeight), 
                BackgroundTransparency = v16.thumbnailContainerTransparency, 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                BorderSizePixel = 0
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v16.thumbnailContainerRadius)
                }), 
                AvatarThumbnail = v1.createElement("ImageLabel", {
                    Image = v10.avatarThumbnail, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Size = UDim2.fromScale(1, 1)
                })
            }), 
            BodyText = if v10.bodyText then v1.createElement(l_StyledTextLabel_0, {
                layoutOrder = 2, 
                automaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v16.bodyTextFont, 
                colorStyle = v16.bodyTextColor, 
                text = v10.bodyText, 
                richText = true, 
                textWrapped = true, 
                textXAlignment = Enum.TextXAlignment.Center
            }) else nil
        });
    end, {
        v10.avatarThumbnail, 
        v10.avatarThumbnailDisplayHeight, 
        v10.bodyText, 
        v16
    });
    local v18 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = function() --[[ Line: 101 ]] --[[ Name: onActivated ]]
                -- upvalues: v10 (copy), v14 (copy)
                if v10.onPrimaryButtonActivated then
                    v10.onPrimaryButtonActivated();
                    return;
                else
                    if v10.closeCentralOverlayThunk then
                        v14(v10.closeCentralOverlayThunk());
                    end;
                    return;
                end;
            end, 
            text = v10.primaryButtonText, 
            buttonRef = v12, 
            fontStyle = v16.buttonTextFont
        }
    };
    local v19 = v10.secondaryButtonText and {
        buttonType = l_ButtonType_0.Secondary, 
        props = {
            onActivated = function() --[[ Line: 118 ]] --[[ Name: onActivated ]]
                -- upvalues: v10 (copy), v14 (copy)
                if v10.onSecondaryButtonActivated then
                    v10.onSecondaryButtonActivated();
                    return;
                else
                    if v10.closeCentralOverlayThunk then
                        v14(v10.closeCentralOverlayThunk());
                    end;
                    return;
                end;
            end, 
            text = v10.secondaryButtonText, 
            fontStyle = v16.buttonTextFont
        }
    };
    return v1.createElement(l_InteractiveAlert_0, {
        defaultChildRef = v13, 
        screenSize = v11, 
        title = v10.titleText, 
        middleContent = v17, 
        buttonStackInfo = {
            disableGamepadRefs = true, 
            marginBetween = v16.buttonStackSpacing, 
            buttons = if v10.secondaryButtonText then {
                v19, 
                v18
            } else {
                v18
            }
        }
    });
end;