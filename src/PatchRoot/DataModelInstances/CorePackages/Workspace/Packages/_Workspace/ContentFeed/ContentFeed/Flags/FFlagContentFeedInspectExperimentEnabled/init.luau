local l_Parent_0 = script.Parent.Parent.Parent;
local l_FFlagContentFeedInspectAndBuySetupEnabled_0 = require(l_Parent_0.SharedFlags).FFlagContentFeedInspectAndBuySetupEnabled;
return game:DefineFastFlag("ContentFeedInspectExperimentEnabled", false) and l_FFlagContentFeedInspectAndBuySetupEnabled_0 and game:GetEngineFeature("SocialContentFeedLayerRegistered");