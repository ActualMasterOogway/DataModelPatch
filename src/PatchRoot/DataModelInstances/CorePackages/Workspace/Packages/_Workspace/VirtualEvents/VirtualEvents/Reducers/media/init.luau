local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_NetworkingGames_0 = require(l_script_FirstAncestor_0.network).NetworkingGames;
return require(script.Parent["media.impl"])(l_NetworkingGames_0);