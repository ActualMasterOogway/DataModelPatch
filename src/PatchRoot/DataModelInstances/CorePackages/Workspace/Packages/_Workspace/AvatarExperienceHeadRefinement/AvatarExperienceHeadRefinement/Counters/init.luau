local v0 = game:DefineFastFlag("AXFixHeadRefinementCounterName", false);
return {
    HeadShapeSelect = "HeadShapeSelect", 
    Enter = v0 and "HeadShapePickerEnter" or "Enter", 
    Unsupported = v0 and "HeadShapePickerUnsupported" or "Unsupported", 
    OwnedClassicHeadsRequest = {
        Start = "OwnedClassicHeadsRequestStart", 
        Success = "OwnedClassicHeadsRequestSuccess", 
        Failure = "OwnedClassicHeadsRequestFailure"
    }
};