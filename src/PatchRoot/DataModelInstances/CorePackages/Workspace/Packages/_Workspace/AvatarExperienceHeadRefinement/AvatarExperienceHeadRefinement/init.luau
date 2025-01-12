local v0 = require(script.Reducers.HeadRefinementReducer);
local v1 = require(script.Enums.HeadShape);
return {
    Actions = {
        TryOnClassicHeadShape = require(script.Actions.TryOnClassicHeadShape), 
        SetLastSelectedHeadShape = require(script.Actions.SetLastSelectedHeadShape), 
        SetAvailableHeadShapes = require(script.Actions.SetAvailableHeadShapes)
    }, 
    Components = {
        HeadRefinementEntryButton = require(script.Components.HeadRefinementEntryButton), 
        HeadShapeList = require(script.Components.HeadShapeList), 
        HeadShapeTile = require(script.Components.HeadShapeTile)
    }, 
    Enums = {
        HeadShape = v1, 
        HeadShapeProperties = require(script.Enums.HeadShapeProperties), 
        HeadShapePropertiesByAssetId = require(script.Enums.HeadShapePropertiesByAssetId)
    }, 
    Reducers = {
        HeadRefinementReducer = v0
    }, 
    Features = {
        HeadShapePicker = require(script.Features.HeadShapePicker)
    }, 
    Thunks = {
        GetUserOwnedClassicHeads = require(script.Thunks.GetUserOwnedClassicHeads)
    }, 
    Utils = {
        getMappedStyleTokens = require(script.Utils.getMappedStyleTokens), 
        getEquippedHeadShapeName = require(script.Utils.getEquippedHeadShapeName), 
        getDefaultSelectedHeadShapeName = require(script.Utils.getDefaultSelectedHeadShapeName), 
        getShouldShowAdjustmentTooltipFromTime = require(script.Utils.getShouldShowAdjustmentTooltipFromTime)
    }, 
    Flags = {
        GetFFlagAXHeadRefinementVisualFixes = require(script.Flags.GetFFlagAXHeadRefinementVisualFixes), 
        GetFFlagAXHeadRefinementCounters = require(script.Flags.GetFFlagAXHeadRefinementCounters)
    }, 
    Counters = require(script.Counters), 
    ["jest.config"] = script["jest.config"]
};