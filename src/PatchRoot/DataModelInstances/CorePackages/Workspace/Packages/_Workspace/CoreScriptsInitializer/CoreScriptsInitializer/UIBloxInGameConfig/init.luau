local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_UIBlox_0 = v1.UIBlox;
return {
    useRobloxGuiFocusedChangedEventInGenericButton = l_UIBlox_0.FFlagUIBloxUseRobloxGuiFocused, 
    useNewHeaderBar = l_UIBlox_0.GetFFlagUIBloxUseNewHeaderBar(), 
    enableInteractionFeedback = v1.GetFFlagEnableUISoundAndHaptics(), 
    refactorInteractable = l_UIBlox_0.FFlagUIBloxUseNewInteractableCoreScript, 
    enableTooltipV2HoverControllerReRenderFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(), 
    enableTooltipV2BodyFontFix = l_UIBlox_0.GetFFlagUIBloxEnableTooltipV2BodyFontFix(), 
    enableTextFieldInputType = l_UIBlox_0.GetFFlagUIBloxEnableTextFieldInputType(), 
    useInteractableWithTileAndCell = l_UIBlox_0.GetFFlagUseInteractableWithTileAndCell(), 
    fixHeaderBarTitleFlickering = l_UIBlox_0.GetFFlagUIBloxFixHeaderBarTitleFlickering(), 
    fixHeaderBarDependenciesArray = l_UIBlox_0.GetFFlagUIBloxFixHeaderBarDependenciesArray(), 
    enableCreateLazyComponent = l_UIBlox_0.GetFFlagEnableCreateLazyComponent(), 
    refactorTileTextHeights = l_UIBlox_0.GetFFlagRefactorTileTextHeights(), 
    enableOpenTypeSupport = v1.GetFFlagLuaAppEnableOpenTypeSupport(), 
    enableNavigationBarSelectionChangeFix = l_UIBlox_0.GetFFlagUIBloxEnableNavigationBarSelectionCallbackFix(), 
    didMountUpdateFullPageModal = l_UIBlox_0.GetFFlagUIBloxDidMountUpdateFullPageModal(), 
    useFoundationColors = v1.GetFFlagLuaAppEnableFoundationColors(), 
    enableUseStyleMetadata = l_UIBlox_0.GetFFlagUIBloxEnableUseStyleMetadata(), 
    enablePanelManagedAnchoring = l_UIBlox_0.GetFFlagUIBloxEnablePanelManagedAnchoring(), 
    fixModalBottomSheetPressState = v1.GetFFlagLuaAppEnableFoundationColors(), 
    useFoundationProvider = v1.GetFFlagUIBloxFoundationProvider()
};