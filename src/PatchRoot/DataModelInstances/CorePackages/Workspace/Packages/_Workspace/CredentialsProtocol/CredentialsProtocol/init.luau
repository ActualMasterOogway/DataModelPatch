local v0 = require(script.CredentialsProtocol);
local v1 = require(script.Constants);
local _ = require(script.CredentialsProtocolTypes);
local v3 = require(script.Flags.GetFFlagLuaAppEnableCredentialsProtocol);
local v4 = require(script.Flags.GetFIntLuaAppCredentialsProtocolTimeout);
local v5 = require(script.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout);
return {
    Constants = v1, 
    CredentialsProtocol = v0, 
    Flags = {
        GetFFlagLuaAppEnableCredentialsProtocol = v3, 
        GetFIntLuaAppCredentialsProtocolTimeout = v4, 
        GetFIntLuaAppCredentialsProtocolAvailableTimeout = v5
    }
};