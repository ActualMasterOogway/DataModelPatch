local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.UserProfileHeader);
local v4 = require(l_script_FirstAncestor_0.Components.About);
local v5 = require(l_script_FirstAncestor_0.Components.ProfileActionBar);
local v6 = require(l_script_FirstAncestor_0.Components.ContentPosts);
local v7 = require(l_script_FirstAncestor_0.Components.CurrentlyWearing);
local v8 = require(l_script_FirstAncestor_0.Components.ViewFullProfile);
local v9 = require(l_script_FirstAncestor_0.Components.QuickLinks);
local v10 = require(l_Parent_0.ProfilePlatform.Common.Enums);
local v11 = require(l_Parent_0.Cryo);
local v12 = require(l_Parent_0.ProfilePlatform.Common.Constants);
local l_FFlagCapturesPostEnabledForAll_0 = require(l_Parent_0.SharedFlags).FFlagCapturesPostEnabledForAll;
local l_FFlagEnableOnPlatformSharingExperiment_0 = require(l_Parent_0.SharedFlags).FFlagEnableOnPlatformSharingExperiment;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableQuickLinks);
return function(v16, v17) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), v11 (copy), v12 (copy), v10 (copy), v3 (copy), l_FFlagCapturesPostEnabledForAll_0 (copy), l_FFlagEnableOnPlatformSharingExperiment_0 (copy), v6 (copy), v7 (copy), v5 (copy), v8 (copy), v4 (copy), v15 (copy), v9 (copy)
    local v18 = v17 or {};
    local v19 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 24)
        })
    };
    if v11.isEmpty(v18) then
        v19.loadingView = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v12.PEEK_VIEW_OPEN_HEIGHT), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        });
        return v19;
    else
        for v20, v21 in ipairs(v18) do
            if v21 == v10.Components.UserProfileHeader then
                v19[v21] = v2.createElement(v3, {
                    layoutOrder = v20
                });
            elseif (l_FFlagCapturesPostEnabledForAll_0 or l_FFlagEnableOnPlatformSharingExperiment_0) and v21 == v10.Components.ContentPosts then
                v19[v21] = v2.createElement(v6, {
                    layoutOrder = v20
                });
            elseif v21 == v10.Components.CurrentlyWearing then
                v19[v21] = v2.createElement(v7, {
                    layoutOrder = v20
                });
            elseif v21 == v10.Components.Actions then
                v19[v21] = v2.createElement(v5, {
                    layoutOrder = v20
                });
            elseif v21 == v10.Components.ViewFullProfile then
                v19[v21] = v2.createElement(v8, {
                    layoutOrder = v20
                });
            elseif v21 == v10.Components.About then
                local v22 = v16[v21];
                v19[v21] = v2.createElement(v4, {
                    description = v22.description, 
                    layoutOrder = v20
                });
            elseif v15 and v21 == v10.Components.QuickLinks then
                v19[v21] = v2.createElement(v9, {
                    layoutOrder = v20
                });
            elseif v21 ~= v10.Components.SocialLinks then

            end;
        end;
        return v19;
    end;
end;