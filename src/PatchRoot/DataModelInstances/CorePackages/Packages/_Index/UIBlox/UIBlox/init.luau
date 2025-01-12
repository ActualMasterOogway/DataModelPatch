local v0 = require(script.Core.Config.makeConfigurable);
local v1 = require(script.UIBloxDefaultConfig);
local l_createLazyComponent_0 = require(script.Parent.LazyRequire).createLazyComponent;
local _ = require(script.App.Style.Fonts);
local _ = require(script.App.ImageSet.ImagesTypes);
local _ = require(script.App.Style.StyleTypes);
local _ = require(script.Core.Layout.Responsive.ResponsiveLayoutConfigReader);
local v7 = require(script.App.Dialog.Overlay.Overlay);
local v8 = require(script.Core.Control.Enum.ControlState);
local _ = require(script.Parent.React);
local v10 = require(script.Parent.ReactUtils);
return v0(function(v11) --[[ Line: 34 ]] --[[ Name: initializeLibrary ]]
    -- upvalues: l_createLazyComponent_0 (copy), v8 (copy), v10 (copy), v7 (copy)
    local v12 = require(script.Utility.strict);
    local function _(v13) --[[ Line: 37 ]] --[[ Name: lazify ]]
        -- upvalues: v11 (copy), l_createLazyComponent_0 (ref)
        if v11.enableCreateLazyComponent then
            return l_createLazyComponent_0(v13);
        else
            return (v13());
        end;
    end;
    local v15 = {};
    local l_v12_0 = v12;
    local v17 = {};
    local l_v12_1 = v12;
    local v19 = {};
    local l_v12_2 = v12;
    local v21 = {
        ResponsiveLayoutProvider = require(script.Core.Layout.Responsive.ResponsiveLayoutProvider)
    };
    local function v22() --[[ Line: 51 ]]
        return require(script.Core.Layout.Responsive.ResponsiveRow);
    end;
    v21.ResponsiveRow = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v21.useResponsiveLayout = require(script.Core.Layout.Responsive.useResponsiveLayout);
    v19.Responsive = l_v12_2(v21);
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 57 ]]
        return require(script.Core.Layout.Grid.GridContainer_DEPRECATED);
    end;
    v21.GridContainer_DEPRECATED = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v21.withGridConfig_DEPRECATED = require(script.Core.Layout.Grid.withGridConfig_DEPRECATED);
    v19.Grid = l_v12_2(v21);
    v19.LayerCollector = v12({
        LayerCollectorProvider = require(script.Core.Layout.LayerCollector.LayerCollectorProvider), 
        withLayerCollectorProvider = require(script.Core.Layout.LayerCollector.withLayerCollectorProvider), 
        useLayerCollector = require(script.Core.Layout.LayerCollector.useLayerCollector)
    });
    v17.Layout = l_v12_1(v19);
    v17.Animation = v12({
        withAnimation = require(script.Core.Animation.withAnimation)
    });
    v17.ImageSet = v12({
        ImageSetButton = require(script.Core.ImageSet.ImageSetComponent).Button, 
        ImageSetLabel = require(script.Core.ImageSet.ImageSetComponent).Label, 
        Validator = v12({
            validateImage = require(script.Core.ImageSet.Validator.validateImage)
        })
    });
    l_v12_1 = v12;
    v19 = {
        Enum = v12({
            ControlState = v8, 
            ControlStateEvent = require(script.Core.Control.Enum.ControlStateEvent), 
            SelectionMode = require(script.Core.Control.Enum.SelectionMode)
        }), 
        Hooks = v12({
            useGuiControlState = require(script.Core.Control.Hooks.useGuiControlState), 
            useGuiControlStateWithBinding = require(script.Core.Control.Hooks.useGuiControlStateWithBinding)
        })
    };
    v21 = function() --[[ Line: 91 ]]
        return require(script.Core.Control.Interactable);
    end;
    v19.Interactable = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 94 ]]
        return require(script.Core.Control.InteractableList);
    end;
    v19.InteractableList = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 97 ]]
        return require(script.Core.Control.StateLayer);
    end;
    v19.StateLayer = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.FeedbackManagerInjectionContext = require(script.Core.Control.FeedbackManagerInjectionContext);
    v17.Control = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 105 ]]
        return require(script.Core.Spatial.SurfaceGuiWithAdornee);
    end;
    v19.SurfaceGuiWithAdornee = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Spatial = l_v12_1(v19);
    v17.Style = v12({
        Provider = require(script.Core.Style.StyleProvider), 
        withStyle = require(script.Core.Style.withStyle), 
        useStyle = require(script.Core.Style.useStyle), 
        useTextSizeOffset = require(script.Core.Style.useTextSizeOffset), 
        withTextSizeOffset = require(script.Core.Style.withTextSizeOffset), 
        useStyleMetadata = if v11.enableUseStyleMetadata then require(script.Core.Style.useStyleMetadata) else nil
    });
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 122 ]]
        return require(script.Core.VR.Panel3D);
    end;
    v19.Panel3D = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.Constants = require(script.Core.VR.Constants);
    v21 = function() --[[ Line: 126 ]]
        return require(script.Core.VR.PointerOverlay);
    end;
    v19.PointerOverlay = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.VR = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {
        ExpandableText = v12({
            GetCanExpand = require(script.Core.Text.ExpandableText.ExpandableTextUtils).getCanExpand
        })
    };
    v21 = function() --[[ Line: 135 ]]
        return require(script.Core.Text.GetWrappedTextWithIcon);
    end;
    v19.GetWrappedTextWithIcon = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 138 ]]
        return require(script.Core.Text.EmojiTextLabel.EmojiTextLabel);
    end;
    v19.EmojiTextLabel = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Text = l_v12_1(v19);
    v17.Hooks = v12({
        useExternalEvent = v10.useEventConnection, 
        useLazyRef = v10.useLazyRef, 
        useInitializedValue = v10.useInitializedValue, 
        useForwardRef = v10.useForwardRef, 
        useProperties = v10.useProperties, 
        usePropertiesDeferred = v10.usePropertiesDeferred, 
        useIsGamepad = require(script.Utility.useIsGamepad), 
        useInputType = require(script.Utility.useInputType)
    });
    v17.Enums = v12({
        InputType = require(script.Enums.InputType)
    });
    v15.Core = l_v12_0(v17);
    v15.Common = v12({
        Style = v12({
            ColorSystem = require(script.Common.Style.ColorSystem)
        })
    });
    l_v12_0 = v12;
    v17 = {
        Context = v12({
            ContentProvider = require(script.App.Context.ContentProvider)
        }), 
        ImageSet = v12({
            Images = require(script.App.ImageSet.Images), 
            getIconSize = require(script.App.ImageSet.getIconSize), 
            getIconSizeUDim2 = require(script.App.ImageSet.getIconSizeUDim2), 
            scaleSliceToResolution = require(script.App.ImageSet.scaleSliceToResolution), 
            Enum = v12({
                IconSize = require(script.App.ImageSet.Enum.IconSize)
            })
        })
    };
    l_v12_1 = v12;
    v19 = {};
    if v11.useNewHeaderBar then
        v21 = function() --[[ Line: 184 ]]
            return require(script.App.Bar.HeaderBar);
        end;
        l_v12_2 = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    else
        l_v12_2 = require(script.App.Bar.HeaderBar);
    end;
    v19.HeaderBar = l_v12_2;
    v21 = function() --[[ Line: 188 ]]
        return require(script.App.Bar.FullscreenTitleBar);
    end;
    v19.FullscreenTitleBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 191 ]]
        return require(script.App.Bar.ControllerBar);
    end;
    v19.ControllerBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Bar = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {
        Enum = v12({
            ButtonType = require(script.App.Button.Enum.ButtonType), 
            StandardButtonSize = require(script.Core.Button.Enum.StandardButtonSize)
        })
    };
    v21 = function() --[[ Line: 201 ]]
        return require(script.App.Button.Button);
    end;
    v19.Button = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 204 ]]
        return require(script.App.Button.ButtonStack);
    end;
    v19.ButtonStack = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 207 ]]
        return require(script.App.Button.TextButton);
    end;
    v19.TextButton = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 210 ]]
        return require(script.App.Button.LinkButton);
    end;
    v19.LinkButton = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 213 ]]
        return require(script.App.Button.IconButton);
    end;
    v19.IconButton = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 216 ]]
        return require(script.App.Button.ActionBar);
    end;
    v19.ActionBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 219 ]]
        return require(script.App.Button.UtilityActionIcon);
    end;
    v19.UtilityActionIcon = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 222 ]]
        return require(script.App.Button.ComboButton);
    end;
    v19.ComboButton = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Button = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    l_v12_2 = v12;
    v21 = {};
    local l_v12_3 = v12;
    v22 = {};
    local function v24() --[[ Line: 230 ]]
        return require(script.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup);
    end;
    v22.SmallRadioButtonGroup = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v24) else v24();
    v21.SelectionGroup = l_v12_3(v22);
    v19.Small = l_v12_2(v21);
    v17.Cell = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 238 ]]
        return require(script.App.Text.ExpandableTextArea.ExpandableTextArea);
    end;
    v19.ExpandableTextArea = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 241 ]]
        return require(script.App.Text.StyledTextLabel);
    end;
    v19.StyledTextLabel = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Text = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {
        Enum = v12({
            RetrievalStatus = require(script.App.Loading.Enum.RetrievalStatus), 
            LoadingStrategy = require(script.App.Loading.Enum.LoadingStrategy)
        })
    };
    v21 = function() --[[ Line: 251 ]]
        return require(script.App.Loading.LoadableImage);
    end;
    v19.LoadableImage = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 254 ]]
        return require(script.App.Loading.ShimmerPanel);
    end;
    v19.ShimmerPanel = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 257 ]]
        return require(script.App.Loading.LoadingSpinner);
    end;
    v19.LoadingSpinner = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Loading = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 263 ]]
        return require(script.App.InputButton.RadioButtonList);
    end;
    v19.RadioButtonList = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 266 ]]
        return require(script.App.InputButton.CheckboxList);
    end;
    v19.CheckboxList = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 269 ]]
        return require(script.App.InputButton.Checkbox);
    end;
    v19.Checkbox = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 272 ]]
        return require(script.App.InputButton.Toggle);
    end;
    v19.Toggle = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.InputButton = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {
        Enum = v12({
            ScrollBarType = require(script.App.Container.Enum.ScrollBarType)
        })
    };
    l_v12_2 = v12;
    v21 = {
        ResponsiveCarousel = require(script.App.Container.Carousel.ResponsiveCarousel)
    };
    v22 = function() --[[ Line: 283 ]]
        return require(script.App.Container.Carousel.FreeFlowCarousel);
    end;
    v21.FreeFlowCarousel = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.Carousel = l_v12_2(v21);
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 288 ]]
        return require(script.App.Container.Grid.ResponsiveGrid);
    end;
    v21.ResponsiveGrid = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.Grid = l_v12_2(v21);
    v21 = function() --[[ Line: 292 ]]
        return require(script.App.Container.VerticalScrollView);
    end;
    v19.VerticalScrollView = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.VerticalScrollViewWithMargin = require(script.App.Container.VerticalScrollViewWithMargin);
    v19.getPageMargin = require(script.App.Container.getPageMargin);
    v21 = function() --[[ Line: 297 ]]
        return require(script.App.Container.LoadingStateContainer);
    end;
    v19.LoadingStateContainer = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 300 ]]
        return require(script.App.Container.LoadingStatePage);
    end;
    v19.LoadingStatePage = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 303 ]]
        return require(script.App.Container.HorizontalPageMargin);
    end;
    v19.HorizontalPageMargin = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.calcMediaGallerySizesFromWidth = require(script.App.Container.MediaGallery.calcMediaGallerySizesFromWidth);
    v21 = function() --[[ Line: 307 ]]
        return require(script.App.Container.MediaGallery.MediaGalleryPreview);
    end;
    v19.MediaGalleryPreview = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 310 ]]
        return require(script.App.Container.MediaGallery.MediaGalleryFullScreen);
    end;
    v19.MediaGalleryFullScreen = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 313 ]]
        return require(script.App.Container.MediaGallery.MediaGalleryHorizontal);
    end;
    v19.MediaGalleryHorizontal = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 316 ]]
        return require(script.App.Container.MediaGallery.MediaGalleryExpandableView);
    end;
    v19.MediaGalleryExpandableView = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 319 ]]
        return require(script.App.Container.MediaGallery.CrossFadeAnimatedView);
    end;
    v19.CrossFadeAnimatedView = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Container = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 325 ]]
        return require(script.App.Slider.ContextualSlider);
    end;
    v19.ContextualSlider = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 328 ]]
        return require(script.App.Slider.SystemSlider);
    end;
    v19.SystemSlider = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 331 ]]
        return require(script.App.Slider.TwoKnobSystemSlider);
    end;
    v19.TwoKnobSystemSlider = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 334 ]]
        return require(script.App.Slider.TwoKnobContextualSlider);
    end;
    v19.TwoKnobContextualSlider = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Slider = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 340 ]]
        return require(script.Core.Emoji.Emoji);
    end;
    v19.Emoji = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.Enum = v12({
        Emoji = require(script.Core.Emoji.Enum.Emoji)
    });
    v17.Emoji = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 349 ]]
        return require(script.App.Grid.GridView);
    end;
    v19.GridView = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.GridMetrics = require(script.App.Grid.GridMetrics);
    v21 = function() --[[ Line: 353 ]]
        return require(script.App.Grid.DefaultMetricsGridView);
    end;
    v19.DefaultMetricsGridView = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Grid = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 359 ]]
        return require(script.App.Tile.MenuTile.MenuTile);
    end;
    v19.MenuTile = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 362 ]]
        return require(script.App.Tile.PlayerTile.PlayerTile);
    end;
    v19.PlayerTile = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 365 ]]
        return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceTileV3);
    end;
    v19.ExperienceTileV3 = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.AspectRatioModeEnum = require(script.App.Tile.SplitTile.ExperienceTile.Enum.AspectRatioMode);
    v19.getExperienceTileHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileHeight);
    v19.getExperienceTileRelativeHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileRelativeHeight);
    v21 = function() --[[ Line: 373 ]]
        return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceActionRow);
    end;
    v19.ExperienceActionRow = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 376 ]]
        return require(script.App.Tile.SplitTile.ActionTile.ActionTile);
    end;
    v19.ActionTile = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 379 ]]
        return require(script.App.Tile.SplitTile.VerticalTile.VerticalTile);
    end;
    v19.VerticalTile = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 382 ]]
        return require(script.App.Tile.SplitTile.VerticalTile.VerticalTileThumbnail);
    end;
    v19.VerticalTileThumbnail = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 386 ]]
        return require(script.App.Tile.ExperienceTileMetadata.SocialProofFooter);
    end;
    v21.SocialProofFooter = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 389 ]]
        return require(script.App.Tile.ExperienceTileMetadata.CoPlayFooter);
    end;
    v21.CoPlayFooter = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 392 ]]
        return require(script.App.Tile.ExperienceTileMetadata.TextFooter);
    end;
    v21.TextFooter = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.ExperienceTileMetadata = l_v12_2(v21);
    v17.Tile = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 400 ]]
        return require(script.App.Dialog.Modal.FullPageModal);
    end;
    v21.FullPageModal = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v21.getPartialPageModalMiddleContentWidth = require(script.App.Dialog.Modal.getPartialPageModalMiddleContentWidth);
    v22 = function() --[[ Line: 406 ]]
        return require(script.App.Dialog.Modal.PartialPageModal);
    end;
    v21.PartialPageModal = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 409 ]]
        return require(script.App.Dialog.Modal.EducationalModal);
    end;
    v21.EducationalModal = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 412 ]]
        return require(script.App.Dialog.Modal.ModalWindow);
    end;
    v21.ModalWindow = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.Modal = l_v12_2(v21);
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 417 ]]
        return require(script.App.Dialog.Alert.InformativeAlert);
    end;
    v21.InformativeAlert = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 420 ]]
        return require(script.App.Dialog.Alert.InteractiveAlert);
    end;
    v21.InteractiveAlert = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 423 ]]
        return require(script.App.Dialog.Alert.LoadingAlert);
    end;
    v21.LoadingAlert = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.Alert = l_v12_2(v21);
    v19.Enum = v12({
        AlertType = require(script.App.Dialog.Alert.Enum.AlertType), 
        CloseButtonIcon = require(script.App.Dialog.Modal.Enum.CloseButtonIcon), 
        TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation)
    });
    v21 = function() --[[ Line: 432 ]]
        return require(script.App.Dialog.Toast.Toast);
    end;
    v19.Toast = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 435 ]]
        return require(script.App.Dialog.Tooltip.Tooltip);
    end;
    v19.Tooltip = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.TooltipV2 = require(script.App.Dialog.TooltipV2.Controllers);
    v21 = function() --[[ Line: 439 ]]
        return require(script.App.Dialog.TooltipV2.TooltipCallout);
    end;
    v19.TooltipCallout = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation);
    v19.Overlay = v7;
    v17.Dialog = l_v12_1(v19);
    v17.Constant = v12({
        IconSize = require(script.App.Constant.IconSize)
    });
    v17.Style = v12({
        AppStyleProvider = require(script.App.Style.AppStyleProvider), 
        Colors = require(script.App.Style.Colors), 
        Constants = require(script.App.Style.Constants), 
        Themes = {
            DarkTheme = require(script.App.Style.Themes.DarkTheme), 
            LightTheme = require(script.App.Style.Themes.LightTheme)
        }, 
        Tokens = require(script.App.Style.Tokens)
    });
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 463 ]]
        return require(script.App.Indicator.Badge);
    end;
    v19.Badge = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 466 ]]
        return require(script.App.Indicator.EmptyState);
    end;
    v19.EmptyState = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.Enum = v12({
        BadgeStates = require(script.App.Indicator.Enum.BadgeStates), 
        BadgeVariant = require(script.App.Indicator.Enum.BadgeVariant), 
        VoteStates = require(script.App.Indicator.Enum.VoteStates)
    });
    v19.PlayerContext = require(script.App.Indicator.PlayerContext);
    v21 = function() --[[ Line: 475 ]]
        return require(script.App.Indicator.PlayerCount);
    end;
    v19.PlayerCount = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 478 ]]
        return require(script.App.Indicator.RateCount);
    end;
    v19.RateCount = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 481 ]]
        return require(script.App.Indicator.StatWidget);
    end;
    v19.StatWidget = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 484 ]]
        return require(script.App.Indicator.StatGroup);
    end;
    v19.StatGroup = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 487 ]]
        return require(script.App.Indicator.PlayerName);
    end;
    v19.PlayerName = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Indicator = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 493 ]]
        return require(script.App.Menu.BaseMenu);
    end;
    v19.BaseMenu = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 496 ]]
        return require(script.App.Menu.ContextualMenu);
    end;
    v19.ContextualMenu = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.MenuDirection = require(script.App.Menu.MenuDirection);
    v21 = function() --[[ Line: 502 ]]
        return require(script.App.Menu.DropdownMenu);
    end;
    v19.DropdownMenu = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 506 ]]
        return require(script.App.Menu.KeyLabel.KeyLabel);
    end;
    v19.KeyLabel = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Menu = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 512 ]]
        return require(script.App.Control.SegmentedControl);
    end;
    v19.SegmentedControl = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 515 ]]
        return require(script.App.Control.Pill.Pill);
    end;
    v19.Pill = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 518 ]]
        return require(script.App.Control.Pill.Pillv2);
    end;
    v19.Pillv2 = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 522 ]]
        return require(script.App.Control.Slot.SlotTray);
    end;
    v21.SlotTray = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.Slot = l_v12_2(v21);
    v21 = function() --[[ Line: 526 ]]
        return require(script.App.Control.Pill.PillGroup);
    end;
    v19.PillGroup = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.ScrollingListWithArrowsAndGradient = require(script.App.Control.HorizontalNav.ScrollingListWithArrowsAndGradient);
    v17.Control = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {
        Enum = v12({
            Placement = require(script.App.Navigation.Enum.Placement), 
            NavigationBarAlignment = require(script.App.Navigation.Enum.NavigationBarAlignment), 
            NavigationRailAlignment = require(script.App.Navigation.Enum.NavigationRailAlignment), 
            NavigationTabLayout = require(script.App.Navigation.Enum.NavigationTabLayout)
        })
    };
    v21 = function() --[[ Line: 541 ]]
        return require(script.App.Navigation.SystemBar);
    end;
    v19.SystemBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 545 ]]
        return require(script.App.Navigation.NavigationBar);
    end;
    v19.NavigationBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 548 ]]
        return require(script.App.Navigation.NavigationBarV2);
    end;
    v19.NavigationBarV2 = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 551 ]]
        return require(script.App.Navigation.NavigationRail);
    end;
    v19.NavigationRail = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v19.NavigationTab = require(script.App.Navigation.NavigationTab);
    l_v12_2 = v12;
    v21 = {};
    v22 = function() --[[ Line: 556 ]]
        return require(script.App.Navigation.PrimaryNavBar.ContextBar);
    end;
    v21.ContextBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 559 ]]
        return require(script.App.Navigation.PrimaryNavBar.IconTab);
    end;
    v21.IconTab = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 562 ]]
        return require(script.App.Navigation.PrimaryNavBar.IconTabGroup);
    end;
    v21.IconTabGroup = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v22 = function() --[[ Line: 565 ]]
        return require(script.App.Navigation.PrimaryNavBar.Types);
    end;
    v21.Types = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v22) else v22();
    v19.PrimaryNavBar = l_v12_2(v21);
    v21 = function() --[[ Line: 569 ]]
        return require(script.App.Navigation.ShortcutBar.ShortcutBar);
    end;
    v19.ShortcutBar = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Navigation = l_v12_1(v19);
    v17.SelectionImage = v12({
        SelectionCursorProvider = require(script.App.SelectionImage.SelectionCursorProvider), 
        CursorKind = require(script.App.SelectionImage.CursorKind), 
        withSelectionCursorProvider = require(script.App.SelectionImage.withSelectionCursorProvider), 
        useSelectionCursor = require(script.App.SelectionImage.useSelectionCursor)
    });
    v17.SelectionCursor = v12({
        CursorProvider = require(script.App.SelectionCursor.CursorProvider), 
        useCursor = require(script.App.SelectionCursor.useCursor), 
        withCursor = require(script.App.SelectionCursor.withCursor), 
        useCursorByType = require(script.App.SelectionCursor.useCursorByType), 
        CursorType = require(script.App.SelectionCursor.CursorType)
    });
    l_v12_1 = v12;
    v19 = {};
    l_v12_2 = {
        Enum = {
            ContentPosition = require(script.App.Template.DetailsPage.Enum.ContentPosition)
        }
    };
    l_v12_3 = function() --[[ Line: 594 ]]
        return require(script.App.Template.DetailsPage.DetailsPageTemplate);
    end;
    l_v12_2.DetailsPageTemplate = if v11.enableCreateLazyComponent then l_createLazyComponent_0(l_v12_3) else l_v12_3();
    l_v12_3 = function() --[[ Line: 597 ]]
        return require(script.App.Template.DetailsPage.DetailsPageSelector);
    end;
    l_v12_2.DetailsPageSelector = if v11.enableCreateLazyComponent then l_createLazyComponent_0(l_v12_3) else l_v12_3();
    v19.DetailsPage = l_v12_2;
    v17.Template = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 604 ]]
        return require(script.App.Table.ListTable);
    end;
    v19.ListTable = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 607 ]]
        return require(script.App.Table.ScrollingListTable);
    end;
    v19.ScrollingListTable = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 610 ]]
        return require(script.App.Table.Cell);
    end;
    v19.Cell = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 613 ]]
        return require(script.App.Table.CellHeadDetail);
    end;
    v19.CellHeadDetail = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v21 = function() --[[ Line: 616 ]]
        return require(script.App.Table.CellTailDescription);
    end;
    v19.CellTailDescription = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Table = l_v12_1(v19);
    l_v12_1 = v12;
    v19 = {};
    v21 = function() --[[ Line: 622 ]]
        return require(script.App.Input.TextField);
    end;
    v19.TextField = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v21) else v21();
    v17.Input = l_v12_1(v19);
    v15.App = l_v12_0(v17);
    v15.UnitTestHelpers = {
        MockContentProvider = require(script.UnitTestHelpers.MockContentProvider), 
        mockStyleComponent = require(script.Utility.mockStyleComponent), 
        testWithStyledComponent = require(script.UnitTestHelpers.testWithStyledComponent)
    };
    l_v12_0 = {
        Provider = v15.Core.Style.Provider, 
        withStyle = v15.Core.Style.withStyle, 
        Validator = {
            validateStyle = require(script.App.Style.Validator.validateStyle), 
            validateFont = require(script.App.Style.Validator.validateFont), 
            validateFontInfo = require(script.Core.Style.Validator.validateFontInfo), 
            validateTypographyInfo = require(script.Core.Style.Validator.validateTypographyInfo), 
            validateTheme = require(script.App.Style.Validator.validateTheme), 
            validateColorInfo = require(script.Core.Style.Validator.validateColorInfo), 
            validateColorToken = require(script.Core.Style.Validator.validateColorToken)
        }
    };
    l_v12_1 = function() --[[ Line: 648 ]]
        return require(script.Core.Style.StyleConsumer);
    end;
    l_v12_0.Consumer = if v11.enableCreateLazyComponent then l_createLazyComponent_0(l_v12_1) else l_v12_1();
    l_v12_0.Context = require(script.Core.Style.StyleContext);
    v15.Style = l_v12_0;
    v17 = function() --[[ Line: 655 ]]
        return require(script.App.Accordion.AccordionView);
    end;
    v15.AccordionView = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v17) else v17();
    l_v12_0 = {};
    l_v12_1 = function() --[[ Line: 660 ]]
        return require(script.App.Tile.SaveTile.SaveTile);
    end;
    l_v12_0.SaveTile = if v11.enableCreateLazyComponent then l_createLazyComponent_0(l_v12_1) else l_v12_1();
    l_v12_1 = function() --[[ Line: 663 ]]
        return require(script.App.Tile.ItemTile.ItemTile);
    end;
    l_v12_0.ItemTile = if v11.enableCreateLazyComponent then l_createLazyComponent_0(l_v12_1) else l_v12_1();
    l_v12_0.ItemTileEnums = require(script.App.Tile.Enum.ItemTileEnums);
    v15.Tile = l_v12_0;
    v15.Utility = {
        ExternalEventConnection = v10.EventConnection, 
        SpringAnimatedItem = require(script.Utility.SpringAnimatedItem), 
        OpenTypeSupport = require(script.Utility.OpenTypeSupport)
    };
    v17 = function() --[[ Line: 680 ]]
        return require(script.ModalBottomSheet.ModalBottomSheet);
    end;
    v15.ModalBottomSheet = if v11.enableCreateLazyComponent then l_createLazyComponent_0(v17) else v17();
    if _G.__UIBLOX_TRACK_USAGE__ then
        l_v12_0 = require(script.Parent.UsageTracker);
        v15 = l_v12_0.trackMemberAccess("UIBlox", v15, l_v12_0.isReactComponent);
    end;
    if v11.enableTraceLevelLog then
        require(script.Logger):enableTraceLog();
    end;
    return v15;
end, "UIBlox", v1);