local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.useLocalization;
local l_useStyle_0 = v1.useStyle;
local l_useSelector_0 = v1.useSelector;
local l_FullPageModal_0 = l_UIBlox_0.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_FlatList_0 = v1.FlatList;
local l_SectionList_0 = v1.SectionList;
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v15 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListEntry);
local v16 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListInviteEntry);
local v17 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsEmptyList);
local v18 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsUploadErrorModal);
local v19 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsGlimmer);
local l_EventNames_0 = require(l_script_FirstAncestor_0.Analytics).EventNames;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v22 = require(l_script_FirstAncestor_0.ContactsList.Components.FindFriendsBanner);
local v23 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListSearchBar);
local l_Dash_0 = v1.Dash;
local v25 = require(l_script_FirstAncestor_0.Flags.ContactImportButtonsIXP);
local v26 = require(l_script_FirstAncestor_0.Flags.OffPlatformFriendRequestsIXP);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagCIAmpUpsellEnabledForAll);
local l_IXPVariants_0 = v26.IXPVariants;
local v29 = game:DefineFastFlag("ContactImportButtonsExperimentEnabled", false);
local v30 = require(l_script_FirstAncestor_0.Utils.getContactImporterParams);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagDisablePhoneVerificationForCI);
local v32 = require(l_script_FirstAncestor_0.Flags.DisablePhoneVerificationForCIIXP);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagContactImporterUIRefactor);
local l_UserInputService_0 = v1.UserInputService;
return function(v35) --[[ Line: 73 ]] --[[ Name: ContactsList ]]
    -- upvalues: l_useStyle_0 (copy), v33 (copy), v32 (copy), l_useSelector_0 (copy), v30 (copy), l_IXPVariants_0 (copy), v14 (copy), v31 (copy), l_useLocalization_0 (copy), v29 (copy), v25 (copy), l_Dash_0 (copy), l_EventNames_0 (copy), l_React_0 (copy), v27 (copy), l_Roact_0 (copy), v15 (copy), v16 (copy), l_StyledTextLabel_0 (copy), l_ButtonType_0 (copy), l_UserInputService_0 (copy), l_SectionList_0 (copy), l_FlatList_0 (copy), v17 (copy), v23 (copy), v22 (copy), v19 (copy), v18 (copy), l_FullPageModal_0 (copy), l_HorizontalPageMargin_0 (copy)
    local v36 = l_useStyle_0();
    local v37 = v33 and v35.showNewUI;
    local v38 = v32.useShouldShowPVUpsell({
        isExposureEnabled = true
    });
    local v39 = v32.useIsPVRequired({
        isExposureEnabled = true
    });
    local l_isPhoneVerified_0 = l_useSelector_0(v30).isPhoneVerified;
    local v41 = if v35.variant ~= l_IXPVariants_0.INVITES_ONLY and v35.showMatchedContacts then v14.CONTACTS_LIST_BLURB_MIXED else v14.CONTACTS_LIST_BLURB_INVITES;
    if v31 and not v39 then
        v41 = v14.CONTACTS_LIST_BLURB_MIXED;
    end;
    local v42 = l_useLocalization_0({
        fromContactsText = v14.ON_ROBLOX, 
        inviteToRobloxText = v14.INVITE_TO_ROBLOX, 
        contactsListBlurb = v41, 
        connectWithFriends = v14.CONTACTS_LIST_TITLE, 
        closeModal = v14.CLOSE_MODAL, 
        goToAddFriends = v14.GO_TO_ADD_FRIENDS, 
        searchContacts = v14.SEARCH_CONTACTS
    });
    local v43 = if v29 then v25.useIsRemoveCloseButtonExperimentEnabled({
        isExposureEnabled = true
    }) else false;
    local v44 = if v29 then v25.useIsGreenFindFriendsButtonExperimentEnabled({
        isExposureEnabled = true
    }) else false;
    local function v48(v45, v46, v47) --[[ Line: 106 ]]
        -- upvalues: l_Dash_0 (ref)
        l_Dash_0.append(v45, v46, if #v46 ~= 0 then {
            {
                isSectionDivider = true
            }
        } else nil, v47);
    end;
    local function v49() --[[ Line: 115 ]]
        -- upvalues: v35 (copy), l_EventNames_0 (ref)
        v35.closeModal(l_EventNames_0.CloseContactListButton);
    end;
    local function v50() --[[ Line: 119 ]]
        -- upvalues: v35 (copy), l_EventNames_0 (ref)
        v35.closeModal(l_EventNames_0.CloseContactListCross);
    end;
    local v51, v52 = l_React_0.useState("");
    local function _(v53) --[[ Line: 125 ]]
        -- upvalues: l_Dash_0 (ref), v51 (copy)
        return l_Dash_0.filter(v53, function(v54) --[[ Line: 126 ]]
            -- upvalues: v51 (ref)
            if v54.contactName ~= nil then
                if not v54.contactName:match("^%s*$") then
                    return (string.find(string.lower(v54.contactName or ""), string.lower(v51)));
                else
                    return nil;
                end;
            else
                return string.find(string.lower(v54.contactName or ""), string.lower(v51));
            end;
        end);
    end;
    local v56 = not (not (v27() or v35.showFindFriendsBannerVariant) or #v35.matchedContacts > 0 or v35.isFetching or v35.openAmpUpsell == nil) or v31 and v38 and not l_isPhoneVerified_0;
    if v31 and not v38 then
        v56 = false;
    end;
    local v57 = v56 and 1 or 0.5;
    local v58 = v56 and 48 or 0;
    local v59 = {};
    local v60 = {};
    local l_matchedContacts_0 = v35.matchedContacts;
    v59 = l_Dash_0.filter(l_matchedContacts_0, function(v62) --[[ Line: 126 ]]
        -- upvalues: v51 (copy)
        if v62.contactName ~= nil then
            if not v62.contactName:match("^%s*$") then
                return (string.find(string.lower(v62.contactName or ""), string.lower(v51)));
            else
                return nil;
            end;
        else
            return string.find(string.lower(v62.contactName or ""), string.lower(v51));
        end;
    end);
    l_matchedContacts_0 = v35.deviceContacts;
    v60 = l_Dash_0.filter(l_matchedContacts_0, function(v63) --[[ Line: 126 ]]
        -- upvalues: v51 (copy)
        if v63.contactName ~= nil then
            if not v63.contactName:match("^%s*$") then
                return (string.find(string.lower(v63.contactName or ""), string.lower(v51)));
            else
                return nil;
            end;
        else
            return string.find(string.lower(v63.contactName or ""), string.lower(v51));
        end;
    end);
    l_matchedContacts_0 = if v56 and #v60 > 0 then {
        {
            isSectionDivider = true
        }
    } else {};
    v48(l_matchedContacts_0, v59, v60);
    local v64 = #v59;
    local v65 = {};
    if v37 then
        if #v59 > 0 then
            table.insert(v65, {
                data = v59, 
                title = v42.fromContactsText, 
                sectionNumber = #v65 + 1
            });
        end;
        if #v60 > 0 then
            table.insert(v65, {
                data = v60, 
                title = v42.inviteToRobloxText, 
                sectionNumber = #v65 + 1
            });
        end;
    end;
    if v31 and v64 > 0 and v38 and not l_isPhoneVerified_0 then
        v64 = v64 + 1;
    end;
    local function _() --[[ Line: 191 ]]
        -- upvalues: v35 (copy)
        return #v35.matchedContacts + #v35.deviceContacts == 0;
    end;
    local function v71(v67) --[[ Line: 195 ]]
        -- upvalues: l_matchedContacts_0 (copy), v64 (ref), l_Roact_0 (ref), v31 (ref), v57 (copy), v36 (copy), v15 (ref), v42 (copy), v37 (copy), v35 (copy), v33 (ref), v16 (ref)
        local l_item_0 = v67.item;
        local v69 = false;
        if v67.index ~= #l_matchedContacts_0 then
            v69 = v67.index ~= v64;
        end;
        if l_item_0.isSectionDivider then
            local v70 = v67.index ~= 1;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, v31 and v70 and 0.5 or v57, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v36.Theme.Divider.Color, 
                    BackgroundTransparency = v36.Theme.Divider.Transparency
                })
            });
        elseif l_item_0.isMatchedContact then
            return l_Roact_0.createElement(v15, {
                contactName = l_item_0.contactName, 
                contactId = l_item_0.contactId, 
                contextualInfo = v42.fromContactsText, 
                hasDivider = v37 and true or v69, 
                hasSentRequest = l_item_0.hasSentRequest, 
                requestFriendship = v35.requestFriendship, 
                openProfilePeekView = v35.openProfilePeekView, 
                headshotThumbnailUrl = if v37 then l_item_0.headshotThumbnailUrl else nil, 
                avatarThumbnailUrl = if v37 then l_item_0.avatarThumbnailUrl else nil, 
                showNewUI = if v33 then v37 else nil
            });
        else
            return l_Roact_0.createElement(v16, {
                contactName = l_item_0.contactName, 
                deviceContactId = l_item_0.deviceContactId, 
                hasDivider = v37 and true or v69, 
                phoneNumber = l_item_0.phoneNumber, 
                hasSentRequest = l_item_0.hasSentRequest
            });
        end;
    end;
    local function v73(v72) --[[ Line: 241 ]]
        -- upvalues: l_Roact_0 (ref), v56 (ref), l_StyledTextLabel_0 (ref), v36 (copy)
        if v72.section then
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = if not (v72.section.sectionNumber == 1) or v56 then l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }) else nil; 
                l_Roact_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1
                }, {
                    sectionHeaderTextLabel = l_Roact_0.createElement(l_StyledTextLabel_0, {
                        fontStyle = v36.Font.Header2, 
                        colorStyle = v36.Theme.TextDefault, 
                        text = v72.section.title or ""
                    })
                })
            });
        else
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v36.Theme.Divider.Color, 
                    BackgroundTransparency = v36.Theme.Divider.Transparency
                })
            });
        end;
    end;
    local function v75(v74) --[[ Line: 286 ]]
        -- upvalues: v35 (copy), l_ButtonType_0 (ref), l_Dash_0 (ref), v43 (copy), v49 (copy)
        if v35.isFetching then
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = true, 
                        onActivated = l_Dash_0.noop
                    }
                }
            };
        elseif v35.showAddFriendsButton and #v35.matchedContacts + #v35.deviceContacts == 0 then
            if v43 then
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v35.onAddFriendsActivated, 
                            text = v74.goToAddFriends
                        }
                    }
                };
            else
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v35.onAddFriendsActivated, 
                            text = v74.goToAddFriends
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v49, 
                            text = v74.closeModal
                        }
                    }
                };
            end;
        elseif v43 then
            return {};
        else
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v49, 
                        text = v74.closeModal
                    }
                }
            };
        end;
    end;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v77 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    local v78 = l_React_0.createRef();
    local function v80(v79) --[[ Line: 355 ]]
        -- upvalues: v52 (copy), v37 (copy), v78 (copy)
        v52(v79);
        if not v37 and v78 and v78.current then
            v78.current:scrollToIndex({
                index = 1
            });
        end;
    end;
    local v81 = if #l_matchedContacts_0 ~= 0 then l_Roact_0.createElement(if v37 then l_SectionList_0 else l_FlatList_0, {
        ref = v78, 
        data = if v37 then nil else l_matchedContacts_0, 
        sections = if v37 then v65 else nil, 
        renderSectionHeader = if v37 and #v59 > 0 then v73 else nil, 
        renderItem = v71, 
        initialNumToRender = 15, 
        CanvasSize = UDim2.new(1, 0, 0, 73 * #l_matchedContacts_0), 
        contentContainerStyle = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            LayoutOrder = 8, 
            Size = UDim2.new(1, 0, 1, -80 - (v43 and 0 or 48) - 36 - 16 - v58), 
            ElasticBehavior = Enum.ElasticBehavior.Always
        }
    }) else l_Roact_0.createElement(v17, {
        errorTextKey = v14.NO_RESULTS, 
        layoutOrder = 8
    });
    local v82 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        spacer1 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        descriptionFrame = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            textLayout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            descriptionText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = v42.contactsListBlurb, 
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v36.Theme.TextDefault, 
                fontStyle = v36.Font.Body, 
                lineHeight = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                maxSize = Vector2.new(0, 80), 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            })
        }), 
        spacer2 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        searchBarContainer = l_Roact_0.createElement(v23, {
            height = 36, 
            layoutOrder = 4, 
            textChangeCallback = v80
        }), 
        spacer3 = if v56 then l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 5
        }) else nil, 
        findFriendsBanner = if v56 then l_Roact_0.createElement(v22, {
            layoutOrder = 6, 
            showMatchedContacts = v35.showMatchedContacts, 
            openAmpUpsell = v35.openAmpUpsell, 
            isUserInGreenFindFriendsButtonExperiment = v44
        }) else nil, 
        spacer4 = if not v56 then l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7
        }) else nil, 
        contactsList = v81
    };
    if v35.isFetching then
        for _, v84 in {
            1, 
            2, 
            3
        } do
            v77["glimmer" .. v84] = l_Roact_0.createElement(v19, {
                layoutOrder = v84
            });
        end;
    elseif v35.hasUploadError and #v35.matchedContacts + #v35.deviceContacts == 0 then
        v77.errorModal = l_Roact_0.createElement(v18);
    elseif #v35.matchedContacts + #v35.deviceContacts == 0 then
        v77.emptyList = l_Roact_0.createElement(v17);
    else
        v77 = v82;
    end;
    return l_Roact_0.createElement(l_FullPageModal_0, {
        title = v42.connectWithFriends, 
        screenSize = v35.screenSize, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        onCloseClicked = v50, 
        buttonStackProps = {
            buttons = v75(v42), 
            buttonHeight = v43 and 0 or 48, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }
    }, {
        hpm = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
            size = UDim2.new(1, 0, 1, 0), 
            position = UDim2.new(0, 0, 0, 0), 
            backgroundTransparency = 1
        }, {
            contentFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v77), 
            gradientFrame = l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, v43 and 0 or -24), 
                Size = UDim2.new(1, 0, 0, 24), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v36.Theme.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, v36.Theme.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            })
        })
    });
end;