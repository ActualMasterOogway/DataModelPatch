local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.SocialStopwatch);
local v6 = require(l_Parent_1.UIBlox);
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v16 = require(l_Parent_0.App.CapturesPolicy);
local v17 = require(l_Parent_0.Constants);
local v18 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local v19 = require(l_Parent_0.Analytics.EventNames);
local v20 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v21 = require(l_Parent_0.Utils.getIsDeleteWarningModalOptedOut);
local v22 = require(l_Parent_0.Utils.getSaveToStoragePermission);
local v23 = require(l_Parent_0.Thunks.ShareCapture);
local v24 = game:DefineFastInt("CapturesSaveToExternalStorageLimit", 10);
local v25 = UDim2.new(0.33, 0, 0, 36);
return (v16.connect(function(v26) --[[ Line: 237 ]]
    return {
        enableShareCaptureCTA = v26.enableShareCaptureCTA()
    };
end)(function(v27) --[[ Line: 51 ]]
    -- upvalues: v11 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useRef_0 (copy), l_useSelector_0 (copy), v17 (copy), v24 (copy), l_useLocalization_0 (copy), v3 (copy), v22 (copy), v19 (copy), v5 (copy), v23 (copy), v20 (copy), v21 (copy), v18 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), v25 (copy)
    local v28 = v11();
    local v29 = l_useDispatch_0();
    local v30 = l_useStyle_0();
    local v31 = l_useRef_0(0);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 58 ]]
        -- upvalues: v17 (ref)
        return v32[v17.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v34 = #v33;
    local v35 = true;
    if #v33 ~= 0 then
        v35 = #v33 > 1;
    end;
    local v36 = true;
    if #v33 ~= 0 then
        v36 = #v33 > v24;
    end;
    local v37 = #v33 == 0;
    local v38 = if v27.isHorizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical;
    local v39 = if v27.isHorizontal then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center;
    local v40 = if v27.isHorizontal then UDim2.new(0, v27.width - 279, 0, v27.height) else UDim2.new(1, 0, 0, 38);
    local v41 = if v27.isHorizontal then UDim2.new(0, 279, 0, v27.height) else UDim2.new(1, 0, 0, 44);
    local v42 = l_useLocalization_0({
        selectCaptureLabel = "Feature.Captures.Label.SelectCapture", 
        oneCaptureSelectedLabel = "Feature.Captures.Label.OneCaptureSelected", 
        multipleCapturesSelectedLabel = {
            "Feature.Captures.Label.MultipleCapturesSelected"; 
            numberOfCaptures = v34
        }
    });
    local v43 = v3.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v34 (copy), v42 (copy)
        if v34 == 0 then
            return v42.selectCaptureLabel;
        elseif v34 == 1 then
            return v42.oneCaptureSelectedLabel;
        else
            return v42.multipleCapturesSelectedLabel;
        end;
    end, {
        v34
    });
    local v44 = v3.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v27 (copy), v31 (copy)
        if v27.isDisabled then
            return true;
        elseif DateTime.now().UnixTimestampMillis - v31.current < 500 then
            return true;
        else
            return false;
        end;
    end, {
        v27.isDisabled
    });
    local v45 = v3.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v31 (copy)
        v31.current = DateTime.now().UnixTimestampMillis;
    end, {});
    local v46 = v3.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v44 (copy), v33 (copy), v22 (ref), v27 (copy), v29 (copy), v28 (copy), v19 (ref), v45 (copy)
        if v44() or #v33 == 0 then
            return;
        else
            v22(v33, v27.openPermissionModal, v29);
            v28.fireEvent(v19.CapturesManagerBulkSaveToExternalStorageActivated);
            v45();
            return;
        end;
    end, {
        v33, 
        v44, 
        v45, 
        v27.openPermissionModal
    });
    local v48 = v3.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v44 (copy), v33 (copy), v45 (copy), v28 (copy), v19 (ref), v5 (ref), v29 (copy), v23 (ref), v20 (ref)
        if v44() or #v33 == 0 then
            return;
        else
            local v47 = v33[1];
            v45();
            v28.fireEvent(v19.CapturesManagerShareActivated);
            if not v5.Stopwatch.get(v5.Events.CaptureShared) then
                v5.Stopwatch.start(v5.Events.CaptureShared);
            end;
            v29(v23(v47, v20.CapturesManager));
            return;
        end;
    end, {
        v33, 
        v27.isDisabled, 
        v44, 
        v45
    });
    local v49 = v3.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v44 (copy), v33 (copy), v45 (copy), v28 (copy), v19 (ref), v21 (ref), v27 (copy), v29 (copy), v18 (ref)
        if v44() or #v33 == 0 then
            return;
        else
            v45();
            v28.fireEvent(v19.CapturesDeleteActivatedInCaptureManager);
            if v21() then
                assert(v27.deleteItem ~= nil, "props.deleteItem should not be nil");
                v27.deleteItem();
                return;
            else
                v29(v18());
                return;
            end;
        end;
    end, {
        v27.deleteItem, 
        v27.isDisabled, 
        v44, 
        v45
    });
    return v3.createElement("Frame", {
        BackgroundColor3 = v30.Theme.BackgroundContrast.Color, 
        BackgroundTransparency = v30.Theme.BackgroundContrast.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v27.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v27.height), 
        ZIndex = v27.ZIndex
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = v38, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 16)
        }), 
        CapturesLabel = v3.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            Font = v30.Font.Header2.Font, 
            LayoutOrder = 1, 
            Position = UDim2.new(1, 0, 1, 0), 
            Size = v40, 
            Text = v43(), 
            TextColor3 = v30.Theme.TextEmphasis.Color, 
            TextSize = v30.Font.BaseSize * v30.Font.CaptionHeader.RelativeSize, 
            TextXAlignment = v39, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 1
        }), 
        CTAContainer = v3.createElement("Frame", {
            BackgroundColor3 = v30.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v30.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = v27.LayoutOrder, 
            Size = v41, 
            ZIndex = v27.ZIndex
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            BulkSaveButton = v3.createElement(l_IconButton_0, {
                backgroundColor = v30.Theme.BackgroundUIContrast, 
                icon = l_Images_0["icons/actions/download_medium"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v36, 
                layoutOrder = 1, 
                onActivated = v46, 
                size = v25
            }), 
            BulkShareButton = v27.enableShareCaptureCTA and v3.createElement(l_IconButton_0, {
                backgroundColor = v30.Theme.BackgroundUIContrast, 
                icon = l_Images_0["icons/actions/share"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v35, 
                layoutOrder = 1, 
                onActivated = v48, 
                size = v25
            }), 
            BulkDeleteButton = v3.createElement(l_IconButton_0, {
                icon = l_Images_0["icons/actions/edit/delete"], 
                iconSize = l_IconSize_0.Medium, 
                isDisabled = v37, 
                layoutOrder = 2, 
                onActivated = v49, 
                size = v25
            })
        })
    });
end));