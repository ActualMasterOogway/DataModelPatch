local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.GameTile);
local _ = require(l_Parent_0.GraphQLServer);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_Parent_0.GamePlayButton);
local v10 = require(l_Parent_0.NotificationModalsManager);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_GameTileView_0 = v3.GameTileView;
local l_GridTileTextFooter_0 = v3.GridTileTextFooter;
local l_FooterCornerButton_0 = v3.FooterCornerButton;
local l_GameTileThumbnailBadges_0 = v3.GameTileThumbnailBadges;
local l_FooterCornerButtonStyle_0 = v3.FooterCornerButtonStyle;
local l_usePlayButtonState_0 = v9.usePlayButtonState;
local l_PlayButtonStates_0 = v9.PlayButtonStates;
local v19 = require(l_script_FirstAncestor_0.Common.formatDateLocalized);
local v20 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
local v21 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnail);
local v22 = require(l_script_FirstAncestor_0.Components.EventsListCarousel.EventWideFooterButton);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local l_useMemo_0 = v2.useMemo;
local l_useCallback_0 = v2.useCallback;
local l_FFlagFixEventTileDescription_0 = require(l_Parent_0.SharedFlags).FFlagFixEventTileDescription;
local l_FFlagShowToastOnEventFollow_0 = require(l_Parent_0.SharedFlags).FFlagShowToastOnEventFollow;
local l_GetFFlagLuaAppEnableSquadPage_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableSquadPage;
return function(v30) --[[ Line: 54 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v20 (copy), l_useMemo_0 (copy), l_FooterCornerButtonStyle_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_PlayButtonStates_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy), l_useLocalization_0 (copy), l_FFlagShowToastOnEventFollow_0 (copy), l_useCallback_0 (copy), v2 (copy), l_useEffect_0 (copy), v19 (copy), v10 (copy), l_useState_0 (copy), v21 (copy), l_ImpressionsTagUtility_0 (copy), l_GameTileView_0 (copy), l_GridTileTextFooter_0 (copy), l_FFlagFixEventTileDescription_0 (copy), l_GameTileThumbnailBadges_0 (copy), l_FooterCornerButton_0 (copy), v22 (copy)
    local v31 = l_useDesignTokens_0();
    local l_Event_0 = v30.Event;
    local v33 = v20(l_Event_0);
    local v34 = DateTime.now().UnixTimestamp >= v33.startDate.UnixTimestamp;
    local v35 = l_Event_0.userRsvpStatus == "going";
    local v36 = l_useMemo_0(function() --[[ Line: 62 ]]
        -- upvalues: v34 (copy), l_FooterCornerButtonStyle_0 (ref), v35 (copy)
        if v34 then
            return l_FooterCornerButtonStyle_0.Play;
        elseif v35 then
            return l_FooterCornerButtonStyle_0.Following;
        else
            return l_FooterCornerButtonStyle_0.Follow;
        end;
    end, {
        v34, 
        v35
    });
    local v37 = l_useRoactService_0(l_RoactNetworking_0);
    local v38 = l_usePlayButtonState_0(v37, v30.Event.universeId or "");
    local v39 = true;
    if v38.playButtonState ~= l_PlayButtonStates_0.Playable then
        v39 = l_GetFFlagLuaAppEnableSquadPage_0() and v38.playButtonState == l_PlayButtonStates_0.PlayableWithParty;
    end;
    local v40 = l_useLocalization_0({
        HappeningNow = "Feature.Home.Label.HappeningNow", 
        DateAtTime = "Feature.VirtualEvents.Label.DateAtTime", 
        ToastText = l_FFlagShowToastOnEventFollow_0 and "Feature.VirtualEvents.Label.ReminderSetForEventTime" or nil
    });
    local v42 = l_useCallback_0(function() --[[ Line: 83 ]]
        -- upvalues: v39 (copy), v34 (copy), v30 (copy), l_Event_0 (copy)
        if not v39 then
            return;
        elseif v34 then
            v30.onJoinEvent(l_Event_0);
            return;
        else
            local v41 = nil;
            v41 = l_Event_0.userRsvpStatus ~= "going" and "going" or "notGoing";
            if v30.onRsvpChanged then
                v30.onRsvpChanged(l_Event_0, v41);
            end;
            return;
        end;
    end, {
        v34, 
        v30.onJoinEvent, 
        v30.onRsvpChanged, 
        l_Event_0.userRsvpStatus, 
        l_Event_0, 
        v39
    });
    if l_FFlagShowToastOnEventFollow_0 then
        local v43 = v2.useRef(l_Event_0.userRsvpStatus);
        local l_v43_0 = v43 --[[ copy: 12 -> 16 ]];
        l_useEffect_0(function() --[[ Line: 105 ]]
            -- upvalues: l_v43_0 (copy), l_Event_0 (copy), v40 (copy), v19 (ref), v33 (copy), v10 (ref)
            if l_v43_0.current and l_v43_0.current ~= "going" and l_Event_0.userRsvpStatus == "going" then
                local v45 = v40.ToastText:gsub("{eventName}", l_Event_0.title):gsub("{eventTime}", v19(v40.DateAtTime, v33.startDate));
                v10.SetUIBloxToast({
                    toastTitle = v45, 
                    sequenceNumber = DateTime.now().UnixTimestamp
                });
            end;
            l_v43_0.current = l_Event_0.userRsvpStatus;
        end, {
            l_Event_0.userRsvpStatus, 
            l_Event_0.title, 
            v33.startDate
        });
    end;
    local v46, v47 = l_useState_0(nil);
    l_useEffect_0(function() --[[ Line: 123 ]]
        -- upvalues: v21 (ref), v37 (copy), l_Event_0 (copy), v30 (copy), v47 (copy)
        local v48 = true;
        v21(v37, l_Event_0.id, v30.DefaultThumbnail):andThen(function(v49) --[[ Line: 125 ]]
            -- upvalues: v48 (ref), v47 (ref)
            if v48 then
                v47(v49);
            end;
        end);
        return function() --[[ Line: 130 ]]
            -- upvalues: v48 (ref)
            v48 = false;
        end;
    end, {
        l_Event_0.id, 
        v30.DefaultThumbnail
    });
    local v50 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v50 (copy), v30 (copy)
        l_ImpressionsTagUtility_0.AddTag(v50, v30.impressionsTag, v30.layoutOrder);
        return function() --[[ Line: 138 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v50 (ref), v30 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v50, v30.impressionsTag, v30.layoutOrder);
        end;
    end, {
        v50, 
        v30.impressionsTag, 
        v30.layoutOrder
    });
    local v51 = l_useCallback_0(function() --[[ Line: 143 ]]
        -- upvalues: v30 (copy)
        v30.onTileActivated(v30.Event);
    end, {
        v30.onTileActivated, 
        v30.Event
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v30.layoutOrder, 
        Size = v30.size, 
        ref = v50
    }, {
        GameTile = v2.createElement(l_GameTileView_0, {
            imageAspectRatio = 1.7777777777777777, 
            image = v46, 
            isContained = true, 
            Size = UDim2.fromScale(1, 1), 
            title = l_Event_0.title or "", 
            onActivated = v51, 
            footerMetadata = v2.createElement(l_GridTileTextFooter_0, {
                text = if l_FFlagFixEventTileDescription_0 and l_Event_0.description then l_Event_0.description:match("[^\n]+") else l_Event_0.description, 
                useLargerFont = true
            }), 
            thumbnailOverlay = v2.createElement(l_GameTileThumbnailBadges_0, {
                tileBadgesByPosition = {
                    ImageTopLeft = {
                        {
                            tileBadgeType = "Text", 
                            text = if v34 then v40.HappeningNow else v19(v40.DateAtTime, v33.startDate)
                        }
                    }
                }
            }), 
            hidePlayButton = true, 
            isHovered = false, 
            rightCornerButton = if not v30.footerButtonEnabled then v2.createElement(l_FooterCornerButton_0, {
                buttonStyle = v36, 
                disabled = not v39, 
                onActivated = v42
            }) else nil, 
            extraFooterSpace = if v30.footerButtonEnabled then v31.Global.Size_350 + v31.Global.Space_100 else nil, 
            extraFooterContent = if v30.footerButtonEnabled then v2.createElement(v22, {
                buttonStyle = v36, 
                disabled = not v39, 
                onActivated = v42, 
                key = "WideFooterButton"
            }) else nil
        })
    });
end;