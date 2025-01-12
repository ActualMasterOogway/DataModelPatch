local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useDeviceType_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useDeviceType;
local _ = require(l_script_FirstAncestor_0.Parent.RobloxAppEnums);
local l_useRoactService_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_script_FirstAncestor_0.Parent.RoactServiceTags).RoactNetworking;
local v10 = require(l_script_FirstAncestor_0.Common.getEventTimerStatus);
local v11 = require(l_script_FirstAncestor_0.Common.findFirstImageInMedia);
local v12 = require(l_script_FirstAncestor_0.Common.getGalleryItems);
local v13 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnailList);
local v14 = require(l_script_FirstAncestor_0.Hooks.useActionBarProps);
local v15 = require(l_script_FirstAncestor_0.Components.EventTimer);
local v16 = require(l_script_FirstAncestor_0.Components.EventDescription);
local v17 = require(l_script_FirstAncestor_0.Components.EventHostedBy);
local v18 = require(l_script_FirstAncestor_0.Components.Attendance);
local v19 = require(l_script_FirstAncestor_0.requests);
local _ = require(l_script_FirstAncestor_0.types);
local l_getFFlagHorizontalMediaOnEventDetailsPage_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).getFFlagHorizontalMediaOnEventDetailsPage;
local l_useMutation_0 = v1.useMutation;
local l_DetailsPageTemplate_0 = v5.App.Template.DetailsPage.DetailsPageTemplate;
local l_ContentPosition_0 = v5.App.Template.DetailsPage.Enum.ContentPosition;
local l_MediaGalleryPreview_0 = v5.App.Container.MediaGalleryPreview;
local l_MediaGalleryHorizontal_0 = v5.App.Container.MediaGalleryHorizontal;
local l_calcMediaGallerySizesFromWidth_0 = v5.App.Container.calcMediaGallerySizesFromWidth;
local l_ListTable_0 = v5.App.Table.ListTable;
local function v29() --[[ Line: 36 ]]

