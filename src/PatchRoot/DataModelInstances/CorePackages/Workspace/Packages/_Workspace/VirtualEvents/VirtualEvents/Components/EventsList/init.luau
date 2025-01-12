local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Parent.RoactAppExperiment);
local v7 = require(script.Parent.PaginatedVerticalList);
local v8 = require(script.Parent.ExposureLogger);
local v9 = require(l_script_FirstAncestor_0.Common.sortEventsByStartDate);
local _ = require(l_script_FirstAncestor_0.types);
local v11 = require(script.Parent.EventRow);
local l_getFFlagRemoveVirtualEventsExperiment_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).getFFlagRemoveVirtualEventsExperiment;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useUserExperiment_0 = v6.useUserExperiment;
local v16 = UDim.new(0, 12);
local v17 = {
    initialEventsShown = 1, 
    extraEventsShownOnLoad = 3, 
    isDesktopGrid = false
};
return function(v18) --[[ Line: 47 ]] --[[ Name: EventsList ]]
    -- upvalues: v2 (copy), v17 (copy), l_getFFlagRemoveVirtualEventsExperiment_0 (copy), l_useUserExperiment_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), v9 (copy), v11 (copy), v16 (copy), l_StyledTextLabel_0 (copy), v7 (copy), v8 (copy)
    local v19 = v2.Dictionary.join(v17, v18);
    local v22 = if l_getFFlagRemoveVirtualEventsExperiment_0() then nil else l_useUserExperiment_0({
        "Ecosystems.EventsOnExperienceDetailsPage"
    }, function(v20) --[[ Line: 54 ]]
        local v21 = v20["Ecosystems.EventsOnExperienceDetailsPage"];
        if v21 then
            return v21.virtualEventsMVPEnabled;
        else
            return nil;
        end;
    end, false);
    if v19.mockVirtualEventsMVPEnabled ~= nil then
        v22 = v19.mockVirtualEventsMVPEnabled;
    end;
    local v23 = l_useStyle_0();
    local v24 = l_useLocalization_0({
        title = "Feature.VirtualEvents.EventsListTitle"
    });
    local v27 = v3.useCallback(function(v25, v26) --[[ Line: 68 ]]
        -- upvalues: v19 (copy)
        if v19.onRsvpChanged then
            v19.onRsvpChanged(v25, v26);
        end;
    end, {
        v19.onRsvpChanged
    });
    local v29 = v3.useCallback(function(v28) --[[ Line: 74 ]]
        -- upvalues: v19 (copy)
        if v19.onJoinEvent then
            v19.onJoinEvent(v28);
        end;
    end, {});
    local v31 = v3.useCallback(function(v30) --[[ Line: 80 ]]
        -- upvalues: v19 (copy)
        if v19.onTileActivated then
            v19.onTileActivated(v30);
        end;
    end, {});
    local v33 = v3.useCallback(function(v32) --[[ Line: 86 ]]
        -- upvalues: v19 (copy)
        if v19.onEventImpression then
            v19.onEventImpression(v32);
        end;
    end, {
        v19.onEventImpression
    });
    if #v19.virtualEvents == 0 then
        return nil;
    else
        local v34 = v9(v19.virtualEvents);
        local v35 = {};
        for _, v37 in v34 do
            table.insert(v35, (v3.createElement(v11, {
                virtualEvent = v37, 
                onRsvpChanged = function(...) --[[ Line: 102 ]] --[[ Name: onRsvpChanged ]]
                    -- upvalues: v27 (copy), v37 (copy)
                    v27(v37, ...);
                end, 
                onJoinEvent = function() --[[ Line: 105 ]] --[[ Name: onJoinEvent ]]
                    -- upvalues: v29 (copy), v37 (copy)
                    v29(v37);
                end, 
                onTileActivated = function() --[[ Line: 108 ]] --[[ Name: onTileActivated ]]
                    -- upvalues: v31 (copy), v37 (copy)
                    v31(v37);
                end, 
                onImpression = function() --[[ Line: 111 ]] --[[ Name: onImpression ]]
                    -- upvalues: v33 (copy), v37 (copy)
                    v33(v37);
                end
            })));
        end;
        if l_getFFlagRemoveVirtualEventsExperiment_0() then
            return v3.createElement("Frame", {
                LayoutOrder = v19.layoutOrder, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = v16
                }), 
                Title = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v24.title, 
                    colorStyle = v23.Theme.TextEmphasis, 
                    fontStyle = v23.Font.Header1
                }), 
                PaginatedList = v3.createElement(v7, {
                    layoutOrder = 2, 
                    initialItemsShown = v19.initialEventsShown, 
                    extraItemsShownOnLoad = v19.extraEventsShownOnLoad, 
                    items = v35, 
                    isDesktopGrid = v19.isDesktopGrid
                })
            });
        else
            return v3.createElement("Frame", {
                LayoutOrder = v19.layoutOrder, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                ExposureLogger = v3.createElement(v8, {
                    exposureLayer = "Ecosystems.EventsOnExperienceDetailsPage"
                }), 
                Wrapper = if v22 then v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = v16
                    }), 
                    Title = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        text = v24.title, 
                        colorStyle = v23.Theme.TextEmphasis, 
                        fontStyle = v23.Font.Header1
                    }), 
                    PaginatedList = v3.createElement(v7, {
                        layoutOrder = 2, 
                        initialItemsShown = v19.initialEventsShown, 
                        extraItemsShownOnLoad = v19.extraEventsShownOnLoad, 
                        items = v35, 
                        isDesktopGrid = v19.isDesktopGrid
                    })
                }) else nil
            });
        end;
    end;
end;