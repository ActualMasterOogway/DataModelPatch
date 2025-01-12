local v0 = require(script.Parent.FFlagProfilePlatformDevFlag);
local v1 = require(script.Parent.FFlagProfilePlatformSetup);
return game:DefineFastFlag("ProfileReRouteToProfilePlatform_v1", false) and v1 or v0;