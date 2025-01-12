local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SpatialUI);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ApolloClient);
local l_gql_0 = v4.gql;
local l_useQuery_0 = v4.useQuery;
local v7 = require(l_Parent_0.ExpChatShared);
local v8 = require(l_script_FirstAncestor_0.Config);
local l_context_0 = v7.context;
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v11 = require(l_Helpers_0.getMessageSettings);
local v12 = require(l_Helpers_0.duplicateInvisibleText);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceIncludesColon");
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v15 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v16 = require(l_Flags_0.getFFlagEnableGradientForChatWindowMessage);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatWindowMemoization);
appendVerifiedBadge = function(v18) --[[ Line: 25 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v8 (copy)
    if l_game_EngineFeature_0 then
        return string.gsub(v18, ":(%S-)$", v8.VERIFIED_EMOJI .. ":%1");
    else
        return v18 .. v8.VERIFIED_EMOJI;
    end;
end;
local function v20(v19) --[[ Line: 33 ]]
    -- upvalues: l_context_0 (copy), l_useQuery_0 (copy), l_gql_0 (copy)
    if l_context_0.apolloClient then
        return (l_useQuery_0(l_gql_0(require(script.Parent.Parent.TranslatedTextMessage.UserProfiles)), {
            errorPolicy = "all", 
            variables = {
                userIds = {
                    (tostring(v19.userId))
                }
            }, 
            client = l_context_0.apolloClient
        }));
    else
        return nil;
    end;
end;
local function _(v21, v22) --[[ Line: 48 ]] --[[ Name: setTransparency ]]
    return v22:map(function(v23) --[[ Line: 49 ]]
        -- upvalues: v21 (copy)
        if v21 == nil then
            return 1;
        else
            return v21 + v23 * (1 - v21);
        end;
    end);
end;
local function v62(v25) --[[ Line: 54 ]]
    -- upvalues: v3 (copy), v11 (copy), v16 (copy), v15 (copy), v20 (copy), v2 (copy), l_game_EngineFeature_0 (copy), v12 (copy), v8 (copy)
    local v26, v27 = v3.useState(nil);
    local v28 = v11(v25.message, v25.chatWindowSettings);
    local v29 = if v16() then v28.text or "" else v25.message.text or "";
    local v30 = if v16() then v28.prefixText or "" else v25.message.prefixText or "";
    local v31 = v26 or v30;
    local l_chatWindowSettings_0 = v25.chatWindowSettings;
    local v33 = if v15() and v25.message.userId then v20(v25.message) else nil;
    local v34 = if v33 then v33.data else nil;
    local l_bodyTextProperties_0 = v28.bodyTextProperties;
    local l_prefixTextProperties_0 = v28.prefixTextProperties;
    local v37 = if v3.useContext(v2).isSpatialUIEnabled then l_chatWindowSettings_0.SpatialPanelTextSize else l_chatWindowSettings_0.TextSize;
    v3.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v33 (copy), v30 (copy), v27 (copy)
        if v33 and v33.data then
            local l_names_0 = v33.data.userProfiles[1].names;
            local v39 = string.gsub(v30, l_names_0.displayName, l_names_0.combinedName);
            v27(v39);
        end;
    end, {
        v25.message.userId, 
        v34
    });
    if string.len(v30) > 0 then
        if v25.isUserVerified then
            v31 = appendVerifiedBadge(v31);
        end;
        if not l_game_EngineFeature_0 then
            v31 = v31 .. ":";
        end;
        v29 = if v16() then v12(v31, l_prefixTextProperties_0.FontFace, l_prefixTextProperties_0.TextSize) .. " " .. v29 else v31 .. " " .. v29;
    end;
    local l_createElement_0 = v3.createElement;
    local v41 = "Frame";
    local v42 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v25.LayoutOrder
    };
    local v43 = {};
    local v44 = v16();
    if v44 then
        v44 = false;
        if string.len(v30) > 0 then
            v44 = v3.createElement;
            local v45 = "TextLabel";
            local v46 = {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                FontFace = l_prefixTextProperties_0.FontFace, 
                RichText = true, 
                Text = v31, 
                TextColor3 = l_prefixTextProperties_0.TextColor3, 
                TextSize = l_prefixTextProperties_0.TextSize, 
                TextStrokeColor3 = l_prefixTextProperties_0.TextStrokeColor3
            };
            local l_TextStrokeTransparency_0 = l_prefixTextProperties_0.TextStrokeTransparency;
            local l_l_TextStrokeTransparency_0_0 = l_TextStrokeTransparency_0 --[[ copy: 22 -> 28 ]];
            v46.TextStrokeTransparency = v25.textTransparency:map(function(v49) --[[ Line: 49 ]]
                -- upvalues: l_l_TextStrokeTransparency_0_0 (copy)
                if l_l_TextStrokeTransparency_0_0 == nil then
                    return 1;
                else
                    return l_l_TextStrokeTransparency_0_0 + v49 * (1 - l_l_TextStrokeTransparency_0_0);
                end;
            end);
            l_TextStrokeTransparency_0 = v25.textTransparency;
            local v50 = 0;
            local l_v50_0 = v50 --[[ copy: 26 -> 29 ]];
            v46.TextTransparency = l_TextStrokeTransparency_0:map(function(v52) --[[ Line: 49 ]]
                -- upvalues: l_v50_0 (copy)
                if l_v50_0 == nil then
                    return 1;
                else
                    return l_v50_0 + v52 * (1 - l_v50_0);
                end;
            end);
            v46.TextWrapped = true;
            v46.TextXAlignment = Enum.TextXAlignment.Left;
            v46.TextYAlignment = Enum.TextYAlignment.Top;
            v46.LayoutOrder = v25.LayoutOrder;
            v44 = v44(v45, v46, {
                UIGradient = v16() and l_prefixTextProperties_0.UIGradient ~= nil and v3.createElement("UIGradient", l_prefixTextProperties_0.UIGradient)
            });
        end;
    end;
    v43.PrefixText = v44;
    v44 = v3.createElement;
    local v53 = "TextLabel";
    local v54 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = if v16() then l_bodyTextProperties_0.FontFace else l_chatWindowSettings_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v29, 
        TextColor3 = if v16() then l_bodyTextProperties_0.TextColor3 else l_chatWindowSettings_0.TextColor3, 
        TextSize = if v16() then l_bodyTextProperties_0.TextSize else v37, 
        TextStrokeColor3 = if v16() then l_bodyTextProperties_0.TextStrokeColor3 else l_chatWindowSettings_0.TextStrokeColor3
    };
    local v55;
    if v16() then
        local l_TextStrokeTransparency_1 = l_bodyTextProperties_0.TextStrokeTransparency;
        local l_l_TextStrokeTransparency_1_0 = l_TextStrokeTransparency_1 --[[ copy: 22 -> 27 ]];
        v55 = v25.textTransparency:map(function(v58) --[[ Line: 49 ]]
            -- upvalues: l_l_TextStrokeTransparency_1_0 (copy)
            if l_l_TextStrokeTransparency_1_0 == nil then
                return 1;
            else
                return l_l_TextStrokeTransparency_1_0 + v58 * (1 - l_l_TextStrokeTransparency_1_0);
            end;
        end);
    else
        v55 = v25.textStrokeTransparency or 0.5;
    end;
    v54.TextStrokeTransparency = v55;
    if v16() then
        local l_textTransparency_0 = v25.textTransparency;
        local v60 = 0;
        v55 = l_textTransparency_0:map(function(v61) --[[ Line: 49 ]]
            -- upvalues: v60 (copy)
            if v60 == nil then
                return 1;
            else
                return v60 + v61 * (1 - v60);
            end;
        end);
    else
        v55 = v25.textTransparency or 0;
    end;
    v54.TextTransparency = v55;
    v54.TextWrapped = true;
    v54.TextXAlignment = Enum.TextXAlignment.Left;
    v54.TextYAlignment = Enum.TextYAlignment.Top;
    v54.LayoutOrder = v25.LayoutOrder;
    v43.BodyText = v44(v53, v54, {
        TextMessageButton = if string.len(v30) ~= 0 then v3.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = if v16() then l_prefixTextProperties_0.FontFace else l_chatWindowSettings_0.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = v31, 
            TextSize = if v16() then l_prefixTextProperties_0.TextSize else v8.ChatWindowTextSize, 
            TextStrokeTransparency = 1, 
            TextTransparency = 1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            [v3.Event.Activated] = function() --[[ Line: 185 ]]
                -- upvalues: v25 (copy)
                v25.onTextMessageLabelButtonActivated(v25.message);
            end
        }) else nil
    });
    return l_createElement_0(v41, v42, v43);
end;
if v17() then
    return (v3.memo(v62));
else
    return v62;
end;