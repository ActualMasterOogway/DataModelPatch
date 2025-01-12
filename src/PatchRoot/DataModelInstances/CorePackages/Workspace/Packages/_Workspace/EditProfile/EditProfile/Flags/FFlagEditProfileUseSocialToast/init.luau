local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.SharedFlags);
return game:DefineFastFlag("EditProfileUseSocialToast", false) and v1.FFlagSocialAddExperienceRoutes;