end;
local v30 = {
    onClose = v29, 
    onJoinEvent = v29, 
    onShare = v29
};
local v31 = game:DefineFastFlag("UseNewEventImageFetch2", false);
return function(v32) --[[ Line: 67 ]] --[[ Name: EventDetailsPage ]]
    -- upvalues: v3 (copy), v30 (copy), v4 (copy), l_useDeviceType_0 (copy), v31 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v13 (copy), v12 (copy), v11 (copy), l_useMutation_0 (copy), v19 (copy), v10 (copy), l_calcMediaGallerySizesFromWidth_0 (copy), v14 (copy), l_ContentPosition_0 (copy), v18 (copy), l_getFFlagHorizontalMediaOnEventDetailsPage_0 (copy), l_MediaGalleryHorizontal_0 (copy), l_MediaGalleryPreview_0 (copy), v16 (copy), l_ListTable_0 (copy), v17 (copy), l_DetailsPageTemplate_0 (copy), v15 (copy)
    local v33 = v3.Dictionary.join(v30, v32);
    local l_media_0 = v32.virtualEvent.media;
    local l_experienceDetails_0 = v32.virtualEvent.experienceDetails;
    local v36, v37 = v4.useState(0);
    local v38 = l_useDeviceType_0();
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    if v31 then
        local v42, v43 = v4.useState({});
        v39 = v42;
        v40 = v43;
        v41 = if v39[1] then v39[1].imageId else nil;
        v42 = l_useRoactService_0(l_RoactNetworking_0);
        local l_v42_0 = v42 --[[ copy: 10 -> 17 ]];
        v4.useEffect(function() --[[ Line: 84 ]]
            -- upvalues: v13 (ref), l_v42_0 (copy), v32 (copy), v40 (ref), v12 (ref), l_media_0 (copy)
            v13(l_v42_0, v32.virtualEvent.id):andThen(function(v45) --[[ Line: 85 ]]
                -- upvalues: v40 (ref), v12 (ref), l_media_0 (ref)
                local v46 = {};
                if v45 then
                    for _, v48 in v45 do
                        if v48.mediaId then
                            table.insert(v46, {
                                imageId = "rbxassetid://" .. v48.mediaId, 
                                isVideo = false
                            });
                        end;
                    end;
                end;
                if #v46 > 0 then
                    v40(v46);
                    return;
                else
                    v40(v12(l_media_0));
                    return;
                end;
            end, function() --[[ Line: 103 ]]
                -- upvalues: v40 (ref), v12 (ref), l_media_0 (ref)
                v40(v12(l_media_0));
            end);
        end, {
            v32.virtualEvent.id, 
            l_media_0
        });
    else
        v39 = v4.useMemo(function() --[[ Line: 108 ]]
            -- upvalues: v12 (ref), l_media_0 (copy)
            return v12(l_media_0);
        end, {
            l_media_0
        });
        v41 = if l_media_0 then v11(l_media_0) else nil;
    end;
    local v56 = l_useMutation_0(v19.UPDATE_RSVP_STATUS, {
        variables = {
            virtualEventId = v32.virtualEvent.id
        }, 
        update = function(_, v50, v51) --[[ Line: 118 ]] --[[ Name: update ]]
            -- upvalues: v3 (ref)
            local l_virtualEvent_0 = v51.data.virtualEventRsvp.virtualEvent;
            v50:modify({
                id = v50:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v54) --[[ Line: 124 ]] --[[ Name: rsvpCounters ]]
                        -- upvalues: l_virtualEvent_0 (copy), v3 (ref)
                        local v55 = l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1;
                        return v3.Dictionary.join(v54, {
                            going = v54.going + v55
                        });
                    end
                }
            });
        end
    });
    local v57 = v4.useMemo(function() --[[ Line: 135 ]]
        -- upvalues: v10 (ref), v33 (copy)
        return v10(v33.virtualEvent, v33.currentTime);
    end, {
        v33.virtualEvent, 
        v33.currentTime
    });
    local v61 = v4.useCallback(function(v58) --[[ Line: 139 ]]
        -- upvalues: l_calcMediaGallerySizesFromWidth_0 (ref), v36 (copy), v37 (copy)
        local l_X_0 = v58.AbsoluteSize.X;
        local l_Offset_0 = l_calcMediaGallerySizesFromWidth_0(l_X_0, 5).contentSize.Y.Offset;
        if l_Offset_0 ~= v36 then
            v37(l_Offset_0);
        end;
    end, {
        v36
    });
    local v64 = v4.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v33 (copy), v56 (copy)
        local v62 = nil;
        v62 = v33.virtualEvent.userRsvpStatus ~= "going" and "going" or "notGoing";
        v56[1]({
            variables = {
                rsvpStatus = v62
            }
        }):andThen(function(v63) --[[ Line: 162 ]]
            -- upvalues: v33 (ref)
            if v33.onRsvpChanged then
                v33.onRsvpChanged(v63.data.virtualEventRsvp.rsvpStatus, v63.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal);
            end;
        end);
    end, {
        v33.virtualEvent
    });
    local v65 = v14(v33.virtualEvent, v57, {
        onClose = v33.onClose, 
        onJoinEvent = v33.onJoinEvent, 
        onShare = v33.onShare, 
        onRsvpChanged = v64
    });
    local v66 = v4.useMemo(function() --[[ Line: 179 ]]
        -- upvalues: v65 (copy)
        return v65.button or #v65.icons > 0;
    end, {
        v65
    });
    local v67 = {
        Attendance = if v57 ~= "Elapsed" then {
            portraitLayoutOrder = 1, 
            landscapePosition = l_ContentPosition_0.Left, 
            landscapeLayoutOrder = 1, 
            renderComponent = function() --[[ Line: 189 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v18 (ref), v33 (copy), v57 (copy)
                return v4.createElement(v18, {
                    virtualEvent = v33.virtualEvent, 
                    eventStatus = v57
                });
            end
        } else nil, 
        MediaGallery = {
            portraitLayoutOrder = 2, 
            landscapePosition = l_ContentPosition_0.Right, 
            landscapeLayoutOrder = 1, 
            renderComponent = function() --[[ Line: 201 ]] --[[ Name: renderComponent ]]
                -- upvalues: l_getFFlagHorizontalMediaOnEventDetailsPage_0 (ref), v4 (ref), l_MediaGalleryHorizontal_0 (ref), v39 (ref), v36 (copy), v61 (copy), l_MediaGalleryPreview_0 (ref)
                if l_getFFlagHorizontalMediaOnEventDetailsPage_0() then
                    return v4.createElement(l_MediaGalleryHorizontal_0, {
                        items = v39
                    });
                else
                    return v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v36), 
                        BackgroundTransparency = 1, 
                        [v4.Change.AbsoluteSize] = v61
                    }, {
                        Gallery = v4.createElement(l_MediaGalleryPreview_0, {
                            items = v39, 
                            numberOfThumbnails = 5
                        })
                    });
                end;
            end
        }, 
        Description = {
            portraitLayoutOrder = 3, 
            landscapePosition = l_ContentPosition_0.Left, 
            landscapeLayoutOrder = 2, 
            renderComponent = function() --[[ Line: 224 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v16 (ref), v33 (copy), l_experienceDetails_0 (copy), v31 (ref), v41 (ref)
                return v4.createElement(v16, {
                    description = v33.virtualEvent.description, 
                    experienceName = if l_experienceDetails_0 then l_experienceDetails_0.name else nil, 
                    experienceThumbnail = if v31 then ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(v33.virtualEvent.universeId) else v41, 
                    onExperienceTileActivated = v33.onExperienceTileActivated
                });
            end
        }, 
        EventInfo = if v33.virtualEvent.host then {
            portraitLayoutOrder = 4, 
            landscapePosition = l_ContentPosition_0.Right, 
            landscapeLayoutOrder = 2, 
            renderComponent = function() --[[ Line: 240 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), l_ListTable_0 (ref), v17 (ref), v33 (copy)
                return v4.createElement(l_ListTable_0, {
                    cells = {
                        v4.createElement(v17, {
                            host = v33.virtualEvent.host, 
                            onActivated = v33.onHostActivated
                        })
                    }
                });
            end
        } else nil
    };
    return v4.createElement(l_DetailsPageTemplate_0, {
        deviceType = v38, 
        titleText = v32.virtualEvent.eventStatus == "moderated" and "[CONTENT MODERATED]" or v33.virtualEvent.title, 
        thumbnailImageUrl = v41, 
        thumbnailAspectRatio = Vector2.new(16, 9), 
        renderInfoContent = function() --[[ Line: 261 ]] --[[ Name: renderInfoContent ]]
            -- upvalues: v4 (ref), v15 (ref), v33 (copy), v57 (copy)
            return v4.createElement(v15, {
                virtualEvent = v33.virtualEvent, 
                status = v57, 
                currentTime = v33.currentTime
            });
        end, 
        actionBarProps = if v66 then v65 else nil, 
        componentList = if v32.virtualEvent.eventStatus ~= "cancelled" and v32.virtualEvent.eventStatus ~= "moderated" then v67 else {}, 
        onClose = v33.onClose
    });
end;