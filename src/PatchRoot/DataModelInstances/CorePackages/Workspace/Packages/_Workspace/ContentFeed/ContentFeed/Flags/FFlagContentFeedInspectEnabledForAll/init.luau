local l_Parent_0 = script.Parent.Parent.Parent;
local l_FFlagContentFeedInspectAndBuySetupEnabled_0 = require(l_Parent_0.SharedFlags).FFlagContentFeedInspectAndBuySetupEnabled;
return game:DefineFastFlag("ContentFeedInspectEnabledForAll", false) and l_FFlagContentFeedInspectAndBuySetupEnabled_0;