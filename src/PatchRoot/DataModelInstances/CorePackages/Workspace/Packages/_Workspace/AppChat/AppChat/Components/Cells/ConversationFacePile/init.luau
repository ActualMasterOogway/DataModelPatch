local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_ImagePile_0 = require(l_Parent_0.AppBlox).ImagePile;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = l_Logger_0:new(script.Name);
local l_useStyle_0 = v5.Core.Style.useStyle;
return function(v10) --[[ Line: 20 ]] --[[ Name: ConversationFacePile ]]
    -- upvalues: v8 (copy), l_useLocalUserId_0 (copy), l_useStyle_0 (copy), v4 (copy), l_useSelector_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_ImagePile_0 (copy)
    if not v10.conversationId or v10.conversationId == "" then
        v8:warning("conversationId cannot be nil nor an empty string");
        return nil;
    else
        local v11 = l_useLocalUserId_0();
        local l_Theme_0 = l_useStyle_0().Theme;
        local v14 = v4.useCallback(function(v13) --[[ Line: 30 ]]
            -- upvalues: v10 (copy)
            if v13 and v13.ChatAppReducer and v13.ChatAppReducer.Conversations then
                return v13.ChatAppReducer.Conversations[v10.conversationId];
            else
                return nil;
            end;
        end, {
            v10.conversationId
        });
        local v15 = l_useSelector_0(v14);
        local v16 = if v15 and v15.participants then v15.participants else {};
        local v17 = {};
        if #v16 == 1 then
            table.insert(v17, {
                Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v11)
            });
        else
            local v18 = 1;
            while #v17 < 2 and v18 <= #v16 do
                local v19 = v16[v18];
                if v19 ~= v11 then
                    table.insert(v17, {
                        Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v19)
                    });
                end;
                v18 = v18 + 1;
            end;
        end;
        return v4.createElement(l_ImagePile_0, {
            images = v17, 
            imageBorderColor = l_Theme_0.BackgroundDefault.Color
        });
    end;
end;