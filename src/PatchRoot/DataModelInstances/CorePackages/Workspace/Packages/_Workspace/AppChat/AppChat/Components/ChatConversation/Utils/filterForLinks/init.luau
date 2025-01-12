local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v5 = require(script.Parent.formatMessages);
local v6 = require(script.Parent.separateLinksFromMessagesRegex);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
return function(v8, v9) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v7 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy)
    v3.isType(v8, "table", "filterForLinks.text");
    v3.isType(v9, "table", "filterForLinks.whitelistedDomains");
    if v7() and v8.messageType == v4.System then
        return {
            v8
        };
    elseif v8.messageType == v4.Link and (not v8.gameLink or not v8.gameLink.universeId) then
        return {
            v2.Dictionary.join(v8, {
                messageType = v2.None
            })
        };
    elseif not v8.content or not v8.content:lower():match("%/games[^%d]*(%d+)/?") or v8.moderated then
        return {
            v8
        };
    else
        return v5(v6(v8.content), v8);
    end;
end;