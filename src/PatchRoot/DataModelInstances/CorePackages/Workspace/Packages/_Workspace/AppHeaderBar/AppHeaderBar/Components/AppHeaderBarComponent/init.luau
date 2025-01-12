local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local v4 = require(l_Parent_1.Cryo);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_UtilityActionIcon_0 = v3.App.Button.UtilityActionIcon;
local l_GetFFlagLuaAppFixAppNavSearchBarSize_0 = require(l_Parent_1.SharedFlags).GetFFlagLuaAppFixAppNavSearchBarSize;
local _ = require(l_Parent_0.Types);
local v10 = {
    automaticHeight = false, 
    hasDivider = false, 
    onMedia = false, 
    isTitleCentered = false, 
    utilitiesGap = UDim.new(0, 0)
};
local function v17(v11) --[[ Line: 32 ]] --[[ Name: BarTitle ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy)
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local l_layoutOrder_0 = v11.layoutOrder;
    local l_title_0 = v11.title;
    local v15 = v11.titleFont or l_Tokens_0.Semantic.Typography.Title;
    local v16 = if v11.onMedia then l_Tokens_0.Global.Color.White else l_Tokens_0.Semantic.Color.Text.Emphasis;
    return v2.createElement("TextLabel", {
        LayoutOrder = l_layoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Text = l_title_0, 
        Font = v15.Font, 
        TextSize = v15.FontSize, 
        LineHeight = v15.LineHeight, 
        TextColor3 = v16.Color3, 
        TextTransparency = v16.Transparency
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_25), 
            PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_25)
        })
    });
end;
local function v25(v18) --[[ Line: 60 ]] --[[ Name: useRenderLeft ]]
    -- upvalues: v2 (copy), v17 (copy)
    local l_renderNavigation_0 = v18.renderNavigation;
    local l_title_1 = v18.title;
    local l_onMedia_0 = v18.onMedia;
    local l_titleFontStyle_0 = v18.titleFontStyle;
    local l_isTitleCentered_0 = v18.isTitleCentered;
    local l_groupTransparencyLeft_0 = v18.groupTransparencyLeft;
    return v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v2 (ref), l_groupTransparencyLeft_0 (copy), l_renderNavigation_0 (copy), l_title_1 (copy), l_isTitleCentered_0 (copy), v17 (ref), l_titleFontStyle_0 (copy), l_onMedia_0 (copy)
        return v2.createElement(l_groupTransparencyLeft_0 and "CanvasGroup" or "Frame", {
            BackgroundTransparency = 1, 
            GroupTransparency = if l_groupTransparencyLeft_0 then l_groupTransparencyLeft_0.transparency else nil, 
            ref = if l_groupTransparencyLeft_0 then l_groupTransparencyLeft_0.guiObjectRef else nil, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Navigation = if l_renderNavigation_0 then l_renderNavigation_0({
                layoutOrder = 1
            }) else nil, 
            Title = if not l_title_1 or l_isTitleCentered_0 then nil else v2.createElement(v17, {
                layoutOrder = 2, 
                title = l_title_1, 
                titleFont = l_titleFontStyle_0, 
                onMedia = l_onMedia_0
            })
        });
    end, {
        l_renderNavigation_0, 
        l_title_1, 
        l_titleFontStyle_0, 
        l_groupTransparencyLeft_0, 
        l_onMedia_0, 
        l_isTitleCentered_0
    });
end;
local function v32(v26) --[[ Line: 99 ]] --[[ Name: useRenderCenter ]]
    -- upvalues: v2 (copy), v17 (copy)
    local l_renderCenter_0 = v26.renderCenter;
    local l_title_2 = v26.title;
    local l_onMedia_1 = v26.onMedia;
    local l_titleFontStyle_1 = v26.titleFontStyle;
    local l_isTitleCentered_1 = v26.isTitleCentered;
    return v2.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: l_renderCenter_0 (copy), l_title_2 (copy), l_isTitleCentered_1 (copy), v2 (ref), v17 (ref), l_titleFontStyle_1 (copy), l_onMedia_1 (copy)
        if l_renderCenter_0 then
            return l_renderCenter_0();
        elseif l_title_2 and l_isTitleCentered_1 then
            return v2.createElement(v17, {
                title = l_title_2, 
                titleFont = l_titleFontStyle_1, 
                onMedia = l_onMedia_1
            });
        else
            return nil;
        end;
    end, {
        l_renderCenter_0, 
        l_title_2, 
        l_titleFontStyle_1, 
        l_isTitleCentered_1, 
        l_onMedia_1
    });
