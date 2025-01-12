local l_Parent_0 = script:FindFirstAncestor("AppChatNetworking").Parent;
return {
    Telemetry = require(l_Parent_0.LoggingProtocol).default
};