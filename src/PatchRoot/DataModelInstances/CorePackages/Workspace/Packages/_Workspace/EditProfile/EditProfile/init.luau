return {
    Analytics = require(script.Analytics), 
    EditProfilePage = require(script.Components.EditProfileEntryPoint), 
    EditDisplayNameModal = require(script.Components.EditDisplayNameModal), 
    EditDescriptionModal = require(script.Components.EditDescriptionModal), 
    EditDisplayNameErrorModal = require(script.Components.ErrorModals.EditDisplayNameErrorModal), 
    EditSocialNetworksErrorModal = require(script.Components.ErrorModals.EditSocialNetworksErrorModal), 
    UsernameInsufficientFundsModal = require(script.Components.ErrorModals.UsernameInsufficientFundsModal), 
    EditSocialLinksModal = require(script.Components.EditSocialLinksModal), 
    Flags = require(script.Flags), 
    Constants = require(script.Common.Constants), 
    ["jest.config"] = script["jest.config"], 
    installReducer = require(script.installReducer), 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    EditUsernameWrapper = require(script.EditUsernameWrapper), 
    useDisplayNameText = require(script.Hooks.useDisplayNameText)
};