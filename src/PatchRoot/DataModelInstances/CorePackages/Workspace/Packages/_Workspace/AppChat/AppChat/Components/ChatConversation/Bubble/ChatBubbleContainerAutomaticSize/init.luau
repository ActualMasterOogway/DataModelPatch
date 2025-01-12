local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ColorSystem_0 = v3.Common.Style.ColorSystem;
local v5 = require(l_Parent_0.Cryo);
local l_Constants_0 = v3.App.Style.Constants;
local v7 = require(script.Parent.ChatBubbleEnum);
local v8 = require(script.Parent.ChatBubbleTail);
local v9 = require(script.Parent.ChatBubble);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v12 = require(script.Parent.RepliedToMarker);
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v14 = require(l_script_FirstAncestor_0.Flags.unfilteredMessageColorConfig);
local v16 = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    isUnfiltered = false, 
    isAssetCard = false, 
    isRepliedTo = false, 
    isPressed = false, 
    [v2.Change.AbsoluteSize] = function(_) --[[ Line: 42 ]]

    end
};
return v2.memo(function(v17) --[[ Line: 45 ]] --[[ Name: ChatBubbleContainer ]]
    -- upvalues: v5 (copy), v16 (copy), v2 (copy), l_useStyle_0 (copy), l_useSelectedTheme_0 (copy), v13 (copy), l_Constants_0 (copy), l_ColorSystem_0 (copy), v14 (copy), v7 (copy), v9 (copy), v8 (copy), v12 (copy)
    local v18 = v5.Dictionary.join(v16, v17);
    local v19, v20 = v2.useState(0);
    local v21 = v18[v2.Change.AbsoluteSize];
    local v22 = l_useStyle_0();
    local v23 = v18.children or {};
    local l_hasTail_0 = v18.hasTail;
    local l_isIncoming_0 = v18.isIncoming;
    local l_isPending_0 = v18.isPending;
    local l_isUnfiltered_0 = v18.isUnfiltered;
    local v28 = nil;
    local v29 = nil;
    local v30 = l_useSelectedTheme_0();
    local v31 = nil;
    local v32 = nil;
    if v13() then
        local v33, v34 = v2.useState(v22.Theme.UIDefault);
        v31 = v33;
        v32 = v34;
    end;
    local function v36() --[[ Line: 67 ]] --[[ Name: setBubbleStyle ]]
        -- upvalues: v13 (ref), v18 (copy), v30 (copy), l_Constants_0 (ref), l_ColorSystem_0 (ref), l_isIncoming_0 (copy), v22 (copy), l_isPending_0 (copy), l_isUnfiltered_0 (copy), v14 (ref), v28 (ref), v29 (ref), v32 (ref)
        local v35 = nil;
        v35 = if v13() and v18.isRepliedTo then {
            Color = if v30 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[30] else l_ColorSystem_0.Gray[90], 
            Transparency = 0
        } else if l_isIncoming_0 then v22.Theme.UIDefault else if l_isPending_0 then v22.Theme.UIMuted else if not l_isUnfiltered_0 or v18.isAssetCard then v22.Theme.UIEmphasis else {
            Color = if v30 == string.lower(l_Constants_0.ThemeName.Light) then v14.UnfilteredMessageLightColor3 else v14.UnfilteredMessageDarkColor3, 
            Transparency = v14.UnfilteredMessageTransparency
        };
        v28 = v35.Color;
        v29 = v35.Transparency;
        if v13() then
            v32(v35);
        end;
    end;
    local function v38() --[[ Line: 100 ]] --[[ Name: setPressedBubbleStyle ]]
        -- upvalues: v13 (ref), v18 (copy), l_isIncoming_0 (copy), v30 (copy), l_Constants_0 (ref), l_ColorSystem_0 (ref), l_isUnfiltered_0 (copy), v14 (ref), v32 (ref)
        if not v13() or v18.isRepliedTo or v18.isPending then
            return;
        else
            local v37 = nil;
            v37 = if l_isIncoming_0 then {
                Color = if v30 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[50] else l_ColorSystem_0.Gray[70], 
                Transparency = 0.35
            } else if not l_isUnfiltered_0 or v18.isAssetCard then {
                Color = if v30 == string.lower(l_Constants_0.ThemeName.Light) then l_ColorSystem_0.Gray[50] else l_ColorSystem_0.Gray[70], 
                Transparency = 0.4
            } else {
                Color = if v30 == l_Constants_0.ThemeName.Light then v14.UnfilteredMessagePressedLightColor3 else v14.UnfilteredMessagePressedDarkColor3, 
                Transparency = v14.UnfilteredMessageTransparency
            };
            v32(v37);
            return;
        end;
    end;
    if v13() then
        v2.useLayoutEffect(function() --[[ Line: 136 ]]
            -- upvalues: v18 (copy), v38 (copy), v36 (copy)
            if v18.isPressed then
                v38();
                return;
            else
                v36();
                return;
            end;
        end, {
            v18.isPressed, 
            v18.isRepliedTo, 
            v30, 
            l_isIncoming_0, 
            l_isPending_0, 
            l_isUnfiltered_0, 
            v18.isAssetCard
        });
    else
        v36();
    end;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v19 + v7.TAIL_WIDTH + if v13() and v18.isRepliedTo then v7.REPLIED_TO_MARKER_GAP + v7.REPLIED_TO_MARKER_WIDTH else 0, 0, 0), 
        LayoutOrder = v18.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        bubble = v2.createElement(v9, {
            contentWidth = v19, 
            isIncoming = l_isIncoming_0, 
            isRepliedTo = if v13() then v18.isRepliedTo else nil, 
            imageColor = if v13() then v31.Color else v28, 
            imageTransparency = if v13() then v31.Transparency else v29, 
            padding = v18.padding, 
            hasTail = l_hasTail_0, 
            onAbsoluteSizeChanged = v21, 
            setContentWidth = v20, 
            containerChildren = v23
        }), 
        tail = l_hasTail_0 and v2.createElement(v8, {
            isIncoming = l_isIncoming_0, 
            imageColor = if v13() then v31.Color else v28, 
            imageTransparency = if v13() then v31.Transparency else v29
        }), 
        repliedToMarker = if v13() and v18.isRepliedTo then v2.createElement(v12, {
            isIncoming = l_isIncoming_0
        }) else nil
    });
end);