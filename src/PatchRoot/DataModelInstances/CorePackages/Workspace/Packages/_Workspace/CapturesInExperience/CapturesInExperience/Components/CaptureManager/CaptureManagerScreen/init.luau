local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_GridView_0 = v7.App.Grid.GridView;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v12 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useScreenSize_0 = v6.useScreenSize;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local v19 = require(l_Parent_0.Hooks.useTopbarInsetHeight);
local v20 = require(l_Parent_0.Actions.CaptureManagerClosed);
local v21 = require(l_Parent_0.Components.CaptureManager.CaptureManagerItem);
local v22 = require(l_Parent_0.Components.CaptureManager.CaptureManagerCTAContainer);
local v23 = require(l_Parent_0.Constants);
local v24 = require(l_Parent_0.Thunks.DeleteCaptures);
local v25 = require(l_Parent_0.Components.Common.DeleteWarningModal);
local v26 = require(l_Parent_0.Analytics.EventNames);
local v27 = require(l_Parent_0.Components.Common.PermissionModal);
local v28 = require(l_Parent_0.Components.Common.ShowMoreButton);
local v29 = require(l_Parent_0.Components.Common.ToastContainer);
local _ = require(l_Parent_0.Types);
local v31 = require(l_Parent_0.Actions.UpdateSelectedCaptures);
local v32 = UDim2.fromOffset(32, 32);
local function _(v33) --[[ Line: 60 ]] --[[ Name: getItemsPerRow ]]
    return (math.clamp(math.floor(v33 / 90), 1, 3));
end;
local function _(v35, v36) --[[ Line: 64 ]] --[[ Name: getGalleryItemSize ]]
    local v37 = math.clamp(math.floor(v36 / 90), 1, 3);
    local v38 = (v36 - 4 * (v37 - 1)) / v37;
    local v39 = v38 * v35;
    return Vector2.new(math.floor(v38), (math.floor(v39)));
end;
local function v43(v41, v42) --[[ Line: 74 ]] --[[ Name: renderItem ]]
    -- upvalues: v4 (copy), v21 (copy)
    return v4.createElement(v21, {
        capture = v41, 
        captureIndex = v42
    });
