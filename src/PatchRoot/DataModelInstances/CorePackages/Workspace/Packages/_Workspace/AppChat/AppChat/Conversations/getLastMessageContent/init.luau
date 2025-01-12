local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.SharedFlags);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatHiddenMessages);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagImprovePreviewMessage);
local l_GetFFlagEnableSocialCards_0 = v3.GetFFlagEnableSocialCards;
local function v10(v9) --[[ Line: 14 ]] --[[ Name: getMessageContent ]]
    -- upvalues: v5 (copy), l_Url_0 (copy), l_GetFFlagEnableSocialCards_0 (copy)
    if v9.messageType == v5.Link then
        return l_Url_0.WWW_URL .. "games/" .. v9.gameLink.universeId;
    elseif l_GetFFlagEnableSocialCards_0() and v9.messageType == v5.System and v9.cards then
        return v9.cards[1] and v9.cards[1].alt_text;
    else
        return (tostring(v9.content));
    end;
end;
return function(v11) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), v6 (copy), v10 (copy), v7 (copy)
    local v12 = v2(v11, "messages.keys");
    local v13 = v2(v11, "messages.values");
    local l_previewMessageId_0 = v11.previewMessageId;
    if v6() and l_previewMessageId_0 and v13 and v13[l_previewMessageId_0] then
        return (v10(v13[l_previewMessageId_0]));
    elseif v6() and v7() then
        return nil;
    else
        if v12 and v13 then
            local v15 = v13[v12[#v12]];
            if v15 then
                return (v10(v15));
            end;
        end;
        return nil;
    end;
end;