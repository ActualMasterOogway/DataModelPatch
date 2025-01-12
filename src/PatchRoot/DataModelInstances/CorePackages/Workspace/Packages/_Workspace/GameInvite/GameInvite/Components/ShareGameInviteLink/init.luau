local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local l_Throttle_0 = require(l_Parent_0.NotificationsCommon).Throttle;
local l_ReducerDependencies_0 = require(l_Parent_0.NotificationsCommon).ReducerDependencies;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v9 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_NetworkingShareLinks_0 = l_ReducerDependencies_0.NetworkingShareLinks;
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
local l_NetworkStatus_0 = l_ReducerDependencies_0.RoduxNetworking.Enum.NetworkStatus;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
game:DefineFastFlag("generateGameInviteShareLinkOnClick", false);
local v20 = l_Images_0["icons/actions/share"];
local v21 = l_Images_0["icons/menu/link"];
local v22 = {
    copied = "Feature.SocialShare.Label.Copied", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
return function(v23) --[[ Line: 46 ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_getLocalizedStrings_0 (copy), v22 (copy), l_NetworkingShareLinks_0 (copy), l_RoduxShareLinks_0 (copy), v9 (copy), l_default_0 (copy), l_Throttle_0 (copy), l_LinkButton_0 (copy), l_NetworkStatus_0 (copy), l_ImageSetButton_0 (copy), v21 (copy), v20 (copy)
    local v24, v25 = v2.useState(false);
    local v27 = l_useSelector_0(function(v26) --[[ Line: 49 ]]
        return v26;
    end);
    local v28 = l_useStyle_0();
    local v29 = l_useDispatch_0();
    local v30 = l_getLocalizedStrings_0(v22);
    local l_ShareInviteLink_0 = v27.ShareLinks.Invites.ShareInviteLink;
    local function v34() --[[ Line: 61 ]]
        -- upvalues: v29 (copy), l_NetworkingShareLinks_0 (ref), l_RoduxShareLinks_0 (ref), v9 (ref), l_default_0 (ref)
        v29(l_NetworkingShareLinks_0.GenerateLink.API({
            linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue()
        })):andThen(function(v32) --[[ Line: 64 ]]
            -- upvalues: v9 (ref), l_RoduxShareLinks_0 (ref), l_default_0 (ref)
            local l_linkId_0 = v32.responseBody.linkId;
            v9:linkGenerated({
                linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue(), 
                linkId = l_linkId_0
            });
            if game:GetFastFlag("generateGameInviteShareLinkOnClick") and v32 and v32.responseBody and v32.responseBody.shortUrl and l_default_0 then
                l_default_0:shareUrl({
                    url = v32.responseBody.shortUrl, 
                    context = "V1Menu"
                });
            end;
        end);
    end;
    v2.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: l_ShareInviteLink_0 (copy), v34 (copy)
        if not game:GetFastFlag("generateGameInviteShareLinkOnClick") and not l_ShareInviteLink_0 then
            v34();
        end;
    end, {});
    local v35 = l_NetworkingShareLinks_0.GenerateLink.getStatus(v27, {
        linkType = l_RoduxShareLinks_0.Enums.LinkType.ExperienceInvite.rawValue()
    });
    local v37 = l_Throttle_0(function() --[[ Line: 101 ]]
        -- upvalues: l_ShareInviteLink_0 (copy), v9 (ref), l_default_0 (ref), v34 (copy), v23 (copy), v25 (copy)
        local v36 = if l_ShareInviteLink_0 then l_ShareInviteLink_0.linkId else nil;
        v9:onShareButtonClick(v36);
        if l_ShareInviteLink_0 then
            if l_default_0 then
                l_default_0:shareUrl({
                    url = l_ShareInviteLink_0.shortUrl, 
                    context = "V1Menu"
                });
            end;
        else
            v34();
        end;
        if v23.isDesktop then
            v25(true);
            task.delay(1, function() --[[ Line: 117 ]]
                -- upvalues: v25 (ref)
                v25(false);
            end);
        end;
    end);
    if v23.isDesktop then
        if v23.isFullSize then
            local l_createElement_0 = v2.createElement;
            local v39 = "Frame";
            local v40 = {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = v23.size, 
                LayoutOrder = v23.layoutOrder
            };
            local v41 = {};
            local l_createElement_1 = v2.createElement;
            local l_l_LinkButton_0_0 = l_LinkButton_0;
            local v44 = {};
            local v45 = true;
            if v35 ~= l_NetworkStatus_0.Fetching then
                v45 = v24;
            end;
            v44.isDisabled = v45;
            v44.isLoading = false;
            v44.onActivated = v37;
            v44.size = v23.size;
            v44.text = v24 and v30.copied or v30.copyLink;
            v41.LinkButton = l_createElement_1(l_l_LinkButton_0_0, v44);
            return l_createElement_0(v39, v40, v41);
        else
            return v2.createElement(l_ImageSetButton_0, {
                LayoutOrder = v23.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = v23.size, 
                [v2.Event.Activated] = v37, 
                Image = v21, 
                ImageColor3 = v28.Theme.IconEmphasis.Color, 
                ImageTransparency = v28.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0
            });
        end;
    else
        return v2.createElement(l_ImageSetButton_0, {
            LayoutOrder = v23.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = v23.size, 
            [v2.Event.Activated] = v37, 
            Image = v20, 
            ImageColor3 = v28.Theme.IconEmphasis.Color, 
            ImageTransparency = v28.Theme.IconEmphasis.Transparency, 
            BorderSizePixel = 0
        });
    end;
end;