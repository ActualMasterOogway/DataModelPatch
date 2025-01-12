local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.UIBlox);
local l_Colors_0 = v7.App.Style.Colors;
local l_Images_0 = v7.App.ImageSet.Images;
local l_HeaderBar_0 = v7.App.Bar.HeaderBar;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_TextButton_0 = v7.App.Button.TextButton;
local v14 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useDeviceInsets_0 = require(l_Parent_1.AppCommonResponsive).useDeviceInsets;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local v19 = require(l_Parent_0.Hooks.useOnScreenKeyboardVisible);
local l_useScreenSize_0 = v6.useScreenSize;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v24 = require(l_Parent_0.Components.Composer.ComposerBottomOverlay);
local v25 = require(l_Parent_0.Actions.ComposerClosed);
local v26 = require(l_Parent_0.Components.Composer.ComposerTextbox);
local v27 = require(l_Parent_0.Constants);
local v28 = require(l_Parent_0.Thunks.CreatePost);
local v29 = require(l_Parent_0.Analytics.EventNames);
local v30 = require(l_Parent_0.Utils.getCaptureSize);
local v31 = require(l_Parent_0.Utils.getCaptureUploadData);
game:DefineFastInt("OnPlatformSharingPostCharLimit", 140);
return function(_) --[[ Line: 49 ]]
    -- upvalues: v14 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v19 (copy), l_useDeviceInsets_0 (copy), l_useSelector_0 (copy), v27 (copy), l_useLocalization_0 (copy), v4 (copy), l_useState_0 (copy), l_useScreenSize_0 (copy), v30 (copy), l_useCallback_0 (copy), v25 (copy), v29 (copy), l_RbxAnalyticsService_0 (copy), v28 (copy), v31 (copy), l_Colors_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_HeaderBar_0 (copy), v26 (copy), l_TextButton_0 (copy), v24 (copy)
    local v33 = v14();
    local v34 = l_useDispatch_0();
    local v35 = l_useStyle_0();
    local v36 = v19();
    local v37 = l_useDeviceInsets_0();
    local l_game_FastInt_0 = game:GetFastInt("OnPlatformSharingPostCharLimit");
    local v40 = l_useSelector_0(function(v39) --[[ Line: 58 ]]
        -- upvalues: v27 (ref)
        return v39[v27.RoduxKey].Composer.IsOpen;
    end);
    local v42 = l_useSelector_0(function(v41) --[[ Line: 62 ]]
        -- upvalues: v27 (ref)
        return v41[v27.RoduxKey].Composer.Capture;
    end);
    local v43 = l_useLocalization_0({
        postAction = "Feature.Captures.Action.Post", 
        postLabel = "Feature.Captures.Label.Post"
    });
    local v44, v45 = v4.useState(Vector2.new(0, 0));
    local v46, v47 = l_useState_0("");
    local v48, v49 = l_useState_0("");
    local v50, v51 = v4.useState(false);
    local v52 = l_useScreenSize_0();
    v4.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v42 (copy), v30 (ref), v45 (copy), v46 (copy), v49 (copy), v47 (copy)
        if v42 then
            task.spawn(function() --[[ Line: 79 ]]
                -- upvalues: v30 (ref), v42 (ref), v45 (ref)
                local v53 = v30(v42.contentId);
                if v53 then
                    v45(v53);
                end;
            end);
            if v42.contentId ~= v46 then
                v49("");
                v47(v42.contentId);
            end;
        end;
    end, {
        v42
    });
    local v54 = l_useCallback_0(function() --[[ Line: 92 ]]
        -- upvalues: v34 (copy), v25 (ref), v33 (copy), v29 (ref), l_RbxAnalyticsService_0 (ref)
        v34(v25());
        v33.fireEvent(v29.ComposerBackButtonActivated, {
            sessionId = l_RbxAnalyticsService_0:GetSessionId()
        });
    end, {});
    local v55 = l_useCallback_0(function() --[[ Line: 99 ]]
        -- upvalues: v51 (copy), v50 (copy)
        v51(not v50);
    end, {
        v50
    });
    local v57 = l_useCallback_0(function() --[[ Line: 103 ]]
        -- upvalues: v34 (copy), v28 (ref), v42 (copy), v48 (copy), v49 (copy), v31 (ref), v33 (copy), v29 (ref), l_RbxAnalyticsService_0 (ref)
        v34(v28(v42, v48));
        v49("");
        local v56 = v31(v42);
        v33.fireEvent(v29.ComposerPostButtonActivated, {
            sessionId = l_RbxAnalyticsService_0:GetSessionId(), 
            universeId = if v56 then v56.context.experienceId else nil
        });
    end, {
        v42, 
        v48
    });
    if not v40 then
        return nil;
    else
        local v58 = v52.Y < v52.X;
        local v59 = v36 and not v58;
        local v60 = v44.X / v44.Y;
        local v61 = v44.X > v44.Y;
        local v62 = v58 and v61 and 116 or 58;
        return v4.createElement("Frame", {
            Active = true, 
            BackgroundColor3 = if v58 then v35.Theme.BackgroundContrast.Color else l_Colors_0.Black, 
            BackgroundTransparency = v35.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            v4.createElement("Frame", {
                Active = true, 
                BackgroundColor3 = if not v58 or v50 then l_Colors_0.Black else v35.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = if v50 then v35.Theme.BackgroundUIContrast.Transparency else v35.Theme.BackgroundContrast.Transparency, 
                BorderSizePixel = 0, 
                Interactable = not v50, 
                Position = UDim2.fromOffset(0, 0), 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ContainerLayout = v4.createElement("UIListLayout", {
                    FillDirection = if v58 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = if v58 then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top
                }), 
                CaptureContainer = v4.createElement("Frame", {
                    Active = true, 
                    BackgroundColor3 = l_Colors_0.Black, 
                    BackgroundTransparency = v35.Theme.BackgroundContrast.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Position = UDim2.fromOffset(0, 0), 
                    Size = if v58 then UDim2.new(0.5, 0, 1, 0) else UDim2.new(1, 0, 0.6, 0)
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = if not v58 or v61 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    ButtonFrame = v4.createElement("Frame", {
                        BackgroundColor3 = l_Colors_0.Black, 
                        BackgroundTransparency = v35.Theme.BackgroundContrast.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1, 
                        Size = if not v58 or v61 then UDim2.new(1, 0, 0, 58 + v37.top) else UDim2.new(0, 58 + v37.left, 1, 0)
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Padding = v4.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16 + v37.top), 
                            PaddingLeft = UDim.new(0, 8 + v37.left)
                        }), 
                        BackButton = v4.createElement(l_IconButton_0, {
                            iconSize = l_IconSize_0.Medium, 
                            icon = l_Images_0["icons/actions/cycleLeft"], 
                            layoutOrder = 1, 
                            onActivated = v54
                        })
                    }), 
                    CapturePreviewFrame = v4.createElement("Frame", {
                        Active = true, 
                        BackgroundColor3 = l_Colors_0.Black, 
                        BackgroundTransparency = v35.Theme.BackgroundContrast.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 2, 
                        Position = UDim2.fromOffset(0, 0), 
                        Size = if not v58 or v61 then UDim2.new(1, 0, 1, -v62 - v37.top) else UDim2.new(1, -58 - v37.left, 1, 0)
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        CapturePreview = v4.createElement("ImageLabel", {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v42.contentId, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            ScaleType = Enum.ScaleType.Fit, 
                            Size = if v61 then UDim2.new(1, 0, 1 / v60, 0) else UDim2.new(v60, 0, 1, 0), 
                            SizeConstraint = if v61 then Enum.SizeConstraint.RelativeXX else Enum.SizeConstraint.RelativeYY, 
                            ZIndex = 1
                        })
                    })
                }), 
                CaptionContainer = v4.createElement("Frame", {
                    Active = true, 
                    BackgroundColor3 = v35.Theme.BackgroundContrast.Color, 
                    BackgroundTransparency = v35.Theme.BackgroundContrast.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Position = UDim2.fromOffset(0, 0), 
                    Size = if v58 then UDim2.new(0.5, -v37.right, 1, 0) else UDim2.new(1, 0, 0.4, 0)
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12), 
                        PaddingLeft = UDim.new(0, 12), 
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    HeaderBar = v4.createElement(l_HeaderBar_0, {
                        backgroundTransparency = 1, 
                        isTitleCentered = false, 
                        margin = 0, 
                        title = "", 
                        renderLeft = function() --[[ Line: 265 ]] --[[ Name: renderLeft ]]
                            -- upvalues: v4 (ref), v35 (copy), v43 (copy)
                            return v4.createElement("TextLabel", {
                                BackgroundTransparency = 1, 
                                Font = v35.Font.Header2.Font, 
                                LayoutOrder = 1, 
                                Size = UDim2.new(1, 0, 0, 24), 
                                Text = v43.postLabel, 
                                TextColor3 = v35.Theme.TextEmphasis.Color, 
                                TextSize = 24, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            });
                        end, 
                        renderRight = function() --[[ Line: 277 ]] --[[ Name: renderRight ]]
                            -- upvalues: v4 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v55 (copy)
                            return v4.createElement(l_IconButton_0, {
                                icon = l_Images_0["icons/actions/info"], 
                                iconSize = l_IconSize_0.Medium, 
                                onActivated = v55, 
                                showBackground = false
                            });
                        end
                    }), 
                    TextBoxFrame = v4.createElement(v26, {
                        charLimit = l_game_FastInt_0, 
                        inputText = v48, 
                        setInputText = v49, 
                        isHorizontal = v58
                    }), 
                    BottomBar = if not v59 then v4.createElement("Frame", {
                        Active = true, 
                        BackgroundColor3 = v35.Theme.BackgroundContrast.Color, 
                        BackgroundTransparency = v35.Theme.BackgroundContrast.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        Position = UDim2.fromOffset(0, 0), 
                        Size = UDim2.new(1, 0, 0.6, -48)
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = if v58 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Bottom
                        }), 
                        Padding = v4.createElement("UIPadding", {
                            PaddingRight = if v58 then UDim.new(0, 12) else nil, 
                            PaddingBottom = UDim.new(0, 24)
                        }), 
                        PostButton = v4.createElement(l_TextButton_0, {
                            colorStyleDefault = "ItemBackgroundDefault", 
                            text = v43.postAction, 
                            size = if v58 then UDim2.fromOffset(160, 40) else UDim2.new(1, 0, 0, 40), 
                            onActivated = v57, 
                            showBackground = true, 
                            backgroundColor = {
                                Color = l_Colors_0.White, 
                                Transparency = 0
                            }
                        })
                    }) else nil
                })
            }); 
            ShadowBlock = if v50 then v4.createElement("Frame", {
                Active = true, 
                BackgroundColor3 = l_Colors_0.Black, 
                BackgroundTransparency = v35.Theme.BackgroundUIContrast.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 0), 
                Size = UDim2.new(1, 0, 1, 0)
            }) else nil, 
            BottomOverlay = if v50 then v4.createElement(v24, {
                isHorizontal = v58, 
                onOverlayActive = v55
            }) else nil
        });
    end;
end;