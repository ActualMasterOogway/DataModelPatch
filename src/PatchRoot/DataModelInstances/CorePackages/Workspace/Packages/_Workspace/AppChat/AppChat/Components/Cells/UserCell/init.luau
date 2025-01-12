local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatUsePaginatedFriends);
local v6 = require(script.Parent.PresenceBubbleCellStyled);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v8 = require(l_Parent_0.UIBlox).App.ImageSet.Images["component_assets/circle_25"];
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local v10 = {
    subTitleText = "subTitleText", 
    user = {}, 
    childWidth = 0, 
    style = v4.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    }), 
    showDivider = true, 
    boldTitle = true
};
return v2.memo(function(v11) --[[ Line: 49 ]] --[[ Name: UserCell ]]
    -- upvalues: v4 (copy), v10 (copy), v2 (copy), v6 (copy), v5 (copy), l_UserModel_0 (copy), v8 (copy)
    local v12 = v4.Dictionary.join(v10, v11);
    local v13 = v2.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v12 (copy)
        if v12.onActivated then
            v12.onActivated(v12.user);
        end;
    end);
    local l_user_0 = v12.user;
    local v15 = l_user_0.metadata and l_user_0.metadata.isPending;
    return v2.createElement(v6, {
        style = v12.style, 
        childWidth = v12.childWidth, 
        onActivated = v13, 
        onCircleActivated = v12.onCircleActivated, 
        subTitleText = v12.subTitleText, 
        showDivider = v12.showDivider, 
        boldTitle = not v15 and v12.boldTitle, 
        avatarCirclePresenceImage = if v5() then if l_user_0.presence ~= l_UserModel_0.PresenceType.OFFLINE then v8 else nil else l_user_0.presenceImage, 
        titleText = l_user_0.displayName, 
        secondaryTitleText = l_user_0.alias, 
        thumbnails = {
            l_user_0.thumbnail
        }
    }, v12.children or {});
end);