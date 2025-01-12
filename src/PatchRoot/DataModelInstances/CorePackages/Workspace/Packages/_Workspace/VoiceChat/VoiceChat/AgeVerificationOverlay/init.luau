local l_Flags_0 = script.Parent.Flags;
local v1 = require(l_Flags_0.GetFFlagUsePostRecordUserSeenGeneralModal);
return {
    ApiFetchShowAgeVerificationOverlay = require(script.ApiFetchShowAgeVerificationOverlay), 
    ApiPostRecordUserSeenModal = require(script.ApiPostRecordUserSeenModal), 
    GetShowAgeVerificationOverlay = require(script.GetShowAgeVerificationOverlay), 
    OpenAgeVerificationModal = require(script.OpenAgeVerificationModal), 
    OpenCentralOverlayForVerifiedEnableVoice = require(script.OpenCentralOverlayForVerifiedEnableVoice), 
    SetShowAgeVerificationOverlay = require(script.SetShowAgeVerificationOverlay), 
    ShowAgeVerificationOverlay = require(script.ShowAgeVerificationOverlay), 
    PostRecordUserSeenGeneralModal = if v1() then require(script.PostRecordUserSeenGeneralModal) else nil
};