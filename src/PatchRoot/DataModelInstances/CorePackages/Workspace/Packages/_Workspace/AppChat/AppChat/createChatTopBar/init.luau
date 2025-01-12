local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v4 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatReplaceWithCloseButton);
local v5 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v7 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.HeaderBarTitleLeftAligned);
local l_getEnableCommunicationsContactConsent_0 = require(l_Parent_0.CommunicationsContactConsent).getEnableCommunicationsContactConsent;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableConversationTitleWithFacePile);
local l_HeaderBar_0 = v7.App.Bar.HeaderBar;
local v15 = require(l_Parent_0.AppHeaderBar);
local v16 = require(l_script_FirstAncestor_0.Constants);
local function v17() --[[ Line: 26 ]] --[[ Name: noOpt ]]
    return nil;
end;
local v18 = if v13() then v16.NAV_BAR_WITH_FACEPILE_SIZE else v16.NEW_NAV_BAR_SIZE;
return function(v19) --[[ Line: 34 ]]
    -- upvalues: v18 (copy), l_GetFFlagUIBloxUseNewHeaderBar_0 (copy), v15 (copy), l_HeaderBar_0 (copy), l_withLocalization_0 (copy), l_getEnableCommunicationsContactConsent_0 (copy), v2 (copy), v5 (copy), v4 (copy), l_withStyle_0 (copy), l_ImageSetLabel_0 (copy), v7 (copy), v17 (copy), v13 (copy), v10 (copy), v3 (copy)
    local l_v18_0 = v18;
    local v21 = v19.navigation.getScreenProps("navigateToRootStack", nil);
    local v22 = v19.shouldRenderCenter and v19.renderCenter ~= nil;
    local v23 = v19.headerText or {};
    local v24 = if l_GetFFlagUIBloxUseNewHeaderBar_0() then v15.makeBackButton else l_HeaderBar_0.renderLeft.backButton;
    local l_makeCloseButton_0 = v15.makeCloseButton;
    return l_withLocalization_0({
        headerText = v23.shouldLocalize and v23.raw or nil
    })(function(v26) --[[ Line: 48 ]]
        -- upvalues: v23 (copy), v22 (copy), v19 (copy), l_getEnableCommunicationsContactConsent_0 (ref), v21 (copy), v2 (ref), v5 (ref), v24 (copy), v4 (ref), l_makeCloseButton_0 (copy), l_withStyle_0 (ref), l_ImageSetLabel_0 (ref), v7 (ref), v17 (ref), l_GetFFlagUIBloxUseNewHeaderBar_0 (ref), v13 (ref), v10 (ref), l_v18_0 (copy), l_HeaderBar_0 (ref), v3 (ref)
        local v27 = v23.shouldLocalize and v26.headerText or v23.raw;
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        if v22 then
            v27 = "";
            v28 = nil;
            v30 = nil;
            v29 = v19.renderCenter;
        else
            v28 = function() --[[ Line: 59 ]]
                -- upvalues: v19 (ref)
                return not (not v19.renderRight or v19.rightHidden) and v19.renderRight() or nil;
            end;
            v29 = nil;
            if l_getEnableCommunicationsContactConsent_0() then
                local v31 = v21 and function() --[[ Line: 67 ]]
                    -- upvalues: v19 (ref), v2 (ref), v21 (ref)
                    if v19.closeInputBar then
                        v19.closeInputBar();
                    end;
                    if v19.isRoot then
                        v19.navigation.navigate(v2.EmptyConversation);
                        v21();
                        return;
                    else
                        v19.navigation.pop();
                        return;
                    end;
                end or function() --[[ Line: 79 ]]
                    -- upvalues: v19 (ref)
                    v19.navigation.pop();
                end;
                local v32 = if v19.backButtonEnabled then v5.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    BackButton = v5.createElement(v24(v31))
                }) else nil;
                local v33 = if v4() and v19.closeButtonEnabled then v5.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    CloseButton = v5.createElement(l_makeCloseButton_0(v31))
                }) else nil;
                local v35 = if v19.lockIconEnabled and v19.isPrivateConversation then l_withStyle_0(function(v34) --[[ Line: 101 ]]
                    -- upvalues: v5 (ref), l_ImageSetLabel_0 (ref), v7 (ref)
                    return v5.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromOffset(v34.Tokens.Semantic.Icon.Size.Medium, v34.Tokens.Semantic.Icon.Size.Medium), 
                        BackgroundTransparency = 1, 
                        Image = v7.App.ImageSet.Images["icons/graphic/lock_xxlarge"], 
                        ImageColor3 = v34.Theme.SystemPrimaryDefault.Color, 
                        ImageTransparency = v34.Theme.SystemPrimaryDefault.Transparency, 
                        LayoutOrder = 2
                    });
                end) else nil;
                local l_v32_0 = v32 --[[ copy: 6 -> 9 ]];
                local l_v33_0 = v33 --[[ copy: 7 -> 10 ]];
                local l_v35_0 = v35 --[[ copy: 8 -> 11 ]];
                v30 = (not not v32 or v35) and function(_) --[[ Line: 119 ]]
                    -- upvalues: v5 (ref), l_v32_0 (copy), l_v33_0 (copy), l_v35_0 (copy)
                    return v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 72, 1, 0)
                    }, {
                        UIListLayout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        BackButton = l_v32_0, 
                        CloseButton = l_v33_0, 
                        LockIcon = l_v35_0
                    });
                end or v17;
            else
                local v40 = v21 and function() --[[ Line: 139 ]]
                    -- upvalues: v19 (ref), v2 (ref), v21 (ref)
                    if v19.closeInputBar then
                        v19.closeInputBar();
                    end;
                    if v19.isRoot then
                        v19.navigation.navigate(v2.EmptyConversation);
                        v21();
                        return;
                    else
                        v19.navigation.pop();
                        return;
                    end;
                end or function() --[[ Line: 151 ]]
                    -- upvalues: v19 (ref)
                    v19.navigation.pop();
                end;
                v30 = if v19.backButtonEnabled then v24(v40) else if v4() and v19.closeButtonEnabled then l_makeCloseButton_0(v40) else v17;
            end;
        end;
        local v41 = not v19.backButtonEnabled and not v22;
        if v19.shouldBoldHeader and v30 == v17 then
            v30 = nil;
        end;
        local v42 = l_GetFFlagUIBloxUseNewHeaderBar_0();
        local v43 = v13() and v19.conversationId;
        local function v44() --[[ Line: 176 ]]
            -- upvalues: v5 (ref), v10 (ref), v30 (ref), v17 (ref), v28 (ref), v27 (ref), v19 (ref)
            return v5.createElement(v10, {
                renderLeft = if v30 == v17 then nil else v30, 
                renderRight = v28, 
                titleText = v27, 
                conversationId = v19.conversationId, 
                navigateToChatDetails = v19.navigateToChatDetails
            });
        end;
        if v21 then
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, l_v18_0), 
                LayoutOrder = -1
            }, {
                headerBar = l_withStyle_0(function(v45) --[[ Line: 192 ]]
                    -- upvalues: v5 (ref), l_HeaderBar_0 (ref), v43 (copy), v27 (ref), l_v18_0 (ref), v30 (ref), v44 (copy), v29 (ref), v28 (ref), v42 (copy), v19 (ref), v3 (ref)
                    return v5.createElement(l_HeaderBar_0, {
                        title = if v43 then nil else v27, 
                        barHeight = l_v18_0, 
                        renderLeft = if v43 then nil else v30, 
                        renderCenter = if v43 then v44 else v29, 
                        renderRight = if v43 then nil else v28, 
                        paddingLeft = if v42 then UDim.new(0, 12) else nil, 
                        paddingRight = if v42 then UDim.new(0, 12) else nil, 
                        isTitleCentered = if v42 then not v19.isTitleLeftAligned else nil, 
                        contentPaddingRight = if v42 then UDim.new(0, 0) else nil, 
                        backgroundTransparency = if v3() then v45.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        else
            return v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, l_v18_0), 
                LayoutOrder = -1
            }, {
                headerBar = l_withStyle_0(function(v46) --[[ Line: 217 ]]
                    -- upvalues: v5 (ref), l_HeaderBar_0 (ref), v43 (copy), v27 (ref), l_v18_0 (ref), v41 (copy), v30 (ref), v44 (copy), v29 (ref), v28 (ref), v42 (copy), v19 (ref), v3 (ref)
                    return v5.createElement(l_HeaderBar_0, {
                        title = if v43 then nil else v27, 
                        barHeight = l_v18_0, 
                        renderLeft = if v43 then nil else not v41 and v30 or nil, 
                        renderCenter = if v43 then v44 else v29, 
                        renderRight = if v43 then nil else v28, 
                        paddingLeft = if v42 then UDim.new(0, 12) else nil, 
                        paddingRight = if v42 then UDim.new(0, 12) else nil, 
                        isTitleCentered = if v42 then not v19.isTitleLeftAligned else nil, 
                        contentPaddingRight = if v42 then UDim.new(0, 0) else nil, 
                        backgroundTransparency = if v3() then v46.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        end;
    end);
end;