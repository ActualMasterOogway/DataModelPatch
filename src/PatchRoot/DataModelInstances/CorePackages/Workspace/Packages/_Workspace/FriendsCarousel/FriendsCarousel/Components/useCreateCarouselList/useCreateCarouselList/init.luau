local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local l_FIntFriendsCarouselSocialBtnFriendsLimit_0 = require(l_Parent_0.SharedFlags).FIntFriendsCarouselSocialBtnFriendsLimit;
local function _(v6) --[[ Line: 23 ]] --[[ Name: addCustomBtnField ]]
    -- upvalues: v3 (copy)
    return v3.List.map(v6 or {}, function(v7, v8) --[[ Line: 24 ]]
        -- upvalues: v3 (ref)
        return (v3.Dictionary.join({
            isCustomBtn = true, 
            id = v7.id or ("%*%*"):format("CustomBtn", v8)
        }, v7));
    end);
end;
local function v13(v10) --[[ Line: 32 ]] --[[ Name: addIndexField ]]
    -- upvalues: v3 (copy)
    return v3.List.map(v10 or {}, function(v11, v12) --[[ Line: 33 ]]
        -- upvalues: v3 (ref)
        return (v3.Dictionary.join({
            index = v12
        }, v11));
    end);
end;
return function(v14) --[[ Line: 40 ]] --[[ Name: useCreateCarouselList ]]
    -- upvalues: v2 (copy), v3 (copy), l_FIntFriendsCarouselSocialBtnFriendsLimit_0 (copy), v13 (copy)
    return (v2.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v14 (copy), v3 (ref), l_FIntFriendsCarouselSocialBtnFriendsLimit_0 (ref), v13 (ref)
        local v15 = if v14.includeAddFriendsBtn then v3.Dictionary.join({
            isAddButton = true, 
            id = "AddFriendsBtn"
        }, v14.addFriendsBtn or {}) else nil;
        local v16;
        if v14.friendCount and v14.friendCount <= l_FIntFriendsCarouselSocialBtnFriendsLimit_0 then
            local l_socialOnboardingBtns_0 = v14.socialOnboardingBtns;
            v16 = v3.List.map(l_socialOnboardingBtns_0 or {}, function(v18, v19) --[[ Line: 24 ]]
                -- upvalues: v3 (ref)
                return (v3.Dictionary.join({
                    isCustomBtn = true, 
                    id = v18.id or ("%*%*"):format("CustomBtn", v19)
                }, v18));
            end);
        else
            v16 = {};
        end;
        local v20 = v14.friendCount and v14.friendCount == 0 and (not v14.users or #v14.users == 0) and (not v16 or #v16 == 0);
        local v21 = if v14.includeEmptyHint and v20 then {
            isEmptyHint = true, 
            id = "EmptyHintElm"
        } else nil;
        local v22 = v3.List.join({
            v15
        }, {
            v21
        }, v14.users or {}, v16 or {});
        return v13(v22);
    end, {
        v14.includeAddFriendsBtn, 
        v14.friendCount, 
        v14.users, 
        v14.socialOnboardingBtns, 
        v14.addFriendsBtn, 
        v14.includeEmptyHint
    }));
end;