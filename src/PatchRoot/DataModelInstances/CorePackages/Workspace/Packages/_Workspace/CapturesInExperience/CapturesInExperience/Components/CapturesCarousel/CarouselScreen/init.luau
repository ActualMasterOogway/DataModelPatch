local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_Parent_1.AppCommonLib);
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.RoactUtils);
local v8 = require(l_Parent_1.RobloxAppHooks);
local v9 = require(l_Parent_1.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local l_Signal_0 = v4.Signal;
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v6.useEffect;
local l_useEffectOnce_0 = v7.Hooks.useEffectOnce;
local l_useRef_0 = v6.useRef;
local l_useScreenSize_0 = v8.useScreenSize;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v22 = require(l_Parent_0.Components.CapturesCarousel.CapturesCarousel);
local v23 = require(l_Parent_0.Enums.CapturesToastType);
local v24 = require(l_Parent_0.Actions.CarouselClosed);
local v25 = require(l_Parent_0.Components.CapturesCarousel.CarouselCTAContainer);
local v26 = require(l_Parent_0.Constants);
local v27 = require(l_Parent_0.Thunks.DeleteCapture);
local v28 = require(l_Parent_0.Components.Common.DeleteWarningModal);
local v29 = require(l_Parent_0.Analytics.EventNames);
local v30 = require(l_Parent_0.Utils.getTimestampFromCapture);
local v31 = require(l_Parent_0.Components.Common.PermissionModal);
local v32 = require(l_Parent_0.Components.Common.ToastContainer);
local v33 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
local v35 = require(l_Parent_0.Analytics.useAnalytics);
local l_FStringSocialCaptureTakenIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer;
local v37 = UDim2.fromOffset(32, 32);
local function v42(v38) --[[ Line: 54 ]] --[[ Name: getTitle ]]
    -- upvalues: v30 (copy), l_LocalizationService_0 (copy)
    local v39 = v30(v38);
    if not v39 then
        return "";
    else
        assert(typeof(v39) == "number", "Expected timestamp to be a number");
        local v40 = DateTime.fromUnixTimestampMillis(v39);
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        return (("%* %*"):format(v40:FormatLocalTime("L", l_RobloxLocaleId_0), (v40:FormatLocalTime("LT", l_RobloxLocaleId_0))));
    end;
end;
return function(_) --[[ Line: 72 ]]
    -- upvalues: v35 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useSelector_0 (copy), v26 (copy), l_useRef_0 (copy), l_Signal_0 (copy), l_useState_0 (copy), l_useScreenSize_0 (copy), l_useEffectOnce_0 (copy), l_IXPServiceWrapper_0 (copy), l_FStringSocialCaptureTakenIXPLayer_0 (copy), l_useEffect_0 (copy), v33 (copy), v23 (copy), l_useCallback_0 (copy), v29 (copy), v24 (copy), v27 (copy), l_ContextActionService_0 (copy), v42 (copy), v6 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v37 (copy), v22 (copy), v25 (copy), v28 (copy), v31 (copy), v32 (copy)
    local v44 = v35();
    local v45 = l_useDispatch_0();
    local v46 = l_useStyle_0();
    local v48 = l_useSelector_0(function(v47) --[[ Line: 77 ]]
        -- upvalues: v26 (ref)
        return v47[v26.RoduxKey].Captures;
    end);
    local v50 = l_useSelector_0(function(v49) --[[ Line: 81 ]]
        -- upvalues: v26 (ref)
        return v49[v26.RoduxKey].Carousel.IsOpen;
    end);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 85 ]]
        -- upvalues: v26 (ref)
        return v51[v26.RoduxKey].Carousel.SelectedCaptureIndex;
    end);
    local v53 = l_useRef_0(l_Signal_0.new());
    local v54, v55 = l_useState_0(false);
    local v56, v57 = l_useState_0(false);
    local v58 = l_useScreenSize_0();
    l_useEffectOnce_0(function() --[[ Line: 94 ]]
        -- upvalues: l_IXPServiceWrapper_0 (ref), l_FStringSocialCaptureTakenIXPLayer_0 (ref)
        l_IXPServiceWrapper_0:LogUserLayerExposure(l_FStringSocialCaptureTakenIXPLayer_0);
    end, v50);
    l_useEffect_0(function() --[[ Line: 98 ]]
        -- upvalues: v45 (copy), v33 (ref), v23 (ref)
        v45(v33(v23.None));
    end, {
        v50
    });
    local v59 = l_useCallback_0(function() --[[ Line: 102 ]]
        -- upvalues: v55 (copy), v44 (copy), v29 (ref), v45 (copy), v24 (ref)
        v55(false);
        v44.fireEvent(v29.CapturesCarouselClosed);
        v45(v24());
    end, {});
    local v60 = l_useCallback_0(function() --[[ Line: 108 ]]
        -- upvalues: v55 (copy), v44 (copy), v29 (ref), v45 (copy), v24 (ref)
        v55(false);
        v44.fireEvent(v29.CapturesCarouselClosedByKeyboard);
        v45(v24());
    end, {});
    local v61 = l_useCallback_0(function() --[[ Line: 114 ]]
        -- upvalues: v57 (copy)
        v57(true);
    end, {});
    local v62 = l_useCallback_0(function() --[[ Line: 118 ]]
        -- upvalues: v57 (copy)
        v57(false);
    end, {});
    local v65 = l_useCallback_0(function() --[[ Line: 122 ]]
        -- upvalues: v55 (copy), v48 (copy), v52 (copy), v45 (copy), v27 (ref), v53 (copy)
        v55(true);
        local v63 = v48[v52];
        local function v64() --[[ Line: 126 ]]
            -- upvalues: v45 (ref), v27 (ref), v63 (copy), v55 (ref)
            v45(v27(v63));
            v55(false);
        end;
        v53.current:fire(v64);
    end, {
        v48, 
        v52
    });
    l_useEffect_0(function() --[[ Line: 134 ]]
        -- upvalues: v50 (copy), l_ContextActionService_0 (ref), v60 (copy)
        if not v50 then
            return;
        else
            l_ContextActionService_0:BindCoreAction("CapturesCarouselCloseShortcutAction", function(_, v67) --[[ Line: 139 ]]
                -- upvalues: v60 (ref)
                if v67 == Enum.UserInputState.End then
                    v60();
                end;
            end, false, Enum.KeyCode.Escape);
            return function() --[[ Line: 145 ]]
                -- upvalues: l_ContextActionService_0 (ref)
                l_ContextActionService_0:UnbindCoreAction("CapturesCarouselCloseShortcutAction");
            end;
        end;
    end, {
        v50, 
        v60
    });
    if not v50 then
        return nil;
    else
        local v68 = v58.Y - 32 - 40 - 8 - 16 - 16;
        local v69 = v48[v52];
        local v70 = v42(v69);
        return v6.createElement("Frame", {
            Active = true, 
            BackgroundColor3 = v46.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v46.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1)
        }, {
            CarouselContainer = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                UIListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Padding = v6.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingTop = UDim.new(0, 8)
                }), 
                TitleFrame = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 32), 
                    ZIndex = 2
                }, {
                    CloseButton = v6.createElement(l_ImageSetButton_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/navigation/close"], 
                        ImageColor3 = v46.Theme.IconEmphasis.Color, 
                        ImageTransparency = v46.Theme.IconEmphasis.Transparency, 
                        Position = UDim2.new(0, 42, 0.5, 0), 
                        Size = v37, 
                        [v6.Event.Activated] = v59
                    }), 
                    DropShadow = v6.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = v46.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 2), 
                        Size = UDim2.fromScale(0, 1), 
                        Text = v70, 
                        TextColor3 = v46.Theme.DropShadow.Color, 
                        TextSize = v46.Font.BaseSize * v46.Font.Header2.RelativeSize, 
                        TextTransparency = v46.Theme.DropShadow.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        ZIndex = 1
                    }, {
                        UIStroke = v6.createElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
                            Color = v46.Theme.DropShadow.Color, 
                            LineJoinMode = Enum.LineJoinMode.Round, 
                            Thickness = 1, 
                            Transparency = v46.Theme.DropShadow.Transparency
                        })
                    }), 
                    Title = v6.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = v46.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromScale(0, 1), 
                        Text = v70, 
                        TextColor3 = v46.Theme.TextEmphasis.Color, 
                        TextSize = v46.Font.BaseSize * v46.Font.Header2.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        ZIndex = 2
                    })
                }), 
                CapturesCarousel = v6.createElement(v22, {
                    deleteItemSignal = v53.current, 
                    isDisabled = v54, 
                    LayoutOrder = 2, 
                    maxHeight = v68, 
                    ZIndex = 1
                }), 
                CTAContainer = v6.createElement(v25, {
                    deleteItem = v65, 
                    height = 40, 
                    isDisabled = v54, 
                    LayoutOrder = 3, 
                    openPermissionModal = v61, 
                    ZIndex = 2
                })
            }), 
            DeleteWarningModal = v6.createElement(v28, {
                deleteItem = v65, 
                zIndex = 3
            }), 
            PermissionModal = v6.createElement(v31, {
                closeModal = v62, 
                visible = v56, 
                zIndex = 3
            }), 
            ToastsFrame = v6.createElement("Frame", {
                Active = false, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = v26.ZIndex.Toasts
            }, {
                ToastContainer = v6.createElement(v32)
            })
        });
    end;
end;