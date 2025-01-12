local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.SpatialUI);
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = require(l_Parent_0.UserProfiles);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_0.RoactRodux);
local l_useQuery_0 = require(l_Parent_1.ApolloClient).useQuery;
local v10 = require(l_script_FirstAncestor_0.Config);
local l_context_0 = v5.context;
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v13 = require(l_Helpers_0.getMessageSettings);
local v14 = require(l_Helpers_0.duplicateInvisibleText);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceIncludesColon");
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v17 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v18 = require(l_Flags_0.getFFlagEnableGradientForChatWindowMessage);
local l_GetFFlagReenableTextChatForTenFootInterfaces_0 = v3.GetFFlagReenableTextChatForTenFootInterfaces;
appendVerifiedBadge = function(v20) --[[ Line: 28 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v10 (copy)
    if l_game_EngineFeature_0 then
        return string.gsub(v20, ":(%S-)$", v10.VERIFIED_EMOJI .. ":%1");
    else
        return v20 .. v10.VERIFIED_EMOJI;
    end;
end;
local function v22(v21) --[[ Line: 35 ]]
    -- upvalues: l_context_0 (copy), l_useQuery_0 (copy), v6 (copy)
    if l_context_0.apolloClient then
        return (l_useQuery_0(v6.Queries.userProfilesInExperienceNamesByUserIds, {
            errorPolicy = "all", 
            variables = {
                userIds = {
                    (tostring(v21.userId))
                }
            }, 
            client = l_context_0.apolloClient
        }));
    else
        return nil;
    end;
end;
trim = function(v23) --[[ Line: 50 ]] --[[ Name: trim ]]
    if v23:match("^()%s*$") then
        return "";
    else
        return (v23:match("^%s*(.*%S)"));
    end;
end;
getMessageText = function(v24, v25, v26) --[[ Line: 54 ]] --[[ Name: getMessageText ]]
    if v25 == nil or v25 == "" then
        return v26 or "";
    elseif v24 then
        return v25 or "";
    else
        return v26 or "";
    end;
end;
local function _(v27, v28) --[[ Line: 64 ]] --[[ Name: setTransparency ]]
    return v28:map(function(v29) --[[ Line: 65 ]]
        -- upvalues: v27 (copy)
        if v27 == nil then
            return 1;
        else
            return v27 + v29 * (1 - v27);
        end;
    end);
end;
return (v8.connect(function() --[[ Line: 260 ]]

end, function(v31) --[[ Line: 260 ]]
    return {
        onToggle = function(v32, v33) --[[ Line: 262 ]] --[[ Name: onToggle ]]
            -- upvalues: v31 (copy)
            v31({
                type = "ChatTranslationMessageToggled", 
                useTranslation = v32, 
                messageId = v33
            });
        end
    };
end)(function(v34) --[[ Line: 70 ]]
    -- upvalues: v7 (copy), v4 (copy), v13 (copy), v18 (copy), v17 (copy), v22 (copy), l_game_EngineFeature_0 (copy), v14 (copy), l_GetFFlagReenableTextChatForTenFootInterfaces_0 (copy)
    local v35, v36 = v7.useState(nil);
    local v37 = v7.useContext(v4);
    local v38 = if v37.isSpatialUIEnabled then v34.chatWindowSettings.SpatialPanelTextSize else v34.chatWindowSettings.TextSize;
    local v39 = v13(v34.message, v34.chatWindowSettings);
    local v40 = v34.showTranslationButton and if v18() then v39.translation ~= nil and v39.translation ~= "" else v34.message.translation ~= nil and v34.message.translation ~= "";
    local v41 = if v18() then v39.useTranslation else v34.message.useTranslation;
    local v42 = getMessageText(v41, if v18() then v39.translation else v34.message.translation, if v18() then v39.text else v34.message.text);
    local v43 = if v18() then v39.prefixText or "" else v34.message.prefixText or "";
    local v44 = v35 or v43;
    local l_chatWindowSettings_0 = v34.chatWindowSettings;
    local v46 = if v17() and v34.message.userId then v22(v34.message) else nil;
    local v47 = if v46 then v46.data else nil;
    local l_bodyTextProperties_0 = v39.bodyTextProperties;
    local l_prefixTextProperties_0 = v39.prefixTextProperties;
    v7.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v46 (copy), v43 (copy), v36 (copy)
        if v46 and v46.data then
            local l_names_0 = v46.data.userProfiles[1].names;
            local l_inExperienceCombinedName_0 = l_names_0.inExperienceCombinedName;
            local v52 = string.gsub(v43, l_names_0.displayName, l_inExperienceCombinedName_0);
            v36(v52);
        end;
    end, {
        v34.message.userId, 
        v47
    });
    if string.len(v43) > 0 then
        if v34.isUserVerified then
            v44 = appendVerifiedBadge(v44);
        end;
        if not l_game_EngineFeature_0 then
            v44 = v44 .. ":";
        end;
        if v40 then
            v42 = "   " .. v42;
        end;
        v42 = if v18() then v14(v44, l_prefixTextProperties_0.FontFace, l_prefixTextProperties_0.TextSize) .. " " .. v42 else v44 .. " " .. v42;
    end;
    local v53 = if v18() then if v37.isSpatialUIEnabled then v38 else l_bodyTextProperties_0.TextSize else v38;
    local v54 = v53 - 2;
    local l_createElement_0 = v7.createElement;
    local v56 = "Frame";
    local v57 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v34.LayoutOrder
    };
    local v58 = {};
    local l_createElement_1 = v7.createElement;
    local v60 = "Frame";
    local v61 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = if l_GetFFlagReenableTextChatForTenFootInterfaces_0() then UDim2.new(1, 0, 0, 0) else nil, 
        BackgroundTransparency = 1
    };
    local v62 = {};
    local v63 = v18();
    if v63 then
        v63 = false;
        if string.len(v43) > 0 then
            v63 = v7.createElement;
            local v64 = "TextLabel";
            local v65 = {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                FontFace = l_prefixTextProperties_0.FontFace, 
                RichText = true, 
                Text = v44, 
                TextColor3 = l_prefixTextProperties_0.TextColor3, 
                TextSize = l_prefixTextProperties_0.TextSize, 
                TextStrokeColor3 = l_prefixTextProperties_0.TextStrokeColor3
            };
            local l_TextStrokeTransparency_0 = l_prefixTextProperties_0.TextStrokeTransparency;
            local l_l_TextStrokeTransparency_0_0 = l_TextStrokeTransparency_0 --[[ copy: 30 -> 41 ]];
            v65.TextStrokeTransparency = v34.textTransparency:map(function(v68) --[[ Line: 65 ]]
                -- upvalues: l_l_TextStrokeTransparency_0_0 (copy)
                if l_l_TextStrokeTransparency_0_0 == nil then
                    return 1;
                else
                    return l_l_TextStrokeTransparency_0_0 + v68 * (1 - l_l_TextStrokeTransparency_0_0);
                end;
            end);
            l_TextStrokeTransparency_0 = v34.textTransparency;
            local v69 = 0;
            local l_v69_0 = v69 --[[ copy: 34 -> 42 ]];
            v65.TextTransparency = l_TextStrokeTransparency_0:map(function(v71) --[[ Line: 65 ]]
                -- upvalues: l_v69_0 (copy)
                if l_v69_0 == nil then
                    return 1;
                else
                    return l_v69_0 + v71 * (1 - l_v69_0);
                end;
            end);
            v65.TextWrapped = true;
            v65.TextXAlignment = Enum.TextXAlignment.Left;
            v65.TextYAlignment = Enum.TextYAlignment.Top;
            v63 = v63(v64, v65, {
                UIGradient = v18() and l_prefixTextProperties_0.UIGradient ~= nil and v7.createElement("UIGradient", l_prefixTextProperties_0.UIGradient)
            });
        end;
    end;
    v62.PrefixText = v63;
    v63 = v7.createElement;
    local v72 = "TextLabel";
    local v73 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = if v18() then l_bodyTextProperties_0.FontFace else l_chatWindowSettings_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v42, 
        TextColor3 = if v18() then l_bodyTextProperties_0.TextColor3 else l_chatWindowSettings_0.TextColor3, 
        TextSize = v53, 
        TextStrokeColor3 = if v18() then l_bodyTextProperties_0.TextStrokeColor3 else l_chatWindowSettings_0.TextStrokeColor3
    };
    local v74;
    if v18() then
        local l_TextStrokeTransparency_1 = l_bodyTextProperties_0.TextStrokeTransparency;
        local l_l_TextStrokeTransparency_1_0 = l_TextStrokeTransparency_1 --[[ copy: 30 -> 40 ]];
        v74 = v34.textTransparency:map(function(v77) --[[ Line: 65 ]]
            -- upvalues: l_l_TextStrokeTransparency_1_0 (copy)
            if l_l_TextStrokeTransparency_1_0 == nil then
                return 1;
            else
                return l_l_TextStrokeTransparency_1_0 + v77 * (1 - l_l_TextStrokeTransparency_1_0);
            end;
        end);
    else
        v74 = v34.textStrokeTransparency or 0.5;
    end;
    v73.TextStrokeTransparency = v74;
    if v18() then
        local l_textTransparency_0 = v34.textTransparency;
        local v79 = 0;
        local l_v79_0 = v79 --[[ copy: 34 -> 39 ]];
        v74 = l_textTransparency_0:map(function(v81) --[[ Line: 65 ]]
            -- upvalues: l_v79_0 (copy)
            if l_v79_0 == nil then
                return 1;
            else
                return l_v79_0 + v81 * (1 - l_v79_0);
            end;
        end);
    else
        v74 = v34.textTransparency or 0;
    end;
    v73.TextTransparency = v74;
    v73.TextWrapped = true;
    v73.TextXAlignment = Enum.TextXAlignment.Left;
    v73.TextYAlignment = Enum.TextYAlignment.Top;
    v62.BodyText = v63(v72, v73);
    if string.len(v43) ~= 0 then
        v63 = v7.createElement;
        v72 = "Frame";
        v73 = {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        v74 = {
            Layout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            TextButton = v7.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                FontFace = if v18() then l_prefixTextProperties_0.FontFace else l_chatWindowSettings_0.FontFace, 
                RichText = true, 
                Size = UDim2.new(0, 0, 0, 0), 
                Text = trim(v44), 
                TextSize = if v18() then l_prefixTextProperties_0.TextSize else v38, 
                TextStrokeTransparency = 1, 
                TextTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 1, 
                [v7.Event.Activated] = function() --[[ Line: 233 ]]
                    -- upvalues: v34 (copy)
                    v34.onTextMessageLabelButtonActivated(v34.message);
                end
            })
        };
        local v82;
        if v40 then
            v82 = v7.createElement;
            local v83 = "ImageButton";
            local v84 = {
                Size = UDim2.new(0, v54, 0, v54), 
                Image = "rbxasset://textures/translateIcon.png", 
                HoverImage = "rbxasset://textures/translateIconDark.png", 
                PressedImage = "rbxasset://textures/translateIconDark.png"
            };
            local v85;
            if v18() then
                local l_textTransparency_1 = v34.textTransparency;
                local v87 = 0;
                v85 = l_textTransparency_1:map(function(v88) --[[ Line: 65 ]]
                    -- upvalues: v87 (copy)
                    if v87 == nil then
                        return 1;
                    else
                        return v87 + v88 * (1 - v87);
                    end;
                end);
            else
                v85 = v34.textTransparency or 0;
            end;
            v84.ImageTransparency = v85;
            v84.LayoutOrder = 2;
            v84.BackgroundTransparency = 1;
            v84[v7.Event.Activated] = function() --[[ Line: 249 ]]
                -- upvalues: v34 (copy)
                v34.onToggle(not v34.message.useTranslation, v34.message.messageId);
            end;
            v82 = v82(v83, v84);
        else
            v82 = nil;
        end;
        v74.TranslationButton = v82;
        v63 = v63(v72, v73, v74);
    else
        v63 = nil;
    end;
    v62.TextMessageButton = v63;
    v58.TextMessage = l_createElement_1(v60, v61, v62);
    return l_createElement_0(v56, v57, v58);
end));