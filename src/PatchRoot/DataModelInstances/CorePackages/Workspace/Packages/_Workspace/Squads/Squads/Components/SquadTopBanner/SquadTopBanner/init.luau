local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Foundation_0 = v1.Foundation;
local l_React_0 = v1.React;
local l_SharedFlags_0 = v1.SharedFlags;
local l_SquadsCore_0 = v1.SquadsCore;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_useCurrentSquadParentChannelId_0 = l_SquadsCore_0.Hooks.useCurrentSquadParentChannelId;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_FFlagMoveSquadTitleFetchIntoTopBanner_0 = l_SharedFlags_0.FFlagMoveSquadTitleFetchIntoTopBanner;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local _ = nil;
local v13 = nil;
if l_GetFFlagEnableCrossExpVoice_0() then
    v13 = v1.CrossExperienceVoice.Hooks.useLastActiveParticipant;
end;
SquadTopBanner = function(v14) --[[ Line: 32 ]] --[[ Name: SquadTopBanner ]]
    -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (copy), v13 (ref), l_useTokens_0 (copy), l_FFlagMoveSquadTitleFetchIntoTopBanner_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_Foundation_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy)
    local v15 = if l_GetFFlagEnableCrossExpVoice_0() then v13() else nil;
    local v16 = v15 and v15.userId or nil;
    local v17 = l_useTokens_0();
    local v18 = "";
    if l_FFlagMoveSquadTitleFetchIntoTopBanner_0 then
        local v19 = l_useCurrentSquadParentChannelId_0();
        v18 = l_React_0.useContext(l_SquadExternalContractContext_0).useParentChannelTitleSelector(v19 or "") or "";
    end;
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 1, 0), 
        backgroundStyle = v17.Color.None, 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v17.Gap.Small), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }
    }, {
        Icon = l_React_0.createElement("Frame", {
            Size = UDim2.fromOffset(20, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            l_React_0.createElement(l_Foundation_0.Image, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(28, 28), 
                Image = "icons/menu/groups", 
                imageStyle = v17.Color.Extended.Gray.Gray_100
            })
        }), 
        Title = l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            textStyle = v17.Color.Extended.Gray.Gray_100, 
            fontStyle = v17.Typography.TitleMedium, 
            backgroundStyle = v17.Color.None, 
            LayoutOrder = 2, 
            Text = if l_FFlagMoveSquadTitleFetchIntoTopBanner_0 then v18 else v14.title, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            UIFlexItem = l_React_0.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        Avatar = if v16 then l_React_0.createElement(l_Foundation_0.Image, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(24, 24), 
            backgroundStyle = v17.Color.Extended.Gray.Gray_700, 
            cornerRadius = UDim.new(0, v17.Radius.Circle), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v16)))
        }) else nil
    });
end;
return SquadTopBanner;