return {
    Components = {
        Overlay = require(script.Components.Overlay.Overlay), 
        FlexLayout = require(script.Components.FlexLayout.FlexLayout)
    }, 
    Lib = {
        SafeAppStorageService = require(script.Lib.SafeAppStorageService)
    }, 
    ["jest.config"] = script["jest.config"]
};