end;
return function(_) --[[ Line: 81 ]]
    -- upvalues: v12 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v19 (copy), l_useSelector_0 (copy), v23 (copy), l_useLocalization_0 (copy), v4 (copy), l_useState_0 (copy), l_useScreenSize_0 (copy), l_useCallback_0 (copy), v20 (copy), v24 (copy), v31 (copy), v26 (copy), v2 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v32 (copy), l_GridView_0 (copy), v43 (copy), v28 (copy), v22 (copy), v25 (copy), v27 (copy), v29 (copy)
    local v45 = v12();
    local v46 = l_useDispatch_0();
    local v47 = l_useStyle_0();
    local v48 = v19();
    local v50 = l_useSelector_0(function(v49) --[[ Line: 88 ]]
        -- upvalues: v23 (ref)
        return v49[v23.RoduxKey].Captures;
    end);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 92 ]]
        -- upvalues: v23 (ref)
        return v51[v23.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 96 ]]
        -- upvalues: v23 (ref)
        return v53[v23.RoduxKey].CaptureManager.IsOpen;
    end);
    local v55 = l_useLocalization_0({
        cancelSelectAllAction = "Feature.Captures.Action.CancelSelectAllCaptures", 
        selectAllAction = "Feature.Captures.Action.SelectAllCaptures"
    });
    local v56 = v4.useRef(nil);
    local v57, v58 = l_useState_0(Vector2.new(0, 0));
    local v59, v60 = l_useState_0(false);
    local v61, v62 = l_useState_0(false);
    local v63, v64 = v4.useState(24);
    local v65 = if #v52 == 0 then v55.selectAllAction else v55.cancelSelectAllAction;
    local v66 = l_useScreenSize_0();
    v4.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v56 (copy), v58 (copy)
        if v56.current then
            v58(v56.current.AbsoluteSize);
        end;
    end, {});
    local v68 = l_useCallback_0(function(v67) --[[ Line: 121 ]]
        -- upvalues: v58 (copy)
        v58(v67.AbsoluteSize);
    end, {});
    local v69 = l_useCallback_0(function() --[[ Line: 125 ]]
        -- upvalues: v60 (copy), v46 (copy), v20 (ref)
        v60(false);
        v46(v20());
    end, {});
    local v70 = l_useCallback_0(function() --[[ Line: 130 ]]
        -- upvalues: v62 (copy)
        v62(true);
    end, {});
    local v71 = l_useCallback_0(function() --[[ Line: 134 ]]
        -- upvalues: v62 (copy)
        v62(false);
    end, {});
    local v72 = l_useCallback_0(function() --[[ Line: 138 ]]
        -- upvalues: v46 (copy), v24 (ref), v52 (copy)
        v46(v24(v52));
    end, {
        v52
    });
    local v73 = l_useCallback_0(function() --[[ Line: 142 ]]
        -- upvalues: v52 (copy), v46 (copy), v31 (ref), v50 (copy), v45 (copy), v26 (ref)
        if #v52 == 0 then
            v46(v31(v50));
            v45.fireEvent(v26.CapturesManagerSelectAllActivated);
            return;
        else
            v46(v31({}));
            return;
        end;
    end, {
        v52, 
        v50
    });
    local v74 = v4.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v64 (copy), v63 (copy)
        v64(v63 + 24);
    end, {
        v63
    });
    local v76 = v4.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v50 (copy), v63 (copy), v2 (ref)
        local v75 = math.min(#v50, v63);
        return v2.slice(v50, 1, v75);
    end, {
        v50, 
        v63
    });
    if not v54 then
        return nil;
    else
        local v77 = false;
        if v57.X > 0 then
            v77 = v57.Y > 0;
        end;
        local v78 = math.clamp(v66.Y / v66.X, 0.42857142857142855, 1);
        local l_Y_0 = v57.Y;
        local v80 = v57.X - 41;
        local l_v80_0 = v80;
        local v82 = math.clamp(math.floor(l_v80_0 / 90), 1, 3);
        local v83 = (l_v80_0 - 4 * (v82 - 1)) / v82;
        local v84 = v83 * v78;
        local v85 = Vector2.new(math.floor(v83), (math.floor(v84)));
        l_v80_0 = l_Y_0 < v80;
        v82 = l_v80_0 and 44 or 82;
        v83 = v4.createElement;
        v84 = "Frame";
        local v86 = {
            Active = true, 
            BackgroundColor3 = v47.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v47.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, -v48), 
            ref = v56, 
            Size = UDim2.new(1, 0, 1, v48), 
            [v4.Change.AbsoluteSize] = v68
        };
        local v87 = {};
        local l_createElement_0 = v4.createElement;
        local v89 = "Frame";
        local v90 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        };
        local v91 = {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Padding = v4.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 8), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 40)
            }), 
            TitleFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 32), 
                ZIndex = 2
            }, {
                CloseButton = v4.createElement(l_ImageSetButton_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/navigation/close"], 
                    ImageColor3 = v47.Theme.IconEmphasis.Color, 
                    ImageTransparency = v47.Theme.IconEmphasis.Transparency, 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = v32, 
                    [v4.Event.Activated] = v69
                }), 
                DropShadow = v4.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = v47.Font.Header2.Font, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(1, -16, 0.5, 2), 
                    Size = UDim2.fromScale(0, 1), 
                    Text = v65, 
                    TextColor3 = v47.Theme.DropShadow.Color, 
                    TextSize = v47.Font.BaseSize * v47.Font.Header2.RelativeSize, 
                    TextTransparency = v47.Theme.DropShadow.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 1
                }, {
                    UIStroke = v4.createElement("UIStroke", {
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
                        Color = v47.Theme.DropShadow.Color, 
                        LineJoinMode = Enum.LineJoinMode.Round, 
                        Thickness = 1, 
                        Transparency = v47.Theme.DropShadow.Transparency
                    })
                }), 
                SelectOrDeselectAllButton = v4.createElement("TextButton", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    Font = v47.Font.Header2.Font, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(1, -16, 0.5, 2), 
                    Size = UDim2.fromScale(0, 1), 
                    Text = v65, 
                    TextColor3 = v47.Theme.TextEmphasis.Color, 
                    TextSize = v47.Font.BaseSize * v47.Font.Header2.RelativeSize, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 2, 
                    [v4.Event.Activated] = v73
                })
            })
        };
        local l_createElement_1 = v4.createElement;
        local v93 = "ScrollingFrame";
        local v94 = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            LayoutOrder = 2, 
            ScrollBarThickness = 1, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.new(1, 0, 1, -(40 + v82))
        };
        local v95 = {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            GridView = v77 and v4.createElement(l_GridView_0, {
                itemPadding = Vector2.new(4, 4), 
                items = v76, 
                itemSize = v85, 
                LayoutOrder = 1, 
                renderItem = v43
            })
        };
        local v96 = false;
        if v63 < #v50 then
            v96 = v4.createElement(v28, {
                buttonHeight = 40, 
                LayoutOrder = 2, 
                onActivated = v74
            });
        end;
        v95.ShowMoreButton = v96;
        v91.ScrollingFrame = l_createElement_1(v93, v94, v95);
        v91.CTAContainer = v4.createElement(v22, {
            deleteItem = v72, 
            height = v82, 
            isDisabled = v59, 
            isHorizontal = l_v80_0, 
            LayoutOrder = 3, 
            openPermissionModal = v70, 
            width = v80, 
            ZIndex = 2
        });
        v87.CaptureManagerContainer = l_createElement_0(v89, v90, v91);
        v87.DeleteWarningModal = v4.createElement(v25, {
            deleteItem = v72, 
            zIndex = 3
        });
        v87.PermissionModal = v4.createElement(v27, {
            closeModal = v71, 
            visible = v61, 
            zIndex = 3
        });
        v87.ToastsFrame = v4.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v23.ZIndex.Toasts
        }, {
            ToastContainer = v4.createElement(v29)
        });
        return v83(v84, v86, v87);
    end;
end;