end;
local function v40(v33) --[[ Line: 121 ]] --[[ Name: useRenderRight ]]
    -- upvalues: v2 (copy), l_UtilityActionIcon_0 (copy)
    local l_renderUserInfo_0 = v33.renderUserInfo;
    local l_avatarActionIcon_0 = v33.avatarActionIcon;
    local l_searchActionIcon_0 = v33.searchActionIcon;
    local l_renderUtilities_0 = v33.renderUtilities;
    local l_utilitiesGap_0 = v33.utilitiesGap;
    local l_groupTransparencyRight_0 = v33.groupTransparencyRight;
    return v2.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v2 (ref), l_groupTransparencyRight_0 (copy), l_utilitiesGap_0 (copy), l_renderUserInfo_0 (copy), l_avatarActionIcon_0 (copy), l_UtilityActionIcon_0 (ref), l_searchActionIcon_0 (copy), l_renderUtilities_0 (copy)
        return v2.createElement(l_groupTransparencyRight_0 and "CanvasGroup" or "Frame", {
            Size = UDim2.fromScale(0, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = if l_groupTransparencyRight_0 then l_groupTransparencyRight_0.transparency else nil, 
            ref = if l_groupTransparencyRight_0 then l_groupTransparencyRight_0.guiObjectRef else nil, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = l_utilitiesGap_0
            }), 
            UserInfo = if l_renderUserInfo_0 then l_renderUserInfo_0({
                layoutOrder = 1, 
                itemsGap = l_utilitiesGap_0
            }) else nil, 
            Avatar = if l_avatarActionIcon_0 then v2.createElement(l_UtilityActionIcon_0, {
                layoutOrder = 2, 
                icon = l_avatarActionIcon_0.icon, 
                iconColor = {}, 
                onActivated = l_avatarActionIcon_0.onActivated
            }) else nil, 
            SearchIcon = if l_searchActionIcon_0 then v2.createElement(l_UtilityActionIcon_0, {
                layoutOrder = 3, 
                icon = l_searchActionIcon_0.icon, 
                onActivated = l_searchActionIcon_0.onActivated
            }) else nil, 
            Utilities = if l_renderUtilities_0 then l_renderUtilities_0({
                layoutOrder = 4, 
                itemsGap = l_utilitiesGap_0
            }) else nil
        });
    end, {
        l_renderUserInfo_0, 
        l_avatarActionIcon_0, 
        l_searchActionIcon_0, 
        l_renderUtilities_0, 
        l_utilitiesGap_0, 
        l_groupTransparencyRight_0
    });
end;
local function _(v41) --[[ Line: 178 ]] --[[ Name: shouldRenderRight ]]
    local l_renderUserInfo_1 = v41.renderUserInfo;
    local l_avatarActionIcon_1 = v41.avatarActionIcon;
    local l_searchActionIcon_1 = v41.searchActionIcon;
    local l_renderUtilities_1 = v41.renderUtilities;
    if l_renderUserInfo_1 or l_avatarActionIcon_1 or l_searchActionIcon_1 or l_renderUtilities_1 then
        return true;
    else
        return false;
    end;
end;
return function(v47) --[[ Line: 190 ]] --[[ Name: AppHeaderBarComponent ]]
    -- upvalues: v4 (copy), v10 (copy), v25 (copy), v32 (copy), v40 (copy), v2 (copy), l_HeaderBar_0 (copy), l_GetFFlagLuaAppFixAppNavSearchBarSize_0 (copy)
    local v48 = v4.Dictionary.join(v10, v47);
    local l_barHeight_0 = v48.barHeight;
    local l_zIndex_0 = v48.zIndex;
    local l_automaticHeight_0 = v48.automaticHeight;
    local l_groupTransparency_0 = v48.groupTransparency;
    local l_backgroundStyle_0 = v48.backgroundStyle;
    local l_hasDivider_0 = v48.hasDivider;
    local l_onMedia_2 = v48.onMedia;
    local l_onHeaderActivated_0 = v48.onHeaderActivated;
    local l_paddingLeft_0 = v48.paddingLeft;
    local l_paddingTop_0 = v48.paddingTop;
    local l_paddingRight_0 = v48.paddingRight;
    local l_paddingBottom_0 = v48.paddingBottom;
    local v61 = v25(v48);
    local v62 = v32(v48);
    local v63 = v40(v48);
    local l_renderUserInfo_2 = v48.renderUserInfo;
    local l_avatarActionIcon_2 = v48.avatarActionIcon;
    local l_searchActionIcon_2 = v48.searchActionIcon;
    local l_renderUtilities_2 = v48.renderUtilities;
    local v68 = not not l_renderUserInfo_2 or (l_avatarActionIcon_2 or l_searchActionIcon_2 or l_renderUtilities_2) and true or false;
    return v2.createElement(l_groupTransparency_0 and "CanvasGroup" or "Frame", {
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        GroupTransparency = if l_groupTransparency_0 then l_groupTransparency_0.transparency else nil, 
        ref = if l_groupTransparency_0 then l_groupTransparency_0.guiObjectRef else nil, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Bar = v2.createElement(l_HeaderBar_0, {
            barHeight = l_barHeight_0, 
            renderLeft = v61, 
            renderCenter = v62, 
            renderRight = if l_GetFFlagLuaAppFixAppNavSearchBarSize_0() then if v68 then v63 else nil else v63, 
            onHeaderActivated = l_onHeaderActivated_0, 
            backgroundStyle = l_backgroundStyle_0, 
            isOnMedia = l_onMedia_2, 
            automaticHeight = l_automaticHeight_0, 
            paddingLeft = l_paddingLeft_0, 
            paddingTop = l_paddingTop_0, 
            paddingRight = l_paddingRight_0, 
            paddingBottom = l_paddingBottom_0, 
            zIndex = l_zIndex_0, 
            hasDivider = l_hasDivider_0
        })
    });
end;